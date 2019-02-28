unit UnitTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, ComCtrls, sPageControl,
  ExtCtrls, StdCtrls, Buttons, sBitBtn, Mask, sMaskEdit, sCustomComboEdit,
  sToolEdit, sComboBox, sEdit, DB, ADODB, sGroupBox, sRadioButton, sMemo,
  sCheckBox, DateUtils;

type
  TFrmTask = class(TForm)
    sPageControl1: TsPageControl;
    sTabShtTaskLst: TsTabSheet;
    sTabShtTaskDetails: TsTabSheet;
    Panel1: TPanel;
    sBitBtnAddTask: TsBitBtn;
    sBitBtnDelTask: TsBitBtn;
    sDtEdtSeekBegin: TsDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    sDtEdtSeekEnd: TsDateEdit;
    sCmbBoxSeekType: TsComboBox;
    Label3: TLabel;
    sEdtSeekVaule: TsEdit;
    sBitBtnSeekPrtTask: TsBitBtn;
    sBitBtnSeekTask: TsBitBtn;
    sBitBtnSaveTask: TsBitBtn;
    ADOQuery: TADOQuery;
    AdvStGrdTaskLst: TAdvStringGrid;
    Label4: TLabel;
    sGroupBox1: TsGroupBox;
    sEdtTaskCode: TsEdit;
    Shape1: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    sCmbBxCustomer: TsComboBox;
    Label8: TLabel;
    sCmbBxProjVariety: TsComboBox;
    Label9: TLabel;
    sCmbBxProjGrade: TsComboBox;
    Label10: TLabel;
    sCmbBxProjNm: TsComboBox;
    Label11: TLabel;
    sCmbBxProjAddr: TsComboBox;
    Label12: TLabel;
    sCmbBxCastPart: TsComboBox;
    Label13: TLabel;
    sEdtDistance: TsEdit;
    Label14: TLabel;
    sGroupBox2: TsGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    sCmbBxConcrVariety: TsComboBox;
    sCmbBxConcrStrength: TsComboBox;
    sCmbBxConcrSeepage: TsComboBox;
    sCmbBxConcrFrost: TsComboBox;
    sCmbBxCementSpec: TsComboBox;
    sCmbBxStoneSpec: TsComboBox;
    sCmbBxStoneSize: TsComboBox;
    sCmbBxAddLiq: TsComboBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    sCmbBxConcrSlump: TsComboBox;
    sCmbBxMixLast: TsComboBox;
    sCmbBxPourMethod: TsComboBox;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    sEdtTecReq: TsEdit;
    sGroupBox3: TsGroupBox;
    sCmbBxRecipeCode: TsComboBox;
    sEdtRecipeStrength: TsEdit;
    AdvStrGrdRecipeInFrmTask: TAdvStringGrid;
    sGroupBox4: TsGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    sEdtPlanAmount: TsEdit;
    Label28: TLabel;
    Label33: TLabel;
    sEdtTolVehs: TsEdit;
    Label34: TLabel;
    sEdtTolAmount: TsEdit;
    Label35: TLabel;
    sCmbBxRecipeState: TsComboBox;
    Label36: TLabel;
    sCmbBxDispatcher: TsComboBox;
    Label37: TLabel;
    sMemoOtherInfo: TsMemo;
    sBitBtn1: TsBitBtn;
    Label38: TLabel;
    sChkBxWinterWork: TsCheckBox;
    sDtEdtBeginDt: TsDateEdit;
    sDtEdtEndDt: TsDateEdit;
    Label26: TLabel;
    sEdtWaterModify: TsEdit;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    sDtEtDt: TsDateEdit;
    sGroupBox5: TsGroupBox;
    sRdiBtn1: TsRadioButton;
    sEdtExcessAmount: TsEdit;
    sRdiBtn2: TsRadioButton;
    sRdiBtn3: TsRadioButton;
    ID: TLabel;
    sEdtTaskIdInDb: TsEdit;
    sCmbBxCharacter: TsComboBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    edtContract: TsEdit;
    sComboBox1: TsComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sTabShtTaskLstShow(Sender: TObject);
    procedure sTabShtTaskDetailsShow(Sender: TObject);
    procedure sBitBtnAddTaskClick(Sender: TObject);
    procedure AdvStrGrdRecipeInFrmTaskGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStrGrdRecipeInFrmTaskCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure sEdtDistanceKeyPress(Sender: TObject; var Key: Char);
    procedure sEdtWaterModifyKeyPress(Sender: TObject; var Key: Char);
    procedure sEdtExcessAmountKeyPress(Sender: TObject; var Key: Char);
    procedure sEdtTolVehsKeyPress(Sender: TObject; var Key: Char);
    procedure sEdtTolAmountKeyPress(Sender: TObject; var Key: Char);
    procedure sEdtTaskCodeChange(Sender: TObject);
    procedure AdvStrGrdRecipeInFrmTaskGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure sDtEtDtChange(Sender: TObject);
    procedure sCmbBxCharacterChange(Sender: TObject);
    procedure sCmbBxCustomerChange(Sender: TObject);
    procedure sCmbBxProjVarietyChange(Sender: TObject);
    procedure sCmbBxProjGradeChange(Sender: TObject);
    procedure sCmbBxProjNmChange(Sender: TObject);
    procedure sCmbBxProjAddrChange(Sender: TObject);
    procedure sCmbBxCastPartChange(Sender: TObject);
    procedure sEdtDistanceChange(Sender: TObject);
    procedure sCmbBxConcrVarietyChange(Sender: TObject);
    procedure sCmbBxConcrStrengthChange(Sender: TObject);
    procedure sCmbBxConcrSeepageChange(Sender: TObject);
    procedure sCmbBxConcrFrostChange(Sender: TObject);
    procedure sCmbBxCementSpecChange(Sender: TObject);
    procedure sCmbBxStoneSpecChange(Sender: TObject);
    procedure sCmbBxStoneSizeChange(Sender: TObject);
    procedure sCmbBxAddLiqChange(Sender: TObject);
    procedure sCmbBxConcrSlumpChange(Sender: TObject);
    procedure sCmbBxMixLastChange(Sender: TObject);
    procedure sCmbBxPourMethodChange(Sender: TObject);
    procedure sChkBxWinterWorkClick(Sender: TObject);
    procedure sEdtTecReqChange(Sender: TObject);
    procedure sDtEdtBeginDtChange(Sender: TObject);
    procedure sDtEdtEndDtChange(Sender: TObject);
    procedure sCmbBxRecipeCodeChange(Sender: TObject);
    procedure sEdtRecipeStrengthChange(Sender: TObject);
    procedure sEdtPlanAmountChange(Sender: TObject);
    procedure sEdtWaterModifyChange(Sender: TObject);
    procedure sRdiBtn1Click(Sender: TObject);
    procedure sRdiBtn2Click(Sender: TObject);
    procedure sEdtExcessAmountClick(Sender: TObject);
    procedure sRdiBtn3Click(Sender: TObject);
    procedure sEdtTolVehsClick(Sender: TObject);
    procedure sEdtTolAmountClick(Sender: TObject);
    procedure sCmbBxRecipeStateChange(Sender: TObject);
    procedure sBitBtnSaveTaskClick(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sCmbBxMixLastKeyPress(Sender: TObject; var Key: Char);
    procedure AdvStGrdTaskLstGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sEdtPlanAmountKeyPress(Sender: TObject; var Key: Char);
    procedure AdvStGrdTaskLstDblClick(Sender: TObject);
    procedure sDtEdtSeekBeginChange(Sender: TObject);
    procedure sBitBtnSeekTaskClick(Sender: TObject);
    procedure sBitBtnDelTaskClick(Sender: TObject);
    procedure edtContractChange(Sender: TObject);
  private
    { Private declarations }

    CanEditTask : boolean;

    IsShowOK : Boolean;
    Procedure CreateNewTaskCode(var TaskCode : String);
    procedure UpdateRecipeSumsInFrmTask();
    procedure WtCmbBoxItemForTbTaskDetails();
    Function WtANewTaskIntoDb(Var NewTaskId : String) : Integer;
    procedure GetTadkFlags(var FlagValue : String);
    procedure RdProdTaskFromDbToFrmTaskLst();
    procedure RdTaskDetailsFromDbToFrmTask(TaskID : String);
    procedure RdRecipeDetailsFromDbToFrmTask();
    function WtAnOldTaskIntoDb(PrdTaskIdInDb : String) : Integer;
    procedure RdSeekBeginDtFromDdToFrmTask(var SeekBeginDt : TDate);
    procedure InitPermissonForFrmTask();
  public
    { Public declarations }
    
  end;

var
  FrmTask: TFrmTask;

implementation

uses UnitGlobeVar, UnitMain, UnitRWDb, UnitPersonnelMangement;

{$R *.dfm}

procedure TFrmTask.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmTaskCrt := False;
    Action := caFree;
end;

procedure TFrmTask.FormCreate(Sender: TObject);
var
    TaskSeekBeginDt : TDate;
begin
    IsShowOK := False;

    ADOQuery.Connection := FrmMain.ADOConnection;

    sBitBtnSaveTask.Left := sBitBtnSeekTask.Left;

    sMemoOtherInfo.OnChange := sCmbBxDispatcher.OnChange;

    RdSeekBeginDtFromDdToFrmTask(TaskSeekBeginDt);
    sDtEdtSeekBegin.Date := TaskSeekBeginDt;
    sDtEdtSeekEnd.Date := Date();
    
    sCmbBoxSeekType.ItemIndex := 1;

    //权限初始化
    InitPermissonForFrmTask();
end;

procedure TFrmTask.InitPermissonForFrmTask();
begin
    if pos('[' + CntPermissonCode[CntPermIsProdTask] + 'e', PersonnelPermit ) >= 1 then
    begin
        CanEditTask := True;

        sBitBtnAddTask.Enabled := True;
        sBitBtnDelTask.Enabled := True;

        sEdtTaskCode.ReadOnly   := False;
        edtContract.ReadOnly    := False;
        sEdtTaskIdInDb.ReadOnly := False;
        sDtEtDt.ReadOnly        := False;
        sCmbBxCharacter.ReadOnly := False;
        sCmbBxCustomer.ReadOnly  := False;
        sCmbBxProjVariety.ReadOnly := False;
        sCmbBxProjGrade.ReadOnly   := False;
        sCmbBxProjNm.ReadOnly      := False;
        sCmbBxProjAddr.ReadOnly    := False;
        sCmbBxCastPart.ReadOnly    := False;
        sEdtDistance.ReadOnly      := False;
        sCmbBxConcrVariety.ReadOnly := False;
        sCmbBxConcrStrength.ReadOnly := False;
        sCmbBxConcrSeepage.ReadOnly  := False;
        sCmbBxConcrFrost.ReadOnly    := False;
        sCmbBxCementSpec.ReadOnly    := False;
        sCmbBxStoneSpec.ReadOnly     := False;
        sCmbBxStoneSize.ReadOnly     := False;
        sCmbBxAddLiq.ReadOnly        := False;
        sCmbBxConcrSlump.ReadOnly    := False;
        sBitBtn1.Enabled             := True;
        sCmbBxMixLast.ReadOnly       := False;
        sCmbBxPourMethod.ReadOnly    := False;
        sChkBxWinterWork.ReadOnly    := False;
        sEdtTecReq.ReadOnly          := False;
        sDtEdtBeginDt.ReadOnly       := False;
        sDtEdtEndDt.ReadOnly         := False;
        sEdtPlanAmount.ReadOnly      := False;
        sEdtWaterModify.ReadOnly     := False;
        sGroupBox5.Enabled           := True;
        sEdtTolVehs.ReadOnly         := False;
        sEdtTolAmount.ReadOnly       := False;
        sCmbBxRecipeState.ReadOnly   := False;
        sCmbBxDispatcher.ReadOnly    := False;
        sMemoOtherInfo.ReadOnly      := False;
        sCmbBxRecipeCode.ReadOnly    := False;

    end
    else
    begin
        CanEditTask := True;

        sBitBtnAddTask.Enabled := False;
        sBitBtnDelTask.Enabled := False;

        sEdtTaskCode.ReadOnly   := True;
        edtContract.ReadOnly    := True;
        sEdtTaskIdInDb.ReadOnly := True;
        sDtEtDt.ReadOnly        := True;
        sCmbBxCharacter.ReadOnly := True;
        sCmbBxCustomer.ReadOnly  := True;
        sCmbBxProjVariety.ReadOnly := True;
        sCmbBxProjGrade.ReadOnly   := True;
        sCmbBxProjNm.ReadOnly      := True;
        sCmbBxProjAddr.ReadOnly    := True;
        sCmbBxCastPart.ReadOnly    := True;
        sEdtDistance.ReadOnly      := True;
        sCmbBxConcrVariety.ReadOnly := True;
        sCmbBxConcrStrength.ReadOnly := True;
        sCmbBxConcrSeepage.ReadOnly  := True;
        sCmbBxConcrFrost.ReadOnly    := True;
        sCmbBxCementSpec.ReadOnly    := True;
        sCmbBxStoneSpec.ReadOnly     := True;
        sCmbBxStoneSize.ReadOnly     := True;
        sCmbBxAddLiq.ReadOnly        := True;
        sCmbBxConcrSlump.ReadOnly    := True;
        sBitBtn1.Enabled             := False;
        sCmbBxMixLast.ReadOnly       := True;
        sCmbBxPourMethod.ReadOnly    := True;
        sChkBxWinterWork.ReadOnly    := True;
        sEdtTecReq.ReadOnly          := True;
        sDtEdtBeginDt.ReadOnly       := True;
        sDtEdtEndDt.ReadOnly         := True;
        sEdtPlanAmount.ReadOnly      := True;
        sEdtWaterModify.ReadOnly     := True;
        sGroupBox5.Enabled           := False;
        sEdtTolVehs.ReadOnly         := True;
        sEdtTolAmount.ReadOnly       := True;
        sCmbBxRecipeState.ReadOnly   := True;
        sCmbBxDispatcher.ReadOnly    := True;
        sMemoOtherInfo.ReadOnly      := True;
        sCmbBxRecipeCode.ReadOnly    := True;
    end;
end;

procedure TFrmTask.RdSeekBeginDtFromDdToFrmTask(var SeekBeginDt : TDate);
begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'TSBD' + '''';
    ADOQuery.Open;
    if ADOQuery.Eof then
        SeekBeginDt := Date() -7
    else
        SeekBeginDt := ADOQuery.FieldByName('RdValues').AsDateTime;
end;

procedure TFrmTask.FormShow(Sender: TObject);
var
    i : Integer ;
begin
    {生产任务列表页}
    AdvStGrdTaskLst.Cells[0, 0] := '序号';
    AdvStGrdTaskLst.ColWidths[0] := 40;
    AdvStGrdTaskLst.Cells[1, 0] := 'ID';
    AdvStGrdTaskLst.ColWidths[1] := 1;
    AdvStGrdTaskLst.Cells[2, 0] := '任务编号';
    AdvStGrdTaskLst.ColWidths[2] := 110;
    AdvStGrdTaskLst.Cells[3, 0] := '创建日期';
    AdvStGrdTaskLst.ColWidths[3] := 90;
    AdvStGrdTaskLst.Cells[4, 0] := '任务性质';
    AdvStGrdTaskLst.ColWidths[4] := 90;
    AdvStGrdTaskLst.Cells[5, 0] := '客户名称';
    AdvStGrdTaskLst.ColWidths[5] := 110;
    AdvStGrdTaskLst.Cells[6, 0] := '工程名称';
    AdvStGrdTaskLst.ColWidths[6] := 110;
    AdvStGrdTaskLst.Cells[7, 0] := '施工地址';
    AdvStGrdTaskLst.ColWidths[7] := 110;
    AdvStGrdTaskLst.Cells[8, 0] := '任务方量';
    AdvStGrdTaskLst.ColWidths[8] := 70;
    AdvStGrdTaskLst.Cells[9, 0] := '施工配比';
    AdvStGrdTaskLst.ColWidths[9] := 70;
    AdvStGrdTaskLst.Cells[10, 0] := '砼品种';
    AdvStGrdTaskLst.ColWidths[10] := 70;
    AdvStGrdTaskLst.Cells[11, 0] := '强度等级';
    AdvStGrdTaskLst.ColWidths[11] := 70;
    AdvStGrdTaskLst.Cells[12, 0] := '坍落度';
    AdvStGrdTaskLst.ColWidths[12] := 70;
    AdvStGrdTaskLst.Cells[13, 0] := '状态';
    AdvStGrdTaskLst.ColWidths[13] := 70;
    AdvStGrdTaskLst.Cells[14, 0] := '技术要求';
    AdvStGrdTaskLst.ColWidths[14] := 120;

    {生产任务明细页}
    AdvStrGrdRecipeInFrmTask.Cells[0, 0] := '序号';
    AdvStrGrdRecipeInFrmTask.ColWidths[0] := 50;
    AdvStrGrdRecipeInFrmTask.Cells[1, 0] := 'MaterialID' ;
    AdvStrGrdRecipeInFrmTask.ColWidths[1] := 1;
    AdvStrGrdRecipeInFrmTask.Cells[2, 0] := '材料名称' ;
    AdvStrGrdRecipeInFrmTask.ColWidths[2] := 100;
    AdvStrGrdRecipeInFrmTask.Cells[3, 0] := '型号规格' ;
    AdvStrGrdRecipeInFrmTask.ColWidths[3] := 100;
    AdvStrGrdRecipeInFrmTask.Cells[4, 0] := '用量/立方(kg)' ;
    AdvStrGrdRecipeInFrmTask.ColWidths[4] := 120;
    AdvStrGrdRecipeInFrmTask.Cells[5, 0] := '备注' ;
    AdvStrGrdRecipeInFrmTask.ColWidths[5] := 120;

    AdvStrGrdRecipeInFrmTask.AutoNumberCol(0);

    //获取原材料信息
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Text := 'select * from Material order by ID';
    ADOQuery.Open;
    AdvStrGrdRecipeInFrmTask.RowCount := ADOQuery.RecordCount + 2;
    ADOQuery.First;
    i := 1;
    while not ADOQuery.Eof do
    begin
       AdvStrGrdRecipeInFrmTask.Cells[1, i] := ADOQuery.FieldByName('ID').AsString;
       AdvStrGrdRecipeInFrmTask.Cells[2, i] := ADOQuery.FieldByName('MaterName').AsString;
       AdvStrGrdRecipeInFrmTask.Cells[3, i] := ADOQuery.FieldByName('MaterSpecs').AsString;
       AdvStrGrdRecipeInFrmTask.Cells[4, i] := '0';
       i := i + 1;
       ADOQuery.Next;
    end;

    UpdateRecipeSumsInFrmTask;

    AdvStrGrdRecipeInFrmTask.Cells[0, AdvStrGrdRecipeInFrmTask.RowCount -1] := '总重';

    sPageControl1.ActivePageIndex := 0;

    IsShowOk := True;
end;

procedure TFrmTask.AdvStGrdTaskLstGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    if (ARow =0) or (ACol =0) then HAlign := taCenter;
end;

procedure TFrmTask.AdvStrGrdRecipeInFrmTaskGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    if (ARow = 0) or (ACol=0) then HAlign := taCenter
    else if ACol=4 then HAlign := taRightJustify;

end;

procedure TFrmTask.AdvStrGrdRecipeInFrmTaskGetCellColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
    if (ACol=2) or (ACol=3) then ABrush.Color := clBtnFace;
end;

procedure TFrmTask.AdvStrGrdRecipeInFrmTaskCellValidate(Sender: TObject;
  ACol, ARow: Integer; var Value: String; var Valid: Boolean);
begin
    UpdateRecipeSumsInFrmTask();
end;

procedure TFrmTask.UpdateRecipeSumsInFrmTask;
begin
  AdvStrGrdRecipeInFrmTask.Floats[4, AdvStrGrdRecipeInFrmTask.RowCount - 1] :=
    AdvStrGrdRecipeInFrmTask.ColumnSum(4, 1, AdvStrGrdRecipeInFrmTask.RowCount - 2);
  AdvStrGrdRecipeInFrmTask.FloatingFooter.Invalidate;
end;

procedure TFrmTask.sTabShtTaskLstShow(Sender: TObject);
begin
    sBitBtnAddTask.Visible := True;
    sBitBtnDelTask.Visible := True;
    sBitBtnSaveTask.Visible := False;
    //Label1.Visible := True;
    sDtEdtSeekBegin.Visible := True;
    //Label2.Visible := True;
    sDtEdtSeekEnd.Visible := True;
    sCmbBoxSeekType.Visible := True;
    //Label3.Visible := True;
    //sEdtSeekVaule.Visible := True;
    sBitBtnSeekTask.Visible := True;

    RdProdTaskFromDbToFrmTaskLst();
end;

procedure TFrmTask.sTabShtTaskDetailsShow(Sender: TObject);
begin
    sBitBtnAddTask.Visible := False;
    sBitBtnDelTask.Visible := False;
    sBitBtnSaveTask.Visible := True;
    Label1.Visible := False;
    //sDtEdtSeekBegin.Visible := False;
    Label2.Visible := False;
    //sDtEdtSeekEnd.Visible := False;
    sCmbBoxSeekType.Visible := False;
    Label3.Visible := False;
    sEdtSeekVaule.Visible := False;
    sBitBtnSeekTask.Visible := False;

    WtCmbBoxItemForTbTaskDetails();

    if IsShowOk then
    begin
        RdTaskDetailsFromDbToFrmTask(Trim(AdvStGrdTaskLst.Cells[1, AdvStGrdTaskLst.Row]));
    end;
    
    IsShowOk := True;

    sBitBtnSaveTask.Enabled := False ;
end;

procedure TFrmTask.WtCmbBoxItemForTbTaskDetails();
var
    RdCode : String;
    RdValue : String;
begin
    sCmbBxCharacter.Items.Clear;
    sCmbBxCustomer.Items.Clear;
    sCmbBxProjVariety.Items.Clear;
    sCmbBxProjGrade.Items.Clear;
    sCmbBxProjNm.Items.Clear;
    sCmbBxProjAddr.Items.Clear;
    sCmbBxCastPart.Items.Clear;
    sCmbBxConcrVariety.Items.Clear;
    sCmbBxConcrStrength.Items.Clear;
    sCmbBxConcrSeepage.Items.Clear;
    sCmbBxConcrFrost.Items.Clear;
    sCmbBxCementSpec.Items.Clear;
    sCmbBxStoneSpec.Items.Clear;
    sCmbBxStoneSize.Items.Clear;
    sCmbBxAddLiq.Items.Clear;
    sCmbBxConcrSlump.Items.Clear;
    sCmbBxMixLast.Items.Clear;
    sCmbBxPourMethod.Items.Clear;
    sCmbBxDispatcher.Items.Clear;

    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Text := 'select * from BasiInfo Order by RdValues' ;
    ADOQuery.Open;
    while Not ADOQuery.Eof do
    begin
        RdCode := ADOQuery.FieldByName('Code').AsString;
        RdValue := ADOQuery.FieldByName('RdValues').AsString;

        if RdCode      = 'TC'     then sCmbBxCharacter.Items.Add(RdValue)
        else if RdCode = 'TCu'    then sCmbBxCustomer.Items.Add(RdValue)
        else if RdCode = 'TPjVa'  then sCmbBxProjVariety.Items.Add(RdValue)
        else if RdCode = 'TPjCl'  then sCmbBxProjGrade.Items.Add(RdValue)
        else if RdCode = 'PjNm'   then sCmbBxProjNm.Items.Add(RdValue)
        else if RdCode = 'PjAdd'  then sCmbBxProjAddr.Items.Add(RdValue)
        else if RdCode = 'PjCaPt' then sCmbBxCastPart.Items.Add(RdValue)
        else if RdCode = 'ConVa'  then sCmbBxConcrVariety.Items.Add(RdValue)
        else if RdCode = 'RSt'    then sCmbBxConcrStrength.Items.Add(RdValue)
        else if RdCode = 'Rse'    then sCmbBxConcrSeepage.Items.Add(RdValue)
        else if RdCode = 'RFr'    then sCmbBxConcrFrost.Items.Add(RdValue)
        else if RdCode = 'CeSp'   then sCmbBxCementSpec.Items.Add(RdValue)
        else if RdCode = 'StSp'   then sCmbBxStoneSpec.Items.Add(RdValue)
        else if RdCode = 'StSz'   then sCmbBxStoneSize.Items.Add(RdValue)
        else if RdCode = 'AddLiq' then sCmbBxAddLiq.Items.Add(RdValue)
        else if RdCode = 'RSl'    then sCmbBxConcrSlump.Items.Add(RdValue)
        else if RdCode = 'MxLast' then sCmbBxMixLast.Items.Add(RdValue)
        else if RdCode = 'PoMd'   then sCmbBxPourMethod.Items.Add(RdValue)
        else if RdCode = 'PdDr'   then sCmbBxDispatcher.Items.Add(RdValue);
        
        ADOQuery.Next;
    end;

    sCmbBxRecipeCode.Items.Clear;
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Text := 'select Code from RecipeInfo where Flag like' + ' ' + '''' + '%0%' + '''' + ' ' + 'order by Code';
    ADOQuery.Open;
    while not ADOQuery.Eof do
    begin
        sCmbBxRecipeCode.Items.Add(ADOQuery.FieldByName('Code').AsString);
        ADOQuery.Next;
    end;
end;

procedure TFrmTask.RdProdTaskFromDbToFrmTaskLst();
var
    RowPt : integer;
    TaskFlag : String;
begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    if sCmbBoxSeekType.Text = '所有任务' then
      ADOquery.SQL.Text := 'select * from ProdTask'
                         + ' ' + 'where' + ' '
                         + 'DtTm>=' + FloatToStr(sDtEdtSeekBegin.date)
                         + ' ' + 'and' + ' '
                         + 'DtTm<=' + FloatToStr(sDtEdtSeekEnd.Date)
                         + ' ' + 'order by Code'
    else if sCmbBoxSeekType.Text = '正常任务' then
      ADOQuery.SQL.Text := 'select * from ProdTask where'
                         + ' ' + 'Flag not like ' + '''' + '%a%' + ''''
                         + ' ' + 'and'
                         + ' ' + 'Flag not like ' + '''' + '%b%' + ''''
                         + ' ' + 'and' + ' '
                         + 'DtTm>=' + FloatToStr(sDtEdtSeekBegin.date)
                         + ' ' + 'and' + ' '
                         + 'DtTm<=' + FloatToStr(sDtEdtSeekEnd.Date)
                         + ' order by Code'
    else if sCmbBoxSeekType.Text = '完成任务' then
      ADOQuery.SQL.Text := 'select * from ProdTask where Flag like ' + '''' + '%a%' + ''''
                         + ' ' + 'and' + ' '
                         + 'DtTm>=' + FloatToStr(sDtEdtSeekBegin.date)
                         + ' ' + 'and' + ' '
                         + 'DtTm<=' + FloatToStr(sDtEdtSeekEnd.Date)
                         + ' order by Code'
    else if sCmbBoxSeekType.Text = '停用任务' then
      ADOQuery.SQL.Text := 'select * from ProdTask where Flag like ' + '''' + '%b%' + ''''
                         + ' ' + 'and' + ' '
                         + 'DtTm>=' + FloatToStr(sDtEdtSeekBegin.date)
                         + ' ' + 'and' + ' '
                         + 'DtTm<=' + FloatToStr(sDtEdtSeekEnd.Date)
                         + ' order by Code';
{任务性质
客户名称
合同信息
工程名称
施工地址
砼品种
强度等级
坍落度
施工配比
调度员 }
    ADOQuery.Open ;
    if ADOQuery.Eof then
    begin
        AdvStGrdTaskLst.RowCount := 2;
        AdvStGrdTaskLst.Rows[1].Clear;
    end
    else
    begin
        AdvStGrdTaskLst.RowCount := ADOQuery.RecordCount + 1;
        ADOQuery.First;
        RowPt := 1;
        while not ADOQuery.Eof do
        begin
            AdvStGrdTaskLst.Cells[1,  RowPt] := inttostr(RowPt);
            AdvStGrdTaskLst.Cells[1,  RowPt] := ADOQuery.FieldByName('ID').AsString;
            AdvStGrdTaskLst.Cells[2,  RowPt] := ADOQuery.FieldByName('Code').AsString;
            AdvStGrdTaskLst.Cells[3,  RowPt] := ADOQuery.FieldByName('DtTm').AsString;           //创建日期';
            AdvStGrdTaskLst.Cells[4,  RowPt] := ADOQuery.FieldByName('Characters').AsString;      //任务性质';
            AdvStGrdTaskLst.Cells[5,  RowPt] := ADOQuery.FieldByName('Customer').AsString;       //客户名称';
            AdvStGrdTaskLst.Cells[6,  RowPt] := ADOQuery.FieldByName('ProjNm').AsString;         //工程名称';
            AdvStGrdTaskLst.Cells[7,  RowPt] := ADOQuery.FieldByName('ProjAddr').AsString;       //施工地址';
            AdvStGrdTaskLst.Cells[8,  RowPt] := ADOQuery.FieldByName('PlanAmount').AsString;     //任务方量';
            AdvStGrdTaskLst.Cells[9,  RowPt] := ADOQuery.FieldByName('RecipeCode').AsString;       //施工配比';
            AdvStGrdTaskLst.Cells[10, RowPt] := ADOQuery.FieldByName('ConcrVariety').AsString;   //砼品种';
            AdvStGrdTaskLst.Cells[11, RowPt] := ADOQuery.FieldByName('ConcrStrength').AsString;  //强度等级';
            AdvStGrdTaskLst.Cells[12, RowPt] := ADOQuery.FieldByName('ConcrSlump').AsString;     //坍落度';
            
            TaskFlag :=  ADOQuery.FieldByName('Flag').AsString;
            if Pos('a', TaskFlag) > 0 then AdvStGrdTaskLst.Cells[13, RowPt] := '完成'
            else if  Pos('b', TaskFlag) > 0 then AdvStGrdTaskLst.Cells[13, RowPt] := '停用'
            else AdvStGrdTaskLst.Cells[13, RowPt] := '正常';

            AdvStGrdTaskLst.Cells[14, RowPt] := ADOQuery.FieldByName('TecReq').AsString;         //技术要求';

            RowPt := RowPt + 1;
            ADOQuery.Next;
        end;
    end;
end;

procedure TFrmTask.RdTaskDetailsFromDbToFrmTask(TaskID : String);
var
    TaskFlags : String;
begin
    if TaskID = '' then
    begin
        sEdtTaskIdInDb.Text      := '';
        sEdtTaskCode.Text        := '';
        edtContract.Text         := '';
        sDtEtDt.Date             := Date();
        sCmbBxCharacter.Text     := '';
        sCmbBxCustomer.Text      := '';
        sCmbBxProjVariety.Text   := '';
        sCmbBxProjGrade.Text     := '';
        sCmbBxProjNm.Text        := '';
        sCmbBxProjAddr.Text      := '';
        sCmbBxCastPart.Text      := '';
        sEdtDistance.Text        := '0.0';
        sCmbBxConcrVariety.Text  := '';
        sCmbBxConcrStrength.Text := '';
        sCmbBxConcrSeepage.Text  := '';
        sCmbBxConcrFrost.Text    := '';
        sCmbBxCementSpec.Text    := '';
        sCmbBxStoneSpec.Text     := '';
        sCmbBxStoneSize.Text     := '';
        sCmbBxAddLiq.Text        := '';
        sCmbBxConcrSlump.Text    := '';
        sCmbBxMixLast.Text       := '0';
        sCmbBxPourMethod.Text    := '';
        sEdtTecReq.Text          := '';
        sDtEdtBeginDt.Date       := Date();
        sDtEdtEndDt.Date         := Date();
        sCmbBxRecipeCode.Text    := '';
        sEdtPlanAmount.Text      := '0.0';
        sEdtWaterModify.Text     := '0.0';
        sEdtTolVehs.Text         := '0';
        sEdtTolAmount.Text       := '0.0';
        sCmbBxDispatcher.Text    := '';
        sMemoOtherInfo.Text      := '';
        sChkBxWinterWork.Checked := False;
        sRdiBtn1.Checked         := True;
        sEdtExcessAmount.Text    := '0';
        sCmbBxRecipeState.ItemIndex := 0;
        
    end
    else
    begin

        ADOQuery.Close;
        ADOQuery.SQL.Clear;
        ADOQuery.SQL.Text := 'select * from ProdTask where ID=' + TaskID;
        ADOQuery.Open;
        if ADOQuery.Eof then
        begin
            sEdtTaskIdInDb.Text      := '';
            sEdtTaskCode.Text        := '';
            edtContract.Text         := '';
            sDtEtDt.Date             := Date();
            sCmbBxCharacter.Text     := '';
            sCmbBxCustomer.Text      := '';
            sCmbBxProjVariety.Text   := '';
            sCmbBxProjGrade.Text     := '';
            sCmbBxProjNm.Text        := '';
            sCmbBxProjAddr.Text      := '';
            sCmbBxCastPart.Text      := '';
            sEdtDistance.Text        := '0.0';
            sCmbBxConcrVariety.Text  := '';
            sCmbBxConcrStrength.Text := '';
            sCmbBxConcrSeepage.Text  := '';
            sCmbBxConcrFrost.Text    := '';
            sCmbBxCementSpec.Text    := '';
            sCmbBxStoneSpec.Text     := '';
            sCmbBxStoneSize.Text     := '';
            sCmbBxAddLiq.Text        := '';
            sCmbBxConcrSlump.Text    := '';
            sCmbBxMixLast.Text       := '0';
            sCmbBxPourMethod.Text    := '';
            sEdtTecReq.Text          := '';
            sDtEdtBeginDt.Date       := Date();
            sDtEdtEndDt.Date         := Date();
            sCmbBxRecipeCode.Text    := '';
            sEdtPlanAmount.Text      := '0.0';
            sEdtWaterModify.Text     := '0.0';
            sEdtTolVehs.Text         := '0';
            sEdtTolAmount.Text       := '0.0';
            sCmbBxDispatcher.Text    := '';
            sMemoOtherInfo.Text      := '';
            sChkBxWinterWork.Checked := False;
            sRdiBtn1.Checked         := True;
            sEdtExcessAmount.Text    := '0';
            sCmbBxRecipeState.ItemIndex := 0;
        end
        else
        begin
            sEdtTaskIdInDb.Text      := ADOQuery.FieldByName('ID').AsString;
            sEdtTaskCode.Text        := ADOQuery.FieldByName('Code').AsString;
            edtContract.Text         := ADOQuery.FieldByName('ContractNO').AsString;
            sDtEtDt.Date             := ADOQuery.FieldByName('DtTm').AsDateTime;
            sCmbBxCharacter.Text     := ADOQuery.FieldByName('Characters').AsString;
            sCmbBxCustomer.Text      := ADOQuery.FieldByName('Customer').AsString;
            sCmbBxProjVariety.Text   := ADOQuery.FieldByName('ProjVariety').AsString;
            sCmbBxProjGrade.Text     := ADOQuery.FieldByName('ProjGrade').AsString;
            sCmbBxProjNm.Text        := ADOQuery.FieldByName('ProjNm').AsString;
            sCmbBxProjAddr.Text      := ADOQuery.FieldByName('ProjAddr').AsString;
            sCmbBxCastPart.Text      := ADOQuery.FieldByName('CastPart').AsString;
            sEdtDistance.Text        := ADOQuery.FieldByName('Distance').AsString;
            sCmbBxConcrVariety.Text  := ADOQuery.FieldByName('ConcrVariety').AsString;
            sCmbBxConcrStrength.Text := ADOQuery.FieldByName('ConcrStrength').AsString;
            sCmbBxConcrSeepage.Text  := ADOQuery.FieldByName('ConcrSeepage').AsString;
            sCmbBxConcrFrost.Text    := ADOQuery.FieldByName('ConcrFrost').AsString;
            sCmbBxCementSpec.Text    := ADOQuery.FieldByName('CementSpec').AsString;
            sCmbBxStoneSpec.Text     := ADOQuery.FieldByName('StoneSpec').AsString;
            sCmbBxStoneSize.Text     := ADOQuery.FieldByName('StoneSize').AsString;
            sCmbBxAddLiq.Text        := ADOQuery.FieldByName('AddLiq').AsString;
            sCmbBxConcrSlump.Text    := ADOQuery.FieldByName('ConcrSlump').AsString;
            sCmbBxMixLast.Text       := ADOQuery.FieldByName('MixLast').AsString;
            sCmbBxPourMethod.Text    := ADOQuery.FieldByName('PourMethod').AsString;
            sEdtTecReq.Text          := ADOQuery.FieldByName('TecReq').AsString;
            sDtEdtBeginDt.Date       := ADOQuery.FieldByName('BeginDt').AsDateTime;
            sDtEdtEndDt.Date         := ADOQuery.FieldByName('EndDt').AsDateTime;
            sCmbBxRecipeCode.Text    := ADOQuery.FieldByName('RecipeCode').AsString;
            sEdtPlanAmount.Text      := ADOQuery.FieldByName('PlanAmount').AsString;
            sEdtWaterModify.Text     := ADOQuery.FieldByName('WaterModify').AsString;
            sEdtTolVehs.Text         := ADOQuery.FieldByName('TolVehs').AsString;
            sEdtTolAmount.Text       := ADOQuery.FieldByName('TolAmount').AsString;
            sCmbBxDispatcher.Text    := ADOQuery.FieldByName('Dispatcher').AsString;
            sMemoOtherInfo.Text      := ADOQuery.FieldByName('OtherInfo').AsString;
            sEdtExcessAmount.Text    := ADOQuery.FieldByName('ExcessAmount').AsString;
        
            TaskFlags := ADOQuery.FieldByName('Flag').AsString;

            if pos('a', TaskFlags) > 0 then sCmbBxRecipeState.ItemIndex := 1
            else if pos('b', TaskFlags) > 0 then sCmbBxRecipeState.ItemIndex := 2
            else sCmbBxRecipeState.ItemIndex := 0;

            if pos('c', TaskFlags) > 0 then sChkBxWinterWork.Checked := True
            else  sChkBxWinterWork.Checked := False;

            if pos('1', TaskFlags) > 0 then sRdiBtn2.Checked := True
            else if pos('2', TaskFlags) > 0 then sRdiBtn3.Checked := True
            else sRdiBtn1.Checked := True;

            RdRecipeDetailsFromDbToFrmTask();
        end;
    end;
end;

procedure TFrmTask.sBitBtnAddTaskClick(Sender: TObject);
var
    NewTaskCode : String ;
    i : Integer;
begin
    CreateNewTaskCode(NewTaskCode);
    sEdtTaskCode.Text := NewTaskCode;
    edtContract.Text  := '';
    sEdtTaskIdInDb.Text := '';
    sDtEtDt.Date := Date();
    sCmbBxCharacter.Text := '';
    sCmbBxCustomer.Text := '';
    sCmbBxProjVariety.Text := '';
    sCmbBxProjGrade.Text := '';
    sCmbBxProjNm.Text := '';
    sCmbBxProjAddr.Text := '';
    sCmbBxCastPart.Text := '';
    sEdtDistance.Text := '0.0';
    sCmbBxConcrVariety.Text := '';
    sCmbBxConcrStrength.Text := '';
    sCmbBxConcrSeepage.Text := '';
    sCmbBxConcrFrost.Text := '';
    sCmbBxCementSpec.Text := '';
    sCmbBxStoneSpec.Text := '';
    sCmbBxStoneSize.Text := '';
    sCmbBxAddLiq.Text := '';
    sCmbBxConcrSlump.Text := '';
    sCmbBxMixLast.Text := '0';
    sCmbBxPourMethod.Text := '';
    sChkBxWinterWork.Checked := False;
    sEdtTecReq.Text := '';
    sDtEdtBeginDt.Date := Date();
    sDtEdtEndDt.Date := IncYear(Date());
    sCmbBxRecipeCode.Text := '';
    sEdtRecipeStrength.Text := '';

    for i:=1 to AdvStrGrdRecipeInFrmTask.RowCount - 2 do
    begin
        AdvStrGrdRecipeInFrmTask.Floats[4, i] := 0;
    end;
    UpdateRecipeSumsInFrmTask();

    sEdtPlanAmount.Text := '0.00';
    sEdtWaterModify.Text := '0.0';
    sRdiBtn1.Checked := True;
    sEdtExcessAmount.Text := '0.0';
    sEdtTolVehs.Text := '0';
    sEdtTolAmount.Text := '0.0';
    sCmbBxRecipeState.ItemIndex := 0;
    sCmbBxDispatcher.Text := '';
    sMemoOtherInfo.Text := '';

    IsShowOk := False;
    sTabShtTaskDetails.Show;
end;

procedure TFrmTask.CreateNewTaskCode( var TaskCode : String);
Var
    RdCountInDb : Integer;
begin
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Text := 'select Count(*) as RdCount from ProdTask where DtTm=:CurrentDt';
  ADOQuery.Parameters.ParamByName('CurrentDt').Value := Date();
  ADOQuery.Open;
  if not ADOQuery.Eof then
      RdCountInDb := ADOQuery.FieldByName('RdCount').AsInteger
  else
      RdCountInDb := 0;
  TaskCode := 'RWD' + FormatDateTime('yy',Date) + FormatDateTime('mm',Date) + FormatDateTime('dd',Date) + Format('%.3d',[RdCountInDb +1] );
end;

procedure TFrmTask.sEdtDistanceKeyPress(Sender: TObject; var Key: Char);
begin
    if NOt (Key in ['0'..'9','.',#8] ) then Key := #0;
end;

procedure TFrmTask.sEdtPlanAmountKeyPress(Sender: TObject; var Key: Char);
begin
    if NOt (Key in ['0'..'9','.',#8] ) then Key := #0;
end;

procedure TFrmTask.sEdtWaterModifyKeyPress(Sender: TObject; var Key: Char);
begin
    if NOt (Key in ['0'..'9','.',#8] ) then Key := #0;
end;

procedure TFrmTask.sEdtExcessAmountKeyPress(Sender: TObject;
  var Key: Char);
begin
    if NOt (Key in ['0'..'9','.',#8] ) then Key := #0;
end;

procedure TFrmTask.sEdtTolVehsKeyPress(Sender: TObject; var Key: Char);
begin
    if NOt (Key in ['0'..'9',#8] ) then Key := #0;
end;

procedure TFrmTask.sEdtTolAmountKeyPress(Sender: TObject; var Key: Char);
begin
    if NOt (Key in ['0'..'9','.',#8] ) then Key := #0;
end;

procedure TFrmTask.sCmbBxMixLastKeyPress(Sender: TObject; var Key: Char);
begin
    if NOt (Key in ['0'..'9',#8] ) then Key := #0;
end;

procedure TFrmTask.sBitBtn1Click(Sender: TObject);
begin
    sCmbBxConcrSlump.SetFocus;
    sCmbBxConcrSlump.SelText := sCmbBxConcrSlump.Text + '±' ;
end;

procedure TFrmTask.edtContractChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sEdtTaskCodeChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sDtEtDtChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxCharacterChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxCustomerChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxProjVarietyChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxProjGradeChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxProjNmChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxProjAddrChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxCastPartChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sEdtDistanceChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxConcrVarietyChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxConcrStrengthChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxConcrSeepageChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxConcrFrostChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxCementSpecChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxStoneSpecChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxStoneSizeChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxAddLiqChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxConcrSlumpChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxMixLastChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxPourMethodChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sChkBxWinterWorkClick(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sEdtTecReqChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sDtEdtBeginDtChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sDtEdtEndDtChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxRecipeCodeChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
    RdRecipeDetailsFromDbToFrmTask();
end;

procedure TFrmTask.RdRecipeDetailsFromDbToFrmTask();
var
    i : Integer;
    RecipeId : String;
    RecipeMateId : String;
    ExResult : Boolean;
begin
    sEdtRecipeStrength.Text := '';
    for i:= 1 to AdvStrGrdRecipeInFrmTask.RowCount -2 do
    begin
        AdvStrGrdRecipeInFrmTask.Cells[4, i] := '0.00';
    end;

    if Trim(sCmbBxRecipeCode.Text) = '' then
    begin
        exit;
    end;

    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Text := 'select Strength,Id from RecipeInfo where Code=' + '''' + Trim(sCmbBxRecipeCode.Text) + '''';
    ADOQuery.Open;
    if Not ADOQuery.Eof then
    begin
        sEdtRecipeStrength.Text := ADOQuery.FieldByName('Strength').AsString;
        RecipeId := ADOQuery.FieldByName('ID').AsString  ;
    end;

    for i:=1 to AdvStrGrdRecipeInFrmTask.RowCount -2 do
     begin
         AdvStrGrdRecipeInFrmTask.Cells[4,i] := '0';
     end;

     ADOQuery.Close;
     ADOQuery.SQL.Clear;
     ADOQuery.SQL.Text := 'select * from RecipeLst where RecipeInfoId=' + RecipeId + ' ' + 'order by MaterId';
     ADOQuery.Open;
     while not ADOQuery.Eof do
     begin
         RecipeMateId := ADOQuery.FieldByName('MaterId').AsString;
         ExResult := False;
         for i:=1 to AdvStrGrdRecipeInFrmTask.RowCount -2 do
         begin
             if RecipeMateId = AdvStrGrdRecipeInFrmTask.Cells[1,i] then
             begin
                 AdvStrGrdRecipeInFrmTask.Cells[4,i] := ADOQuery.FieldByName('Amount').AsString;
                 ExResult := True;
                 Break;
             end;
         end;
         if Not ExResult then Showmessage('配比材料用量显示失败');
         ADOQuery.Next;
     end;
end;

procedure TFrmTask.sEdtRecipeStrengthChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sEdtPlanAmountChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sEdtWaterModifyChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sRdiBtn1Click(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sRdiBtn2Click(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sEdtExcessAmountClick(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sRdiBtn3Click(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sEdtTolVehsClick(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sEdtTolAmountClick(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sCmbBxRecipeStateChange(Sender: TObject);
begin
    sBitBtnSaveTask.Enabled := True;
end;

procedure TFrmTask.sBitBtnSaveTaskClick(Sender: TObject);
var
    PrdTaskIdInDb : String;
    ExResult : Integer;
begin
    if CanEditTask then
    begin
        //添加小字典信息
        WtNewBasicInfoIntoDb('TC',    Trim(sCmbBxCharacter.Text));
        WtNewBasicInfoIntoDb('TCu',   Trim(sCmbBxCustomer.Text));
        WtNewBasicInfoIntoDb('TPjVa', Trim(sCmbBxProjVariety.Text));
        WtNewBasicInfoIntoDb('TPjCl', Trim(sCmbBxProjGrade.Text));
        WtNewBasicInfoIntoDb('PjNm',  Trim(sCmbBxProjNm.Text));
        WtNewBasicInfoIntoDb('PjAdd', Trim(sCmbBxProjAddr.Text));
        WtNewBasicInfoIntoDb('PjCaPt',Trim(sCmbBxCastPart.Text));
        WtNewBasicInfoIntoDb('ConVa', Trim(sCmbBxConcrVariety.Text));
        WtNewBasicInfoIntoDb('RSt',   Trim(sCmbBxConcrStrength.Text));
        WtNewBasicInfoIntoDb('Rse',   Trim(sCmbBxConcrSeepage.Text));
        WtNewBasicInfoIntoDb('RFr',   Trim(sCmbBxConcrFrost.Text));
        WtNewBasicInfoIntoDb('CeSp',  Trim(sCmbBxCementSpec.Text));
        WtNewBasicInfoIntoDb('StSp',  Trim(sCmbBxStoneSpec.Text));
        WtNewBasicInfoIntoDb('StSz',  Trim(sCmbBxStoneSize.Text));
        WtNewBasicInfoIntoDb('AddLiq',Trim(sCmbBxAddLiq.Text));
        WtNewBasicInfoIntoDb('RSl',   Trim(sCmbBxConcrSlump.Text));
        WtNewBasicInfoIntoDb('MxLast',Trim(sCmbBxMixLast.Text));
        WtNewBasicInfoIntoDb('PoMd', Trim(sCmbBxPourMethod.Text));
        WtNewBasicInfoIntoDb('PdDr', Trim(sCmbBxDispatcher.Text));

        PrdTaskIdInDb := Trim(sEdtTaskIdInDb.Text);
        if PrdTaskIdInDb = '' then
        begin
            ExResult := WtANewTaskIntoDb(PrdTaskIdInDb);
            Case ExResult of
                0:
                begin
                    sEdtTaskIdInDb.Text := PrdTaskIdInDb;
                    sBitBtnSaveTask.Enabled := False;
                end;
                1:    Showmessage('无效的生产任务单号');
                2:    Showmessage('生产任务单编号已经存在！');
                3:    Showmessage('写入失败！');
            end;
        end
        else
        begin
            ExResult := WtAnOldTaskIntoDb(PrdTaskIdInDb);
            Case ExResult of
                0:
                begin
                     sBitBtnSaveTask.Enabled := False;
                end;
                1:    Showmessage('保存任务单修改失败');
            //    2:    Showmessage('生产任务单编号已经存在！');
            //    3:    Showmessage('写入失败！');
            end;
        end;
        WtCmbBoxItemForTbTaskDetails();
    end
    else
    begin
        Showmessage('无效的操作权限');
    end;
end;

Function TFrmTask.WtANewTaskIntoDb(Var NewTaskId : String) : Integer;
//Result = 0：添加成功
//         1；无效的生产任务单号
//         2：生产任务单号已经存在
//         3：写数据库失败
var
    ExContinue : Boolean;
    FlagValue : String;
begin
    if Trim(sEdtTaskCode.Text) = '' then
    begin
        ExContinue := False;
        Result := 1;
        Exit;
    end;

    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Text := 'select ID from ProdTask where Code=' + '''' + Trim(sEdtTaskCode.Text) + '''';
    ADOQuery.Open;
    if ADOQuery.Eof then
    begin
        ExContinue := True;
    end
    else
    begin
        ExContinue := False;
        Result := 2;
        Exit;
    end;

    GetTadkFlags(FlagValue) ;

    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery.Close;
        ADOQuery.SQL.Clear;
        ADOQuery.SQL.Text := 'insert into ProdTask ('
                           + 'Code'
                           + ',' + 'ContractNO'
                           + ',' + 'Characters'
                           + ',Customer'
                           + ',ProjNm'
                           + ',ProjVariety'
                           + ',ProjGrade'
                           + ',ProjAddr'
                           + ',Distance'
                           + ',CastPart'
                           + ',PourMethod'
                           + ',ConcrVariety'
                           + ',ConcrStrength'
                           + ',ConcrSeepage'
                           + ',ConcrFrost'
                           + ',ConcrSlump'
                           + ',CementSpec'
                           + ',StoneSpec'
                           + ',StoneSize'
                           + ',AddLiq'
                           + ',TecReq'
                           + ',RecipeCode'
                           + ',MixLast'
                           + ',PlanAmount'
                           + ',BeginDt'
                           + ',EndDt'
                           + ',Dispatcher'
                           + ',ExcessAmount'
                           + ',WaterModify'
                           + ',Flag'
                           + ',TolVehs'
                           + ',TolAmount'
                           + ',' + 'DtTm'
                           + ',' + 'OtherInfo'
                           + ') values('
                           + '''' + Trim(sEdtTaskCode.Text) + ''''              //Code
                           + ',' + '''' + Trim(edtContract.Text) + ''''               //ContractNO
                           + ',' + '''' + Trim(sCmbBxCharacter.Text) + ''''     //Characters
                           + ',' + '''' + Trim(sCmbBxCustomer.Text) + ''''      //Customer
                           + ',' + '''' + Trim(sCmbBxProjNm.Text) + ''''        //ProjNm
                           + ',' + '''' + Trim(sCmbBxProjVariety.Text) + ''''   //ProjVariety
                           + ',' + '''' + Trim(sCmbBxProjGrade.Text) + ''''     //ProjGrade
                           + ',' + '''' + Trim(sCmbBxProjAddr.Text) + ''''      //ProjAddr
                           + ',' + Trim(sEdtDistance.Text)                      //Distance
                           + ',' + '''' + Trim(sCmbBxCastPart.Text) + ''''      //CastPart
                           + ',' + '''' + Trim(sCmbBxPourMethod.Text) + ''''    //PourMethod
                           + ',' + '''' + Trim(sCmbBxConcrVariety.Text) + ''''  //ConcrVariety
                           + ',' + '''' + Trim(sCmbBxConcrStrength.Text) + '''' //ConcrStrength
                           + ',' + '''' + Trim(sCmbBxConcrSeepage.Text) + ''''  //ConcrSeepage
                           + ',' + '''' + Trim(sCmbBxConcrFrost.Text) + ''''    //ConcrFrost
                           + ',' + '''' + Trim(sCmbBxConcrSlump.Text) + ''''    //ConcrSlump
                           + ',' + '''' + Trim(sCmbBxCementSpec.Text) + ''''    //CementSpec
                           + ',' + '''' + Trim(sCmbBxStoneSpec.Text) + ''''     //StoneSpec
                           + ',' + '''' + Trim(sCmbBxStoneSize.Text) + ''''     //StoneSize
                           + ',' + '''' + Trim(sCmbBxAddLiq.Text) + ''''        //AddLiq
                           + ',' + '''' + Trim(sEdtTecReq.Text) + ''''          //TecReq
                           + ',' + '''' + Trim(sCmbBxRecipeCode.Text) + ''''    //RecipeCode
                           + ',' + Trim(sCmbBxMixLast.Text)                     //MixLast
                           + ',' + Trim(sEdtPlanAmount.Text)                    //PlanAmount
                           + ',' + '''' + Trim(sDtEdtBeginDt.Text) + ''''       //BeginDt
                           + ',' + '''' + Trim(sDtEdtEndDt.Text) + ''''         //
                           + ',' + '''' + Trim(sCmbBxDispatcher.Text) + ''''    //
                           + ',' + '''' + Trim(sEdtExcessAmount.Text) + ''''    //
                           + ',' + '''' + Trim(sEdtWaterModify.Text) + ''''     //
                           + ',' + '''' + FlagValue + ''''                      //
                           + ',' + '''' + Trim(sEdtTolVehs.Text) + ''''         //
                           + ',' + '''' + Trim(sEdtTolAmount.Text) + ''''       //
                           + ',' + '''' + DateToStr(Date()) + ''''              //
                           + ',' + '''' + sMemoOtherInfo.Text + ''''            //
                           + ')';
        ADOQuery.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        ExContinue := False;
        Result := 3;
        Exit;
    end;

    if ExContinue then Result := 0;
end;

procedure TFrmTask.GetTadkFlags(var FlagValue : String);
begin
    FlagValue := '';

    Case sCmbBxRecipeState.ItemIndex of
        0:    ;
        1:    FlagValue := FlagValue + 'a';
        2:    FlagValue := FlagValue + 'b';
    end;

    if sChkBxWinterWork.Checked then FlagValue := FlagValue + 'c';

    if sRdiBtn2.Checked then FlagValue := FlagValue + '1'
    else if sRdiBtn3.Checked then FlagValue := FlagValue + '2';
end;

function TFrmTask.WtAnOldTaskIntoDb(PrdTaskIdInDb : String) : Integer;
var
    ExContinue : Boolean;
    FlagValue : String;
begin
    ExContinue := True;

    GetTadkFlags(FlagValue) ;

    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery.Close;
        ADOQuery.SQL.Clear;
        ADOQuery.SQL.Text := 'update ProdTask set '
                           + 'Code=' + '''' + Trim(sEdtTaskCode.Text) + ''''
                           + ',ContractNO=' + '''' + Trim(edtContract.Text) + ''''
                           + ',Characters=' + '''' + Trim(sCmbBxCharacter.Text) + ''''
                           + ',Customer=' + '''' + Trim(sCmbBxCustomer.Text) + ''''
                           + ',ProjNm=' + '''' + Trim(sCmbBxProjNm.Text) + ''''
                           + ',ProjVariety=' + '''' + Trim(sCmbBxProjVariety.Text) + ''''
                           + ',ProjGrade=' + '''' + Trim(sCmbBxProjGrade.Text) + ''''
                           + ',ProjAddr=' + '''' + Trim(sCmbBxProjAddr.Text) + ''''
                           + ',Distance=' + Trim(sEdtDistance.Text)
                           + ',CastPart=' + '''' + Trim(sCmbBxCastPart.Text) + ''''
                           + ',PourMethod=' + '''' + Trim(sCmbBxPourMethod.Text) + ''''
                           + ',ConcrVariety=' + '''' + Trim(sCmbBxConcrVariety.Text) + ''''
                           + ',ConcrStrength=' + '''' + Trim(sCmbBxConcrStrength.Text) + ''''
                           + ',ConcrSeepage=' + '''' + Trim(sCmbBxConcrSeepage.Text) + ''''
                           + ',ConcrFrost=' + '''' + Trim(sCmbBxConcrFrost.Text) + ''''
                           + ',ConcrSlump=' + '''' + Trim(sCmbBxConcrSlump.Text) + ''''
                           + ',CementSpec=' + '''' + Trim(sCmbBxCementSpec.Text) + ''''
                           + ',StoneSpec=' + '''' + Trim(sCmbBxStoneSpec.Text) + ''''
                           + ',StoneSize=' + '''' + Trim(sCmbBxStoneSize.Text) + ''''
                           + ',AddLiq=' + '''' + Trim(sCmbBxAddLiq.Text) + ''''
                           + ',TecReq=' + '''' + sEdtTecReq.Text + ''''
                           + ',BeginDt=' + '''' + sDtEdtBeginDt.Text + ''''
                           + ',EndDt=' + '''' + sDtEdtEndDt.Text + ''''
                           + ',Dispatcher=' + '''' + sCmbBxDispatcher.Text + ''''
                           + ',ExcessAmount=' + Trim(sEdtExcessAmount.Text)
                           + ',WaterModify=' + Trim(sEdtWaterModify.Text)
                           + ',Flag=' + '''' + FlagValue + ''''
                           + ',TolVehs=' + Trim(sEdtTolVehs.Text)
                           + ',TolAmount=' + Trim(sEdtTolAmount.Text)
                           + ',OtherInfo=' + '''' + Trim(sMemoOtherInfo.Text) + ''''
                           + ',PlanAmount=' + Trim(sEdtPlanAmount.Text)
                           + ',RecipeCode=' + '''' + Trim(sCmbBxRecipeCode.Text) + ''''
                           + ' ' + 'where ID=' + Trim(sEdtTaskIdInDb.Text);
        ADOQuery.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Result := 1;
        ExContinue := False;
    end;

    if ExContinue then Result := 0;
end;

procedure TFrmTask.AdvStGrdTaskLstDblClick(Sender: TObject);
begin
    sTabShtTaskDetails.Show;
end;

procedure TFrmTask.sDtEdtSeekBeginChange(Sender: TObject);
var
    IsRdExist : Boolean;
    RdId : String;
begin
    if Not IsShowOk then exit;
    
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Text := 'select Max(ID) as LastRdId from BasiInfo where Code=' + '''' + 'TSBD' + '''';
    ADOQuery.Open;
    if ADOQuery.Eof then
    begin
        IsRdExist := False;
    end
    else
    begin
        IsRdExist := True;
        RdId := ADOQuery.FieldByName('LastRdId').AsString;
    end;
    if Not IsRdExist then
    begin
        WtNewBasicInfoIntoDb('TSBD', Trim(sDtEdtSeekBegin.Text));    //保存基本信息到数据库
    end
    else
    begin
        try
            FrmMain.ADOConnection.BeginTrans;
            ADOQuery.Close;
            ADOQuery.SQL.Clear;
            ADOQuery.SQL.Text := 'update BasiInfo set RdValues=' + '''' + sDtEdtSeekBegin.Text + '''' + ' where Code=' + '''' + 'TSBD' + '''';
            ADOQuery.ExecSQL;
            FrmMain.ADOConnection.CommitTrans;
        except
            FrmMain.ADOConnection.RollbackTrans;
        end;
    end;
end;

procedure TFrmTask.sBitBtnSeekTaskClick(Sender: TObject);
begin
    RdProdTaskFromDbToFrmTaskLst();
end;

procedure TFrmTask.sBitBtnDelTaskClick(Sender: TObject);
begin
    if messagebox(getfocus, Pchar('您确定要删除编号为 ' + AdvStGrdTaskLst.Cells[2, AdvStGrdTaskLst.Row] + ' 的任务单吗？' ),
       '警示信息', MB_YESNO ) =idYes then
    begin
        try
            FrmMain.ADOConnection.BeginTrans;
            ADOQuery.Close;
            ADOQuery.SQL.Clear;
            ADOQuery.SQL.Text := 'delete from ProdTask where ID=' + Trim(AdvStGrdTaskLst.Cells[1, AdvStGrdTaskLst.Row]);
            ADOQuery.ExecSQL;
            FrmMain.ADOConnection.CommitTrans;
            RdProdTaskFromDbToFrmTaskLst();
        except
            FrmMain.ADOConnection.RollbackTrans;
            Showmessage('删除失败!');
        end;
    end;
end;



end.
