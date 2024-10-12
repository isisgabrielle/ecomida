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
    CONSTRAINT chk_telefone CHECK (LENGTH(telefone) = 11 AND telefone ~ '^[0-9]+$'),
    CONSTRAINT chk_vinculo CHECK (LENGTH(tipo_vinculo) = 3 AND tipo_vinculo IN ('CON', 'AGR', 'ADM', 'ASS')),
    CONSTRAINT chk_documento CHECK (documento ~ '^[0-9]+$')
);

COMMENT ON COLUMN usuario.telefone IS 'O check para telefone faz com que o banco aceite apenas números como entrada e receba apenas 11 caracteres.';
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
