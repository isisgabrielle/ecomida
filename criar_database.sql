CREATE SEQUENCE usuarioid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE tipopenalidadeid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE penalidadeid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE barraquinhaid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE feirinhaid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE categoriapopularid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE categoriacientificaid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE alimentoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE subcategoriapopularid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE subcategoriacientificaid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE produtoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE imagemid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE pedidoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE promocaoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE ecomidamarketid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE enderecoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE avaliacaoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE horariofuncionamentoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE chatid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE suporteid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE favoritoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE produtopedidoid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE estoqueid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE cadastroagricultorid_seq
    AS bigint
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

CREATE SEQUENCE visitaid_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;
		
CREATE SEQUENCE medidacaseiraid_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE medidapadraoid_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE beneficiamentoid_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE documentoid_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE tipodocid_seq
       AS bigint
       INCREMENT 1
       MINVALUE 1
       MAXVALUE 9223372036854775807
       START 1;


CREATE SEQUENCE propriedadeid_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE correcaoestoqueid_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE doceducativoid_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;
	
CREATE SEQUENCE conteudo_seq
	AS bigint
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;


CREATE TABLE usuarios (
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

COMMENT ON COLUMN usuarios.tipo_vinculo IS 'CON significa consumidor, AGR significa agricultor, ADM significa administrador, ASS significa assistente social.';

CREATE TABLE tipos_de_penalidades (
    id_tipo_penalidade BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('tipopenalidadeid_seq'),
    nome_do_tipo VARCHAR(255) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    gravidade INT NOT NULL CHECK (gravidade BETWEEN 1 AND 5),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN tipos_de_penalidades.gravidade IS 'Vai checar qual é o nível da gravidade se vai de um até 5';

CREATE TABLE penalidades (
    id_penalidade BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('penalidadeid_seq'),
    id_usuario BIGINT NOT NULL,
    id_tipo_penalidade BIGINT NOT NULL,
    data_penalidade DATE NOT NULL,
    descricao VARCHAR(255),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_tipo_penalidade) REFERENCES tipos_de_penalidades(id_tipo_penalidade)
);

CREATE TABLE barraquinhas (
    id_barraquinha BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('barraquinhaid_seq'),
    id_usuario BIGINT NOT NULL,
    nome_barraquinha VARCHAR(50) NOT NULL, 
    telefone_barraquinha CHAR(11) NOT NULL,
    realiza_entrega BOOLEAN NOT NULL,
    pontos_de_encontro VARCHAR(500) NOT NULL,
    preco_entrega DECIMAL(12, 2) NOT NULL,
    funcionamento_dia_da_semana BOOLEAN NOT NULL,
    funcionamento_fds BOOLEAN NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_telefonebarraca CHECK (LENGTH(telefone_barraquinha) = 11 AND telefone_barraquinha ~ '^[0-9]+$'),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

COMMENT ON COLUMN barraquinhas.pontos_de_encontro IS 'Os pontos de encontro vão ser disponibilizados pelo proprietário da barraca.';
COMMENT ON COLUMN barraquinhas.funcionamento_dia_da_semana IS 'as informações sobre horario não estão ai pois temos uma tabela de horario de funcionamento ligada a barraquinha.';

CREATE TABLE feirinhas (
    id_feirinha BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('feirinhaid_seq'),
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

CREATE TABLE categorias_populares (
    id_categoria_popular BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('categoriapopularid_seq'),
    nome_categoria VARCHAR(100) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias_cientificas (
    id_categoria_cientifica BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('categoriacientificaid_seq'),
    nome_categoria VARCHAR(100) NOT NULL UNIQUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON COLUMN categorias_cientificas.nome_categoria IS 'Nome da categoria científica. Deve ser único.';

CREATE TABLE alimentos (
    id_alimento BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('alimentoid_seq'),
    nome_alimento VARCHAR(100) NOT NULL,
    id_categoria_popular BIGINT NOT NULL,
    id_categoria_cientifica BIGINT NOT NULL,
    classificacao_alimento CHAR(2) NOT NULL,
    alimento_regional BOOLEAN NOT NULL,
    informacoes_educativas VARCHAR(400) NOT NULL,
    selo_inspecao BOOLEAN NOT NULL,
    umidade DECIMAL(5, 2),
    energia_kcal DECIMAL(5, 2),
    energia_kj DECIMAL(5, 2),
    proteina DECIMAL(5, 2),
    lipideos DECIMAL(5, 2),
    colesterol DECIMAL(5, 2),
    carboidrato DECIMAL(5, 2),
    fibra DECIMAL(5, 2),
    cinzas DECIMAL(5, 2),
    calcio DECIMAL(5, 2),
    magnesio DECIMAL(5, 2),
    manganes DECIMAL(5, 2),
    fosforo DECIMAL(5, 2),
    ferro DECIMAL(5, 2),
    sodio DECIMAL(5, 2),
    potassio DECIMAL(5, 2),
    zinco DECIMAL(5, 2),
    cobre DECIMAL(5, 2),
    retinol DECIMAL(5, 2),
    re DECIMAL(5, 2),
    rae DECIMAL(5, 2),
    tiamina DECIMAL(5, 2),
    riboflavina DECIMAL(5, 2),
    piridoxina DECIMAL(5, 2),
    niacina DECIMAL(5, 2),
    vitamina_c DECIMAL(5, 2),
    "SAT_12:0" DECIMAL(5, 2),
    "SAT_14:0" DECIMAL(5, 2),
    "SAT_16:0" DECIMAL(5, 2),
    "SAT_18:0" DECIMAL(5, 2),
    "SAT_20:0" DECIMAL(5, 2),
    "SAT_22:0" DECIMAL(5, 2),
    "SAT_24:0" DECIMAL(5, 2),
    "MINSAT_14:1" DECIMAL(5, 2),
    "MINSAT_16:1" DECIMAL(5, 2),
    "MINSAT_18:1" DECIMAL(5, 2),
    "MINSAT_20:1" DECIMAL(5, 2),
    "POLI_18:2_n-6" DECIMAL(5, 2),
    "POLI_18:3_n-3" DECIMAL(5, 2),
    "POLI_20:4" DECIMAL(5, 2),
    "POLI_20:5" DECIMAL(5, 2),
    "POLI_22:5" DECIMAL(5, 2),
    "POLI_22:6" DECIMAL(5, 2),
    "POLI_18:1t" DECIMAL(5, 2),
    "POLI_18:2t" DECIMAL(5, 2),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria_cientifica) REFERENCES categorias_cientificas(id_categoria_cientifica),
    FOREIGN KEY (id_categoria_popular) REFERENCES categorias_populares(id_categoria_popular),
    CONSTRAINT chk_classificacao_alimento CHECK (LENGTH(classificacao_alimento) = 2 AND classificacao_alimento IN ('NT', 'MP', 'PR'))

);
COMMENT ON COLUMN alimentos.classificacao_alimento IS 'NT significa Natural, MP significa Minimamente Processado, PR significa Processado.';
COMMENT ON COLUMN alimentos."SAT_12:0" IS 'SAT refere-se aos acidos saturados';
COMMENT ON COLUMN alimentos."MINSAT_14:1" IS 'SAT refere-se aos acidos monoinsaturados';
COMMENT ON COLUMN alimentos."POLI_20:4" IS 'POLI refere-se aos acidos poliinsaturados';

CREATE TABLE subcategorias_populares (
    id_subcategoria_popular BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('subcategoriapopularid_seq'),
    id_categoria_popular BIGINT NOT NULL,
    nome_sub VARCHAR(100) NOT NULL UNIQUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria_popular) REFERENCES categorias_populares(id_categoria_popular)
);

CREATE TABLE subcategorias_cientificas (
    id_subcategoria_cientifica BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('subcategoriacientificaid_seq'),
    id_categoria_cientifica BIGINT NOT NULL,
    nome_sub VARCHAR(100) NOT NULL UNIQUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria_cientifica) REFERENCES categorias_cientificas(id_categoria_cientifica)
);

CREATE TABLE produtos (
    id_produto BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('produtoid_seq'),
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(12, 2) NOT NULL,
    descricao_produto VARCHAR(255) NOT NULL,
    id_subcategoria_popular BIGINT NOT NULL,
    id_subcategoria_cientifica BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_subcategoria_popular) REFERENCES subcategorias_populares(id_subcategoria_popular),
    FOREIGN KEY (id_subcategoria_cientifica) REFERENCES subcategorias_cientificas(id_subcategoria_cientifica),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinhas(id_barraquinha)
);

CREATE TABLE imagens (
    id_imagem BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('imagemid_seq'),
    nome_imagem VARCHAR(255) NOT NULL,
    dados_imagem VARCHAR (255) NOT NULL,
    id_usuario BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinhas(id_barraquinha),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
 );

CREATE TABLE pedidos (
    id_pedido BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('pedidoid_seq'),
    id_usuario BIGINT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE promocoes (
    id_promocao BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('promocaoid_seq'),
    id_produto BIGINT NOT NULL,
    desconto DECIMAL(5, 2) NOT NULL,
    validade DATE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE ecomidamarket (
    id_ecomidamarket BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('ecomidamarketid_seq'),
    id_usuario BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinhas(id_barraquinha)
);

CREATE TABLE enderecos (
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
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE avaliacoes (
    id_avaliacao BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('avaliacaoid_seq'),
    id_pedido BIGINT NOT NULL,
    id_usuario BIGINT NOT NULL,
    avaliacao_barraquinha VARCHAR(1) NOT NULL,
    data_hora_avaliacao TIMESTAMP NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT chk_avaliacao_barraquinha CHECK (avaliacao_barraquinha IN ('5', '4', '3', '2', '1'))
);

CREATE TABLE horarios_funcionamento (
    id_horario_funcionamento BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('horariofuncionamentoid_seq'),
    id_barraquinha BIGINT NOT NULL,
    horario_abertura TIME NOT NULL,
    horario_fechamento TIME NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dias_funcionamento VARCHAR(256) NOT NULL,
    CONSTRAINT chk_dias_funcionamento CHECK (dias_funcionamento IN ('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo')),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinhas(id_barraquinha)
);

CREATE TABLE chats (
    id_chat BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('chatid_seq'),
    id_pedido BIGINT NOT NULL,
    mensagem VARCHAR(300) NOT NULL,
    data_hora_envio TIMESTAMP NOT NULL,
    tipo_remetente VARCHAR (3) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    CONSTRAINT chk_tipo_remetente CHECK (tipo_remetente IN ('CON', 'AGR', 'ADM','ASS'))
);

COMMENT ON COLUMN chats.tipo_remetente IS 'CON significa consumidor, AGR significa agricultor, ADM significa administrador, ASS significa assistente social.';

CREATE TABLE suportes (
    id_suporte BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('suporteid_seq'),
    id_usuario BIGINT NOT NULL,
    solicitacao VARCHAR(50) NOT NULL,
    data_solicitacao DATE NOT NULL, 
    descricao VARCHAR(300) NOT NULL,
    status_suporte VARCHAR(30) NOT NULL,
    data_resolucao DATE, 
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
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
    id_favorito BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('favoritoid_seq'),
    id_usuario BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE produtos_pedidos (
    id_produto_pedido BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('produtopedidoid_seq'),
    id_produto BIGINT NOT NULL,
    id_pedido BIGINT NOT NULL,
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
    foreign key (id_produto) references produtos(id_produto),
    foreign key (id_pedido) references pedidos(id_pedido)
 );

CREATE TABLE estoques (
    id_estoque BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('estoqueid_seq'), 
    id_produto BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL, 
    quantidade decimal NOT NULL,
    valor_quantidade decimal NOT NULL,
    CHECK (quantidade >= 0), 
    CHECK (valor_quantidade >= 0), 
    foreign key (id_produto) references produtos(id_produto),
    foreign key (id_barraquinha) references barraquinhas(id_barraquinha)
 );

CREATE TABLE cadastros_agricultores (
    id_cadastro_agricultor BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('cadastroagricultorid_seq'), 
    id_usuario BIGINT NOT NULL,                
    id_assistente_social BIGINT NOT NULL,         
    data_cadastro DATE NOT NULL,                 
    possui_registro BOOLEAN NOT NULL,
    registro_organico VARCHAR(256) NOT NULL,
    certificacoes VARCHAR (256) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_assistente_social) REFERENCES usuarios(id_usuario)
);

CREATE TABLE medidas_padrao (
    id_medida_padrao BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('medidapadraoid_seq'), 
    nome VARCHAR(50) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_tipo_medida CHECK (tipo IN ('P', 'Vol', 'Cont', 'A'))
);

COMMENT ON COLUMN medidas_padrao.tipo IS 'P significa peso, Vol significa volume, CONT significa contagem, A significa área.';

CREATE TABLE medidas_caseiras (
    id_medida_caseira BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('medidacaseiraid_seq'),
    id_medida_padrao BIGINT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_medida_padrao) REFERENCES medidas_padrao(id_medida_padrao),
    CONSTRAINT chk_tipo_medida CHECK (tipo IN ('P', 'Vol', 'Cont', 'A'))
);

COMMENT ON COLUMN medidas_caseiras.tipo IS 'P significa peso, Vol significa volume, CONT significa contagem, A significa área.';

CREATE TABLE beneficiamentos (
    id_beneficiamento BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('beneficiamentoid_seq'),
    id_barraquinha BIGINT NOT NULL,
    id_produto BIGINT NOT NULL, 
    data_obtencao DATE NOT NULL,
    local_obtencao VARCHAR(200) NOT NULL, 
    tratamentos TEXT NOT NULL,
    certificacoes_produto VARCHAR(256) NOT NULL,
    data_validade DATE NOT NULL,
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinhas(id_barraquinha),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)  	
);

CREATE TABLE tipos_documentos (
    id_tipo_doc BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('tipodocid_seq'),
    nome_tipo VARCHAR(256) NOT NULL
);

CREATE TABLE documentos (
    id_documento BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('documentoid_seq'), 
    id_tipo_doc BIGINT NOT NULL,
    nome_documento VARCHAR(300) NOT NULL, 
    data_emisao DATE NOT NULL,
    data_validade DATE,
    FOREIGN KEY (id_tipo_doc) REFERENCES tipos_documentos(id_tipo_doc)  
);

CREATE TABLE propriedades (
    id_propriedade BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('propriedadeid_seq'),              
    id_cadastro_agricultor BIGINT NOT NULL, 
    nome_propriedade VARCHAR(256) NOT NULL, 
    foto_propriedade1 VARCHAR(256) NOT NULL,               
    foto_propriedade2 VARCHAR(256),                    
    foto_propriedade3 VARCHAR(256),                  
    descricao TEXT NOT NULL,                                     
    latitude NUMERIC(9, 6) NOT NULL,                            
    longitude NUMERIC(9, 6) NOT NULL,                                                              
    FOREIGN KEY (id_cadastro_agricultor) REFERENCES cadastros_agricultores(id_cadastro_agricultor),
    CHECK (latitude BETWEEN -90 AND 90),             
    CHECK (longitude BETWEEN -180 AND 180)            
);

CREATE TABLE visitacoes (
    id_visita BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('visitaid_seq'),
    id_propriedade BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    aberta_visita BOOLEAN NOT NULL, 
    cobra_visita BOOLEAN NOT NULL,
    valor_visita DECIMAL NOT NULL, 
    producao_anos INT NOT NULL,       
    CHECK (valor_visita >= 0), 
    CHECK (producao_anos >= 0), 
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinhas(id_barraquinha),
    FOREIGN KEY (id_propriedade) REFERENCES propriedades(id_propriedade)
);

CREATE TABLE correcoes_estoque (
    id_correcao BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('correcaoestoqueid_seq'),
    id_usuario BIGINT NOT NULL,
    id_barraquinha BIGINT NOT NULL,
    data_hora_insercao TIMESTAMP NOT NULL,
    data_hora_alteracao TIMESTAMP NOT NULL,
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinhas(id_barraquinha),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)  	
);

CREATE TABLE documentos_educativos (
    id_doceducativo BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('doceducativoid_seq'),
    id_tipo_doc BIGINT NOT NULL,
    autor_doc VARCHAR(256) NOT NULL,
    foto_capa VARCHAR(256) NOT NULL,
    data_criacao DATE NOT NULL,
    FOREIGN KEY (id_tipo_doc) REFERENCES tipos_documentos(id_tipo_doc)  
);

CREATE TABLE conteudos_interface (
    id_conteudo BIGINT NOT NULL PRIMARY KEY DEFAULT nextval('conteudo_seq'),
    titulo VARCHAR(256) NOT NULL   
);
