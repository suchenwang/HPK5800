unit UnitMaterialStorage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzButton, Mask, RzEdit, ExtCtrls, RzLabel,
  RzPanel, DB, ADODB, DateUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TFrmMaterialStorage = class(TForm)
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    RzLabel1: TRzLabel;
    REtStorageNoteId: TRzEdit;
    Bevel1: TBevel;
    RzLabel2: TRzLabel;
    REtStuffId: TRzEdit;
    REtStuffNm: TRzEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    REtStuffType: TRzEdit;
    Bevel2: TBevel;
    RCmbSiloName: TRzComboBox;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    REdtStorageNum: TRzEdit;
    RzLabel7: TRzLabel;
    Bevel4: TBevel;
    RCmbUnit: TRzComboBox;
    RzEdit7: TRzEdit;
    REdtMan: TRzEdit;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    cBtnManulPrtDel: TcxButton;
    cxBtnMaSelForWarehousing: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure REdtStorageNumKeyPress(Sender: TObject; var Key: Char);
    procedure cxBtnMaSelForWarehousingClick(Sender: TObject);
    procedure cBtnManulPrtDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMaterialStorage: TFrmMaterialStorage;

  NoteIdDate : TDate;
  NoteCounter : Integer;
implementation

uses UnitMain, UnitGlobeVar, UnitMaterialLst;

{$R *.dfm}

procedure TFrmMaterialStorage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmMaterialStorageCrt := False;
    Action := caFree;
end;

procedure TFrmMaterialStorage.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;
end;

procedure TFrmMaterialStorage.FormShow(Sender: TObject);
var
    StorageNOteIdStr : String;
    i : Integer;
begin
    NoteIdDate := Date();

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select count(*) as RdCount from MaterialWarehousing where DtTm >= :EditDtTm';
    ADOQuery1.Parameters.ParamByName('EditDtTm').Value := DateToStr( NoteIdDate ) +' ' + '00:00:00';
    ADOQuery1.Open;
    if ADOQuery1.Eof then
    begin
        Showmessage('数据错误，添加失败');
        exit;
    end
    else
    begin
        StorageNOteIdStr := DateToStr(NoteIdDate) + '-' + Format('%.3d', [ADOQuery1.FieldByName('RdCount').AsInteger +1] );
    end;

    REtStorageNoteId.Text := StorageNOteIdStr ;
    


        {写数据库}
{        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        try
            FrmMain.ADOConnection.BeginTrans;
            ADOQuery1.SQL.Text := 'insert into BasicInfo (ProductionNoticeIdDate, '
                            + 'ProductionNoticeIdCounter,NoteType ) values (:ProductionNoticeIdDate,'
                            + ':ProductionNoticeIdCounter,:NoteType)';
            ADOQuery1.Parameters.ParamByName('ProductionNoticeIdDate').Value := DateToStr(NoteIdDate);
            ADOQuery1.Parameters.ParamByName('ProductionNoticeIdCounter').Value := '0';
            ADOQuery1.Parameters.ParamByName('NoteType').Value := 'SiloStroageNote';
            ADOQuery1.ExecSQL;
            FrmMain.ADOConnection.CommitTrans;
        except
            FrmMain.ADOConnection.RollbackTrans;
            Showmessage('入库单信息保存失败!');
            exit;
        end;
    end
    else
    begin
        if ADOQuery1.FieldByName('ProductionNoticeIdDate').AsDateTime >= NoteIdDate then
        begin
            NoteIdDate := Dateof(ADOQuery1.FieldByName('ProductionNoticeIdDate').AsDateTime);
            NoteCounter := ADOQuery1.FieldByName('ProductionNoticeIdCounter').AsInteger + 1;
        end
        else
        begin
            NoteCounter := 1;
        end;
    end;

    StorageNoteIdStr := DateToStr(NoteIdDate) + '-' + inttostr(NoteCounter);
    REtStorageNoteId.Text := StorageNoteIdStr; }

    RCmbSiloName.Items.Clear;
    for i:=0 to CntStorageCount -1 do
    begin
        if not StorageInfo[i].Enable then Continue;
        RCmbSiloName.Items.Add(StorageInfo[i].Name);
    end; 

    RCmbUnit.ItemIndex := 0;

    REdtMan.Text := LoginNm;

    RzEdit7.Text := DateTimeToStr(now()); //}
end;

procedure TFrmMaterialStorage.REdtStorageNumKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (key in ['0'..'9', '.', #8,#13]) then Key := #0;
end;


procedure TFrmMaterialStorage.cxBtnMaSelForWarehousingClick(
  Sender: TObject);
begin
    if not FrmMaterialLstCrt then
    begin
        FrmMaterialLst := TFrmMaterialLst.Create(Self);
        FrmMaterialLstCrt := True;
    end;
    FrmMaLstUseMode := CntFrmMaLstIsMaSelForHouse ;    //材料入库 ;
    FrmMaterialLst.ShowModal;   
end;

procedure TFrmMaterialStorage.cBtnManulPrtDelClick(Sender: TObject);
var
    StorageSiloId : Integer;
    SearchOk      : Boolean;
    StockNow      : Double;
    i             : Integer;
    StorageNUm : Double;
begin
    {检查料仓中的材料是否和入库材料相符}
    SearchOk := False;
    for i:=1 to CntStorageCount do
    begin
        if not StorageInfo[i].Enable then Continue;
        if Trim(RCmbSiloName.Text) = StorageInfo[i].Name then
        begin
            if Not SearchOk then
            begin
                StorageSiloId := i;
                SearchOk := True;
            end
            else
            begin
                Showmessage('相同名称的料仓数量多于1个');
                exit;
            end;
        end;
    end;

    if not SearchOk then
    begin
        Showmessage('无效的料仓选择!');
        exit;
    end;

    {检查料仓原料是否与入库原料相同}
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text :='select * from Storage where ID=' + inttostr( StorageSiloId );
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        if ADOQuery1.FieldByName('Mater').AsString <> Trim(REtStuffId.Text) then
        begin
            Showmessage('料仓内材料与选择材料不相同！');
            exit;
        end;
        StockNow := ADOquery1.FieldByName('Stock').AsFloat;
    end
    else
    begin
        Showmessage('获取料仓信息失败!');
        exit;
    end;

    {入库数量处理}
    try
        StorageNUm := StrToFloat( REdtStorageNum.Text );
    except
        Showmessage('请正确输入入库数量');
        exit;
    end;
    if Trim(RCmbUnit.Text) = '吨' then
        StorageNUm := StorageNUm *1000;

    {创建入库单}
    Try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'insert into MaterialWarehousing ('
                            + 'ID'                                         //入库单号
                            + ',MaId'                                      //原料编号
                            + ',MaNm'                                      //原料名称
                            + ',MaSpec'                                    //原料规格
                            + ',StorId'                                    //料仓号
                            + ',StorNm'                                    //料仓名称
                            + ',Amount'                                    //入库数量
                            + ',OldStocks'                                 //入库前库存
                            + ',NewStosks'                                 //入库后库存
                            + ',SetMan'                                    //制单人
                            + ',DtTm'
                            + ') values ('
                            + '''' + Trim(REtStorageNoteId.Text) + ''''    //入库单号
                            + ',' + Trim(REtStuffId.Text)                  //原料编号
                            + ',' + '''' + Trim(REtStuffNm.Text) + ''''    //原料名称
                            + ',' + '''' + Trim(REtStuffType.Text) + ''''  //原料规格
                            + ',' + inttostr(i)                            //料仓号
                            + ',' + '''' + Trim(RCmbSiloName.Text) + ''''  //料仓名称
                            + ',' + FloatToStr(StorageNUm)                 //入库数量
                            + ',' + FloatToStr(StockNow)                   //入库前库存
                            + ',' + FloatToStr( StockNow + StorageNUm )    //入库后库存
                            + ',' + '''' + Trim(REdtMan.Text) + ''''     //制单人
                            + ',' + '''' + DateTimeToStr(Now()) + ''''
                            + ')';
        ADOQuery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Showmessage('添加入库单失败');
        exit;
    end;

    {更新库存}
    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'update Storage set Stock=Stock + ' + Floattostr(StorageNUm) + ' where ID=' + inttostr( StorageSiloId );
        ADOquery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Showmessage('库存值更新失败');
        exit;
    end;

    Self.Close;
end;


end.
