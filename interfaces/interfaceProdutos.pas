unit interfaceProdutos;

interface

type
  IProdutos = interface
    function GetDescricaoProduto(const ACodigo: integer): string;
    function GetPrecoVenda(const ACodigo: integer): currency;

  end;

implementation

end.
