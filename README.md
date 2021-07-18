# Turismo de Fenômenos Naturais

## Integrantes


- Gabriel Monteiro Ferracioli - 11219129
- Matheus Lopes Rigato - 10260462
- Vinícius Eduardo Araújo - 11275193

## Dependências

Instale o pacote `libpqxx-dev` (Ubuntu) ou equivalente.

Instale o [PostgreSQL](https://www.postgresql.org/)

<!-- CREATE USER admin WITH PASSWORD 'admin'; -->

<!-- TODO: descreve isso aqui -->

## Instalação

<!-- TODO: subir o serviço do postgresql-->

Inicie o serviço

```shell
# service postgresql start
```

Mude para a conta postgres

```shell
$ sudo -i -u postgres
```

Crie a nova role e mude sua senha

```shell
postgres@server:~$ createuser --interactive
Digite o nome da role a ser adicionada: admin
A nova role poderá criar um super-usuário? (s/n) s

postgres@server:~$ psql

postgres=# \password admin
Enter new password: admin
```

Crie o banco de dados

```shell
postgres@server:~$ psql

postgres=# CREATE DATABASE banquinho
```

Compile o executável

```shell
$ g++ main.cpp -lpqxx -lpq
```

## Uso

Execute os arquivos de esquema do banco, inserções nas tabelas e consultas ao banco, substituindo os endereços de acordo

```shell
postgres@server:~$ psql admin -h 127.0.0.1 -d banquinho -f /path/to/esquema.sql
postgres@server:~$ psql admin -h 127.0.0.1 -d banquinho -f /path/to/dados.sql
postgres@server:~$ psql admin -h 127.0.0.1 -d banquinho -f /path/to/consultas.sql
```

Execute o programa

```shell
$ ./a.out
```