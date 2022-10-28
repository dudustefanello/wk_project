program WkProject;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {formPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPedido, formPedido);
  Application.Run;
end.
