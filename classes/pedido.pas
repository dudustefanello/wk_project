unit pedido;

interface

uses
  interfacePedido, pedidoData, interfaceProdutos, System.SysUtils, Data.DB;

type
  EErroPedido = class(Exception);

  TPedido = class(TInterfacedObject, IPedido)
  private
    FDados: TdmPedido;
    FProdutos: IProdutos;
    FCodigoCliente: integer;

    procedure InserirItem(const ACodigoProduto, AQuantidade: integer; const AValor: Currency; const AId: integer = 0);
    procedure SetCodigoCliente(const ACodigo: integer);
    procedure CarregarPedido(const ANumero: integer);
    procedure CancelarPedido(const ANumero: integer);
    procedure GravarPedido;                              
    procedure GravarPedidoItens(const ANrPedido: integer);
    procedure CarregarPedidoItens(const ANumero: integer);
    procedure RemoverItem;

    function GetQuantidadeTotal: integer;
    function GetValorTotal: currency;
    function GetCodigoCliente: integer;
    function GetDataSource: TDataSource;

  public
    constructor Create;

    destructor Destroy; override;

  end;

implementation

uses
  produtos, FireDAC.Stan.Param;

{ TPedido }

constructor TPedido.Create;
begin
  FDados := TdmPedido.Create(nil);
  FProdutos := TProdutos.Create;
end;

destructor TPedido.Destroy;
begin
  FDados.Free;
end;

procedure TPedido.CancelarPedido(const ANumero: integer);
begin
  FDados.FDTransaction1.StartTransaction;
  try
    FDados.FDQueryDelete.ParamByName('numero').AsInteger := ANumero;
    FDados.FDQueryDelete.ExecSQL;
  
    FDados.FDTransaction1.Commit;
  finally
    if FDados.FDTransaction1.Active then
      FDados.FDTransaction1.Rollback;
  end;
end;

procedure TPedido.CarregarPedido(const ANumero: integer);
begin
  FDados.FDTransaction1.StartTransaction;
  try
    If FDados.FDQueryPedido.Active then
      FDados.FDQueryPedido.Close;

    FDados.FDQueryPedido.ParamByName('numero').AsInteger := ANumero;  
    FDados.FDQueryPedido.Open;

    FCodigoCliente := FDados.FDQueryPedido.FieldByName('cliente').AsInteger;

    CarregarPedidoItens(ANumero);
  finally
    FDados.FDTransaction1.Rollback;
  end;
end;

procedure TPedido.CarregarPedidoItens(const ANumero: integer);
begin
  FDados.cItens.EmptyDataset;  

  FDados.FDQueryPedido.First;
  while not FDados.FDQueryPedido.Eof do
  begin  
    FDados.cItens.Append;
    try
      FDados.cItensproduto.Value := FDados.FDQueryPedido.FieldByName('produto').AsInteger;
      FDados.cItensquantidade.Value := FDados.FDQueryPedido.FieldByName('quantidade').AsInteger;
      FDados.cItensvalor.Value := FDados.FDQueryPedido.FieldByName('valor_unitario').AsCurrency;
      FDados.cItenstotal.Value := FDados.FDQueryPedido.FieldByName('valor_total').AsCurrency;

      FDados.cItens.Post;
    finally
      FDados.cItens.Cancel;      
    end;
    FDados.FDQueryPedido.Next;
  end;  
end;

function TPedido.GetCodigoCliente: integer;
begin
  Result := FCodigoCliente;
end;

function TPedido.GetDataSource: TDataSource;
begin
  Result := FDados.dItens;
end;

function TPedido.GetQuantidadeTotal: integer;
begin
  Result := FDados.cItens.Aggregates[0].Value;
end;

function TPedido.GetValorTotal: currency;
begin
  Result := FDados.cItens.Aggregates[1].Value;
end;

procedure TPedido.GravarPedido;
var
  nrPedido: integer;
begin
  FDados.FDTransaction1.StartTransaction;
  try
    If FDados.FDQueryNumeroPedido.Active then
      FDados.FDQueryNumeroPedido.Close;

    FDados.FDQueryNumeroPedido.Open;
    nrPedido := FDados.FDQueryNumeroPedido.FieldByName('numero').AsInteger;
  
    FDados.FDQueryGravaPedido.ParamByName('numero').AsInteger := nrPedido;   
    FDados.FDQueryGravaPedido.ParamByName('data_emissao').AsDate := Date;
    FDados.FDQueryGravaPedido.ParamByName('cliente').AsCurrency := GetCodigoCliente;
    FDados.FDQueryGravaPedido.ParamByName('valor_total').AsCurrency := GetValorTotal;

    FDados.FDQueryGravaPedido.ExecSQL;
  
    GravarPedidoItens(nrPedido);
  
    FDados.FDTransaction1.Commit;
  finally
    if FDados.FDTransaction1.Active then
      FDados.FDTransaction1.Rollback;
  end;
end;

procedure TPedido.GravarPedidoItens(const ANrPedido: integer);
begin
  FDados.cItens.First;
  while not FDados.cItens.Eof do
  begin
    FDados.FDQueryGravaItens.ParamByName('pedido').AsInteger := ANrPedido;   
    FDados.FDQueryGravaItens.ParamByName('produto').AsInteger := FDados.cItensproduto.Value;
    FDados.FDQueryGravaItens.ParamByName('quantidade').AsCurrency := FDados.cItensquantidade.Value;
    FDados.FDQueryGravaItens.ParamByName('valor_unitario').AsCurrency := FDados.cItensvalor.Value;
    FDados.FDQueryGravaItens.ParamByName('valor_total').AsCurrency := FDados.cItenstotal.Value;

    FDados.FDQueryGravaItens.ExecSQL;

    FDados.cItens.Next;
  end;  
end;

procedure TPedido.InserirItem(const ACodigoProduto, AQuantidade: integer; const AValor: Currency; const AId: integer = 0);
begin
  if AQuantidade <= 0 then
    raise EErroPedido.Create('Quantidade não pode ser menor ou igual a zero.');

  if AValor <= 0 then
    raise EErroPedido.Create('Valor não pode ser menor ou igual a zero.');

  FDados.cItens.DisableControls;
  try
    if AId = 0 then
      FDados.cItens.Append
    else
      FDados.cItens.Edit;

    FDados.cItensproduto.Value := ACodigoProduto;
    FDados.cItensdescricao.Value := FProdutos.GetDescricaoProduto(ACodigoProduto);
    FDados.cItensquantidade.Value := AQuantidade;
    FDados.cItensvalor.value := AValor;
    FDados.cItenstotal.Value := AValor * AQuantidade;

    FDados.cItens.Post;
  finally
    FDados.cItens.Cancel;
    FDados.cItens.EnableControls;
  end;
end;

procedure TPedido.RemoverItem;
begin
  FDados.cItens.DisableControls;
  try
    FDados.cItens.Delete;
  finally
    FDados.cItens.EnableControls;
  end;
end;

procedure TPedido.SetCodigoCliente(const ACodigo: integer);
begin
  FCodigoCliente := ACodigo;
end;

end.
