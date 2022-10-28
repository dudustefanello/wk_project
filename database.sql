CREATE DATABASE `wk_project`;


CREATE TABLE `cliente` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cliente_nome_IDX` (`nome`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO cliente (nome, cidade, uf) VALUES('CLAYTON BARBEE', 'Alvorada', 'RS');
INSERT INTO cliente (nome, cidade, uf) VALUES('JOSEPH JOY', 'Angra dos Reis', 'RJ');
INSERT INTO cliente (nome, cidade, uf) VALUES('TAMARA NGUYEN', 'Anápolis', 'GO');
INSERT INTO cliente (nome, cidade, uf) VALUES('NATALIE MEYER', 'Aparecida de Goiânia', 'GO');
INSERT INTO cliente (nome, cidade, uf) VALUES('JANE BENNETT', 'Araçatuba', 'SP');
INSERT INTO cliente (nome, cidade, uf) VALUES('ANTONIO MEEK', 'Bagé', 'RS');
INSERT INTO cliente (nome, cidade, uf) VALUES('NICHOLAS BARFIELD', 'Belém', 'PA');
INSERT INTO cliente (nome, cidade, uf) VALUES('TERRI VASQUEZ', 'Blumenau', 'SC');
INSERT INTO cliente (nome, cidade, uf) VALUES('HAROLD MARTINO', 'Boa Vista', 'RR');
INSERT INTO cliente (nome, cidade, uf) VALUES('TIMOTHY BUNN', 'Brasília', 'DF');
INSERT INTO cliente (nome, cidade, uf) VALUES('TINA SIMMONS', 'Goiânia', 'GO');
INSERT INTO cliente (nome, cidade, uf) VALUES('JESUS MCCARTNEY', 'Guarujá', 'RJ');
INSERT INTO cliente (nome, cidade, uf) VALUES('CHARLOTTE HUNTER', 'Águas Lindas de Goiás', 'GO');
INSERT INTO cliente (nome, cidade, uf) VALUES('DANIEL CABRAL', 'Ibirité', 'MG');
INSERT INTO cliente (nome, cidade, uf) VALUES('FRANCES PARKER', 'Juazeiro do Norte', 'CE');
INSERT INTO cliente (nome, cidade, uf) VALUES('KENT ARSENAULT', 'Juiz de Fora', 'MG');
INSERT INTO cliente (nome, cidade, uf) VALUES('IDA ANDREWS', 'Luziânia', 'GO');
INSERT INTO cliente (nome, cidade, uf) VALUES('MARIAN MENDOZA', 'Maringá', 'PR');
INSERT INTO cliente (nome, cidade, uf) VALUES('ELLEN SIMPSON', 'Porto Alegre', 'RS');
INSERT INTO cliente (nome, cidade, uf) VALUES('MAXINE SILVA', 'Poços de Caldas', 'MG');
INSERT INTO cliente (nome, cidade, uf) VALUES('DENISE KELLY', 'Rio Claro', 'SP');
INSERT INTO cliente (nome, cidade, uf) VALUES('MARION SNYDER', 'Santa Bárbara do Oeste', 'SP');
INSERT INTO cliente (nome, cidade, uf) VALUES('JUSTIN NGO', 'Santo André', 'SP');
INSERT INTO cliente (nome, cidade, uf) VALUES('CODY NOLEN', 'São Bernardo do Campo', 'SP');
INSERT INTO cliente (nome, cidade, uf) VALUES('FRANCISCO SKIDMORE', 'São Leopoldo', 'RS');
INSERT INTO cliente (nome, cidade, uf) VALUES('GEORGE LINTON', 'Sorocaba', 'SP');
INSERT INTO cliente (nome, cidade, uf) VALUES('DEBRA NELSON', 'Vila Velha', 'ES');
INSERT INTO cliente (nome, cidade, uf) VALUES('JEREMY HURTADO', 'Vitória de Santo Antão', 'PE');


CREATE TABLE `produto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `preco_venda` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `produto_descricao_IDX` (`descricao`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO produto (descricao, preco_venda) VALUES('ARROZ', 7.11);
INSERT INTO produto (descricao, preco_venda) VALUES('FEIJÃO', 8.63);
INSERT INTO produto (descricao, preco_venda) VALUES('ÓLEO DE SOJA', 1.81);
INSERT INTO produto (descricao, preco_venda) VALUES('PÃO', 3.17);
INSERT INTO produto (descricao, preco_venda) VALUES('FARINHA DE TRIGO', 0.41);
INSERT INTO produto (descricao, preco_venda) VALUES('FARINHA DE MILHO', 2.57);
INSERT INTO produto (descricao, preco_venda) VALUES('REFRIGERANTE', 1.62);
INSERT INTO produto (descricao, preco_venda) VALUES('SUCO', 0.40);
INSERT INTO produto (descricao, preco_venda) VALUES('MACARRÃO', 7.12);
INSERT INTO produto (descricao, preco_venda) VALUES('SABONETE', 4.41);
INSERT INTO produto (descricao, preco_venda) VALUES('SHAMPOO', 0.70);
INSERT INTO produto (descricao, preco_venda) VALUES('CREME DENTAL', 0.26);
INSERT INTO produto (descricao, preco_venda) VALUES('CARNE BOVINA', 9.20);
INSERT INTO produto (descricao, preco_venda) VALUES('PRESUNTO', 5.25);
INSERT INTO produto (descricao, preco_venda) VALUES('QUEIJO', 8.67);
INSERT INTO produto (descricao, preco_venda) VALUES('MARGARINA', 7.57);
INSERT INTO produto (descricao, preco_venda) VALUES('DOCE DE LEITE', 1.87);
INSERT INTO produto (descricao, preco_venda) VALUES('SABÃO EM PÓ', 6.63);
INSERT INTO produto (descricao, preco_venda) VALUES('ÁGUA SANITÁRIA', 7.56);
INSERT INTO produto (descricao, preco_venda) VALUES('AMACIANTE DE ROUPAS', 7.89);
INSERT INTO produto (descricao, preco_venda) VALUES('DETERGENTE', 6.79);
INSERT INTO produto (descricao, preco_venda) VALUES('ÁGUA MINERAL', 0.28);
INSERT INTO produto (descricao, preco_venda) VALUES('CAFÉ SOLÚVEL', 1.04);
INSERT INTO produto (descricao, preco_venda) VALUES('CAFÉ EM PÓ', 4.35);


CREATE TABLE `pedido` (
  `numero` int NOT NULL,
  `data_emissao` date NOT NULL,
  `cliente` int DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `pedido_FK` (`cliente`),
  KEY `pedido_data_emissao_IDX` (`data_emissao`,`cliente`) USING BTREE,
  CONSTRAINT `pedido_FK` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `pedido_item` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `pedido` int NOT NULL,
  `produto` int NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `pedido_item_FK` (`produto`),
  KEY `pedido_item_pedido_IDX` (`pedido`) USING BTREE,
  CONSTRAINT `pedido_item_FK` FOREIGN KEY (`produto`) REFERENCES `produto` (`codigo`),
  CONSTRAINT `pedido_item_FK_1` FOREIGN KEY (`pedido`) REFERENCES `pedido` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

