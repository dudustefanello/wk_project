program WkProject;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {formPedido},
  helpers in 'helpers.pas',
  interfacePedido in 'interfaces\interfacePedido.pas',
  interfaceProdutos in 'interfaces\interfaceProdutos.pas',
  interfaceClientes in 'interfaces\interfaceClientes.pas',
  pedido in 'classes\pedido.pas',
  produtos in 'classes\produtos.pas',
  projectData in 'dados\projectData.pas' {dmProjeto: TDataModule},
  pedidoData in 'dados\pedidoData.pas' {dmPedido: TDataModule},
  clientes in 'classes\clientes.pas',
  clienteData in 'dados\clienteData.pas' {dmCliente: TDataModule},
  produtoData in 'dados\produtoData.pas' {dmProduto: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPedido, formPedido);
  Application.Run;
end.
