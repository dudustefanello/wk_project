object formPedido: TformPedido
  Left = 0
  Top = 0
  Caption = 'Pedido de venda'
  ClientHeight = 462
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    891
    462)
  TextHeight = 15
  object lGrid: TLabel
    Left = 344
    Top = 8
    Width = 51
    Height = 15
    Caption = 'Produtos:'
  end
  object gProdutos: TDBGrid
    Left = 344
    Top = 26
    Width = 539
    Height = 356
    Anchors = [akLeft, akTop, akRight, akBottom]
    Enabled = False
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyUp = gProdutosKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'produto'
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 244
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Visible = True
      end>
  end
  object eProduto: TLabeledEdit
    Left = 8
    Top = 26
    Width = 70
    Height = 23
    EditLabel.Width = 46
    EditLabel.Height = 15
    EditLabel.Caption = 'Produto:'
    TabOrder = 0
    Text = ''
    OnExit = eProdutoExit
  end
  object eQuantidade: TLabeledEdit
    Left = 8
    Top = 75
    Width = 145
    Height = 23
    EditLabel.Width = 62
    EditLabel.Height = 15
    EditLabel.Caption = 'Quantidade'
    NumbersOnly = True
    TabOrder = 1
    Text = ''
  end
  object eValor: TLabeledEdit
    Left = 159
    Top = 75
    Width = 162
    Height = 23
    EditLabel.Width = 70
    EditLabel.Height = 15
    EditLabel.Caption = 'Valor unit'#225'rio'
    NumbersOnly = True
    TabOrder = 2
    Text = ''
  end
  object eDescricao: TEdit
    Left = 84
    Top = 26
    Width = 237
    Height = 23
    TabStop = False
    ReadOnly = True
    TabOrder = 5
  end
  object eCliente: TLabeledEdit
    Left = 8
    Top = 388
    Width = 70
    Height = 23
    Anchors = [akLeft, akBottom]
    EditLabel.Width = 40
    EditLabel.Height = 15
    EditLabel.Caption = 'Cliente:'
    TabOrder = 6
    Text = ''
    OnExit = eClienteExit
    ExplicitTop = 387
  end
  object eVlrTotal: TLabeledEdit
    Left = 791
    Top = 388
    Width = 92
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    EditLabel.Width = 56
    EditLabel.Height = 23
    EditLabel.Caption = 'Valor total:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 7
    Text = ''
    ExplicitLeft = 787
    ExplicitTop = 387
  end
  object eQtdTotal: TLabeledEdit
    Left = 623
    Top = 388
    Width = 92
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    EditLabel.Width = 92
    EditLabel.Height = 23
    EditLabel.Caption = 'Quantidade total:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 8
    Text = ''
    ExplicitLeft = 619
    ExplicitTop = 387
  end
  object bGravar: TButton
    Left = 344
    Top = 417
    Width = 539
    Height = 37
    Action = aGravarPedido
    Anchors = [akLeft, akRight, akBottom]
    Enabled = False
    TabOrder = 9
    ExplicitTop = 416
    ExplicitWidth = 535
  end
  object bCarregar: TButton
    Left = 8
    Top = 417
    Width = 154
    Height = 37
    Action = aCarregarPedido
    Anchors = [akLeft, akBottom]
    TabOrder = 10
    ExplicitTop = 416
  end
  object bCancelar: TButton
    Left = 168
    Top = 417
    Width = 153
    Height = 37
    Action = aCancelarPedido
    Anchors = [akLeft, akBottom]
    TabOrder = 11
    ExplicitTop = 416
  end
  object bInserir: TButton
    Left = 159
    Top = 104
    Width = 162
    Height = 25
    Action = aInserirItem
    TabOrder = 3
  end
  object eNome: TEdit
    Left = 84
    Top = 388
    Width = 237
    Height = 23
    TabStop = False
    Anchors = [akLeft, akBottom]
    ReadOnly = True
    TabOrder = 12
    ExplicitTop = 387
  end
  object aActionList: TActionList
    Left = 833
    Top = 328
    object aInserirItem: TAction
      Caption = 'Inserir item'
      OnExecute = aInserirItemExecute
    end
    object aCarregarPedido: TAction
      Caption = 'Carregar pedido'
      OnExecute = aCarregarPedidoExecute
    end
    object aCancelarPedido: TAction
      Caption = 'Cancelar pedido'
      OnExecute = aCancelarPedidoExecute
    end
    object aGravarPedido: TAction
      Caption = 'GRAVAR PEDIDO'
      OnExecute = aGravarPedidoExecute
    end
    object aLimpar: TAction
      Caption = 'Limpar'
      OnExecute = aLimparExecute
    end
  end
end
