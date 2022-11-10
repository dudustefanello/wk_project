object dmProjeto: TdmProjeto
  OnCreate = DataModuleCreate
  Height = 193
  Width = 192
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=wk_project'
      'User_Name=root'
      'Password=1234'
      'Server=localhost'
      'DriverID=MySQL')
    TxOptions.AutoStart = False
    TxOptions.AutoStop = False
    Transaction = FDTransaction1
    Left = 72
    Top = 40
  end
  object FDTransaction1: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = FDConnection1
    Left = 72
    Top = 96
  end
end
