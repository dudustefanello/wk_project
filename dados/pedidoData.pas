unit pedidoData;

interface

uses
  System.SysUtils, System.Classes, projectData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.DBClient, FireDAC.Comp.DataSet;

type
  TdmPedido = class(TdmProjeto)
    FDQueryGravaPedido: TFDQuery;
    FDQueryGravaItens: TFDQuery;
    FDQueryNumeroPedido: TFDQuery;
    FDQueryPedido: TFDQuery;
    FDQueryDelete: TFDQuery;
    dItens: TDataSource;
    cItens: TClientDataSet;
    cItensid: TAutoIncField;
    cItensproduto: TIntegerField;
    cItensdescricao: TStringField;
    cItensquantidade: TIntegerField;
    cItensvalor: TCurrencyField;
    cItenstotal: TCurrencyField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPedido: TdmPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
