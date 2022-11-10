unit initData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TinitDataModule = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDCommand1: TFDCommand;
    FDCommand2: TFDCommand;
    FDCommand3: TFDCommand;
    FDCommand4: TFDCommand;
    FDCommand5: TFDCommand;
    FDCommand6: TFDCommand;
    FDCommand7: TFDCommand;
    FDCommand8: TFDCommand;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;

    procedure DataModuleCreate(Sender: TObject);

  private
    procedure LoadConfigs;

  public
    procedure CreateDatabase;

  end;

var
  initDataModule: TinitDataModule;

implementation

uses
  FireDAC.Phys.MySQLWrapper, System.IniFiles;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TinitDataModule.CreateDatabase;
begin
  FDConnection1.Connected := True;

  FDCommand1.Execute;
  FDCommand2.Execute;
  FDCommand3.Execute;
  FDCommand4.Execute;
  FDCommand5.Execute;
  FDCommand6.Execute;
  FDCommand7.Execute;
  FDCommand8.Execute;
end;

procedure TinitDataModule.DataModuleCreate(Sender: TObject);
begin
  LoadConfigs;
end;

procedure TinitDataModule.LoadConfigs;
var
  arquivo: TIniFile;
begin
  arquivo := Tinifile.Create('.\database.ini');
  try                               
    FDPhysMySQLDriverLink1.VendorLib := arquivo.ReadString('MySQL', 'VendorLib', 'libmysql.dll');
    FDConnection1.Params.Values['User_name'] := arquivo.ReadString('MySQL', 'User_name', EmptyStr);
    FDConnection1.Params.Values['Password'] := arquivo.ReadString('MySQL', 'Password', EmptyStr);
    FDConnection1.Params.Values['Server'] := arquivo.ReadString('MySQL', 'Server', EmptyStr);
    FDConnection1.Params.Values['Database'] := arquivo.ReadString('MySQL', 'Database', EmptyStr);
  finally
    arquivo.Free;
  end;
end;

end.
