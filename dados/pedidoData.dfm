object dmPedido: TdmPedido
  OnCreate = DataModuleCreate
  Height = 404
  Width = 427
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=wk_project'
      'User_Name=root'
      'Password=1234'
      'Server=localhost'
      'DriverID=MySQL')
    TxOptions.AutoStart = False
    TxOptions.AutoStop = False
    Connected = True
    Transaction = FDTransaction1
    Left = 72
    Top = 88
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'E:\outros\delphi\wk_project\libmysql.dll'
    Left = 72
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = FDConnection1
    Left = 72
    Top = 144
  end
  object FDQueryGravaPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'INSERT INTO pedido (numero, data_emissao, cliente, valor_total)'
      'VALUES (:numero, :data_emissao, :cliente, :valor_total);')
    Left = 72
    Top = 216
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_EMISSAO'
        ParamType = ptInput
      end
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_TOTAL'
        ParamType = ptInput
      end>
  end
  object cItens: TClientDataSet
    PersistDataPacket.Data = {
      E90000009619E0BD010000001800000006000000000003000000E90002696404
      0001000000010007535542545950450200490008004175746F696E6300077072
      6F6475746F04000100000000000964657363726963616F010049000000010005
      57494454480200020064000A7175616E74696461646508000400000001000753
      5542545950450200490006004D6F6E6579000576616C6F720800040000000100
      07535542545950450200490006004D6F6E65790005746F74616C080004000000
      010007535542545950450200490006004D6F6E65790001000C4155544F494E43
      56414C55450400010001000000}
    Active = True
    Aggregates = <
      item
        Active = True
        AggregateName = 'QuantidadeTotal'
        Expression = 'sum(quantidade)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'ValorTotal'
        Expression = 'sum(total)'
        Visible = False
      end>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftAutoInc
      end
      item
        Name = 'produto'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'quantidade'
        DataType = ftCurrency
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'total'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 16
    object cItensid: TIntegerField
      FieldName = 'id'
    end
    object cItensproduto: TIntegerField
      FieldName = 'produto'
    end
    object cItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cItensquantidade: TCurrencyField
      FieldName = 'quantidade'
    end
    object cItensvalor: TCurrencyField
      FieldName = 'valor'
    end
    object cItenstotal: TCurrencyField
      FieldName = 'total'
    end
  end
  object dItens: TDataSource
    DataSet = cItens
    Left = 216
    Top = 80
  end
  object FDQueryGravaItens: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'INSERT INTO pedido_item (pedido, produto, quantidade, valor_unit' +
        'ario, valor_total)'
      
        'VALUES (:pedido, :produto, :quantidade, :valor_unitario, :valor_' +
        'total);')
    Left = 192
    Top = 216
    ParamData = <
      item
        Name = 'PEDIDO'
        ParamType = ptInput
      end
      item
        Name = 'PRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_UNITARIO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_TOTAL'
        ParamType = ptInput
      end>
  end
  object FDQueryNumeroPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT COALESCE(MAX(NUMERO) + 1, 1) AS NUMERO FROM PEDIDO;')
    Left = 320
    Top = 216
  end
  object FDQueryPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PEDIDO AS P '
      'JOIN PEDIDO_ITEM AS I'
      #9'ON I.PEDIDO = P.NUMERO'
      'WHERE NUMERO = :NUMERO;')
    Left = 72
    Top = 272
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryDelete: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'DELETE FROM PEDIDO WHERE NUMERO = :NUMERO ;')
    Left = 192
    Top = 272
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end>
  end
end
