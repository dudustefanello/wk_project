object formPedido: TformPedido
  Left = 0
  Top = 0
  Caption = 'Pedido de venda'
  ClientHeight = 462
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lGrid: TLabel
    Left = 344
    Top = 8
    Width = 51
    Height = 15
    Caption = 'Produtos:'
  end
  object lCnsProduto: TLabel
    Left = 247
    Top = 8
    Width = 74
    Height = 15
    Caption = 'F9 - Consultar'
  end
  object lCnsCliente: TLabel
    Left = 247
    Top = 341
    Width = 74
    Height = 15
    Caption = 'F9 - Consultar'
  end
  object gProdutos: TDBGrid
    Left = 344
    Top = 26
    Width = 361
    Height = 356
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object eProduto: TLabeledEdit
    Left = 8
    Top = 26
    Width = 313
    Height = 23
    EditLabel.Width = 46
    EditLabel.Height = 15
    EditLabel.Caption = 'Produto:'
    TabOrder = 1
    Text = ''
  end
  object eQuantidade: TLabeledEdit
    Left = 8
    Top = 106
    Width = 145
    Height = 23
    EditLabel.Width = 62
    EditLabel.Height = 15
    EditLabel.Caption = 'Quantidade'
    NumbersOnly = True
    TabOrder = 2
    Text = ''
  end
  object eValor: TLabeledEdit
    Left = 159
    Top = 106
    Width = 162
    Height = 23
    EditLabel.Width = 70
    EditLabel.Height = 15
    EditLabel.Caption = 'Valor unit'#225'rio'
    NumbersOnly = True
    TabOrder = 3
    Text = ''
  end
  object eDescricao: TEdit
    Left = 8
    Top = 55
    Width = 313
    Height = 23
    TabStop = False
    ReadOnly = True
    TabOrder = 4
  end
  object eCliente: TLabeledEdit
    Left = 8
    Top = 359
    Width = 313
    Height = 23
    EditLabel.Width = 40
    EditLabel.Height = 15
    EditLabel.Caption = 'Cliente:'
    TabOrder = 5
    Text = ''
  end
  object eVlrTotal: TLabeledEdit
    Left = 613
    Top = 388
    Width = 92
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    EditLabel.Width = 56
    EditLabel.Height = 23
    EditLabel.Caption = 'Valor total:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 6
    Text = ''
  end
  object eQtdTotal: TLabeledEdit
    Left = 445
    Top = 388
    Width = 92
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    EditLabel.Width = 92
    EditLabel.Height = 23
    EditLabel.Caption = 'Quantidade total:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 7
    Text = ''
  end
  object bGravar: TButton
    Left = 344
    Top = 417
    Width = 361
    Height = 37
    Caption = 'GRAVAR PEDIDO'
    TabOrder = 8
  end
  object bCarregar: TButton
    Left = 8
    Top = 417
    Width = 154
    Height = 37
    Caption = 'Carregar pedido'
    TabOrder = 9
  end
  object bCancelar: TButton
    Left = 168
    Top = 417
    Width = 153
    Height = 37
    Caption = 'Cancelar pedido'
    TabOrder = 10
  end
  object bInserir: TButton
    Left = 159
    Top = 135
    Width = 162
    Height = 25
    Caption = 'Inserir item'
    TabOrder = 11
  end
  object eNome: TEdit
    Left = 8
    Top = 388
    Width = 313
    Height = 23
    TabStop = False
    ReadOnly = True
    TabOrder = 12
  end
end
