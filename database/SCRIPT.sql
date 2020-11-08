/******************************************************************************/
/***               Generated by IBExpert 17/07/2020 17:42:53                ***/
/******************************************************************************/

/******************************************************************************/
/***      Following SET SQL DIALECT is just for the Database Comparer       ***/
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE ENDERECO (
    IDENDECO         INTEGER NOT NULL,
    CEP              VARCHAR(8),
    LOGRADOURO       VARCHAR(50),
    NUMERO           VARCHAR(10),
    COMPLEMENTO      VARCHAR(20),
    BAIRRO           VARCHAR(30),
    CIDADE           VARCHAR(40),
    ESTADO           VARCHAR(2),
    PAIS             VARCHAR(40),
    TIPO_LOGRADOURO  VARCHAR(10),
    ID_ENTIDADE      BIGINT
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE ENDERECO ADD CONSTRAINT PK_ENDERECO PRIMARY KEY (IDENDECO);


/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_1 FOREIGN KEY (ID_ENTIDADE) REFERENCES ENTIDADE (ID_ENTIDADE);


/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/


CREATE TABLE USUARIOS (
    ID_USUARIO BIGINT NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    LOGIN VARCHAR(20) NOT NULL,
    SENHA VARCHAR(30) NOT NULL,
    ATIVO SMALLINT
);

select id_usuario,NOME from clientes


ALTER TABLE CLIENTES ADD ID_USUARIO bigint 


/******************************************************************************/
/*                 Generated by IBExpert 21/06/2020 22:49:03                  */
/******************************************************************************/

/******************************************************************************/
/*        Following SET SQL DIALECT is just for the Database Comparer         */
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/***               Generated by IBExpert 17/07/2020 17:43:55                ***/
/******************************************************************************/

/******************************************************************************/
/***      Following SET SQL DIALECT is just for the Database Comparer       ***/
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE ENTIDADE (
    ID_ENTIDADE       BIGINT NOT NULL,
    NOME              VARCHAR(50),
    INSCRICAO_FISCAL  VARCHAR(14),
    EMAIL             VARCHAR(200),
    TELEFONE          VARCHAR(16),
    TIPO_ENTIDADE     INTEGER DEFAULT 300
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE ENTIDADE ADD CONSTRAINT PK_ENTIDADE PRIMARY KEY (ID_ENTIDADE);


/******************************************************************************/
/***                          Fields descriptions                           ***/
/******************************************************************************/

COMMENT ON COLUMN ENTIDADE.TIPO_ENTIDADE IS 
'300 cliente
600 fornecedor';



/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE USUARIOS (
    ID_USUARIO  BIGINT NOT NULL,
    NOME        VARCHAR(50) NOT NULL,
    LOGIN       VARCHAR(20) NOT NULL,
    SENHA       VARCHAR(30) NOT NULL,
    ATIVO       SMALLINT DEFAULT 1
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE USUARIOS ADD CONSTRAINT PK_USUARIOS PRIMARY KEY (ID_USUARIO);


/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/
