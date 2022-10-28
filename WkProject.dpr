program WkProject;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {formPedido},
  helpers in 'helpers.pas',
  interfacePedido in 'interfaces\interfacePedido.pas',
  interfaceProdutos in 'interfaces\interfaceProdutos.pas',
  interfaceClientes in 'interfaces\interfaceClientes.pas',
  pedidoData in 'dados\pedidoData.pas' {dmPedido: TDataModule},
  pedido in 'classes\pedido.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPedido, formPedido);
  Application.Run;
end.
