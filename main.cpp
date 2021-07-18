#include <iostream>
#include <algorithm>
#include <string>
#include <pqxx/pqxx>

// trim from end (in place)
static inline void rtrim(std::string &s) {
	s.erase(std::find_if(s.rbegin(), s.rend(),
			std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
}

// Insere um novo usuário na base de dados após as validações
void criar_usuario(pqxx::connection& c){
	pqxx::work w(c);
	// pqxx::nontransaction n(c);
	std::string sql;
	std::string str, username;
	pqxx::result r;

	// Faz a leitura do username e já faz a validação de tamanho
	std::cout << "Username: ";
	std::cin >> str;
	if(str.length() > 15){
		str.resize(15);
	}

	// Verifica se já existe um usuário com este nome
	sql = "SELECT * FROM USUARIO WHERE USERNAME='" + str + "';";
	// std::cout << sql.c_str() << std::endl;
	r = w.exec(sql.c_str());

	if(!r.empty()){
		std::cout << "Username já existe. Cancelando..." << std::endl;
		return;
	}

	username = str;

	sql = "INSERT INTO USUARIO VALUES ('" + str + "', '";

	// Faz a leitura do nome e já faz a validação do tamanho,
	// ignora linhas em branco e lê nomes com espaço
	std::cout << "Nome: ";
	do{
		std::getline (std::cin,str);
		if(str.length() > 50){
			str.resize(50);
		}
		rtrim(str);
	}while(str.length() <= 0);
	sql += str + "', '";

	// Por padrão, o cargo é mochileiro.
	sql += std::string("MOCHILEIRO") + "');\n";

	sql += "INSERT INTO MOCHILEIRO VALUES ('" + username + "');\n";



	w.exec( sql.c_str() );
	w.commit();
	// std::cout << sql.c_str() << std::endl;

	std::cout << "\nUsuário " << username << " criado com sucesso." << std::endl;
}

// Lista todas as caravanas nas quais um usuário de nome dado está participando 
void buscar_caravana(pqxx::connection& c){
	pqxx::nontransaction n(c);
	std::string sql;
	std::string str, cargo;
	pqxx::result r;

	// Faz a leitura do username e já valida o tamanho
	std::cout << "Username: ";
	std::cin >> str;
	if(str.length() > 15){
		str.resize(15);
	}

	// Busca o cargo do usuario digitado para saber qual tabela consultar
	sql = "SELECT CARGO FROM USUARIO WHERE USERNAME='" + str + "'";
	// std::cout << sql.c_str() << std::endl;
	r = n.exec(sql.c_str());

	// Não existe nenhum usuario com esse nome
	if(r.empty()){
		std::cout << "Username " << str << " não existe. Cancelando..." << std::endl;
		return;
	}

	cargo = r[0][0].c_str();
	rtrim(cargo);

	// Se o usuário é um mochileiro: buscamos a partir da tabela participa
	if(!cargo.compare("MOCHILEIRO")){
		sql = "SELECT * FROM CARAVANA C JOIN PARTICIPA P ON (P.MOCHILEIRO = '";
		sql += str;
		sql += "'AND P.ORGANIZADOR = C.ORGANIZADOR AND P.CODIGO_INTERNO = C.CODIGO_INTERNO);";

	// Se o usuário é um especialista: buscamos a partir da tabela auxilia
	}else if(!cargo.compare("ESPECIALISTA")){
		sql = "SELECT * FROM CARAVANA C JOIN AUXILIA AU ON (AU.ESPECIALISTA = '";
		sql += str;
		sql += "' AND AU.ORGANIZADOR = C.ORGANIZADOR AND AU.CODIGO_INTERNO = C.CODIGO_INTERNO);";

	// Se o usuário é um organizador: olhamos apenas a tabela caravana
	}else if(!cargo.compare("ORGANIZADOR")){
		sql = "SELECT * FROM CARAVANA WHERE ORGANIZADOR='" + str + "';";

	// Se o usuário é um administrador: ele não pode participar de caravanas
	}else if(!cargo.compare("ADMINISTRADOR")){
		std::cout << "O administrador não participa de Caravanas." << std::endl;
		return;

	// Ocorreu algum erro durante a execução
	}else{
		std::cout << "Erro ao ler cargo. Cancelando..." << std::endl;
		return;

	}

	// Executa o comando SQL
	r = n.exec(sql.c_str());

	// Ele não está registrado em nenhuma caravana
	if(r.empty()){
		std::cout << "Usuário não participa de Caravanas." << std::endl;
		return;
	}

	std::cout << "\n================================" << std::endl;
	// Lista todas as caravanas nas quais o usuário está cadastrado
	/* List down all the records */
	for (pqxx::result::const_iterator ci = r.begin(); ci != r.end(); ++ci) {
		std::cout << "Organizador = " << ci[0].c_str() << std::endl;
		std::cout << "Código = " << ci[1].c_str() << std::endl;
		std::cout << "Nome = " << ci[2].c_str() << std::endl;
		std::cout << "Partida = " << ci[3].c_str() << std::endl;
		std::cout << "Chegada = " << ci[4].c_str() << std::endl;
		std::cout << "Descrição = " << ci[5].c_str() << std::endl;
		std::cout << "================================" << std::endl;
	}
}

int main(int argc, char *argv[]){
	int choice = 0;
	bool will_exit = false;

	// Tenta se conectar com a base de dados
	// A interface só funciona após uma tentativa bem sucedida de conexão
	try {
		pqxx::connection C("dbname = banquinho user = admin password = admin \
		hostaddr = 127.0.0.1 port = 5432");
		if(C.is_open()) {
			std::cout << "Opened database successfully: " << C.dbname() << std::endl;
		} else {
			std::cout << "Não deu pra abrir véi" << std::endl;
			return 1;
		}

		// Laço que funciona enquanto o usuário não quiser fechar a interface
		while(!will_exit){
			std::cout << "\nSelecione:\n" <<
					"1) Criar novo Mochileiro\n" <<
					"2) Buscar Caravanas por Usuário\n" <<
					"3) Sair\n" <<
					"Escolha: ";

			std::cin >> choice;
			std::cout << std::endl;

			switch(choice){
				case 1:
					// Criação de um novo usuário
					criar_usuario(C);
					break;
				case 2:
					// Buscar caravanas a partir do nome
					buscar_caravana(C);
					break;
				case 3:
					// Encerrar o sistema
					will_exit = true;
					break;
				default:
					std::cout << "\033[0;31m" << // Set color as red
							"VALOR INVALIDO!\n" <<
							"\033[0m"; // Reset color
			}
		}
		// Se desconecta da base de dados
		C.disconnect ();
	// Tratamento de erros
	}catch(const std::exception &e){
		// TODO
		std::cerr << e.what() << std::endl;
		return 1;
	}

	return 0;
}