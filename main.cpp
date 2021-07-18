#include <iostream>
#include <algorithm>
#include <string>
#include <pqxx/pqxx>

// trim from end (in place)
static inline void rtrim(std::string &s) {
	s.erase(std::find_if(s.rbegin(), s.rend(),
			std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
}

void criar_usuario(pqxx::connection& c){
	// pqxx::work w(c);
	pqxx::nontransaction n(c);
	std::string sql;
	std::string str, username;
	pqxx::result r;

	std::cout << "Username: ";
	std::cin >> str;
	if(str.length() > 15){
		str.resize(15);
	}

	// Verifica se já existe
	sql = "SELECT * FROM USUARIO WHERE USERNAME='" + str + "';";
	// std::cout << sql.c_str() << std::endl;
	r = n.exec(sql.c_str());

	if(!r.empty()){
		std::cout << "Username já existe. Cancelando..." << std::endl;
		return;
	}

	username = str;

	sql = "INSERT INTO USUARIO VALUES ('" + str + "', '";

	std::cout << "Nome: ";
	std::cin >> str;
	if(str.length() > 50){
		str.resize(50);
	}
	sql += str + "', '";

	// Default para mochileiro
	// std::cout << "Cargo: ";
	// std::cin >> str;
	// if(str.length() > 13){
	// 	str.resize(13);
	// }
	sql += std::string("MOCHILEIRO") + "');\n";

	sql += "INSERT INTO MOCHILEIRO VALUES ('" + username + "');\n";



	// w.exec( sql.c_str() );
	// w.commit();
	std::cout << sql.c_str() << std::endl;

	std::cout << "\nUsuário criado com sucesso." << std::endl;
}

void buscar_caravana(pqxx::connection& c){
	pqxx::nontransaction n(c);
	std::string sql;
	std::string str, cargo;
	pqxx::result r;

	std::cout << "Username: ";
	std::cin >> str;
	if(str.length() > 15){
		str.resize(15);
	}

	sql = "SELECT CARGO FROM USUARIO WHERE USERNAME='" + str + "'";
	// std::cout << sql.c_str() << std::endl;
	r = n.exec(sql.c_str());

	if(r.empty()){
		std::cout << "Username não existe. Cancelando..." << std::endl;
		return;
	}

	cargo = r[0][0].c_str();
	rtrim(cargo);

	if(!cargo.compare("MOCHILEIRO")){
		sql = "SELECT * FROM CARAVANA C JOIN PARTICIPA P"+
					"ON (P.MOCHILEIRO = '" + str + "'"+ 
						"AND P.ORGANIZADOR = C.ORGANIZADOR"+
						"AND P.CODIGO_INTERNO = C.CODIGO_INTERNO);";

	}else if(!cargo.compare("ESPECIALISTA")){
		sql = "SELECT * FROM CARAVANA C JOIN AUXILIA AU"+
					"ON (AU.ESPECIALISTA = '" + str + "'"+ 
						"AND AU.ORGANIZADOR = C.ORGANIZADOR"+
						"AND AU.CODIGO_INTERNO = C.CODIGO_INTERNO);";

	}else if(!cargo.compare("ORGANIZADOR")){
		sql = "SELECT * FROM CARAVANA WHERE ORGANIZADOR='" + str + "';";

	}else if(!cargo.compare("ADMINISTRADOR")){
		std::cout << "Usuário não participa de Caravanas." << std::endl;
		return;

	}else{
		std::cout << "Erro ao ler cargo. Cancelando..." << std::endl;
		return;

	}


	r = n.exec(sql.c_str());
	std::cout << r << std::endl;

	if(r.empty()){
		std::cout << "Usuário não participa de Caravanas." << std::endl;
		return;
	}

	std::cout << "\n================================" << std::endl;

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

	try {
		pqxx::connection C("dbname = banquinho user = admin password = admin \
		hostaddr = 127.0.0.1 port = 5432");
		if(C.is_open()) {
			std::cout << "Opened database successfully: " << C.dbname() << std::endl;
		} else {
			std::cout << "Não deu pra abrir véi" << std::endl;
			return 1;
		}

		while(!will_exit){
			std::cout << "\nSelecione:\n" <<
					"1) Criar Usuário\n" <<
					"2) Buscar Caravanas por Usuário\n" <<
					"3) Sair\n" <<
					"Escolha: ";

			std::cin >> choice;
			std::cout << std::endl;

			switch(choice){
				case 1:
					criar_usuario(C);
					break;
				case 2:
					buscar_caravana(C);
					break;
				case 3:
					will_exit = true;
					break;
				default:
					std::cout << "\033[0;31m" << // Set color as red
							"VALOR INVALIDO!\n" <<
							"\033[0m"; // Reset color
			}
		}

		C.disconnect ();
	}catch(const std::exception &e){
		// TODO
		std::cerr << e.what() << std::endl;
		return 1;
	}

	return 0;
}