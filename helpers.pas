unit helpers;

interface

uses
  Vcl.ExtCtrls;

type
  TEditHelper = class helper for TLabeledEdit
    function AsInteger: integer;
    function AsCurrency: currency;

  end;

implementation

uses
  System.SysUtils;

{ TEditHelper }

function TEditHelper.AsCurrency: currency;
begin
  Self.Text := StringReplace(Self.Text, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StrToCurrDef(Self.Text, 0.0);
end;

function TEditHelper.AsInteger: integer;
begin
  Result := StrToIntDef(Self.Text, 0);
end;

end.
