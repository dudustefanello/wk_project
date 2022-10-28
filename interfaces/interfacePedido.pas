unit interfacePedido;

interface

type
  IPedido = interface
    procedure InserirItem(const ACodigoProduto: integer; const AQuantidade: Currency; const AValor: Currency);
    procedure SetCodigoCliente(const ACodigo: integer);
    procedure CarregarPedido(const ANumero: integer = 0);
    procedure CancelarPedido(const ANumero: integer = 0);
    procedure GravarPedido;

    function GetQuantidadeTotal: currency;
    function GetValorTotal: currency;
    function GetCodigoCliente: integer;

  end;

implementation

end.
