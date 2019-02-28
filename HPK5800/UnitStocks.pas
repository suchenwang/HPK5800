unit UnitStocks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, StdCtrls, DB, ADODB;

type
  TFrmStocks = class(TForm)
    GroupBox1: TGroupBox;
    AdvGdSiloStocks: TAdvStringGrid;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AdvGdSiloStocksGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStocks: TFrmStocks;

implementation

uses UnitGlobeVar, UnitMain;

{$R *.dfm}

procedure TFrmStocks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FrmStocksCrt := False;
     Action       := caFree;
end;

procedure TFrmStocks.FormShow(Sender: TObject);
var
    RowCnt : Integer;
    i      : Integer;
begin
    AdvGdSiloStocks.Cells[0, 0] := '序号';
    AdvGdSiloStocks.Cells[1, 0] := '料仓名称';
    AdvGdSiloStocks.Cells[2, 0] := '材料名称';
    AdvGdSiloStocks.Cells[3, 0] := '型号规格';
    AdvGdSiloStocks.Cells[4, 0] := '库存值';
    AdvGdSiloStocks.Cells[5, 0] := '单位';

    RowCnt := 1;
    for i:=1 to CntStorageCount do
    begin
        if StorageInfo[i].Enable then
        begin
            AdvGdSiloStocks.Cells[0, RowCnt] := Inttostr(RowCnt);

            AdvGdSiloStocks.Cells[1, RowCnt] := StorageInfo[i].Name ;   //料仓名称';
            AdvGdSiloStocks.Cells[2, RowCnt] := StorageInfo[i].MaterName;    //材料名称';
            AdvGdSiloStocks.Cells[3, RowCnt] := StorageInfo[i].MaterSpec;    //型号规格';

            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOquery1.SQL.Text := 'select Stock from Storage where ID =' + inttostr( i);
            ADOQuery1.Open;
            if not ADOquery1.Eof then
            begin
                AdvGdSiloStocks.Cells[4, RowCnt] := Format('%.3f', [ADOQuery1.FieldByName('Stock').AsFloat / 1000]);    //库存值';
            end;

            //
            AdvGdSiloStocks.Cells[5, RowCnt] := '吨';    //单位';

            inc(RowCnt);
        end;
    end;

    AdvGdSiloStocks.RowCount := RowCnt;
end;

procedure TFrmStocks.AdvGdSiloStocksGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

procedure TFrmStocks.Button1Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmStocks.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;
end;

end.
