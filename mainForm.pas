unit mainForm;

interface

uses
  Winapi.Messages, System.Variants,
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
    eCliente: TLabeledEdit;
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

    procedure eProdutoExit(Sender: TObject);
    procedure aInserirItemExecute(Sender: TObject);
    procedure eClienteExit(Sender: TObject);
    procedure aCarregarPedidoExecute(Sender: TObject);
    procedure aCancelarPedidoExecute(Sender: TObject);
    procedure aGravarPedidoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    FPedido: IPedido;
    FProdutos: IProdutos;   
    FClientes: IClientes;
    FIdItem: Integer;

    procedure AtualizarTotais;
    procedure LimparCamposItens;
    procedure LimparCampos;
    procedure CarregarItem;
    procedure RemoverItem;

  end;

var
  formPedido: TformPedido;

implementation

uses
  helpers, System.SysUtils, pedido, produtos, clientes, Datasnap.DBClient,
  Winapi.Windows;

{$R *.dfm}

procedure TformPedido.AtualizarTotais;
begin
  eQtdTotal.Text := FPedido.GetQuantidadeTotal.ToString;
  eVlrTotal.Text := FPedido.GetValorTotal.ToString;
end;

procedure TformPedido.RemoverItem;
begin
  FPedido.RemoverItem;
  if eProduto.CanFocus then
    eProduto.SetFocus;
end;

procedure TformPedido.CarregarItem;
begin
  FIdItem := FPedido.GetDataSource.Dataset.FieldByname('id').AsInteger;
  eProduto.Text := FPedido.GetDataSource.Dataset.FieldByname('produto').AsString;
  eDescricao.Text := FPedido.GetDataSource.Dataset.FieldByname('descricao').AsString;
  eQuantidade.Text := FPedido.GetDataSource.Dataset.FieldByname('quantidade').AsString;
  eValor.Text := FPedido.GetDataSource.Dataset.FieldByname('valor').AsString;
  eProduto.ReadOnly := True;
  FPedido.GetDataSource.Dataset.DisableControls;
end;

procedure TformPedido.LimparCamposItens;
begin
  eProduto.Text := '';
  eDescricao.Text := '';
  eQuantidade.Text := '';
  eValor.Text := '';
end;

procedure TformPedido.LimparCampos;
begin
  LimparCamposItens;
  eCliente.Text := '';
  eNome.Text := '';
  eQtdTotal.Text := '';
  eVlrTotal.Text := '';
  TClientDataset(FPedido.GetDataSource.DataSet).EmptyDataset;
  bGravar.Enabled := False;
  bcarregar.Enabled := True;
  bCancelar.Enabled := True;
end;

procedure TformPedido.eClienteExit(Sender: TObject);
begin
  try
    bCarregar.Enabled := eCliente.Text = '';
    bCancelar.Enabled := eCliente.Text = '';

    if eCliente.Text = '' then
      Exit;

    eNome.Text := FClientes.GetNomeCliente(eCliente.AsInteger);
    FPedido.SetCodigoCliente(eCliente.AsInteger);
    bGravar.Enabled := not FPedido.GetDataSource.Dataset.IsEmpty;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.eProdutoExit(Sender: TObject);
begin
  try
    if eProduto.Text <> '' then
    begin
      eDescricao.Text := FProdutos.GetDescricaoProduto(eProduto.AsInteger);
      eValor.Text := FProdutos.GetPrecoVenda(eProduto.AsInteger).ToString;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.FormCreate(Sender: TObject);
begin
  FPedido := TPedido.Create;
  FProdutos := TProdutos.Create;
  FClientes := TClientes.Create;

  gProdutos.DataSource := FPedido.GetDataSource;
end;

procedure TformPedido.gProdutosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    RemoverItem
  else if Key = VK_RETURN then
    CarregarItem;
end;

procedure TformPedido.aCancelarPedidoExecute(Sender: TObject);
var
  numero: string;
begin
  try
    numero := InputBox('Informe o número do pedido para cancelar', 'Número:', '');
    FPedido.CancelarPedido(StrToIntDef(numero, 0));
    ShowMessage('Pedido cancelado com sucesso.');
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.aCarregarPedidoExecute(Sender: TObject);
var
  numero: string;
begin
  try
    numero := InputBox('Informe o número do pedido para cancelar', 'Número:', '');
    FPedido.CarregarPedido(StrToIntDef(numero, 0));
    eCliente.Text := FPedido.GetCodigoCliente.ToString;
    eNome.Text := FClientes.GetNomeCliente(FPedido.GetCodigoCliente);
    AtualizarTotais;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.aGravarPedidoExecute(Sender: TObject);
begin
  try
    FPedido.GravarPedido;
    LimparCampos;
    if eProduto.CanFocus then
      eProduto.SetFocus;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TformPedido.aInserirItemExecute(Sender: TObject);
begin
  try
    FPedido.InserirItem(eProduto.AsInteger, eQuantidade.AsInteger, eValor.AsCurrency, FIdItem);
    AtualizarTotais;
    LimparCamposItens;
    gProdutos.Enabled := True;
    bGravar.Enabled := eCliente.Text <> '';
    if eProduto.CanFocus then
      eProduto.SetFocus;

    if FIditem <> 0 then
    begin
      eProduto.ReadOnly := False;
      FPedido.GetDataSource.Dataset.EnableControls;
      FIdItem := 0;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

end.
