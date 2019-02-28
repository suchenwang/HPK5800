unit UnitModifyStocks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, ExtCtrls, RzPanel, RzCmboBx, Mask, RzEdit,
  RzButton, DB, ADODB, DateUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, math;

type
  TFrmModifyStocks = class(TForm)
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    RzLabel1: TRzLabel;
    REtModifyStocksId: TRzEdit;
    Bevel1: TBevel;
    RzLabel2: TRzLabel;
    RCmbSiloName: TRzComboBox;
    RzLabel3: TRzLabel;
    REdtStuffNm: TRzEdit;
    RzLabel4: TRzLabel;
    REdtStuffSpec: TRzEdit;
    Bevel2: TBevel;
    RzLabel5: TRzLabel;
    REdtStocks: TRzEdit;
    RzLabel11: TRzLabel;
    RzCmbModifyType: TRzComboBox;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    REdtModifyAmount: TRzEdit;
    RzLabel8: TRzLabel;
    RCmbUnit: TRzComboBox;
    Bevel3: TBevel;
    REdtMan: TRzEdit;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    REtModifyDt: TRzEdit;
    cBtnModifyStocks: TcxButton;
    RCbStocksUnit: TRzComboBox;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RCmbSiloNameChange(Sender: TObject);
    procedure REdtModifyAmountKeyPress(Sender: TObject; var Key: Char);
    procedure RCbStocksUnitChange(Sender: TObject);
    procedure cBtnModifyStocksClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModifyStocks: TFrmModifyStocks;

  NoteIdDate : TDate;
//  NoteCounter : Integer;

  ModifySiloId : Integer;
  SiloStocks   : double;

implementation

uses UnitGlobeVar, UnitMain;

{$R *.dfm}

procedure TFrmModifyStocks.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmModifyStocksCrt := False;
    Action := caFree;
end;

procedure TFrmModifyStocks.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;
    ModifySiloId := -1;
end;

procedure TFrmModifyStocks.FormShow(Sender: TObject);
var
    ModifyNoteIdStr : String;
    i : Integer;
begin
    {库存单号生成}

    NoteIdDate := Date();

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select Count(*) as RdCount from MaMdfyStocks where DtTm >= :TodayDt';
    ADOQuery1.Parameters.ParamByName('TodayDt').Value := DateToStr( NoteIdDate ) + ' ' + '00:00:00';
    ADOQuery1.Open;
    if ADOQuery1.Eof then
        REtModifyStocksId.Text := DateToStr( NoteIdDate ) + '-001'
    else
        REtModifyStocksId.Text := DateToStr( NoteIdDate ) + '-' + format('%.3d',[ADOquery1.FieldByName('RdCount').asInteger +1]);

    RCmbSiloName.Items.Clear;
    for i := 1 to CntStorageCount do
    begin
        if not StorageInfo[i].Enable then Continue;
        RCmbSiloName.Items.Add(StorageInfo[i].Name);
    end;

    RCbStocksUnit.ItemIndex := 1;

    REdtModifyAmount.Text := '0';

    RCmbUnit.ItemIndex := 1;

    REdtMan.Text := LoginNm;

    REtModifyDt.Text := DateTimetoStr(Now());
    
end;

procedure TFrmModifyStocks.RCmbSiloNameChange(Sender: TObject);
var
    i : Integer;
    SearchOk : Boolean;
begin
    SearchOk := False;
    cBtnModifyStocks.Enabled := false;
    for i:=1 to CntStorageCount do
    begin
        if not StorageInfo[i].Enable then Continue;
        if Trim(RCmbSiloName.Text) = StorageInfo[i].Name then
        begin
            if not SearchOk then
            begin
                ModifySiloId := i;
                SearchOk  := True;
            end
            else
            begin
                showmessage('同名料仓存在，不能修改库存');
                exit;
            end;
        end;
    end;

    if SearchOk then
    begin
        REdtStuffNm.Text   := StorageInfo[ModifySiloId].MaterName;
        REdtStuffSpec.Text := StorageInfo[ModifySiloId].MaterSpec;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select * from Storage where ID='+ inttostr( ModifySiloId );
        ADOQuery1.Open;
        if not ADOquery1.Eof then
        begin
            if Trim(RCbStocksUnit.Text) = '吨' then
            begin
                REdtStocks.Text := FloatToStr( RoundTo(ADOQuery1.FieldByName('Stock').asFloat / 1000, -3 ));
            end
            else
            begin
                REdtStocks.Text := FloatToStr( RoundTo(ADOQuery1.FieldByName('Stock').asFloat , -1 ));
            end;
            SiloStocks := RoundTo(ADOQuery1.FieldByName('Stock').asFloat , -1 );
        end
        else
        begin
            Showmessage('获取料仓库存信息失败');
            exit;
        end;
    end;

    cBtnModifyStocks.Enabled := True;

end;

procedure TFrmModifyStocks.REdtModifyAmountKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Not (Key in ['0'..'9', '.', #8, #13]) then Key := #0;
end;

procedure TFrmModifyStocks.RCbStocksUnitChange(Sender: TObject);
begin
    if Trim(RCmbSiloName.Text) <> '' then RCmbSiloNameChange(Sender);
end;

procedure TFrmModifyStocks.cBtnModifyStocksClick(Sender: TObject);
var
    ModifyAmnt : double;

begin
    if ( ModifySiloId <= 0 ) or ( ModifySiloId > CntStorageCount ) then
    begin
        Showmessage('请选择正确料仓');
        exit;
    end;

    try
        ModifyAmnt := StrToFloat(REdtModifyAmount.Text);
    except
        Showmessage('无效的更改数量');
        exit;
    end;

    if Trim(RCmbUnit.Text) = '吨' then
        ModifyAmnt := ModifyAmnt * 1000;

    if Trim(RzCmbModifyType.Text) = '' then
    begin
        Showmessage('请正确选择调整类型');
    end;

    {写库存调整单}
    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'insert into MaMdfyStocks ('
                        + 'ID'
                        + ', StorId'
                        + ', StorNm'
                        + ', MaId'
                        + ', MaNm'
                        + ', MaSpec'
                        + ', MdType'
                        + ', Amount'
                        + ', OldStocks'
                        + ', NewStocks'
                        + ', SetMan'

                        + ', DtTm'
                        + ') values ('
                        + '''' + Trim(REtModifyStocksId.Text) + ''''
                        + ','  + inttostr(ModifySiloId)
                        + ','  + '''' + StorageInfo[ModifySiloId].Name + ''''
                        + ','  + inttostr(StorageInfo[ModifySiloId].MaterId)
                        + ','  + '''' + (StorageInfo[ModifySiloId].MaterName) + ''''
                        + ','  + '''' + (StorageInfo[ModifySiloId].MaterSpec) + ''''
                        + ','  + '''' + trim(RzCmbModifyType.Text) + ''''
                        + ',' + floattostr( ModifyAmnt )
                        + ',' + floattostr( SiloStocks )
                        
                        + ',' + ':NewStocks'
                        + ',' + '''' + Trim(REdtMan.Text) + ''''
                        + ','  + '''' + DateTimeToStr(Now()) + ''''
                        + ')';
        if Trim(RzCmbModifyType.Text) = '盈' then
        begin
            ADOQuery1.Parameters.ParamByName('NewStocks').Value := SiloStocks + ModifyAmnt ;
        end
        else
        begin
            ADOQuery1.Parameters.ParamByName('NewStocks').Value := SiloStocks - ModifyAmnt ;
        end;

        ADOquery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Showmessage('写库存调整单失败');
        exit;
    end;

    //更新库存记录
    try
        ADOQuery1.Close;
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.SQL.Clear;
        if Trim(RzCmbModifyType.Text) = '盈' then
            ADOQuery1.SQL.Text := 'update Storage set Stock=Stock +' + floattostr(ModifyAmnt) + ' where ID=' + inttostr( ModifySiloId )
        else
            ADOQuery1.SQL.Text := 'update Storage set Stock=Stock -' + floattostr(ModifyAmnt) + ' where ID=' + inttostr( ModifySiloId );
        ADOquery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Showmessage('更新库存失败!');
        exit;
    end;

    self.Close;
    
end;

end.
