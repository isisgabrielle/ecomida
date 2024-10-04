INSERT INTO usuario (id_usuario, nome, email, telefone, vinculo, documento, possui_registro, registro_organico, penalidades) 
VALUES 
    (nextval('usuarioid_seq'), 'João Silva', 'joao@email.com', '11111111111', 'CON', '12345678901', true, 'ORG123', 0),
    (nextval('usuarioid_seq'), 'Maria Oliveira', 'maria@email.com', '22222222222', 'AGR', '98765432100', false, null, 1);

INSERT INTO barraquinha (id_barraquinha, id_usuario, nome_barraquinha, telefone_barraquinha, realiza_entrega, pontos_de_encontro, preço_entrega, funcionamento_diadasemana, funcionamento_fds) 
VALUES 
    (nextval('barraquinhaid_seq'), currval('usuarioid_seq'), 'Barraquinha da Maria', '33333333333', true, 'Praça Central', 5.50, true, false);

INSERT INTO feirinhas (id_feirinhas, nome_feirinhas, dias_abertura)
VALUES 
	(nextval('feirinhasid_seq'), 'Feirinha do Mercado Central', 'Terça, Quinta, Sábado'),
	(nextval('feirinhasid_seq'), 'Feirinha da Praia', 'Domingo, Segunda');

INSERT INTO categoria_popular (id_categoriapopular, nome_categoria)
VALUES (nextval('categoriapopularid_seq'), 'Frutas'),
	   (nextval('categoriapopularid_seq'), 'Verduras'),
	   (nextval('categoriapopularid_seq'), 'Laticínios');
	   
INSERT INTO categoria_cientifica (id_categoriacientifica, nome_categoria)
VALUES (nextval('categoriacientificaid_seq'), 'Vitamínico'),
       (nextval('categoriacientificaid_seq'), 'Proteico'),
	   (nextval('categoriacientificaid_seq'), 'Energético');

INSERT INTO alimento (id_alimento, nome_alimento, id_categoriapopular, id_categoriacientifica, classificacao_alimento, composicao_nutricional, alimento_regional, informacoes_educativas, selo_inspecao)
VALUES (nextval('alimentoid_seq'), 'Maçã', 1, 1, 'N', 'Vitamina C, fibra', FALSE, 'A maçã é uma fruta rica em nutrientes.', TRUE),
	   (nextval('alimentoid_seq'), 'Queijo Minas', 3, 2, 'P', 'Proteína, cálcio', TRUE, 'O queijo Minas é um produto lácteo tradicional brasileiro.', TRUE);
       

select * from usuario; 
select * from barraquinha;
select * from feirinhas;
select * from categoria_popular;
select * from categoria_cientifica;
select * from alimento;