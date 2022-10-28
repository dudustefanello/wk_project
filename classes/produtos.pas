unit produtos;

interface

uses
  interfaceProdutos, produtoData;

type
  TProdutos = class(TInterfacedObject, IProdutos)
  private
    FDados: TdmProduto;

    function GetDescricaoProduto(const ACodigo: integer): string;
    function GetPrecoVenda(const ACodigo: integer): currency;

  public
    constructor Create;

    destructor Destroy; override;

  end;

implementation

{ TProdutos }

constructor TProdutos.Create;
begin
  FDados := TdmProduto.Create(nil);
end;

destructor TProdutos.Destroy;
begin
  FDados.Free;
  inherited;
end;

function TProdutos.GetDescricaoProduto(const ACodigo: integer): string;
begin
  FDados.FDTransaction1.StartTransaction;
  try
    if FDados.FDQueryProduto.Active and (FDados.FDQueryProduto.FieldByName('codigo').AsInteger <> ACodigo) then
      FDados.FDQueryProduto.Close;

    FDados.FDQueryProduto.ParamByName('codigo').AsInteger := ACodigo;
    FDados.FDQueryProduto.Open;

    Result := FDados.FDQueryProduto.FieldByName('descricao').AsString;
  finally
    FDados.FDTransaction1.Rollback;
  end;
end;

function TProdutos.GetPrecoVenda(const ACodigo: integer): currency;
begin
  FDados.FDTransaction1.StartTransaction;
  try
    if FDados.FDQueryProduto.Active and (FDados.FDQueryProduto.FieldByName('codigo').AsInteger <> ACodigo) then
      FDados.FDQueryProduto.Close;

    FDados.FDQueryProduto.ParamByName('codigo').AsInteger := ACodigo;
    FDados.FDQueryProduto.Open;

    Result := FDados.FDQueryProduto.FieldByName('preco_venda').AsCurrency;
  finally
    FDados.FDTransaction1.Rollback;
  end;
end;

end.
