TRUNCATE TABLE 
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
ALTER SEQUENCE tipopenalidadeid_seq RESTART WITH 1;
ALTER SEQUENCE penalidadeid_seq RESTART WITH 1;
ALTER SEQUENCE barraquinhaid_seq RESTART WITH 1;
ALTER SEQUENCE feirinhasid_seq RESTART WITH 1;
ALTER SEQUENCE categoriapopularid_seq RESTART WITH 1;
ALTER SEQUENCE categoriacientificaid_seq RESTART WITH 1;
ALTER SEQUENCE alimentoid_seq RESTART WITH 1;
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
