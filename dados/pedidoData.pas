unit pedidoData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.DBClient;

type
  TdmPedido = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDTransaction1: TFDTransaction;
    FDQueryGravaPedido: TFDQuery;
    cItens: TClientDataSet;
    dItens: TDataSource;
    cItensid: TIntegerField;
    cItensproduto: TIntegerField;
    cItensdescricao: TStringField;
    cItensquantidade: TCurrencyField;
    cItensvalor: TCurrencyField;
    cItenstotal: TCurrencyField;
    FDQueryGravaItens: TFDQuery;
    FDQueryNumeroPedido: TFDQuery;
    FDQueryPedido: TFDQuery;
    FDQueryDelete: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmPedido.DataModuleCreate(Sender: TObject);
begin
FDTransaction1.
end;

end.
