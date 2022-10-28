unit mainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, interfacePedido, interfaceProdutos, interfaceClientes;

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
    aActionList: TActionList;
    aInserirItem: TAction;
    aCarregarPedido: TAction;
    aCancelarPedido: TAction;
    aGravarPedido: TAction;
    aConsultarCliente: TAction;
    aConsultarProduto: TAction;

    procedure eProdutoExit(Sender: TObject);
    procedure aInserirItemExecute(Sender: TObject);
    procedure eClienteExit(Sender: TObject);
    procedure aCarregarPedidoExecute(Sender: TObject);
    procedure aCancelarPedidoExecute(Sender: TObject);
    procedure aGravarPedidoExecute(Sender: TObject);
    procedure aConsultarClienteExecute(Sender: TObject);
    procedure aConsultarProdutoExecute(Sender: TObject);

  private
    FPedido: IPedido;
    FProdutos: IProdutos;   
    FClientes: IClientes;

    procedure AtualizarTotais;

  end;

var
  formPedido: TformPedido;

implementation

uses
  helpers, System.SysUtils;

{$R *.dfm}

procedure TformPedido.AtualizarTotais;
begin
  eQtdTotal.Text := FPedido.GetQuantidadeTotal.ToString;
  eVlrTotal.Text := FPedido.GetValorTotal.ToString;
end;

procedure TformPedido.eClienteExit(Sender: TObject);
begin
  try
    if eCliente.Text = '' then
      Exit;
      
    eNome.Text := FClientes.GetNomeCliente(eCliente.AsInteger);
    FPedido.SetCodigoCliente(eProduto.AsInteger);
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.eProdutoExit(Sender: TObject);
begin
  try
    if (eProduto.Text = '') and bGravar.CanFocus then
      bGravar.SetFocus
    else
      eDescricao.Text := FProdutos.GetDescricaoProduto(eProduto.AsInteger);
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.aCancelarPedidoExecute(Sender: TObject);
begin
  try
    FPedido.CancelarPedido;   
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.aCarregarPedidoExecute(Sender: TObject);
begin
  try
    FPedido.CarregarPedido;
    eCliente.Text := FPedido.GetCodigoCliente.ToString;
    eNome.Text := FClientes.GetNomeCliente(FPedido.GetCodigoCliente);
    AtualizarTotais;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.aConsultarClienteExecute(Sender: TObject);
begin
//
end;

procedure TformPedido.aConsultarProdutoExecute(Sender: TObject);
begin
//
end;

procedure TformPedido.aGravarPedidoExecute(Sender: TObject);
begin
  try
    FPedido.GravarPedido;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.aInserirItemExecute(Sender: TObject);
begin
  try
    FPedido.InserirItem(eProduto.AsInteger, eQuantidade.AsCurrency, eValor.AsCurrency);
    AtualizarTotais;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

end.
