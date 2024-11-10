INSERT INTO usuarios (id_usuario, nome, email, telefone, tipo_vinculo, documento) 
VALUES 
    (nextval('usuarioid_seq'), 'João Silva', 'joao@email.com', '11111111111', 'CON', '12345678901'),
    (nextval('usuarioid_seq'), 'Maria Oliveira', 'maria@email.com', '22222222222', 'AGR', '98765432100');

INSERT INTO barraquinhas (id_barraquinha, id_usuario, nome_barraquinha, telefone_barraquinha, realiza_entrega, pontos_de_encontro, preco_entrega, funcionamento_dia_da_semana, funcionamento_fds) 
VALUES 
    (nextval('barraquinhaid_seq'), 2, 'Barraquinha da Maria', '33333333333', true, 'Praça Central', 5.50, true, false);


INSERT INTO categorias_populares (id_categoria_popular, nome_categoria)
VALUES (nextval('categoriapopularid_seq'), 'Frutas'),
	   (nextval('categoriapopularid_seq'), 'Verduras'),
	   (nextval('categoriapopularid_seq'), 'Laticínios');
	   
INSERT INTO categorias_cientificas (id_categoria_cientifica, nome_categoria)
VALUES (nextval('categoriacientificaid_seq'), 'Vitamínico'),
       (nextval('categoriacientificaid_seq'), 'Proteico'),
	   (nextval('categoriacientificaid_seq'), 'Energético');

INSERT INTO alimentos (id_alimento, nome_alimento, id_categoria_popular, id_categoria_cientifica, classificacao_alimento, alimento_regional, informacoes_educativas, selo_inspecao)
VALUES (nextval('alimentoid_seq'), 'Maçã', 1, 1, 'NT', FALSE, 'A maçã é uma fruta rica em nutrientes.', TRUE),
	   (nextval('alimentoid_seq'), 'Queijo Minas', 3, 2,'NT',TRUE, 'O queijo Minas é um produto lácteo tradicional brasileiro.', TRUE);
       

select * from usuarios; 
select * from barraquinhas;
select * from feirinhas;
select * from categorias_populares;
select * from categorias_cientificas;
select * from alimentos;
