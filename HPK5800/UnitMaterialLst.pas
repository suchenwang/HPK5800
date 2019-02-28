unit UnitMaterialLst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, DB, ADODB, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls, cxButtons;

type
  TFrmMaterialLst = class(TForm)
    ADOQuery1: TADOQuery;
    cBtnManulPrtDel: TcxButton;
    GroupBox1: TGroupBox;
    AdvStringGrid1: TAdvStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AdvStringGrid1GetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormCreate(Sender: TObject);
    procedure cBtnManulPrtDelClick(Sender: TObject);
    procedure AdvStringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure MaSelForHousing();
  public
    { Public declarations }
  end;

var
  FrmMaterialLst: TFrmMaterialLst;

implementation

uses UnitGlobeVar, UnitMain, UnitMaterialStorage;

{$R *.dfm}

procedure TFrmMaterialLst.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;
end;

procedure TFrmMaterialLst.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmMaterialLstCrt := False;
    Action := caFree;
end;

procedure TFrmMaterialLst.FormShow(Sender: TObject);
var
    Row : integer;
begin
    AdvStringGrid1.Cells[0,0] := '序号';
    AdvStringGrid1.Cells[1,0] := '原料名称';
    AdvStringGrid1.Cells[2,0] := '型号规格';

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from Material order by ID';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        AdvStringGrid1.RowCount := ADOQuery1.RecordCount +1;
        Row := 1;
        while not ADOquery1.Eof do
        begin
            AdvStringGrid1.Cells[0, Row] := ADOQuery1.FieldByName('ID'        ).AsString;
            AdvStringGrid1.Cells[1, Row] := ADOQuery1.FieldByName('MaterName' ).AsString;
            AdvStringGrid1.Cells[2, Row] := ADOQuery1.FieldByName('MaterSpecs').AsString;
            inc(Row);
            ADOquery1.Next;
        end;
    end
    else
    begin
        Showmessage('获取原料信息失败!');
    end;
    
    case FrmMaLstUseMode of
        CntFrmMaLstIsMaSelForHouse :    //材料入库
        begin
            Self.Caption := '入库选择原料';
        end;
    end;

    
end;

procedure TFrmMaterialLst.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    VAlign := vtaCenter;
    HAlign := taCenter;
end;

procedure TFrmMaterialLst.MaSelForHousing();
var
    SelRow : Integer;
begin
    SelRow := AdvStringGrid1.Row;
    if (SelRow < 1) or (SelRow > AdvStringGrid1.RowCount) then
    begin
        Showmessage('请正确选择原料');
        exit;
    end;

    FrmMaterialStorage.REtStuffId.Text := AdvStringGrid1.Cells[0, SelRow];
    FrmMaterialStorage.REtStuffNm.Text := AdvStringGrid1.Cells[1, SelRow];
    FrmMaterialStorage.REtStuffType.Text := AdvStringGrid1.Cells[2, SelRow];

    Self.Close;
end;

procedure TFrmMaterialLst.cBtnManulPrtDelClick(Sender: TObject);
begin
    case FrmMaLstUseMode of
        CntFrmMaLstIsMaSelForHouse :    //材料入库
        begin
            MaSelForHousing();
        end;
    end;
end;

procedure TFrmMaterialLst.AdvStringGrid1DblClick(Sender: TObject);
begin
    case FrmMaLstUseMode of
        CntFrmMaLstIsMaSelForHouse :    //材料入库
        begin
            MaSelForHousing();
        end;
    end;
end;

end.
