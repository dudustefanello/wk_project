program WkProject;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {formPedido},
  helpers in 'helpers.pas',
  pedidoData in 'dados\pedidoData.pas' {DataModule1: TDataModule},
  interfacePedido in 'interfaces\interfacePedido.pas',
  interfaceProdutos in 'interfaces\interfaceProdutos.pas',
  interfaceClientes in 'interfaces\interfaceClientes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPedido, formPedido);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
