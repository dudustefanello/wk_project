unit pedido;

interface

uses
  interfacePedido, pedidoData, interfaceProdutos, System.SysUtils;

type
  EErroPedido = class(Exception);

  TPedido = class(TInterfacedObject, IPedido)
  private
    FDados: TdmPedido;
    FProdutos: IProdutos;
    FCodigoCliente: integer;

    procedure InserirItem(const ACodigoProduto: integer; const AQuantidade: Currency; const AValor: Currency);
    procedure SetCodigoCliente(const ACodigo: integer);
    procedure CarregarPedido(const ANumero: integer = 0);
    procedure CancelarPedido(const ANumero: integer = 0);
    procedure GravarPedido;                              
    procedure GravarPedidoItens(const ANrPedido: integer);
    procedure CarregarPedidoItens(const ANumero: integer);

    function GetQuantidadeTotal: currency;
    function GetValorTotal: currency;
    function GetCodigoCliente: integer;

  public
    constructor Create;

    destructor Destroy; override;

  end;

implementation

{ TPedido }

constructor TPedido.Create;
begin
  FDados := TdmPedido.Create(nil);
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
      FDados.cItensproduto.Value := FDados.FDQueryPedido.ParamByName('produto').AsInteger;
      FDados.cItensquantidade.Value := FDados.FDQueryPedido.ParamByName('quantidade').AsCurrency;
      FDados.cItensvalor.Value := FDados.FDQueryPedido.ParamByName('valor_unitario').AsCurrency;
      FDados.cItenstotal.Value := FDados.FDQueryPedido.ParamByName('valor_total').AsCurrency;

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

function TPedido.GetQuantidadeTotal: currency;
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

    FDados.FDQueryGravaItens.ExecSQL;
  
    GravarPedidoItens(nrPedido);
  
    FDados.FDTransaction1.Commit;
  finally
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

procedure TPedido.InserirItem(const ACodigoProduto: integer; const AQuantidade, AValor: Currency);
begin
  if AQuantidade <= 0 then
    raise EErroPedido.Create('Quantidade não pode ser menor ou igual a zero.');

  if AValor <= 0 then
    raise EErroPedido.Create('Valor não pode ser menor ou igual a zero.');

  FDados.cItens.Append;
  try
    FDados.cItensproduto.Value := ACodigoProduto;
    FDados.cItensdescricao.Value := FProdutos.GetDescricaoProduto(ACodigoProduto);
    FDados.cItensquantidade.Value := AQuantidade;
    FDados.cItensvalor.value := AValor;
    FDados.cItenstotal.Value := AValor * AQuantidade;

    FDados.cItens.Post;
  finally
    FDados.cItens.Cancel;
  end;
end;

procedure TPedido.SetCodigoCliente(const ACodigo: integer);
begin
  FCodigoCliente := ACodigo;
end;

end.
