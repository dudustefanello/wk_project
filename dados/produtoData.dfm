inherited dmProduto: TdmProduto
  Height = 304
  Width = 174
  inherited FDConnection1: TFDConnection
    Connected = False
  end
  object FDQueryProduto: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTO WHERE (CODIGO = :CODIGO OR :CODIGO = 0);')
    Left = 72
    Top = 224
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
