INSERT INTO usuario (id_usuario, nome, email, telefone, tipo_vinculo, documento) 
VALUES 
    (nextval('usuarioid_seq'), 'João Silva', 'joao@email.com', '11111111111', 'CON', '12345678901'),
    (nextval('usuarioid_seq'), 'Maria Oliveira', 'maria@email.com', '22222222222', 'AGR', '98765432100');

INSERT INTO barraquinha (id_barraquinha, id_usuario, nome_barraquinha, telefone_barraquinha, realiza_entrega, pontos_de_encontro, preco_entrega, funcionamento_diadasemana, funcionamento_fds) 
VALUES 
    (nextval('barraquinhaid_seq'), 2, 'Barraquinha da Maria', '33333333333', true, 'Praça Central', 5.50, true, false);


INSERT INTO categoria_popular (id_categoriapopular, nome_categoria)
VALUES (nextval('categoriapopularid_seq'), 'Frutas'),
	   (nextval('categoriapopularid_seq'), 'Verduras'),
	   (nextval('categoriapopularid_seq'), 'Laticínios');
	   
INSERT INTO categoria_cientifica (id_categoriacientifica, nome_categoria)
VALUES (nextval('categoriacientificaid_seq'), 'Vitamínico'),
       (nextval('categoriacientificaid_seq'), 'Proteico'),
	   (nextval('categoriacientificaid_seq'), 'Energético');

INSERT INTO alimento (id_alimento, nome_alimento, id_categoriapopular, id_categoriacientifica, classificacao_alimento, alimento_regional, informacoes_educativas, selo_inspecao)
VALUES (nextval('alimentoid_seq'), 'Maçã', 1, 1, 'NT', FALSE, 'A maçã é uma fruta rica em nutrientes.', TRUE),
	   (nextval('alimentoid_seq'), 'Queijo Minas', 3, 2,'NT',TRUE, 'O queijo Minas é um produto lácteo tradicional brasileiro.', TRUE);
       

select * from usuario; 
select * from barraquinha;
select * from feirinhas;
select * from categoria_popular;
select * from categoria_cientifica;
select * from alimento;
