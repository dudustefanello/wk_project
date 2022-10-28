unit interfacePedido;

interface

uses
  Data.DB;

type
  IPedido = interface
    procedure InserirItem(const ACodigoProduto, AQuantidade: integer; const AValor: Currency; const AId: integer = 0);
    procedure SetCodigoCliente(const ACodigo: integer);
    procedure CarregarPedido(const ANumero: integer);
    procedure CancelarPedido(const ANumero: integer);
    procedure GravarPedido;
    procedure RemoverItem;

    function GetQuantidadeTotal: integer;
    function GetValorTotal: currency;
    function GetCodigoCliente: integer;
    function GetDataSource: TDataSource;

  end;

implementation

end.
