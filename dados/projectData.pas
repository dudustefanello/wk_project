unit projectData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB;

type
  TdmProjeto = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProjeto: TdmProjeto;

implementation

uses
  initData, FireDAC.Phys.MySQLWrapper;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmProjeto.DataModuleCreate(Sender: TObject);
begin
  try
    FDConnection1.Params.Values['User_name'] := initDataModule.FDConnection1.Params.Values['User_name'];
    FDConnection1.Params.Values['Password'] := initDataModule.FDConnection1.Params.Values['Password'];
    FDConnection1.Params.Values['Server'] := initDataModule.FDConnection1.Params.Values['Server'];
    FDConnection1.Params.Values['Database'] := 'wk_project_eduardo_stefanello';
    FDConnection1.Connected := True;
  except on E: EMySQLNativeException do
    if Pos('Unknown database', E.Message) > 0 then
    begin
      initDataModule.CreateDatabase;
      FDConnection1.Connected := True;
    end;
  end;
end;

end.
