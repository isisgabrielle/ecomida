INSERT INTO usuario (id_usuario, nome, email, telefone, vinculo, documento, possui_registro, registro_organico, penalidades) 
VALUES 
    (nextval('usuarioid_seq'), 'João Silva', 'joao@email.com', '11111111111', 'CON', '12345678901', true, 'ORG123', 0),
    (nextval('usuarioid_seq'), 'Maria Oliveira', 'maria@email.com', '22222222222', 'AGR', '98765432100', false, null, 1);

INSERT INTO barraquinha (id_barraquinha, id_usuario, nome_barraquinha, telefone_barraquinha, realiza_entrega, pontos_de_encontro, preço_entrega, funcionamento_diadasemana, funcionamento_fds) 
VALUES 
    (nextval('barraquinhaid_seq'), currval('usuarioid_seq'), 'Barraquinha da Maria', '33333333333', true, 'Praça Central', 5.50, true, false);

