unit clientes;

interface

uses
  interfaceClientes, clienteData;

type
  TClientes = class(TInterfacedObject, IClientes)
  private
    FDados: TdmCliente;

    function GetNomeCliente(const ACodigo: integer): string;

  public
    constructor Create;

    destructor Destroy; override;

  end;

implementation

uses
  FireDAC.Stan.Param;

{ TClientes }

constructor TClientes.Create;
begin
  FDados := TdmCliente.Create(nil);
end;

destructor TClientes.Destroy;
begin
  FDados.Free;
  inherited;
end;

function TClientes.GetNomeCliente(const ACodigo: integer): string;
begin
  FDados.FDTransaction1.StartTransaction;
  try
    if FDados.FDQueryCliente.Active then
      FDados.FDQueryCliente.Close;

    FDados.FDQueryCliente.ParamByName('codigo').AsInteger := ACodigo;
    FDados.FDQueryCliente.Open;

    Result := FDados.FDQueryCliente.FieldByName('nome').AsString;
  finally
    FDados.FDTransaction1.Rollback;
  end;
end;

end.
