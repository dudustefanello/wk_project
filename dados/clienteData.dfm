inherited dmCliente: TdmCliente
  Height = 314
  Width = 181
  object FDQueryCliente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM CLIENTE WHERE (CODIGO = :CODIGO OR :CODIGO = 0);')
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
