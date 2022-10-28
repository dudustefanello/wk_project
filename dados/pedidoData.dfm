inherited dmPedido: TdmPedido
  Height = 393
  Width = 431
  object FDQueryGravaPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'INSERT INTO pedido (numero, data_emissao, cliente, valor_total)'
      'VALUES (:numero, :data_emissao, :cliente, :valor_total);')
    Left = 72
    Top = 248
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryGravaItens: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'INSERT INTO pedido_item (pedido, produto, quantidade, valor_unit' +
        'ario, valor_total)'
      
        'VALUES (:pedido, :produto, :quantidade, :valor_unitario, :valor_' +
        'total);')
    Left = 192
    Top = 248
    ParamData = <
      item
        Name = 'PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR_UNITARIO'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryNumeroPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT COALESCE(MAX(NUMERO) + 1, 1) AS NUMERO FROM PEDIDO;')
    Left = 320
    Top = 248
  end
  object FDQueryPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PEDIDO AS P '
      'JOIN PEDIDO_ITEM AS I'
      #9'ON I.PEDIDO = P.NUMERO'
      'WHERE NUMERO = :NUMERO;')
    Left = 72
    Top = 304
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryDelete: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'DELETE FROM PEDIDO WHERE NUMERO = :NUMERO ;')
    Left = 192
    Top = 304
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dItens: TDataSource
    DataSet = cItens
    Left = 320
    Top = 96
  end
  object cItens: TClientDataSet
    PersistDataPacket.Data = {
      D50000009619E0BD010000001800000006000000000003000000D50002696404
      0001000200010007535542545950450200490008004175746F696E6300077072
      6F6475746F04000100000000000964657363726963616F010049000000010005
      57494454480200020064000A7175616E74696461646504000100000000000576
      616C6F72080004000000010007535542545950450200490006004D6F6E657900
      05746F74616C080004000000010007535542545950450200490006004D6F6E65
      790001000C4155544F494E4356414C55450400010001000000}
    Active = True
    Aggregates = <
      item
        Active = True
        AggregateName = 'QuantidadeTotal'
        Expression = 'sum(quantidade)'
      end
      item
        Active = True
        AggregateName = 'ValorTotal'
        Expression = 'sum(total)'
      end>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faReadonly]
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
        DataType = ftInteger
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
    Left = 320
    Top = 32
    object cItensid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object cItensproduto: TIntegerField
      FieldName = 'produto'
    end
    object cItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cItensquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object cItensvalor: TCurrencyField
      FieldName = 'valor'
    end
    object cItenstotal: TCurrencyField
      FieldName = 'total'
    end
  end
end
