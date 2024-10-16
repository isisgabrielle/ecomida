CREATE SEQUENCE usuarioid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE tipopenalidadeid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE penalidadesid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE barraquinhaid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE feirinhasid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE categoriapopularid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE categoriacientificaid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE alimentoid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE subcategoriaid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE subcategoriacientificaid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE produtoid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE imagensid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE pedidosid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE promocoesid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE ecomidamarketid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE enderecoid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE avaliacoesid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE horariofuncionamentoid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE chatid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE suporteid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE favoritosid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE produtospedidosid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE estoqueid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE cadastro_agricultorid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;

CREATE SEQUENCE visitaid_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;
		
CREATE SEQUENCE medidas_caseirasid_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE SEQUENCE medida_padraoid_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE SEQUENCE beneficiamentoid_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE SEQUENCE documentoid_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE SEQUENCE tipodocid_seq
    AS integer
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 999999999
    START 1;


CREATE SEQUENCE propriedadeid_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE SEQUENCE correcaoestoqueid_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE SEQUENCE doceducativoid_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;
	
CREATE SEQUENCE conteudo_seq
	AS INTEGER
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;


CREATE TABLE usuario (
    id_usuario BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('usuarioid_seq'),
    nome VARCHAR(256) NOT NULL,
    email VARCHAR(254) NOT NULL,
    telefone CHAR(11) NOT NULL,
    tipo_vinculo CHAR(3) NOT NULL,
    documento VARCHAR(14) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_vinculo CHECK (LENGTH(tipo_vinculo) = 3 AND tipo_vinculo IN ('CON', 'AGR', 'ADM', 'ASS')),
    CONSTRAINT chk_documento CHECK (documento ~ '^[0-9]+$')
);

COMMENT ON COLUMN usuario.tipo_vinculo IS 'CON significa consumidor, AGR significa agricultor, ADM significa administrador, ASS significa assistente social.';

CREATE TABLE tipos_de_penalidade (
    id_tipo_penalidade BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('tipopenalidadeid_seq'),
    descricao VARCHAR(100) NOT NULL,
    gravidade INT NOT NULL CHECK (gravidade BETWEEN 1 AND 5),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN tipos_de_penalidade.gravidade IS 'Vai checar qual é o nível da gravidade se vai de um até 5';

CREATE TABLE penalidades (
    id_penalidades BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('penalidadesid_seq'),
    id_usuario BIGINT NOT NULL,
    id_tipo_penalidade BIGINT NOT NULL,
    data_penalidade DATE NOT NULL,
    descricao VARCHAR(255),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_tipo_penalidade) REFERENCES tipos_de_penalidade(id_tipo_penalidade)
);

CREATE TABLE barraquinha (
    id_barraquinha BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('barraquinhaid_seq'),
    id_usuario BIGINT NOT NULL,
    nome_barraquinha VARCHAR(50) NOT NULL, 
    telefone_barraquinha CHAR(11) NOT NULL,
    realiza_entrega BOOLEAN NOT NULL,
    pontos_de_encontro VARCHAR(500) NOT NULL,
    preco_entrega DECIMAL(12, 2) NOT NULL,
    funcionamento_diadasemana BOOLEAN NOT NULL,
    funcionamento_fds BOOLEAN NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_telefonebarraca CHECK (LENGTH(telefone_barraquinha) = 11 AND telefone_barraquinha ~ '^[0-9]+$'),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

COMMENT ON COLUMN barraquinha.pontos_de_encontro IS 'Os pontos de encontro vão ser disponibilizados pelo proprietário da barraca.';
COMMENT ON COLUMN barraquinha.funcionamento_diadasemana IS 'as informações sobre horario não estão ai pois temos uma tabela de horario de funcionamento ligada a barraquinha.';

CREATE TABLE feirinhas (
    id_feirinhas BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('feirinhasid_seq'),
    nome_feirinhas VARCHAR(256) NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    horario_funcionamento_inicio TIME NOT NULL,
    horario_funcionamento_fim TIME NOT NULL,
    funciona_final_de_semana BOOLEAN NOT NULL,
    horario_final_de_semana_inicio TIME,
    horario_final_de_semana_fim TIME,
    dias_funcionamento VARCHAR(256) NOT NULL,
    CONSTRAINT chk_dias_funcionamento CHECK (dias_funcionamento IN ('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'))
);

CREATE TABLE categoria_popular (
    id_categoriapopular BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('categoriapopularid_seq'),
    nome_categoria VARCHAR(100) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categoria_cientifica (
    id_categoriacientifica BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('categoriacientificaid_seq'),
    nome_categoria VARCHAR(100) NOT NULL UNIQUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN categoria_cientifica.nome_categoria IS 'Nome da categoria científica. Deve ser único.';

CREATE TABLE alimento (
    id_alimento BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('alimentoid_seq'),
    nome_alimento VARCHAR(100) NOT NULL,
    id_categoriapopular BIGINT NOT NULL,
    id_categoriacientifica BIGINT NOT NULL,
    classificacao_alimento CHAR(2) NOT NULL,
    composicao_nutricional VARCHAR(500) NOT NULL,
    alimento_regional BOOLEAN NOT NULL,
    informacoes_educativas VARCHAR(400) NOT NULL,
    selo_inspecao BOOLEAN NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoriacientifica) REFERENCES categoria_cientifica(id_categoriacientifica),
    FOREIGN KEY (id_categoriapopular) REFERENCES categoria_popular(id_categoriapopular),
    CONSTRAINT chk_classificacao_alimento CHECK (LENGTH(classificacao_alimento) = 2 AND classificacao_alimento IN ('NT', 'MP', 'PR'))
);

COMMENT ON COLUMN alimento.classificacao_alimento IS 'NT significa Natural, MP significa Minimamente Processado, PR significa Processado.';

CREATE TABLE subcategoria_popular (
    id_subcategoria BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('subcategoriaid_seq'),
    id_categoriapopular BIGINT NOT NULL,
    nome_sub VARCHAR(100) NOT NULL UNIQUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoriapopular) REFERENCES categoria_popular(id_categoriapopular)
);

CREATE TABLE subcategoria_cientifica (
    id_subcategoria_cientifica BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('subcategoriacientificaid_seq'),
    id_categoriacientifica BIGINT NOT NULL,
    nome_sub VARCHAR(100) NOT NULL UNIQUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoriacientifica) REFERENCES categoria_cientifica(id_categoriacientifica)
);

CREATE TABLE produto (
    id_produto BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('produtoid_seq'),
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(12, 2) NOT NULL,
    descricao_produto VARCHAR(255) NOT NULL,
    id_subcategoria BIGINT NOT NULL,
    id_subcategoria_cientifica BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_subcategoria) REFERENCES subcategoria_popular(id_subcategoria),
    FOREIGN KEY (id_subcategoria_cientifica) REFERENCES subcategoria_cientifica(id_subcategoria_cientifica),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha)
);

CREATE TABLE imagens (
    id_imagem BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('imagensid_seq'),
    nome_imagem VARCHAR(255) NOT NULL,
    dados_imagem VARCHAR (255) NOT NULL,
    id_usuario BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
 );

CREATE TABLE pedidos (
    id_pedidos BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('pedidosid_seq'),
    id_usuario BIGINT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE promocoes (
    id_promocoes BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('promocoesid_seq'),
    id_produto BIGINT NOT NULL,
    desconto DECIMAL(5, 2) NOT NULL,
    validade DATE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE ecomidamarket (
    id_ecomidamarket BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('ecomidamarketid_seq'),
    id_usuario BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha)
);

CREATE TABLE endereco (
    id_endereco BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('enderecoid_seq'),
    id_usuario BIGINT NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE avaliacoes (
    id_avaliacoes BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('avaliacoesid_seq'),
  	id_pedidos BIGINT NOT NULL,
    id_usuario BIGINT NOT NULL,
    avaliacao_barraquinha VARCHAR(1) NOT NULL,
    data_avaliacao DATE,
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT chk_avaliacao_barraquinha CHECK (avaliacao_barraquinha IN ('5', '4', '3', '2', '1'))
);

CREATE TABLE horario_funcionamento (
    id_horario_funcionamento BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('horariofuncionamentoid_seq'),
    id_barraquinha BIGINT NOT NULL,
    horario_abertura TIME NOT NULL,
    horario_fechamento TIME NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	dias_funcionamento VARCHAR(256) NOT NULL,
    CONSTRAINT chk_dias_funcionamento CHECK (dias_funcionamento IN ('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo')),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha)
);

CREATE TABLE chat (
    id_chat BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('chatid_seq'),
    id_pedidos BIGINT NOT NULL,
    mensagem VARCHAR(300) NOT NULL,
	data_envio DATE NOT NULL,
	tipo_remetente VARCHAR (20) NOT NULL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    CONSTRAINT chk_tipo_remetente CHECK (tipo_remetente IN ('C', 'A', 'ADM'))
);

CREATE TABLE suporte (
    id_suporte BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('suporteid_seq'),
    id_usuario BIGINT NOT NULL,
    solicitacao VARCHAR(50) NOT NULL,
	data_solicitacao DATE NOT NULL, 
    descricao VARCHAR(300) NOT NULL,
	status_suporte VARCHAR(30) NOT NULL,
	data_resolucao DATE, 
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT chk_solicitacao CHECK (
        solicitacao IN (
            'Problema Tecnico', 'Duvidas sobre Produtos', 
            'Problemas com Pedidos', 'Reembolso', 
            'Problemas de Pagamento', 'Sugestao', 
            'Problemas de Conta', 'Cancelamento de Conta', 
            'Problemas com Chat'
        )
    ),
    CONSTRAINT chk_status_suporte CHECK (
        status_suporte IN (
            'Aberto', 'Em Analise', 'Pendente', 
            'Aguardando Resposta do Usuario', 
            'Resolvido', 'Fechado', 'Cancelado'
        )
    )
);


CREATE TABLE favoritos (
    id_favoritos BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('favoritosid_seq'),
    id_usuario BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE produtos_pedidos (
    id_produtos_pedidos BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('produtospedidosid_seq'),
    id_produto BIGINT NOT NULL,
    id_pedidos BIGINT NOT NULL,
    quantidade INT NOT NULL,
    valor_quantidade decimal NOT NULL,
    valor_embalagem decimal, 
	valor_desconto decimal,
	valor_total decimal NOT NULL, 
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (quantidade >= 0), 
	CHECK (valor_quantidade >= 0), 
	CHECK (valor_embalagem >= 0), 
	CHECK (valor_desconto >= 0), 
	CHECK (valor_total >= 0), 
    foreign key (id_produto) references produto(id_produto),
    foreign key (id_pedidos) references pedidos(id_pedidos)
 );

CREATE TABLE estoque (
    id_estoque BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('estoqueid_seq'), 
    id_produto BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL, 
    quantidade decimal NOT NULL,
    valor_quantidade decimal NOT NULL,
	CHECK (quantidade >= 0), 
	CHECK (valor_quantidade >= 0), 
    foreign key (id_produto) references produto(id_produto),
    foreign key (id_barraquinha) references barraquinha(id_barraquinha)
 );

CREATE TABLE cadastro_agricultor (
    id_cadastro_agricultor BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('cadastro_agricultorid_seq'), 
    id_agricultor BIGINT NOT NULL,                
    id_assistente_social BIGINT NOT NULL,         
    data_cadastro DATE NOT NULL,                 
    possui_registro BOOLEAN NOT NULL,
    registro_organico VARCHAR(256) NOT NULL,
    certificacoes VARCHAR (256) NOT NULL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_agricultor) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_assistente_social) REFERENCES usuario(id_usuario)
);

CREATE TABLE medidas_padrao (
    id_medida_padrao BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('medida_padraoid_seq'), 
    nome VARCHAR(50) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_tipo_medida CHECK (tipo IN ('P', 'Vol', 'Cont', 'A'))
);

COMMENT ON COLUMN medidas_padrao.tipo IS 'P significa peso, Vol significa volume, CONT significa contagem, A significa área.';

CREATE TABLE medidas_caseiras (
    id_medidas_caseiras BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('medidas_caseirasid_seq'),
    id_medida_padrao BIGINT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_medida_padrao) REFERENCES medidas_padrao(id_medida_padrao),
    CONSTRAINT chk_tipo_medida CHECK (tipo IN ('P', 'Vol', 'Cont', 'A'))
);

COMMENT ON COLUMN medidas_caseiras.tipo IS 'P significa peso, Vol significa volume, CONT significa contagem, A significa área.';

CREATE TABLE beneficiamento (
    id_beneficiamento BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('beneficiamentoid_seq'),
    id_barraquinha BIGINT NOT NULL,
    id_produto BIGINT NOT NULL, 
    data_obtencao DATE NOT NULL,
    local_obtencao VARCHAR(200) NOT NULL, 
    tratamentos TEXT NOT NULL,
    certificacoes_produto VARCHAR(256) NOT NULL,
    data_validade DATE NOT NULL,
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)  	
);

CREATE TABLE tipos_documentos (
    id_tipoDoc BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('tipodocid_seq'),
    nome_tipo VARCHAR(256) NOT NULL
);

CREATE TABLE documentos (
    id_documento BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('documentoid_seq'), 
    id_tipoDoc BIGINT NOT NULL,
    nome_documento VARCHAR(300) NOT NULL, 
    data_emisao DATE NOT NULL,
    data_validade DATE,
    FOREIGN KEY (id_tipoDoc) REFERENCES tipos_documentos(id_tipoDoc)  
);

CREATE TABLE propriedade (
    id_propriedade BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('propriedadeid_seq'),              
    id_cadastro_agricultor BIGINT NOT NULL, 
    nome_propriedade VARCHAR(256) NOT NULL, 
    foto_propriedade1 VARCHAR(256) NOT NULL,               
    foto_propriedade2 VARCHAR(256),                    
    foto_propriedade3 VARCHAR(256),                  
    descricao TEXT NOT NULL,                                     
    latitude NUMERIC(9, 6) NOT NULL,                            
    longitude NUMERIC(9, 6) NOT NULL,    -- VER ISSO                                                            
    FOREIGN KEY (id_cadastro_agricultor) REFERENCES cadastro_agricultor(id_cadastro_agricultor),
    CHECK (latitude BETWEEN -90 AND 90),             
    CHECK (longitude BETWEEN -180 AND 180)            
);

CREATE TABLE visitacao (
    id_visita BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('visitaid_seq'),
    id_propriedade BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    aberta_visita BOOLEAN NOT NULL, 
    cobra_visita BOOLEAN NOT NULL,
    valor_visita DECIMAL NOT NULL, -- VER ISSO
    producao_anos INT NOT NULL,       
    CHECK (valor_visita >= 0), 
    CHECK (producao_anos >= 0), 
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    FOREIGN KEY (id_propriedade) REFERENCES propriedade(id_propriedade)
);

CREATE TABLE correcao_estoque (
    id_correcao BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('correcaoestoqueid_seq'),
    id_usuario BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    data_insercao DATE NOT NULL,
    hora_insercao TIMESTAMP NOT NULL,
    data_alteracao DATE NOT NULL,
    hora_alteracao TIMESTAMP NOT NULL,
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)  	
);

CREATE TABLE documentos_educativos (
    id_doceducativo BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('doceducativoid_seq'),
    id_tipoDoc BIGINT NOT NULL,
    autor_doc VARCHAR(256) NOT NULL,
    foto_capa VARCHAR(256) NOT NULL,
    data_criacao DATE NOT NULL,
    FOREIGN KEY (id_tipoDoc) REFERENCES tipos_documentos(id_tipoDoc)  
);

CREATE TABLE Conteudos_interface (
    id_conteudo BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('conteudo_seq'),
    titulo VARCHAR(256) NOT NULL   
);

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

INSERT INTO alimento (id_alimento, nome_alimento, id_categoriapopular, id_categoriacientifica, classificacao_alimento, composicao_nutricional, alimento_regional, informacoes_educativas, selo_inspecao)
VALUES (nextval('alimentoid_seq'), 'Maçã', 1, 1, 'NT', 'Vitamina C, fibra', FALSE, 'A maçã é uma fruta rica em nutrientes.', TRUE),
	   (nextval('alimentoid_seq'), 'Queijo Minas', 3, 2, 'PR', 'Proteína, cálcio', TRUE, 'O queijo Minas é um produto lácteo tradicional brasileiro.', TRUE);
       

select * from usuario; 
select * from barraquinha;
select * from feirinhas;
select * from categoria_popular;
select * from categoria_cientifica;
select * from alimento;

TRUNCATE TABLE 
	Conteudos_interface,
    penalidades,
	chat,
    suporte,
    imagens,
    produtos_pedidos,
    estoque,
    ecomidamarket,
    pedidos,
    promocoes,
    favoritos,
    avaliacoes,
    barraquinha,
    visitacao,
    correcao_estoque,
    horario_funcionamento,
    beneficiamento,
    cadastro_agricultor,
    propriedade,
    documentos,
    alimento,
	documentos_educativos,
    tipos_documentos,
    tipos_de_penalidade,
    subcategoria_popular,
    subcategoria_cientifica,
    categoria_popular,
    categoria_cientifica,
    produto,
    endereco,
    feirinhas,
    medidas_caseiras,
    medidas_padrao,
    usuario;

ALTER SEQUENCE usuarioid_seq RESTART WITH 1;
ALTER SEQUENCE medidas_caseirasid_seq RESTART WITH 1;
ALTER SEQUENCE medida_padraoid_seq RESTART WITH 1;
ALTER SEQUENCE tipopenalidadeid_seq RESTART WITH 1;
ALTER SEQUENCE penalidadesid_seq RESTART WITH 1;
ALTER SEQUENCE barraquinhaid_seq RESTART WITH 1;
ALTER SEQUENCE feirinhasid_seq RESTART WITH 1;
ALTER SEQUENCE categoriapopularid_seq RESTART WITH 1;
ALTER SEQUENCE categoriacientificaid_seq RESTART WITH 1;
ALTER SEQUENCE alimentoid_seq RESTART WITH 1;
ALTER SEQUENCE doceducativoid_seq RESTART WITH 1;
ALTER SEQUENCE subcategoriaid_seq RESTART WITH 1;
ALTER SEQUENCE subcategoriacientificaid_seq RESTART WITH 1;
ALTER SEQUENCE produtoid_seq RESTART WITH 1;
ALTER SEQUENCE imagensid_seq RESTART WITH 1;
ALTER SEQUENCE pedidosid_seq RESTART WITH 1;
ALTER SEQUENCE promocoesid_seq RESTART WITH 1;
ALTER SEQUENCE ecomidamarketid_seq RESTART WITH 1;
ALTER SEQUENCE enderecoid_seq RESTART WITH 1;
ALTER SEQUENCE avaliacoesid_seq RESTART WITH 1;
ALTER SEQUENCE horariofuncionamentoid_seq RESTART WITH 1;
ALTER SEQUENCE chatid_seq RESTART WITH 1;
ALTER SEQUENCE suporteid_seq RESTART WITH 1;
ALTER SEQUENCE favoritosid_seq RESTART WITH 1;
ALTER SEQUENCE produtospedidosid_seq RESTART WITH 1;
ALTER SEQUENCE estoqueid_seq RESTART WITH 1;
ALTER SEQUENCE cadastro_agricultorid_seq RESTART WITH 1;
ALTER SEQUENCE beneficiamentoid_seq RESTART WITH 1;
ALTER SEQUENCE documentoid_seq RESTART WITH 1;
ALTER SEQUENCE propriedadeid_seq RESTART WITH 1;
ALTER SEQUENCE visitaid_seq RESTART WITH 1;
ALTER SEQUENCE correcaoestoqueid_seq RESTART WITH 1;
ALTER SEQUENCE tipodocid_seq RESTART WITH 1;
ALTER SEQUENCE conteudo_seq RESTART WITH 1;



DROP TABLE IF EXISTS Conteudos_interface;
DROP TABLE IF EXISTS penalidades;
DROP TABLE IF EXISTS chat;
DROP TABLE IF EXISTS suporte;
DROP TABLE IF EXISTS imagens;
DROP TABLE IF EXISTS produtos_pedidos;
DROP TABLE IF EXISTS estoque;
DROP TABLE IF EXISTS ecomidamarket;
DROP TABLE IF EXISTS promocoes;
DROP TABLE IF EXISTS favoritos;
DROP TABLE IF EXISTS avaliacoes;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS visitacao; 
DROP TABLE IF EXISTS correcao_estoque;
DROP TABLE IF EXISTS horario_funcionamento;
DROP TABLE IF EXISTS beneficiamento;
DROP TABLE IF EXISTS propriedade;
DROP TABLE IF EXISTS cadastro_agricultor;
DROP TABLE IF EXISTS documentos;
DROP TABLE IF EXISTS alimento;
DROP TABLE IF EXISTS documentos_educativos;
DROP TABLE IF EXISTS tipos_documentos;
DROP TABLE IF EXISTS tipos_de_penalidade;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS subcategoria_popular;
DROP TABLE IF EXISTS subcategoria_cientifica;
DROP TABLE IF EXISTS categoria_popular;
DROP TABLE IF EXISTS categoria_cientifica;
DROP TABLE IF EXISTS barraquinha;
DROP TABLE IF EXISTS endereco;
DROP TABLE IF EXISTS feirinhas;
DROP TABLE IF EXISTS medidas_caseiras;
DROP TABLE IF EXISTS medidas_padrao;
DROP TABLE IF EXISTS usuario;

DROP SEQUENCE IF EXISTS conteudo_seq;
DROP SEQUENCE IF EXISTS penalidadesid_seq;
DROP SEQUENCE IF EXISTS chatid_seq;
DROP SEQUENCE IF EXISTS suporteid_seq;
DROP SEQUENCE IF EXISTS imagensid_seq;
DROP SEQUENCE IF EXISTS produtospedidosid_seq;
DROP SEQUENCE IF EXISTS estoqueid_seq;
DROP SEQUENCE IF EXISTS ecomidamarketid_seq;
DROP SEQUENCE IF EXISTS promocoesid_seq;
DROP SEQUENCE IF EXISTS favoritosid_seq;
DROP SEQUENCE IF EXISTS avaliacoesid_seq;
DROP SEQUENCE IF EXISTS pedidosid_seq;
DROP SEQUENCE IF EXISTS visitaid_seq;
DROP SEQUENCE IF EXISTS correcaoestoqueid_seq;
DROP SEQUENCE IF EXISTS horariofuncionamentoid_seq;
DROP SEQUENCE IF EXISTS beneficiamentoid_seq;
DROP SEQUENCE IF EXISTS propriedadeid_seq;
DROP SEQUENCE IF EXISTS cadastro_agricultorid_seq;
DROP SEQUENCE IF EXISTS documentoid_seq;
DROP SEQUENCE IF EXISTS alimentoid_seq;
DROP SEQUENCE IF EXISTS doceducativoid_seq;
DROP SEQUENCE IF EXISTS tipodocid_seq;
DROP SEQUENCE IF EXISTS tipopenalidadeid_seq;
DROP SEQUENCE IF EXISTS produtoid_seq;
DROP SEQUENCE IF EXISTS subcategoriaid_seq;
DROP SEQUENCE IF EXISTS subcategoriacientificaid_seq;
DROP SEQUENCE IF EXISTS categoriapopularid_seq;
DROP SEQUENCE IF EXISTS categoriacientificaid_seq;
DROP SEQUENCE IF EXISTS barraquinhaid_seq;
DROP SEQUENCE IF EXISTS enderecoid_seq;
DROP SEQUENCE IF EXISTS feirinhasid_seq;
DROP SEQUENCE IF EXISTS medidas_caseirasid_seq;
DROP SEQUENCE IF EXISTS medida_padraoid_seq;
DROP SEQUENCE IF EXISTS usuarioid_seq;