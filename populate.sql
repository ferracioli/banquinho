INSERT INTO USUARIO VALUES
    ('zeca', 'José Carlos', 'ADMINISTRADOR'),
    ('georgeIV', 'Jorge', 'ADMINISTRADOR'),
    ('ga', 'Gabriel', 'MOCHILEIRO'),
    ('atlow', 'Matheus', 'MOCHILEIRO'),
    ('vini', 'Vinicius', 'MOCHILEIRO'),
    ('carlao', 'Carlos Silva', 'ESPECIALISTA'),
    ('madrugideon', 'Ronaldo', 'ESPECIALISTA'),
    ('botta', 'Leandro Botta', 'ORGANIZADOR'),
    ('guilhos', 'Guilherme', 'ORGANIZADOR');

-- TIMESTAMP USA FOTMATO 'yyyy-MM-dd HH:mm:ss'
-- psql admin -h 127.0.0.1 -d banquinho -f /home/gabriel/banquinho/database.sql
-- abrir o postgres: sudo -i -u postgres
-- fechar o postgres: \q
INSERT INTO CARAVANA VALUES
    ('guilhos', 'ajhaajha', 'CARAVANA DO DESESPERO', '2021-09-01 15:00:00', '2021-10-01 22:00:00', '3 horas restantes');
-- SELECT E.USUARIO, (SUM( G.GASTOS_GANHOS)) FROM ENTRA E JOIN GRUPO_DE_PARTICIPANTES G ON ( E.ATIVIDADE = G.ATIVIDADE AND E.CATEGORIA = G.CATEGORIA)GROUP BY E.USUARIO;

INSERT INTO CONTATO VALUES
    ('ga', '40028922'),
    ('botta', 'nao@respondo.com'),
    ('zeca', 'atendimento@sac.com');

INSERT INTO CONDICOES_MEDICAS VALUES
    ('ga', 'sinusite'),
    ('carlao', 'claustrofobia'),
    ('vini', 'rinite'),
    ('atlow', 'Pneumonoultramicroscopicsilicovolcanoconiosis');

INSERT INTO QUALIFICACOES VALUES
    ('zeca', 'curso do senai'),
    ('ga', 'curso da alura'),
    ('atlow', 'Telecurso 2000');

INSERT INTO ORGANIZADOR
    SELECT USERNAME FROM USUARIO WHERE USUARIO.CARGO = ('ORGANIZADOR');

INSERT INTO ADMINISTRADOR
    SELECT USERNAME FROM USUARIO WHERE USUARIO.CARGO = ('ADMINISTRADOR');

INSERT INTO MOCHILEIRO
    SELECT USERNAME FROM USUARIO WHERE USUARIO.CARGO = ('MOCHILEIRO');

INSERT INTO ESPECIALISTA
    SELECT USERNAME FROM USUARIO WHERE USUARIO.CARGO = ('ESPECIALISTA');

INSERT INTO AUTORIZACOES_LEGAIS VALUES
    ('botta', 'Alvará de autônomo'),
    ('botta', 'CNH de categoria D');

INSERT INTO CARAVANA VALUES
    ('guilhos', 'WATANUKI14', 'Caravana da Coragem', '2006-04-01 15:00:00', '2021-04-01 22:00:00', 'Conheça a aurora boreal conosco'),
    ('botta', 'ODRENAEL19', 'Rumo ao Himalaia', '2012-05-11 23:20:00', '2012-05-16 08:00:00', 'Conheça o ponto mais alto do planeta e viva uma aventura inesquecível!');


INSERT INTO PONTO_TURISTICO VALUES
    (1, 'Aurora Boreal', 360.0, 0.0, 1.0, 'Alaska', 'Um lindo evento sazonal'),
    (2, 'Cordilheira do Himalaia', 43.2, 27.5, 4000.0, 'Nepal', 'A famosa cordilheira que exala desafio a todos que a encontram');

INSERT INTO REQUISITOS VALUES
    (1, 'Visto para os Estados Unidos'),
    (2, 'Vacinação contra sarampo'),
    (2, 'Ao menos 95% dos pulmões funcionais');

INSERT INTO ITINERARIO VALUES
    (1, 'guilhos', 'WATANUKI14', '2006-04-01 15:00:00', '2007-05-12 12:00:00', 1),
    (2, 'guilhos', 'WATANUKI14', '2007-05-12 12:00:01', '2021-04-01 22:00:00', 1),
    (3, 'botta', 'ODRENAEL19', '2012-05-11 23:20:00', '2012-05-16 08:00:00', 2);

INSERT INTO ATIVIDADE VALUES
    (1, 1, 'Passeio de barco no frio extremo', '2006-04-01 15:00:00', '2006-04-03 16:00:00', 'Apesar de exótico, esse passeio atrai milhares de turistas todos os anos', 'Alaska', 360.0, 0.0, 1.0),
    (2, 3, 'Escalada 2km acima', '2012-05-12 15:30:00', '2012-05-15 10:00:00', 'Não há forma de se sentir revigorado melhor que escalar uma montanha', 'Nepal', 43.2, 27.5, 4000.0);

/*======================*/
INSERT INTO ATIVIDADE VALUES    (3, 2, 'ITINERARIO TOP', '2222-11-11 12:00:00', '2222-11-11 12:00:00' , 'NADA A CIMENTAR', 'BLA', 1.0, 1.0, 1.0);
INSERT INTO GRUPO_DE_PARTICIPANTES VALUES (3, 'Turistas', 128);
INSERT INTO ENTRA VALUES    ('ga', 3, 'Turistas');
INSERT INTO ADENTRA VALUES ('ga', 2, 0.99);
INSERT INTO ADENTRA VALUES ('vini', 2, 9);
/*=====================*/

INSERT INTO RESTRICOES VALUES
    (1, 'Baixa taxa de hemoglobina'),
    (1, 'Próteses de metal nos braços ou pernas'),
    (2, 'Próteses de metal nos braços ou pernas');
    
INSERT INTO GRUPO_DE_PARTICIPANTES VALUES
    (1, 'Especialistas:paramédico', -2000.0),
    (1, 'Turistas', 150.0),
    (2, 'Especialistas:alpinista', -1800.0),
    (2, 'Turistas', 800.0);
    
INSERT INTO QUALIFICACOES_NECESSARIAS VALUES
    (2, 'Especialistas:alpinista', 'Autorização de guia'),
    (2, 'Especialistas:alpinista', 'Visto permanente');

INSERT INTO INSTRUMENTOS_NECESSARIOS VALUES
    (1, 'Especialistas:paramédico', 'Kit primeiros socorros'),
    (1, 'Especialistas:paramédico', 'Roupa de frio extremo'),
    (1, 'Turistas', 'Roupa de frio extremo'),
    (2, 'Especialistas:alpinista', 'Corda');

INSERT INTO INSTRUMENTOS_PROVIDENCIADOS VALUES
    (1, 'Especialistas:paramédico', 'Kit primeiros socorros'),
    (2, 'Especialistas:alpinista', 'Corda');

INSERT INTO ESTADIA VALUES
    (1, 'Quarto 12, Pousada do Esquimó, Juneau, Alaska', '2006-04-01 18:00:00', '2007-05-12 08:00:00', 3, 1),
    (2, 'Quarto 2, Pousada do Esquimó, Juneau, Alaska', '2006-04-01 18:00:00', '2007-05-12 08:00:00', 4, 1),
    (3, 'Quarto 37, Pousada do Esquimó, Juneau, Alaska', '2006-04-01 18:00:00', '2007-05-12 08:00:00', 2, 1),
    (4, 'Estância Kuloth, Katmandu, Nepal', '2012-05-11 23:59:00', '2012-05-14 14:00:00', 3, 3);

INSERT INTO SERVICO_OFERECIDO VALUES
    (1, 'Café da manhã'),
    (2, 'Café da manhã'),
    (3, 'Café da manhã'),
    (4, 'Chá de ervas'),
    (4, 'Sauna');

INSERT INTO TRANSPORTE VALUES
    ('EEQ1234', '2006-04-01 16:00:00', 'Juneau', 4, '2006-04-02 16:00:00', 'Douglas Island', 'carro', 1),
    ('ASXJ3019', '2012-05-12 17:00:00', 'Katmandu', 3, '2012-05-14 12:00:00', 'Parque Nacional Langtang', 'jipe', 2);

INSERT INTO TRANSACOES_FINANCEIRAS VALUES
    ('ga', '2006-03-30 17:00:00', 'TED', 150.0, '123456-0'),
    ('atlow', '2006-03-15 21:37:00', 'Deposito', 150.0, '654321-0');

INSERT INTO LOCOMOVE VALUES
    ('ga', '2006-04-01 16:00:00', 50, 'EEQ1234'),
    ('atlow', '2012-05-12 17:00:00', 100, 'ASXJ3019');

INSERT INTO OCUPA VALUES 
    ('ga', 1, 0.0),
    ('botta', 2, 0.0),
    ('vini', 3, 0.0),
    ('atlow', 4, 15.0);

INSERT INTO ADENTRA VALUES
    ('ga', 1, 500.0),
    ('botta', 1, 500.0),
    ('vini', 1, 500.0),
    ('atlow', 3, 15.0),
    ('carlao', 3, 0), 
    ('madrugideon', 1, 0);


INSERT INTO PARTICIPA VALUES
    ('ga', 'guilhos', 'WATANUKI14'),
    ('atlow', 'botta', 'ODRENAEL19'),
    ('vini', 'guilhos', 'WATANUKI14');

INSERT INTO AUXILIA VALUES
    ('carlao', 'botta', 'ODRENAEL19'),
    ('madrugideon', 'guilhos', 'WATANUKI14');

INSERT INTO ENTRA VALUES
    ('ga', 1, 'Turistas'),
    ('atlow', 2, 'Turistas'),
    ('vini', 1, 'Turistas'),
    ('madrugideon', 1, 'Especialistas:paramédico'),
    ('carlao', 2, 'Especialistas:alpinista');