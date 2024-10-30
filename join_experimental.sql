
INSERT INTO usuario (id_usuario, nome, email, telefone, tipo_vinculo, documento) 
VALUES 
    (nextval('usuarioid_seq'), 'João Silva', 'joao@email.com', '11111111111', 'CON', '12345678901'),
    (nextval('usuarioid_seq'), 'Maria Oliveira', 'maria@email.com', '22222222222', 'AGR', '98765432100'),
	(nextval('usuarioid_seq'), 'Bernabeu', 'bernabeu@email.com','33333333333', 'AGR', '98543432187'),
	(nextval('usuarioid_seq'), 'Claudia', 'claudinha@email.com','77777777777', 'ASS', '99924556187');

INSERT INTO barraquinha (id_barraquinha, id_usuario, nome_barraquinha, telefone_barraquinha, realiza_entrega, pontos_de_encontro, preco_entrega, funcionamento_diadasemana, funcionamento_fds) 
VALUES 
    (nextval('barraquinhaid_seq'), 2, 'Barraquinha da Maria', '33333333333', true, 'Praça Central', 5.50, true, false),
	(nextval('barraquinhaid_seq'), 3, 'Barraquinha do seu bernabeu', '33344333333', true, 'Praça da fé', 6.50, true, false),
	(nextval('barraquinhaid_seq'), null, 'Barraquinha do dionisio', '23344373930', true, 'Praça da teté', 6.50, true, false);

INSERT INTO cadastro_agricultor (id_cadastro_agricultor,id_agricultor, id_assistente_social,data_cadastro, possui_registro, registro_organico, certificacoes) 
VALUES 
	( nextval('cadastro_agricultorid_seq'),1, 4, '2024-10-23', TRUE,'Registro ABC123',  'Certificação XYZ'),
	( nextval('cadastro_agricultorid_seq'),2, 4, '2024-11-20', TRUE,'Registro AWQ232',  'Certificação YYZ'),
	( nextval('cadastro_agricultorid_seq'),3, 4, '2024-12-24', TRUE,'Registro XJK333',  'Certificação ZZZ');

INSERT INTO propriedade (id_cadastro_agricultor, nome_propriedade, foto_propriedade1, foto_propriedade2, foto_propriedade3, descricao, latitude, longitude) 
VALUES 
( 1,'Sítio Flor da Serra','foto1.jpg','foto2.jpg', NULL,'Uma propriedade rural dedicada ao cultivo de orgânicos e cereais.',-23.550520, -46.633308),
( 2,'Sítio Flor do Mato','foto1.jpg','foto2.jpg', NULL,'Uma propriedade rural dedicada ao cultivo de hortaliças e ervas.',-23.550525, -46.635629),
( null,'Sítio Paraiso das Aves','foto1.jpg','foto2.jpg', NULL,'Uma propriedade rural dedicada a criação de aves.',-23.577222, -46.333400);
 
/* join left do usuario e barraquinha*/
SELECT c.nome, p.nome_barraquinha
FROM usuario c
LEFT JOIN barraquinha p ON c.id_usuario = p.id_usuario;

/* join right do usuario e barraquinha */
SELECT u1.nome, b2.nome_barraquinha
FROM usuario u1
RIGHT JOIN barraquinha b2 ON u1.id_usuario = b2.id_usuario;

/* inner join do usuario e barraquinha*/
SELECT u1.nome, b2.nome_barraquinha
FROM usuario u1
INNER JOIN barraquinha b2 ON u1.id_usuario = b2.id_usuario;

/* full join do usuario e barraquinha */
SELECT u1.nome, b2.nome_barraquinha
FROM usuario u1
FULL JOIN barraquinha b2 ON u1.id_usuario = b2.id_usuario;

/* left join do usuario e propriedade*/
SELECT c.nome, p.nome_propriedade
FROM usuario c
LEFT JOIN propriedade p ON c.id_usuario = p.id_cadastro_agricultor;

/* right join do usuario e propriedade*/
SELECT c.nome, p.nome_propriedade
FROM usuario c
RIGHT JOIN propriedade p ON c.id_usuario = p.id_cadastro_agricultor;

/* inner join do usuario e propriedade*/
SELECT c.nome, p.nome_propriedade
FROM usuario c
INNER JOIN propriedade p ON c.id_usuario = p.id_cadastro_agricultor;

/* full join do usuario e propriedade*/
SELECT c.nome, p.nome_propriedade
FROM usuario c
FULL JOIN propriedade p ON c.id_usuario = p.id_cadastro_agricultor;

/* left join da barraquinha e propriedade*/
SELECT c.nome_barraquinha, p.nome_propriedade
FROM barraquinha c
LEFT JOIN propriedade p ON c.id_usuario = p.id_cadastro_agricultor;

/* right join da barraquinha e propriedade*/
SELECT c.nome_barraquinha, p.nome_propriedade
FROM barraquinha c
RIGHT JOIN propriedade p ON c.id_usuario = p.id_cadastro_agricultor;

/* inner join da barraquinha e propriedade*/
SELECT c.nome_barraquinha, p.nome_propriedade
FROM barraquinha c
INNER JOIN propriedade p ON c.id_usuario = p.id_cadastro_agricultor;

/* Full join da barraquinha e propriedade*/
SELECT c.nome_barraquinha, p.nome_propriedade
FROM barraquinha c
RIGHT JOIN propriedade p ON c.id_usuario = p.id_cadastro_agricultor;

