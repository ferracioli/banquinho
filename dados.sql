/*  Insere usuários na base de dados */
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


/* Insere alguns meios de contato para os usuários */
INSERT INTO CONTATO VALUES
    ('ga', '40028922'),
    ('botta', 'nao@respondo.com'),
    ('zeca', 'atendimento@sac.com');

/* Insere algumas condições médicas */
INSERT INTO CONDICOES_MEDICAS VALUES
    ('ga', 'sinusite'),
    ('carlao', 'claustrofobia'),
    ('vini', 'rinite'),
    ('atlow', 'Pneumonoultramicroscopicsilicovolcanoconiosis');

/* Insere algumas qualificações para os usuários */
INSERT INTO QUALIFICACOES VALUES
    ('zeca', 'curso do senai'),
    ('ga', 'curso da alura'),
    ('atlow', 'Telecurso 2000');

/* O preenchimento das tabelas de generalização de usuário é feito de forma automatizada */
INSERT INTO ORGANIZADOR
    SELECT USERNAME FROM USUARIO WHERE USUARIO.CARGO = ('ORGANIZADOR');

INSERT INTO ADMINISTRADOR
    SELECT USERNAME FROM USUARIO WHERE USUARIO.CARGO = ('ADMINISTRADOR');

INSERT INTO MOCHILEIRO
    SELECT USERNAME FROM USUARIO WHERE USUARIO.CARGO = ('MOCHILEIRO');

INSERT INTO ESPECIALISTA
    SELECT USERNAME FROM USUARIO WHERE USUARIO.CARGO = ('ESPECIALISTA');

/* Insere autorizações legais para os organizadores */
INSERT INTO AUTORIZACOES_LEGAIS VALUES
    ('botta', 'Alvará de autônomo'),
    ('botta', 'CNH de categoria D');

/* Insere caravanas na base de dados */
INSERT INTO CARAVANA VALUES
    ('guilhos', 'WATANUKI14', 'Caravana da Coragem', '2006-04-01 15:00:00', '2021-04-01 22:00:00', 'Conheça a aurora boreal conosco'),
    ('botta', 'ODRENAEL19', 'Rumo ao Himalaia', '2012-05-11 23:20:00', '2012-05-16 08:00:00', 'Conheça o ponto mais alto do planeta e viva uma aventura inesquecível!');

/* Insere pontos turísticos na base */
INSERT INTO PONTO_TURISTICO VALUES
    (1, 'Aurora Boreal', 360.0, 0.0, 1.0, 'Alaska', 'Um lindo evento sazonal'),
    (2, 'Cordilheira do Himalaia', 43.2, 27.5, 4000.0, 'Nepal', 'A famosa cordilheira que exala desafio a todos que a encontram');

/* Insere requisitos para os pontos turísticos */
INSERT INTO REQUISITOS VALUES
    (1, 'Visto para os Estados Unidos'),
    (2, 'Vacinação contra sarampo'),
    (2, 'Ao menos 95% dos pulmões funcionais');

/* Insere itinerários na base de dados */
INSERT INTO ITINERARIO VALUES
    (1, 'guilhos', 'WATANUKI14', '2006-04-01 15:00:00', '2007-05-12 12:00:00', 1),
    (2, 'guilhos', 'WATANUKI14', '2007-05-12 12:00:01', '2021-04-01 22:00:00', 1),
    (3, 'botta', 'ODRENAEL19', '2012-05-11 23:20:00', '2012-05-16 08:00:00', 2);

/* Insere atividades na base de dados */
INSERT INTO ATIVIDADE VALUES
    (1, 1, 'Passeio de barco no frio extremo', '2006-04-01 15:00:00', '2006-04-03 16:00:00', 'Apesar de exótico, esse passeio atrai milhares de turistas todos os anos', 'Alaska', 360.0, 0.0, 1.0),
    (2, 3, 'Escalada 2km acima', '2012-05-12 15:30:00', '2012-05-15 10:00:00', 'Não há forma de se sentir revigorado melhor que escalar uma montanha', 'Nepal', 43.2, 27.5, 4000.0);

/* Insere restrições para as atividades */
INSERT INTO RESTRICOES VALUES
    (1, 'Baixa taxa de hemoglobina'),
    (1, 'Próteses de metal nos braços ou pernas'),
    (2, 'Próteses de metal nos braços ou pernas');
    
/* Insere grupos de participantes vinculados às atividades */
INSERT INTO GRUPO_DE_PARTICIPANTES VALUES
    (1, 'Especialistas:paramédico', -2000.0),
    (1, 'Turistas', 150.0),
    (2, 'Especialistas:alpinista', -1800.0),
    (2, 'Turistas', 800.0);
    
/* Insere as qualificações necessárias para o grupo de participantes específico de uma atividade */
INSERT INTO QUALIFICACOES_NECESSARIAS VALUES
    (2, 'Especialistas:alpinista', 'Autorização de guia'),
    (2, 'Especialistas:alpinista', 'Visto permanente');

/* Insere os instrumentos necessários para o grupo de participantes específico de uma atividade */
INSERT INTO INSTRUMENTOS_NECESSARIOS VALUES
    (1, 'Especialistas:paramédico', 'Kit primeiros socorros'),
    (1, 'Especialistas:paramédico', 'Roupa de frio extremo'),
    (1, 'Turistas', 'Roupa de frio extremo'),
    (2, 'Especialistas:alpinista', 'Corda');

/* Insere os instrumentos providenciados para o grupo de participantes específico de uma atividade */
INSERT INTO INSTRUMENTOS_PROVIDENCIADOS VALUES
    (1, 'Especialistas:paramédico', 'Kit primeiros socorros'),
    (2, 'Especialistas:alpinista', 'Corda');

/* Insere estadias na base de dados */
INSERT INTO ESTADIA VALUES
    (1, 'Quarto 12, Pousada do Esquimó, Juneau, Alaska', '2006-04-01 18:00:00', '2007-05-12 08:00:00', 3, 1),
    (2, 'Quarto 2, Pousada do Esquimó, Juneau, Alaska', '2006-04-01 18:00:00', '2007-05-12 08:00:00', 4, 1),
    (3, 'Quarto 37, Pousada do Esquimó, Juneau, Alaska', '2006-04-01 18:00:00', '2007-05-12 08:00:00', 2, 1),
    (4, 'Estância Kuloth, Katmandu, Nepal', '2012-05-11 23:59:00', '2012-05-14 14:00:00', 3, 3);

/* Adiciona serviços oferecidos em cada base de dados */
INSERT INTO SERVICO_OFERECIDO VALUES
    (1, 'Café da manhã'),
    (2, 'Café da manhã'),
    (3, 'Café da manhã'),
    (4, 'Chá de ervas'),
    (4, 'Sauna');

/* Insere transportes na base de dados */
INSERT INTO TRANSPORTE VALUES
    ('EEQ1234', '2006-04-01 16:00:00', 'Juneau', 4, '2006-04-02 16:00:00', 'Douglas Island', 'carro', 1),
    ('ASXJ3019', '2012-05-12 17:00:00', 'Katmandu', 3, '2012-05-14 12:00:00', 'Parque Nacional Langtang', 'jipe', 2);

/* Insere transações no histórico da base de dados */
INSERT INTO TRANSACOES_FINANCEIRAS VALUES
    ('ga', '2006-03-30 17:00:00', 'TED', 150.0, '123456-0', TRUE),
    ('atlow', '2006-03-15 21:37:00', 'Deposito', 150.0, '654321-0', FALSE);

/* Relações N:M */
/* Insere usuários que se locomoveram com o transporte disponibilizado */
INSERT INTO LOCOMOVE VALUES
    ('ga', '2006-04-01 16:00:00', 50, 'EEQ1234'),
    ('atlow', '2012-05-12 17:00:00', 100, 'ASXJ3019');

/* Insere usuários que se hospedaram nas estadias disponibilizadas */
INSERT INTO OCUPA VALUES 
    ('ga', 1, 0.0),
    ('botta', 2, 0.0),
    ('vini', 3, 0.0),
    ('atlow', 4, 15.0);

/* Insere usuários que adentraram em itinerários das caravanas */
INSERT INTO ADENTRA VALUES
    ('ga', 1, 500.0),
    ('botta', 1, 500.0),
    ('vini', 1, 500.0),
    ('atlow', 3, 15.0),
    ('carlao', 3, 0), 
    ('madrugideon', 1, 0);

--==
INSERT INTO USUARIO VALUES ('TESTE', 'TESTE', 'MOCHILEIRO');
INSERT INTO MOCHILEIRO VALUES ('TESTE');
INSERT INTO PARTICIPA VALUES ('TESTE', 'guilhos', 'WATANUKI14');
INSERT INTO ADENTRA VALUES ('TESTE', 1, 25);
--==
/* Insere mochileiros que entraram nas caravanas */
INSERT INTO PARTICIPA VALUES
    ('ga', 'guilhos', 'WATANUKI14'),
    ('atlow', 'botta', 'ODRENAEL19'),
    ('vini', 'guilhos', 'WATANUKI14');

/* Insere especialistas que entraram nas caravanas */
INSERT INTO AUXILIA VALUES
    ('carlao', 'botta', 'ODRENAEL19'),
    ('madrugideon', 'guilhos', 'WATANUKI14');

/* Insere usuários que entraram nos grupos de participantes */
INSERT INTO ENTRA VALUES
    ('ga', 1, 'Turistas'),
    ('atlow', 2, 'Turistas'),
    ('vini', 1, 'Turistas'),
    ('madrugideon', 1, 'Especialistas:paramédico'),
    ('carlao', 2, 'Especialistas:alpinista');