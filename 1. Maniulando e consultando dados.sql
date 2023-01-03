#----------------------------------------------------------------------#
#-----------------------Criando a base de dados------------------------#
#----------------------------------------------------------------------#
CREATE DATABASE SUCOS;
# O SQL não é Case-sensitive, ou seja, não diferencia letras maiúsculas e 
# minúsculas. Uma boa pratica é usar os comandos todos em letras maiúsculas.
# Uma observação a se fazer é que se usa o ";" depois de todo código.


#----------------------------------------------------------------------#
#---------------------Selecionando a base de dados---------------------#
#----------------------------------------------------------------------#
# Pode-se fazer o mesmo com um duplo clique na pasta, no ambiente navigator, 
# na lateral esquerda do MySQL Workbench.
USE Sucos;


#----------------------------------------------------------------------#
#----------------------------Criando Tabelas---------------------------#
#----------------------------------------------------------------------#
#-------------Tabela dos Clientes------------#
# Criando a tabela dos clientes, com as colunas pré-estabelecidas.
# Lembrando de estipular o tipo de variável armazenada.

CREATE TABLE tb_cliente
(CPF VARCHAR(11), 
# É melhor ser armazenado como texto, por poder começar com zeros.
# Ainda mais que não vamos fazer cálculos com esse número, apenas consulta.
NOME VARCHAR(100),
ENDERECO VARCHAR(50),
ENDERECO2 VARCHAR(50),
# É bom deixar dois espaços para o endereço, pode precisar de complemento.
BAIRRO VARCHAR(50),
CIDADE VARCHAR(50),
ESTADO VARCHAR(2),
CEP VARCHAR(8),
IDADE SMALLINT,
GENERO VARCHAR(1),
# Pode-se usar apenas as letras "M", "F" e "X" ou "D".
LIMITE_CREDITO FLOAT,
# Poderiamos deixar específicado que é apenas duas casas decimais,
# por ser dinheiro, mas podemos nos preocupar com isso apenas quando 
# for apresentar os dados, fazendo a devida formatação.
VOLUME_COMPRA FLOAT,
PRIMEIRA_COMPRA BIT(1));
# 0 siginifica que não fez a compra e 1 que fez.


#--------------------------------------------#
#-------------Tabela dos Vendedores----------#
#--------------------------------------------#
CREATE TABLE tb_vendedores
(MATRICULA VARCHAR(5),
NOME VARCHAR(100),
PERCENTUAL_COMISSAO FLOAT,
DATA_ADMISSAO DATE,
DE_FERIAS BIT);


#--------------------------------------------#
#--------------Tabela dos Produtos-----------#
#--------------------------------------------#
# Podemos incluir as tabelas clicando com o botão direito em "Tables", 
# no ambiente navigator, na lateral esquerda do MySQL Workbench, e 
# depois clicar em "Create Table...". É possível adicionar as colunas e 
# outras configurações. No fim, é o mesmo que escrever o seguinte comando:

CREATE TABLE `sucos`.`tb_produto` (
  `PRODUTO` VARCHAR(20) NULL,
  `NOME` VARCHAR(150) NULL,
  `EMBALAGEM` VARCHAR(50) NULL,
  `TAMANHO` VARCHAR(50) NULL,
  `SABOR` VARCHAR(50) NULL,
  `PRECO_LISTA` FLOAT NULL);
  
#----------------------------------------------------------------------#
#---------------------------Excluindo Tabelas--------------------------#
#----------------------------------------------------------------------#
# Deve-se tomar muitos cuidados ao excluir tabela, pois no SQL é comum que
# as tabelas estejam relacionadas, dependentes umas das outras.

# Outra maneira de excluir é pelo ambiente navigator, na lateral esquerda 
# do MySQL Workbench.

# Vou criar uma tabela para depois excluí-la.
CREATE TABLE tb_para_excluir
(PARA_EXCLUIR1 VARCHAR(5),
PARA_EXCLUIR2 VARCHAR(100));

DROP TABLE tb_para_excluir;


#----------------------------------------------------------------------#
#---------------------------Adicionando Dados--------------------------#
#----------------------------------------------------------------------#
#---------Adicionando linha por linha--------#
INSERT INTO tb_produto(PRODUTO, NOME,  EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
  VALUES('1040107', 'Light - 350 ml - Melância', 'Lata', '350 ml', 'Melância', 4.56);  
INSERT INTO tb_produto(PRODUTO, NOME,  EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
  VALUES('10037797', 'Clean - 2 litros - Laranja', 'PET', '2 litros', 'Laranja', 16.01);  
INSERT INTO tb_produto(PRODUTO, NOME,  EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
  VALUES('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.31);  
INSERT INTO tb_produto(PRODUTO, NOME,  EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
  VALUES('1004327', 'Videira do Campo - 700 ml - Melância', 'PET', '700 ml', 'Melância', 19.51);  
INSERT INTO tb_produto(PRODUTO, NOME,  EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
  VALUES('544931', 'Frescor do Verão - 350 ml - Limão', 'PET', '350 ml', 'Limão', 3.20);  
INSERT INTO tb_produto(PRODUTO, NOME,  EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
  VALUES('1078680', 'Frescor do Verão - 470 ml - Manga', 'Lata', '470 ml', 'Manga', 5.18);  
# A ordem do nome da coluna não precisa seguir a ordem estabelecida na tabela,
# mas a lista dos valores precisam seguir a ordem estabeleciada acima.
# As strings são identificas com aspas simples.

SELECT * FROM tb_produto;
# Para visualização do resultado.

INSERT INTO tb_vendedores(MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS)
  VALUES('00235','Márcio Almeida Silva',  0.08, '2014-08-15', 0);  
INSERT INTO tb_vendedores(MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS)
  VALUES('00236','Cláudia Morais',  0.08, '2013-09-17', 1);  
INSERT INTO tb_vendedores(MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS)
  VALUES('00237','Roberta Martins',  0.11, '2017-03-18', 1);  
INSERT INTO tb_vendedores(MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS)
  VALUES('00238','Péricles Alves',  0.11, '2016-08-21', 0);

SELECT * FROM tb_vendedores;


#--------------------------------------------#
#--------Adicionando todo arquivo Excel------#
#--------------------------------------------#
# Primeiramente é necessário salvar o arquivo como CSV.

# Podemos clicar com o botão direito na tabela de interesse, no ambiente 
# navigator, na lateral esquerda do MySQL Workbench, e depois em "Table 
# Data Import Wizard". 

# As informações de tamanho e sabor estão dentro do nome do produto, mas não
# sei se tem como separar dentro do MySQL. Eu consigo fazer com Python.


#----------------------------------------------------------------------#
#---------------------------Alterando células--------------------------#
#----------------------------------------------------------------------#
# Alterando alguns campos errados de produtos.
# O produto é como se fosse a chave primária, mas ainda não está definida 
# como tal. Podemos driblar isso indo em: Edit > Preferences... > SQL Editor.
# Depois disso, desmarcar a opção "Safe Updades" e reconectar no Workbench.
UPDATE tb_produto SET EMBALAGEM  = 'Lata', PRECO_LISTA = 2.46
  WHERE PRODUTO = '544931';
UPDATE tb_produto SET EMBALAGEM  = 'Garrafa'
  WHERE PRODUTO = '1078680';

SELECT * FROM tb_produto;


UPDATE tb_vendedores SET PERCENTUAL_COMISSAO  = 0.11 WHERE MATRICULA = '00236';  
UPDATE tb_vendedores SET NOME  = 'José Geraldo da Fonseca Junior' WHERE MATRICULA = '00233'; 

SELECT * FROM tb_vendedores;


#----------------------------------------------------------------------#
#---------------------------Deletando linhas---------------------------#
#----------------------------------------------------------------------#
DELETE FROM tb_produto WHERE PRODUTO = '1078680';

SELECT * FROM tb_produto;


DELETE FROM tb_vendedores WHERE MATRICULA = '00233';

SELECT * FROM tb_vendedores;


#----------------------------------------------------------------------#
#----------------------Definindo a chave primária----------------------#
#----------------------------------------------------------------------#
# Há como definir a chave primária quando se cria a tabela, mas aqui vamos 
# definar para uma tabela já existe.
ALTER TABLE tb_produto ADD PRIMARY KEY (PRODUTO);
# Agora, se tentar colocar outro item com o mesmo número, teremos um erro.

SELECT * FROM tb_produto; 


ALTER TABLE tb_cliente ADD PRIMARY KEY(CPF);

SELECT * FROM tb_cliente; 


ALTER TABLE tb_vendedores ADD PRIMARY KEY (MATRICULA);

SELECT * FROM tb_vendedores; 


#----------------------------------------------------------------------#
#--------------------------Incluindo colunas---------------------------#
#----------------------------------------------------------------------#
ALTER TABLE tb_cliente ADD COLUMN (DATA_NASCIMENTO DATE);

SELECT * FROM tb_cliente;


#----------------------------------------------------------------------#
#----------------------Datas e números binários------------------------#
#----------------------------------------------------------------------#
# Números binários podem ser escritos como se fossem números normais, sem
# as aspas, nem nada indicando, basta digitar os zeros e uns. A data é 
# escrita na forma 'aaaa-mm-dd'.
INSERT INTO tb_cliente(CPF, NOME, ENDERECO, ENDERECO2, BAIRRO, CIDADE, ESTADO, 
  CEP, IDADE, GENERO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA, DATA_NASCIMENTO)
	VALUES('00022233365', 'João Nascimento Gonçalves', 'Rua Zero 01', 'Rua Zero 02', 
      'Parque Florestal', 'São Bernado do Campo', 'SP', '00056055', 
      30, 'M', 12500.00, 1000.00, 0, '1989-05-26');

SELECT * FROM tb_cliente;


#----------------------------------------------------------------------#
#------------------------------Consultas-------------------------------#
#----------------------------------------------------------------------#
# Para visualizar a base inteira basta usar o comando com um asterisco.
SELECT * FROM tb_cliente;

# Podemos também visualizar algumas colunas específicas, em ordem diferente,
# fazendo da seguinte maneira:
SELECT NOME, CPF FROM tb_cliente;

# Há, também, como mostrar apenas os primeiros registros da tabela:
SELECT CPF, NOME FROM tb_cliente LIMIT 5;

# É possível também mudar o nome das colunas para visualização. 
SELECT CPF AS `CPF do Cliente`, NOME AS `Nome do Cliente` FROM tb_cliente;

# Consulta com filtro. Não precisa fazer parte da chave primária e
# pode retornar múltiplos registros.
SELECT * FROM tb_produto WHERE PRODUTO = '544931';  


#--------------------------------------------#
#------------Condicionais numéricos----------#
#--------------------------------------------#
# Podemos usar "=", ">", "<", "=>", "<=" e "<>". Esse último é o único 
# diferente de outras liguagens e é o simbolo de diferente mesmo.
SELECT * FROM tb_cliente WHERE IDADE = 30;
SELECT * FROM tb_cliente WHERE IDADE <> 22;

# Podemos pesquisar entre valores:
SELECT * FROM tb_produto WHERE PRECO_LISTA BETWEEN 15.00 AND 20.00;

# Vendedores com comissão maior que 10%.
SELECT NOME, PERCENTUAL_COMISSAO FROM tb_vendedores WHERE PERCENTUAL_COMISSAO > 0.10;

# Filtrando a partir de uma data:
SELECT * FROM tb_cliente WHERE DATA_NASCIMENTO > '1995-01-13';

# Função YEAR filtra o ano.
SELECT * FROM tb_cliente WHERE YEAR(DATA_NASCIMENTO) = 1995; 

# Função MONTH filtra o mês.
SELECT * FROM tb_cliente WHERE MONTH(DATA_NASCIMENTO) = 10;

#--------------------------------------------#
#--------------Filtros compostos-------------#
#--------------------------------------------#
# Exemplos:
SELECT * FROM tb_cliente WHERE IDADE >= 18 AND IDADE <= 22 AND GENERO = 'M';

SELECT * FROM tb_cliente WHERE (IDADE >= 18 AND IDADE <= 22 AND GENERO = 'M') 
  OR (CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins');