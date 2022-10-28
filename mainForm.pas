unit mainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls;

type
  TformPedido = class(TForm)
    gProdutos: TDBGrid;
    lGrid: TLabel;
    eProduto: TLabeledEdit;
    eQuantidade: TLabeledEdit;
    eValor: TLabeledEdit;
    eDescricao: TEdit;
    lCnsProduto: TLabel;
    eCliente: TLabeledEdit;
    lCnsCliente: TLabel;
    eVlrTotal: TLabeledEdit;
    eQtdTotal: TLabeledEdit;
    bGravar: TButton;
    bCarregar: TButton;
    bCancelar: TButton;
    bInserir: TButton;
    eNome: TEdit;

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  formPedido: TformPedido;

implementation

{$R *.dfm}

end.
