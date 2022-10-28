unit interfacePedido;

interface

type
  IPedido = interface
    procedure InserirItem(const ACodigoProduto: integer; const AQuantidade: Currency; const AValor: Currency);
    procedure SetCliente(const ACodigo: integer);
    procedure CarregarPedido(const ACodigo: integer = 0);
    procedure CancelarPedido(const ACodigo: integer = 0);
    procedure GravarPedido;

    function GetQuantidadeTotal: currency;
    function GetValorTotal: currency;
    function GetCodigoCliente: integer;

  end;

implementation

end.
