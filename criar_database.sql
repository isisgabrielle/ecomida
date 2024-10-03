CREATE SEQUENCE usuarioid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE usuario (
    id_usuario INT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(256) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    vinculo VARCHAR(3) NOT NULL,
    documento VARCHAR (14) NOT NULL,
    penalidades INT,
    CONSTRAINT chk_vinculo CHECK (vinculo IN ('CON', 'AGR', 'ADM', 'ASS'))
);

COMMENT ON COLUMN usuario.vinculo IS 'CON significa consumidor, AGR significa agricultor, ADM significa administrador, ASS significa assistente social.';

CREATE SEQUENCE barraquinhaid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

 create table barraquinha (
    id_barraquinha int not null primary key,
    id_usuario int,
    nome_barraquinha varchar (150), 
    telefone_barraquinha varchar(14),
    realiza_entrega BOOLEAN,
    pontos_de_encontro varchar (500),
    preço_entrega decimal,
    funcionamento_diadasemana BOOLEAN,
    funcionamento_fds BOOLEAN,
    foreign key (id_usuario) references usuario(id_usuario)
 );

CREATE SEQUENCE feirinhasid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table feirinhas (
    id_feirinhas int not null primary key,
	nome_feirinhas varchar (256) not null,
	dias_abertura varchar (256)
);

CREATE SEQUENCE categoriapopularid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table categoria_popular(
    id_categoriapopular int not null primary key ,
    nome_categoria varchar (256) not null
 );
 
CREATE SEQUENCE categoriacientificaid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table categoria_cientifica(
    id_categoriacientifica int not null primary key ,
    nome_categoria varchar (256) not null
 );
 
CREATE SEQUENCE alimentoid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE alimento (
    id_alimento INT NOT NULL PRIMARY KEY,
    nome_alimento VARCHAR(100) NOT NULL,
    id_categoriapopular INT,
    id_categoriacientifica INT,
    classificacao_alimento VARCHAR(100),
    composicao_nutricional VARCHAR(500) NOT NULL,
    alimento_regional BOOLEAN,
    informacoes_educativas varchar (400),
    selo_inspecao BOOLEAN,
    FOREIGN KEY (id_categoriacientifica) REFERENCES categoria_cientifica(id_categoriacientifica),
    FOREIGN KEY (id_categoriapopular) REFERENCES categoria_popular(id_categoriapopular),
    CONSTRAINT chk_classificacao_alimento CHECK (classificacao_alimento IN ('N', 'MP', 'P'))
);
COMMENT ON COLUMN alimento.classificacao_alimento IS 'N significa Natural, MP significa Minimamente Processado, P significa Processado.';

CREATE SEQUENCE subcategoriaid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table subcategoria_popular(
    id_subcategoria INT NOT NULL PRIMARY KEY,
    id_categoriapopular INT,
	nome_sub varchar (256),
    FOREIGN KEY (id_categoriapopular) REFERENCES categoria_popular(id_categoriapopular)
 );

CREATE SEQUENCE subcategoriacientificaid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

 CREATE TABLE subcategoria_cientifica (
    id_subcategoriacientifica int PRIMARY KEY,
    id_categoriacientifica INT,
	nome_cientifica varchar (256),
    FOREIGN KEY (id_categoriacientifica) REFERENCES categoria_cientifica(id_categoriacientifica)
 );
 
CREATE SEQUENCE produtoid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table produto(
    id_produto int not null primary key ,
    id_alimento int,
    id_barraquinha int,
    nome_produto varchar (100) not null,
    descrição_produto varchar (255) not null,
    data_validade date,
    unidade int,
    preço decimal,  
    exibir BOOLEAN,   
    foreign key (id_barraquinha) references barraquinha (id_barraquinha),
    foreign key (id_alimento) references alimento(id_alimento)
);

CREATE SEQUENCE imagemid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE imagens (
    id_imagem INT PRIMARY KEY,
    nome_imagem VARCHAR(255) NOT NULL,
    dados_imagem VARCHAR (255) NOT NULL,
    id_usuario int NOT NULL,
    id_barraquinha int NOT NULL,
    id_produto int NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
 );
 
CREATE SEQUENCE pedidosid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE pedidos (
    id_pedidos INT NOT NULL PRIMARY KEY,
    id_usuario INT,
    id_barraquinha INT,
    data_pedido DATE,
    situacao VARCHAR(50) NOT NULL,
    observacoes VARCHAR(150),
    valor_de_entrega DECIMAL(10, 2),
    valor_total DECIMAL(10, 2),
    hora_do_pedido TIME,
    codigo_seguranca varchar (10),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    CONSTRAINT chk_situacao CHECK (situacao IN ('em analise', 'aceito', 'pronto para retirar', 'em transito', 'entregue', 'cancelado'))
);
CREATE SEQUENCE promocoesid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table promocoes(
    id_promocoes int not null primary key,
    id_barraquinha int,
    id_produto int,
    cupons decimal,
    foreign key (id_barraquinha) references barraquinha(id_barraquinha),
    foreign key (id_produto) references produto(id_produto)
);

CREATE SEQUENCE ecomidamarketid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table ecomidamarket(
    id_destaque int not null primary key,
    id_produto int,
    texto_produto text,
    id_imagem int,
    id_barraquinha int,
    foreign key (id_produto) references produto(id_produto),
    foreign key (id_imagem) references imagens(id_imagem),
    foreign key (id_barraquinha) references barraquinha(id_barraquinha)
);

CREATE SEQUENCE enderecoid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

 create table endereco (
    id_endereco int not null primary key ,
    id_usuario  int not null,
    cidade varchar (50) not null,
    bairro varchar (150) not null,
    rua varchar (150) not null,
    numero int not null,
    complemento varchar (150) not null,
    cep varchar (9) not null,
    estado varchar (256) not null,
    foreign key (id_usuario) references usuario(id_usuario)
 );

CREATE SEQUENCE avaliacaoid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;
	 
CREATE TABLE avaliacoes (
    id_avaliacao INT NOT NULL PRIMARY KEY,
    id_pedidos INT,
    id_usuario INT,
    avaliacao_barraquinha VARCHAR(1) NOT NULL,
    data_avaliacao DATE,
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT chk_avaliacao_barraquinha CHECK (avaliacao_barraquinha IN ('5', '4', '3', '2', '1'))
);
CREATE SEQUENCE horariofuncionamentoid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;
	 
create table horario_funcionamento (
    id_horariofuncionamento int not null primary key,
    abertura time not null,
    abertura_fds time not null,
    fechamento time not null, 
    fechamento_fds time not null,
    id_barraquinha int,
    foreign key (id_barraquinha) references barraquinha(id_barraquinha)
);


CREATE SEQUENCE chatid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE chat (
    id_chat INT NOT NULL PRIMARY KEY,
    id_pedidos INT NOT NULL,
    mensagem VARCHAR(300) NOT NULL,
    data_envio DATE NOT NULL,
    tipo_remetente VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    CONSTRAINT chk_tipo_remetente CHECK (tipo_remetente IN ('C', 'A', 'ADM'))
);
COMMENT ON COLUMN chat.tipo_remetente IS 'C significa consumidor, A significa agricultor, ADM significa administrador.';


CREATE SEQUENCE suporteid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE suporte (
    id_suporte INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    solicitacao VARCHAR(50) NOT NULL,
    data_solicitacao DATE NOT NULL, 
    descricao VARCHAR(300) NOT NULL,
    status_suporte VARCHAR(30) NOT NULL,
    data_resolucao DATE, 
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

CREATE SEQUENCE favoritosid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

 create table favoritos(
    id_favoritos int not null primary key,
    id_usuario int not null, 
    id_produto int not null, 
    foreign key (id_usuario) references usuario (id_usuario),
    foreign key (id_produto) references produto (id_produto)
 );

CREATE SEQUENCE produtospedidosid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table produtos_pedidos(
    id_produtospedidos INT NOT NULL PRIMARY KEY,
    id_produto int NOT NULL, 
    id_pedidos int NOT NULL, 
    quantidade int NOT NULL,
    valor_quantidade decimal NOT NULL,
    valor_embalagem decimal, 
    valor_desconto decimal,
    valor_total decimal NOT NULL, 
	CHECK (quantidade >= 0), 
	CHECK (valor_quantidade >= 0), 
	CHECK (valor_embalagem >= 0), 
	CHECK (valor_desconto >= 0), 
	CHECK (valor_total >= 0), 
    foreign key (id_produto) references produto(id_produto),
    foreign key (id_pedidos) references pedidos(id_pedidos)
 );

CREATE SEQUENCE estoqueid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

create table estoque(
    id_estoque INT NOT NULL PRIMARY KEY , 
    id_produto INT NOT NULL,
    id_barraquinha INT NOT NULL, 
    quantidade decimal NOT NULL,
    valor_quantidade decimal NOT NULL,
	CHECK (quantidade >= 0), 
	CHECK (valor_quantidade >= 0), 
    foreign key (id_produto) references produto(id_produto),
    foreign key (id_barraquinha) references barraquinha(id_barraquinha)
 );
   
CREATE SEQUENCE cadastro_agricultorid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

 CREATE TABLE cadastro_agricultor (
    id_cadastro_agricultor INT NOT NULL PRIMARY KEY,  
    id_agricultor INT NOT NULL,                
    id_assistente_social INT NOT NULL,         
    data_cadastro DATE NOT NULL, 
    possui_registro BOOLEAN NOT NULL,
    registro_organico VARCHAR(256) NOT NULL,
    certificacoes VARCHAR (256) NOT NULL,
    FOREIGN KEY (id_agricultor) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_assistente_social) REFERENCES usuario(id_usuario)
);

CREATE SEQUENCE visitaid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;
		
CREATE SEQUENCE medidas_caseirasid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;
	
CREATE TABLE medidas_padrao (
    id_medida_padrao INT NOT NULL PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    CONSTRAINT chk_tipo_medida CHECK (tipo IN ('P', 'Vol', 'Cont', 'A'))
);

COMMENT ON COLUMN medidas_padrao.tipo IS 'P significa peso, Vol significa volume, CONT significa contagem, A significa área.';

CREATE TABLE medidas_caseiras (
    id_medidas_caseiras INT  NOT NULL PRIMARY KEY,
    id_medida_padrao INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_medida_padrao) REFERENCES medidas_padrao(id_medida_padrao),
    CONSTRAINT chk_tipo_medida CHECK (tipo IN ('P', 'Vol', 'Cont', 'A'))
);
COMMENT ON COLUMN usuario.vinculo IS 'P significa peso, Vol significa volume, CONT significa contagem, A siginifica área.';

CREATE SEQUENCE beneficiamentoid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE beneficiamento (
    id_beneficiamento INT NOT NULL PRIMARY KEY,
    id_barraquinha INT NOT NULL,
    id_produto INT NOT NULL, 
    data_obtencao DATE NOT NULL,
    local_obtencao VARCHAR(200) NOT NULL, 
    tratamentos TEXT NOT NULL,
    certificacoes_produto varchar (256) NOT NULL,
    data_validade DATE NOT NULL,
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)  	
);

CREATE SEQUENCE documentoid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;
	
CREATE TABLE tipos_documentos(
    id_tipoDoc INT NOT NULL PRIMARY KEY,
    nome_tipo VARCHAR (256) NOT NULL
);

CREATE TABLE documentos (
    id_documento INT NOT NULL PRIMARY KEY, 
    id_tipoDoc INT NOT NULL,
    nome_documento VARCHAR(300)NOT NULL, 
    data_emisao DATE NOT NULL,
    data_validade DATE,
    FOREIGN KEY (id_tipoDoc) REFERENCES tipos_documentos(id_tipoDoc)  
);

CREATE SEQUENCE propriedadeid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE propriedade (
    id_propriedade INT NOT NULL PRIMARY KEY,              
    id_cadastro_agricultor INT NOT NULL, 
    nome_propriedade varchar(256) NOT NULL, 
    foto_propriedade1 VARCHAR(256) NOT NULL,               
    foto_propriedade2 VARCHAR(256),                    
    foto_propriedade3 VARCHAR(256),                  
    descricao TEXT NOT NULL,                                     
    latitude NUMERIC(9, 6) NOT NULL,                            
    longitude NUMERIC(9, 6) NOT NULL,                                                                
    FOREIGN KEY (id_cadastro_agricultor) REFERENCES cadastro_agricultor(id_cadastro_agricultor),
    CHECK (latitude BETWEEN -90 AND 90),             
    CHECK (longitude BETWEEN -180 AND 180)            
);

CREATE TABLE visitacao (
    id_visita INT NOT NULL PRIMARY KEY,
    id_propriedade INT NOT NULL,
    id_barraquinha INT NOT NULL,
    aberta_visita BOOLEAN NOT NULL, 
    cobra_visita BOOLEAN NOT NULL,
    valor_visita DECIMAL NOT NULL,
    producao_anos INT NOT NULL,       
    CHECK (valor_visita >= 0), 
    CHECK (producao_anos >= 0), 
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    FOREIGN KEY (id_propriedade) REFERENCES propriedade(id_propriedade)
);

CREATE SEQUENCE correcaoestoqueid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE correcao_estoque (
    id_correcao INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_barraquinha INT NOT NULL,
    data_insercao DATE NOT NULL,
    hora_insercao TIMESTAMP NOT NULL,
    data_alteracao DATE NOT NULL,
    hora_alteracao TIMESTAMP NOT NULL,
    FOREIGN KEY (id_barraquinha) REFERENCES barraquinha(id_barraquinha),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)  	
);

CREATE SEQUENCE doceducativoid_seq
	AS integer
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 999999999
	START 1;

CREATE TABLE documentos_educativos(
    id_doceducativo INT NOT NULL PRIMARY KEY,
    id_tipoDoc INT NOT NULL,
    autor_doc VARCHAR (256) NOT NULL,
    foto_capa VARCHAR (256) NOT NULL,
    data_criacao DATE NOT NULL,
    FOREIGN KEY (id_tipoDoc) REFERENCES tipos_documentos(id_tipoDoc)  
);


CREATE TABLE Conteudos_interface(

);
	

 	
	
