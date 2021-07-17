#include <iostream>
#include <String>
#include <pqxx/pqxx>

void criar_usuario(pqxx::connection& c){
	pqxx::work w(c);
	std::string sql = "bla bla bla";

	work W(C);
	W.exec( sql );
	W.commit();
}

int main(int argc, char *argv[]){
	int choice = 0;
	int will_exit = 0;

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
			std::cout << "Selecione:\n" <<
					"1) Criar Usuário\n" <<
					"2) TODO\n" <<
					"3) Sair\n" <<
					"Escolha: ";

			std::cin >> choice;

			switch(choice){
				case 1:
					criar_usuario(C);
					break;
				case 2:
					//TODO
					break;
				case 3:
					will_exit = 1;
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