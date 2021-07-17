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

Crie a nova role e mude sua senha

```
postgres@server:~$ createuser --interactive
Digite o nome da role a ser adicionada: admin
A nova role poderá criar um super-usuário? (s/n) s

postgres@server:~$ psql

postgres=# \password admin
Enter new password: admin
```

