object initDataModule: TinitDataModule
  OnCreate = DataModuleCreate
  Height = 308
  Width = 524
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=sys'
      'User_Name=root'
      'Password=123'
      'Server=localhost'
      'DriverID=MySQL')
    TxOptions.AutoStart = False
    TxOptions.AutoStop = False
    Transaction = FDTransaction1
    Left = 56
    Top = 40
  end
  object FDTransaction1: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = FDConnection1
    Left = 56
    Top = 96
  end
  object FDCommand1: TFDCommand
    Connection = FDConnection1
    Transaction = FDTransaction1
    CommandText.Strings = (
      'DROP DATABASE IF EXISTS `wk_project_eduardo_stefanello`;')
    Left = 56
    Top = 160
  end
  object FDCommand2: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'CREATE DATABASE `wk_project_eduardo_stefanello`;')
    Left = 56
    Top = 216
  end
  object FDCommand3: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'CREATE TABLE `wk_project_eduardo_stefanello`.`cliente` ('
      '  `codigo` int NOT NULL AUTO_INCREMENT,'
      '  `nome` varchar(100) NOT NULL,'
      '  `cidade` varchar(100) DEFAULT NULL,'
      '  `uf` varchar(2) DEFAULT NULL,'
      '  PRIMARY KEY (`codigo`),'
      '  KEY `cliente_nome_IDX` (`nome`) USING BTREE'
      
        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_' +
        'ci;')
    Left = 152
    Top = 160
  end
  object FDCommand4: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'CLAYTON BARBEE'#39', '#39'Alvorada'#39', '#39'RS'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'JOSEPH JOY'#39', '#39'Angra dos Reis'#39', '#39'RJ'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'TAMARA NGUYEN'#39', '#39'An'#225'polis'#39', '#39'GO'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'NATALIE MEYER'#39', '#39'Aparecida de Goi'#226'nia'#39', '#39'GO'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'JANE BENNETT'#39', '#39'Ara'#231'atuba'#39', '#39'SP'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'ANTONIO MEEK'#39', '#39'Bag'#233#39', '#39'RS'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'NICHOLAS BARFIELD'#39', '#39'Bel'#233'm'#39', '#39'PA'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'TERRI VASQUEZ'#39', '#39'Blumenau'#39', '#39'SC'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'HAROLD MARTINO'#39', '#39'Boa Vista'#39', '#39'RR'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'TIMOTHY BUNN'#39', '#39'Bras'#237'lia'#39', '#39'DF'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'TINA SIMMONS'#39', '#39'Goi'#226'nia'#39', '#39'GO'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'JESUS MCCARTNEY'#39', '#39'Guaruj'#225#39', '#39'RJ'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'CHARLOTTE HUNTER'#39', '#39#193'guas Lindas de Goi'#225's'#39', '#39'GO' +
        #39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'DANIEL CABRAL'#39', '#39'Ibirit'#233#39', '#39'MG'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'FRANCES PARKER'#39', '#39'Juazeiro do Norte'#39', '#39'CE'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'KENT ARSENAULT'#39', '#39'Juiz de Fora'#39', '#39'MG'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'IDA ANDREWS'#39', '#39'Luzi'#226'nia'#39', '#39'GO'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'MARIAN MENDOZA'#39', '#39'Maring'#225#39', '#39'PR'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'ELLEN SIMPSON'#39', '#39'Porto Alegre'#39', '#39'RS'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'MAXINE SILVA'#39', '#39'Po'#231'os de Caldas'#39', '#39'MG'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'DENISE KELLY'#39', '#39'Rio Claro'#39', '#39'SP'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'MARION SNYDER'#39', '#39'Santa B'#225'rbara do Oeste'#39', '#39'SP'#39')' +
        ';'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'JUSTIN NGO'#39', '#39'Santo Andr'#233#39', '#39'SP'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'CODY NOLEN'#39', '#39'S'#227'o Bernardo do Campo'#39', '#39'SP'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'FRANCISCO SKIDMORE'#39', '#39'S'#227'o Leopoldo'#39', '#39'RS'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'GEORGE LINTON'#39', '#39'Sorocaba'#39', '#39'SP'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'DEBRA NELSON'#39', '#39'Vila Velha'#39', '#39'ES'#39');'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`cliente` (nome, cid' +
        'ade, uf) VALUES('#39'JEREMY HURTADO'#39', '#39'Vit'#243'ria de Santo Ant'#227'o'#39', '#39'PE'#39 +
        ');')
    Left = 152
    Top = 216
  end
  object FDCommand5: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'CREATE TABLE `wk_project_eduardo_stefanello`.`produto` ('
      '  `codigo` int NOT NULL AUTO_INCREMENT,'
      '  `descricao` varchar(100) NOT NULL,'
      '  `preco_venda` decimal(10,2) NOT NULL,'
      '  PRIMARY KEY (`codigo`),'
      '  KEY `produto_descricao_IDX` (`descricao`) USING BTREE'
      
        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_' +
        'ci;')
    Left = 248
    Top = 160
  end
  object FDCommand6: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'ARROZ'#39', 7.11);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'FEIJ'#195'O'#39', 8.63);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39#211'LEO DE SOJA'#39', 1.81);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'P'#195'O'#39', 3.17);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'FARINHA DE TRIGO'#39', 0.41);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'FARINHA DE MILHO'#39', 2.57);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'REFRIGERANTE'#39', 1.62);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'SUCO'#39', 0.40);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'MACARR'#195'O'#39', 7.12);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'SABONETE'#39', 4.41);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'SHAMPOO'#39', 0.70);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'CREME DENTAL'#39', 0.26);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'CARNE BOVINA'#39', 9.20);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'PRESUNTO'#39', 5.25);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'QUEIJO'#39', 8.67);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'MARGARINA'#39', 7.57);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'DOCE DE LEITE'#39', 1.87);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'SAB'#195'O EM P'#211#39', 6.63);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39#193'GUA SANIT'#193'RIA'#39', 7.56);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'AMACIANTE DE ROUPAS'#39', 7.89);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'DETERGENTE'#39', 6.79);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39#193'GUA MINERAL'#39', 0.28);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'CAF'#201' SOL'#218'VEL'#39', 1.04);'
      
        'INSERT INTO `wk_project_eduardo_stefanello`.`produto` (descricao' +
        ', preco_venda) VALUES('#39'CAF'#201' EM P'#211#39', 4.35);')
    Left = 248
    Top = 216
  end
  object FDCommand7: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'CREATE TABLE `wk_project_eduardo_stefanello`.`pedido` ('
      '  `numero` int NOT NULL,'
      '  `data_emissao` date NOT NULL,'
      '  `cliente` int DEFAULT NULL,'
      '  `valor_total` decimal(10,2) NOT NULL,'
      '  PRIMARY KEY (`numero`),'
      '  KEY `pedido_FK` (`cliente`),'
      
        '  KEY `pedido_data_emissao_IDX` (`data_emissao`,`cliente`) USING' +
        ' BTREE,'
      
        '  CONSTRAINT `pedido_FK` FOREIGN KEY (`cliente`) REFERENCES `cli' +
        'ente` (`codigo`)'
      
        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_' +
        'ci;')
    Left = 344
    Top = 160
  end
  object FDCommand8: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'CREATE TABLE `wk_project_eduardo_stefanello`.`pedido_item` ('
      '  `codigo` int NOT NULL AUTO_INCREMENT,'
      '  `pedido` int NOT NULL,'
      '  `produto` int NOT NULL,'
      '  `quantidade` decimal(8,2) NOT NULL,'
      '  `valor_unitario` decimal(10,2) NOT NULL,'
      '  `valor_total` decimal(10,2) NOT NULL,'
      '  PRIMARY KEY (`codigo`),'
      '  KEY `pedido_item_FK` (`produto`),'
      '  KEY `pedido_item_pedido_IDX` (`pedido`) USING BTREE,'
      
        '  CONSTRAINT `pedido_item_FK` FOREIGN KEY (`produto`) REFERENCES' +
        ' `produto` (`codigo`),'
      
        '  CONSTRAINT `pedido_item_FK_1` FOREIGN KEY (`pedido`) REFERENCE' +
        'S `pedido` (`numero`) ON DELETE CASCADE ON UPDATE RESTRICT'
      
        ') ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE' +
        '=utf8mb4_0900_ai_ci;')
    Left = 440
    Top = 160
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 344
    Top = 40
  end
end
