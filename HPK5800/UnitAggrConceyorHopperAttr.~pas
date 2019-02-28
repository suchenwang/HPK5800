unit UnitAggrConceyorHopperAttr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, Grids, AdvObj, BaseGrid, AdvGrid,
  sGroupBox, sEdit, ComCtrls, sPageControl, acProgressBar, UnitGlobeVar,
  ExtCtrls, ADODB;

type
  TFrmAggrConceyorHopperAttr = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    Label1: TLabel;
    sEtEquipName: TsEdit;
    sGroupBox2: TsGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    sEtLoadCell: TsEdit;
    sTabSheet2: TsTabSheet;
    AdvStrGdAggrBinAttri: TAdvStringGrid;
    Memo2: TMemo;
    BtnReadDb: TsBitBtn;
    BtnRestore: TsBitBtn;
    sBtBtnOK: TsBitBtn;
    sBitBtn4: TsBitBtn;
    sProgressBar1: TsProgressBar;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvStrGdAggrBinAttriGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStrGdAggrBinAttriCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure AdvStrGdAggrBinAttriGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure AdvStrGdAggrBinAttriCellsChanged(Sender: TObject; R: TRect);
    procedure sBtBtnOKClick(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    CanEditConceyorParaPeimisson : boolean;

    procedure IniAggrConcParaInfo();
    Function GetAggrConvParaInfoId(var ParaIndex : Integer; ParaIdInParaValueArray : Integer) : Boolean;
    procedure paraValueDspInAggrConvAttr();    //参数值显示
    procedure SaveParaModifyOfAggrConc(var WtInstrValid : Boolean);    //保存骨料修改
    procedure GetNewAggrConcParaValue();
    procedure MsCmRecProgInUtAggConcAttr();
    procedure MscmRecProgForSaveNewPara();    //保存新参数时的通讯接收处理
    procedure SaveNewAggrConcParaToDb(var ExDbRslt : boolean);    //保存新参数到数据库
    procedure SaveNewAggrConcParaToMemory();                      //保存骨料参数新值到内存

    procedure InitPermissonInFrmConyorAttr();
  public
    { Public declarations }
  end;

var
  FrmAggrConceyorHopperAttr: TFrmAggrConceyorHopperAttr;

var
  AggConcPrarChanged : Boolean;

  AggregateConvParaInUntAggrConcAttr : array[1..CntAggregateConvParaCount] of AggregateConvParaRd ;    //按控制器地址排列

  StepsOfAggrConcParaModify : Integer;    //骨料输送参数修改步骤
const
  CntStepsOfAggrConcParaMfyIsIdle                    = 0;     //空闲
  CntStepsOfAggrConcParaMfyIsGetNewParaVaue          = 1;     //获取新的参数值
  CntStepsOfAggrConcParaMfyIsWtAggrModeToIns         = 2;    //写骨料生产模式到下
  CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns       = 3;    //写骨料参数组1到仪表
  CntStepsOfAggrConcParaMfyIsWtParaArray2ToIns       = 4;    //写骨料参数组1到仪表
  CntStepsOfAggrConcParaMfyIsWtAggrDschIntervalToIns = 5;    //写骨料称卸料阀间隔时间到仪表
  CntStepsOfAggrConcParaMfyIsEnd                     = 6;    //写骨料输送参数结束

var
  MsCommStateInUntAggrConcAttr : Integer;
Const
  CntMsCmStaInUntAggConcAttrIsIdle = 1;         //空闲
  CntMsCmStaInUntAggConcAttrIsWaitReply = 2;    //等待下位机应答

var
  MscmTmrInUntAggConcAttr         : Integer;   //通讯计时器
  MscmTmrInterValInUntAggConcAttr : Integer;   //通讯计时器定时间隔
var
  MscmWaitRecBufPtInUntAggrConcAttr : Integer;     //通讯接收缓冲区指针

var
  MscmSendCmdInUntAggrConcAttr : Integer;    //发送命令名称
Const
  CntMscmSndCmdInUtAggConAttrIsSaveNewPara =2 ;    //发送到仪表的命令是保存新的参数值

implementation

{$R *.dfm}

uses  UnitRWInstrument1MscommBuf, UnitMain, UnitPersonnelMangement;

procedure TFrmAggrConceyorHopperAttr.FormCreate(Sender: TObject);
var
    i : Integer;
begin
    AggConcPrarChanged := False;
    MsCommStateInUntAggrConcAttr    := CntMsCmStaInUntAggConcAttrIsIdle ;      //通讯状态为空闲
    StepsOfAggrConcParaModify       := CntStepsOfAggrConcParaMfyIsIdle;        //骨料输送参数修改步骤 = 空闲
    MscmTmrInterValInUntAggConcAttr := Timer1.Interval;

    for i:=1 to CntAggregateConvParaCount do
    begin
        AggregateConvParaInUntAggrConcAttr[i] := AggregateConvPara[PMAggrHopperId][i]  ;    //按控制器地址排列
    end;

    {窗体标签}
    if AggregateConveyorMode = CntAggregateConveyorBelt then            //骨料输送方式 = 斜皮带
    begin
        Self.Caption := AggregateMidBinInfo[PMAggrHopperId].Name + ' 属性';
        sEtEquipName.Text := AggregateMidBinInfo[PMAggrHopperId].Name;

        if AggregateMidBinInfo[PMAggrHopperId].IsWeigher then
        begin
            sGroupBox2.Visible := True ;
        end
        else
        begin
            sGroupBox2.Visible := False;
        end;

        {参数列表}
        IniAggrConcParaInfo();

    end
    else if AggregateConveyorMode = CntAggregateConveyorElevator then   //骨料输送方式 = 提升机
    begin
        Self.Caption := LiftBucketAttr[PMAggrHopperId].Name + ' 属性';
        sEtEquipName.Text := LiftBucketAttr[PMAggrHopperId].Name;
        sGroupBox2.Visible := False;

        {参数列表}
        IniAggrConcParaInfo();
    end;

    AdvStrGdAggrBinAttri.Cells[1, 0] := '序号';
    AdvStrGdAggrBinAttri.Cells[2, 0] := '参数名称';
    AdvStrGdAggrBinAttri.Cells[3, 0] := '参数值';
    AdvStrGdAggrBinAttri.Cells[4, 0] := '单位';
    AdvStrGdAggrBinAttri.Cells[5, 0] := 'CntAggreConvParaInfoID';
    AdvStrGdAggrBinAttri.ColWidths[5] := 0;

    InitPermissonInFrmConyorAttr();
end;

procedure TFrmAggrConceyorHopperAttr.InitPermissonInFrmConyorAttr();
begin
    if pos('[' + CntPermissonCode[CntPermIsPara] + 'e]', PersonnelPermit) >= 1 then
    begin
        CanEditConceyorParaPeimisson := True;

        BtnReadDb.Enabled  := True;
        BtnRestore.Enabled := True;
        sBtBtnOK.Enabled   := True;
    end
    else
    begin
        CanEditConceyorParaPeimisson := False;

        BtnReadDb.Enabled  := False;
        BtnRestore.Enabled := False;
        sBtBtnOK.Enabled   := False;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.IniAggrConcParaInfo();
var
    i : Integer;
    BeginRw,
    WtOffsetRw : Integer;
    ParaIdInInfoArray : Integer;
begin
    {获取控制参数}
    BeginRw := 1;
    WtOffsetRw := 1;
    for i:= 1 to CntAggregateConvParaCount do
    begin
        if Pos('D', AggregateConvPara[PMAggrHopperId][i].Flags) <= 0 then Continue;

        if pos('X', AggregateConvPara[PMAggrHopperId][i].Flags) > 0 then    //骨料中间仓参数
        begin
            if AggregateConveyorMode <> CntAggregateConveyorBelt then Continue;   //骨料输送方式 != 斜皮带
        end
        else if Pos('T',  AggregateConvPara[PMAggrHopperId][i].Flags) > 0 then    //骨料提升斗参数
        begin
            if AggregateConveyorMode <> CntAggregateConveyorElevator then Continue;   //骨料输送方式 != 提升机
        end
        else    //公共参数
        begin

        end;

        AdvStrGdAggrBinAttri.Cells[1, BeginRw + WtOffsetRw] := IntToStr(WtOffsetRw);
        AdvStrGdAggrBinAttri.Cells[2, BeginRw + WtOffsetRw] := AggregateConvPara[PMAggrHopperId][i].Name;

        AdvStrGdAggrBinAttri.Cells[4, BeginRw + WtOffsetRw] := AggregateConvPara[PMAggrHopperId][i].ParaUnit;

        if GetAggrConvParaInfoId(ParaIdInInfoArray, i) then   //获取该参数在信息数组中的下标
        begin
            AdvStrGdAggrBinAttri.Cells[5, BeginRw + WtOffsetRw] := IntToStr(ParaIdInInfoArray);
        end
        else
        begin
            Showmessage('获取参数信息组序号失败');
        end;

        WtOffsetRw := WtOffsetRw +1;
    end;

    AdvStrGdAggrBinAttri.RowCount := BeginRw + WtOffsetRw;
    AdvStrGdAggrBinAttri.AddNode(BeginRw, WtOffsetRw);
    AdvStrGdAggrBinAttri.Cells[1, BeginRw] := '控制参数';
    
end;

Function TFrmAggrConceyorHopperAttr.GetAggrConvParaInfoId(var ParaIndex : Integer;
  ParaIdInParaValueArray : Integer) : Boolean;
var
    i : Integer;
begin
    for i:=1 to CntAggregateConvParaCount do
    begin
        if ParaIdInParaValueArray = CntAggreConvParaInfo[i].BufIndex then Break;
    end;
    if i<= CntAggregateConvParaCount then
    begin
        ParaIndex := i;
        Result := True;
    end
    else
    begin
        Result := False;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.paraValueDspInAggrConvAttr();    //参数值显示
var
    i : Integer;
    TempParaCode : Integer;
begin
    for i:=1 to AdvStrGdAggrBinAttri.RowCount -1 do
    begin
        if Trim(AdvStrGdAggrBinAttri.cells[5, i]) = '' then Continue;

        try
            TempParaCode := StrToInt(AdvStrGdAggrBinAttri.cells[5, i]);
            TempParaCode := CntAggreConvParaInfo[TempParaCode].ParaCode;
        except
            TempParaCode := 0;
        end;

        case TempParaCode of
            {正数型参数}
            CntAggrConvParaIsMidBinDschDelay    ,     //$7041 骨料输送参数是中储仓延迟投料时间
            CntAggrConvParaIsMidBinDschLong     ,     //$7043 骨料输送参数是中储仓投料时长
            CntAggrConvParaIsMidBinLoadContinue ,     //$7045 骨料输送参数是中储仓装料持续时间(骨料输送/提升延迟时间)
            CntAggrConvParaIsLevelBeltStopDelay ,     //$7046 骨料输送参数是平皮带延迟停止时间
            CntAggrConvParaIsMidBinVibraDelay   ,    //$704A 骨料输送参数是延迟振动时间
            CntAggrConvParaIsMidBinVibraRunTm   ,    //$704B 骨料输送参数是振动时间
            CntAggrConvParaIsMidBinVibraSTP     ,    //$704C 骨料输送参数是振动间隔时间
            CntAggrConvParaIsHopprRunMaxTm      :    //$704D 骨料输送参数是过卷保护时间
            begin
                AdvStrGdAggrBinAttri.cells[3, i] := IntToStr(AggregateConvPara[PMAggrHopperId][CntAggreConvParaInfo[TempParaCode].BufIndex].Value);
            end;
            //CntAggrConvParaIsMidBinSndDschDelay = 2;     //$7042 骨料输送参数是中处仓二次延迟投料时间
            //
            //CntAggrConvParaIsMidBinSndDschLong  = 4;     //$7044 骨料输送参数是中储仓二次投料时长
            
            //
                                                 //$7047
            //CntAggrConvParaIsMidBinDschPauseTm  = 8;     //$7048 骨料输送参数是两次开门间隔
            //CntAggrConvParaIsSAND_WT            = 9;     //$7049 骨料输送参数是砂裹石重量值

            //CntAggrConvParaIs                          //704E  内存数组下标
            //CntAggrConvParaIs                          //704F  内存数组下标
            //CntAggrConvParaIsAggreMode          = 16;    //7050 骨料生产方式 内存数组下标
        end;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.FormShow(Sender: TObject);
begin
    {参数值显示}
    paraValueDspInAggrConvAttr();
end;

procedure TFrmAggrConceyorHopperAttr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmAggrConceyorHopperAttrCrt := False;
    Action := caFree;
end;

procedure TFrmAggrConceyorHopperAttr.AdvStrGdAggrBinAttriGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
    VAlign := vtaCenter;
    
    if (Arow = 0) and (Acol = 1) then
    begin
        HAlign := taCenter;
    end;

end;

procedure TFrmAggrConceyorHopperAttr.AdvStrGdAggrBinAttriCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
    if CanEditConceyorParaPeimisson then
    begin
        if ACol = 3 then
        begin
            if Trim(AdvStrGdAggrBinAttri.Cells[5, ARow]) <> '' then
                CanEdit := True
            else
                CanEdit := False;
        end
        else
        begin
            CanEdit := False;
        end;
    end
    else
    begin
        CanEdit := False;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.AdvStrGdAggrBinAttriGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
var
    ParaCodeS : String;
    ParaCodeI : Integer;
begin
    ParaCodeS := Trim(AdvStrGdAggrBinAttri.Cells[5, ARow]);
    if ParaCodeS <> '' then
    begin
        try
            ParaCodeI := StrToInt(ParaCodeS);
            ParaCodeI := CntAggreConvParaInfo[ParaCodeI].ParaCode;
        except
            ParaCodeI := 0;
        end;
        case ParaCodeI of
            CntAggrConvParaIsMidBinDschDelay    :     //$7041 骨料输送参数是中储仓延迟投料时间
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinSndDschDelay :     //$7042 骨料输送参数是中处仓二次延迟投料时间
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinDschLong     :     //$7043 骨料输送参数是中储仓投料时长
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinSndDschLong  :     //$7044 骨料输送参数是中储仓二次投料时长
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinLoadContinue :     //$7045 骨料输送参数是中储仓装料持续时间(骨料输送/提升延迟时间)
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsLevelBeltStopDelay :     //$7046 骨料输送参数是平皮带延迟停止时间
            begin
                AEditor := edSpinEdit ;
            end;
                                                 //$7047
            CntAggrConvParaIsMidBinDschPauseTm  :     //$7048 骨料输送参数是两次开门间隔
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsSAND_WT            :     //$7049 骨料输送参数是砂裹石重量值
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinVibraDelay   :    //$704A 骨料输送参数是延迟振动时间
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinVibraRunTm   :    //$704B 骨料输送参数是振动时间
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinVibraSTP     :    //$704C 骨料输送参数是振动间隔时间
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsHopprRunMaxTm      :    //$704D 骨料输送参数是过卷保护时间
            begin
                AEditor := edSpinEdit ;
            end;
            //CntAggrConvParaIs                          //704E  内存数组下标
            //CntAggrConvParaIs                          //704F  内存数组下标
            CntAggrConvParaIsAggreMode          :    //7050 骨料生产方式 内存数组下标}
            begin
                AEditor := edSpinEdit ;
            end;
        end;
    end
    else
    begin
        AEditor := edNone ;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.AdvStrGdAggrBinAttriCellsChanged(
  Sender: TObject; R: TRect);
begin
    AggConcPrarChanged := True;
end;

procedure TFrmAggrConceyorHopperAttr.sBtBtnOKClick(Sender: TObject);
var
    WtInstrValid : Boolean;
begin
    if AggConcPrarChanged then
    begin
        if messagebox(getfocus, Pchar('是否保存对参数的修改'), '系统询问', MB_YESNO) = idYES then
        begin
            sProgressBar1.Visible := True;
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsGetNewParaVaue;    //骨料输送参数修改步骤 = 获取新的参数值
            SaveParaModifyOfAggrConc(WtInstrValid);    //保存骨料修改
            //Showmessage('获取新的参数值');
            //sProgressBar1.Position := 20;
            //Showmessage('下发参数到仪表');
            //sProgressBar1.Position := 40;
            //Showmessage('保存进数据库');
            //sProgressBar1.Position := 80;
            //Showmessage('更新内存');
            //sProgressBar1.Position := 100;
            //sProgressBar1.Visible := True;
            //Self.Close;
        end;
    end
    else
    begin
        Self.Close;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.SaveParaModifyOfAggrConc(var WtInstrValid : Boolean);    //保存骨料修改
var
    AddrInInstr : Integer;
    DataCount   : Integer;
    DataValue   : array[1..8] of Integer;
    ExRstSaveDb : Boolean;
begin
    case StepsOfAggrConcParaModify of
        CntStepsOfAggrConcParaMfyIsIdle           :     //空闲
        begin

        end;

        CntStepsOfAggrConcParaMfyIsGetNewParaVaue :     //获取新的参数值
        begin
            GetNewAggrConcParaValue();
            sProgressBar1.Position := 20;
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtAggrModeToIns;    //写骨料生产模式到仪表
            WtInstrValid := False;
        end;

        CntStepsOfAggrConcParaMfyIsWtAggrModeToIns :    //写骨料生产模式到仪表
        begin
            if AggregateConveyorMode = CntAggregateConveyorBelt then    //斜皮带输送
            begin
                //写$0750地址
                WtAWordToInstument1MscommBuf(MscmWaitRecBufPtInUntAggrConcAttr, $0750, $0000);              //写一个字到通讯缓冲区
                WtInstrValid := True;
            end
            else
            begin
                StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns ;    //写骨料参数组1到仪表
                WtInstrValid := False;
            end;
            sProgressBar1.Position := 40;
        end;

        CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns :
        begin
            //写$0741 连续6个数据
            DataValue[1] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidDschDelay].Value;       //$7041 中储仓延迟投料时间 内存数组下标
            DataValue[2] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidSndDschDelay].Value;    //$7042 第二次延迟投料时间 内存数组下标
            DataValue[3] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidDschTm].Value;          //$7043 中储仓投料时间 内存数组下标
            DataValue[4] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidSndDschTm].Value;       //$7044 第二次开门时间 内存数组下标
            DataValue[5] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidLoadContinue].Value;    //$7045 中储仓装料持续时间 内存数组下标
            DataValue[6] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreBeltStopDelay].Value;      //$7046 平皮带延迟停止时间 内存数组下标
            WtWordSToInstucment1MscommBuf(MscmWaitRecBufPtInUntAggrConcAttr, $0741, DataValue, $0006);      //写多个数到通讯缓冲区

            WtInstrValid := True;
            sProgressBar1.Position := 60;
        end;

        CntStepsOfAggrConcParaMfyIsWtParaArray2ToIns :
        begin
            //写0748 连续6个数据
            DataValue[1] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidDschPauseTm].Value;       //7048 两次开门间隔 内存数组下标
            DataValue[2] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfSAND_WT            ].Value;    //7049 砂裹石重量值 内存数组下标
            DataValue[3] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfVibraDelay         ].Value;          //704A 延迟振动时间 内存数组下标
            DataValue[4] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfVibraRunTm         ].Value;       //704B 振动时间 内存数组下标
            DataValue[5] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfVibraSTP           ].Value;    //  704C  振动间隔时间 内存数组下标
            DataValue[6] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfRunMaxTm           ].Value;      //704D 过卷保护时间 内存数组下标
            WtWordSToInstucment1MscommBuf(MscmWaitRecBufPtInUntAggrConcAttr, $0748, DataValue, $0006);      //写多个数到通讯缓冲区

            WtInstrValid := True;
            sProgressBar1.Position := 70;
        end;

        CntStepsOfAggrConcParaMfyIsWtAggrDschIntervalToIns :    //写骨料称卸料阀间隔时间到仪表
        begin
            if AggregateConveyorMode = CntAggregateConveyorElevator then      //提升机
            begin
                //704F  骨料秤多个卸料门间隔时间
                WtAWordToInstument1MscommBuf(MscmWaitRecBufPtInUntAggrConcAttr, $074F, $0000);              //写一个字到通讯缓冲区
                WtInstrValid := True;
            end
            else
            begin
                StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsEnd;
                WtInstrValid := False;
            end;
            sProgressBar1.Position := 80;
        end;

        CntStepsOfAggrConcParaMfyIsEnd                     :    //写骨料输送参数结束
        begin
            
            SaveNewAggrConcParaToDb(ExRstSaveDb);
            if ExRstSaveDb then
            begin
                sProgressBar1.Position := 90;
                WtInstrValid := False;
                SaveNewAggrConcParaToMemory();
                sProgressBar1.Position := 100;
                StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsIdle;
                Self.Close;
            end
            else
            begin
                Showmessage('保存数据库失败！请重新保存');
                sProgressBar1.Visible := False;
            end;

        end;

        else
        begin
            WtInstrValid := False;
        end;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.GetNewAggrConcParaValue();
var
    i : Integer;

    ParaIdInParaInfoArray : Integer;     //参数信息数组 ID 值
    ParaIdInParaValueArray : Integer;    //参数值数组 ID 值

    NewParaValueI : Integer;
begin
    for i:=1 to AdvStrGdAggrBinAttri.RowCount -1 do
    begin
        if trim(AdvStrGdAggrBinAttri.Cells[5, i]) = '' then Continue;

        try
            ParaIdInParaInfoArray := StrToInt(Trim(AdvStrGdAggrBinAttri.Cells[5, i]));
        except
            ParaIdInParaInfoArray := 0;
        end;

        if (ParaIdInParaInfoArray <=0) or (ParaIdInParaInfoArray > CntAggregateConvParaCount ) then
        begin
            Showmessage('无效的参数');
            Continue;
        end;

        case CntAggreConvParaInfo[ParaIdInParaInfoArray].ParaCode of
            {正数型参数}
            CntAggrConvParaIsMidBinDschDelay    ,     //$7041 骨料输送参数是 中储仓延迟投料时间
            CntAggrConvParaIsMidBinSndDschDelay ,     //$7042 骨料输送参数是 中处仓二次延迟投料时间
            CntAggrConvParaIsMidBinDschLong     ,     //$7043 骨料输送参数是 中储仓投料时长
            CntAggrConvParaIsMidBinSndDschLong  ,     //$7044 骨料输送参数是 中储仓二次投料时长
            CntAggrConvParaIsMidBinLoadContinue ,     //$7045 骨料输送参数是 中储仓装料持续时间(骨料输送/提升延迟时间)
            CntAggrConvParaIsLevelBeltStopDelay ,     //$7046 骨料输送参数是 平皮带延迟停止时间
                                                 //$7047
            CntAggrConvParaIsMidBinDschPauseTm  ,     //$7048 骨料输送参数是 两次开门间隔
            CntAggrConvParaIsSAND_WT            ,     //$7049 骨料输送参数是 砂裹石重量值
            CntAggrConvParaIsMidBinVibraDelay   ,    //$704A 骨料输送参数是 延迟振动时间
            CntAggrConvParaIsMidBinVibraRunTm   ,    //$704B 骨料输送参数是 振动时间
            CntAggrConvParaIsMidBinVibraSTP     ,    //$704C 骨料输送参数是 振动间隔时间
            CntAggrConvParaIsHopprRunMaxTm      ,    //$704D 骨料输送参数是 过卷保护时间
            //CntAggrConvParaIs                          //704E  骨料输送参数是
            //CntAggrConvParaIs                          //704F  骨料输送参数是
            CntAggrConvParaIsAggreMode          :    //7050 骨料输送参数是 骨料生产方式
            begin
                ParaIdInParaValueArray := CntAggreConvParaInfo[ParaIdInParaInfoArray].BufIndex;
                try
                    NewParaValueI := StrToInt( Trim(AdvStrGdAggrBinAttri.Cells[3, i]) );
                except
                    NewParaValueI := 0;
                end;
                AggregateConvParaInUntAggrConcAttr[ParaIdInParaValueArray].Value := NewParaValueI;
            end;

        end;
    end;
    //
end;

procedure TFrmAggrConceyorHopperAttr.SaveNewAggrConcParaToDb(var ExDbRslt : boolean);
var
    Qry : TADOquery;
    ParaIdInValueArray : Integer;
    ParaValue          : Integer;
    ParaCodeInDb       : String[20];
    i : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;

    try
        FrmMain.ADOConnection.BeginTrans;
        for i:=1 to CntAggregateConvParaCount do
        begin
            if CntAggreConvParaInfo[i].CodeInDb = '' then Continue ;

            ParaIdInValueArray := CntAggreConvParaInfo[i].BufIndex ;
            ParaValue          := AggregateConvParaInUntAggrConcAttr[ParaIdInValueArray].Value;
            ParaCodeInDb       := CntAggreConvParaInfo[i].CodeInDb;
            Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Text := 'update AggreConvdPara set AggreConvdPara.Value =' + inttostr(ParaValue) + ' ' + 'where AggreConvdPara.Code=' + '''' + ParaCodeInDb + '''';
            Qry.ExecSQL;

        end;
        FrmMain.ADOConnection.CommitTrans;
        ExDbRslt := True;
    except
        FrmMain.ADOConnection.RollbackTrans;
        ExDbRslt := False;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.SaveNewAggrConcParaToMemory();
var
    i : integer;
begin
    for i:=1 to CntAggregateConvParaCount do
    begin
        AggregateConvPara[PMAggrHopperId][i].Value := AggregateConvParaInUntAggrConcAttr[i].Value;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.sBitBtn4Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmAggrConceyorHopperAttr.Timer1Timer(Sender: TObject);
var
    WtInstrValid : Boolean;
begin
    Timer1.Enabled := False;

    case MsCommStateInUntAggrConcAttr of
        CntMsCmStaInUntAggConcAttrIsIdle      :         //空闲
        begin
            if StepsOfAggrConcParaModify <> CntStepsOfAggrConcParaMfyIsIdle then    //骨料输送参数修改步骤
            begin
                SaveParaModifyOfAggrConc(WtInstrValid);    //保存骨料修改
                if WtInstrValid then
                begin
                    MscmTmrInUntAggConcAttr      := 0;
                    MscmSendCmdInUntAggrConcAttr := CntMscmSndCmdInUtAggConAttrIsSaveNewPara;    //发送到仪表的命令是保存新的参数值

                    MsCommStateInUntAggrConcAttr := CntMsCmStaInUntAggConcAttrIsWaitReply;
                end;
            end
            else
            begin

            end;
        end;

        CntMsCmStaInUntAggConcAttrIsWaitReply :         //等待下位机应答
        begin
            MscmTmrInUntAggConcAttr := MscmTmrInUntAggConcAttr + MscmTmrInterValInUntAggConcAttr;

            if Instruction1ReceiveBuf[MscmWaitRecBufPtInUntAggrConcAttr].Active then
            begin
                if (Instruction1ReceiveBuf[MscmWaitRecBufPtInUntAggrConcAttr].ReceiveCmd and $80 ) = $00 then
                begin
                    MsCmRecProgInUtAggConcAttr();
                    MsCommStateInUntAggrConcAttr := CntMsCmStaInUntAggConcAttrIsIdle
                end
                else
                begin
                    case MscmSendCmdInUntAggrConcAttr of
                        CntMscmSndCmdInUtAggConAttrIsSaveNewPara :
                        begin
                            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsIdle ;       //骨料输送参数修改步骤
                            showmessage('写下位机参数失败，请重新发送');
                        end;

                        else
                        begin
                            Showmessage('骨料输送窗体通讯失败!');
                        end;
                    end;

                    MsCommStateInUntAggrConcAttr := CntMsCmStaInUntAggConcAttrIsIdle;    //通讯状态
                end;
                Instruction1ReceiveBuf[MscmWaitRecBufPtInUntAggrConcAttr].Active := False;
            end
            else if MscmTmrInUntAggConcAttr >= 3000 then
            begin
                case MscmSendCmdInUntAggrConcAttr of
                    CntMscmSndCmdInUtAggConAttrIsSaveNewPara :
                    begin
                        StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsIdle ;       //骨料输送参数修改步骤

                        showmessage('写下位机参数失败，请重新发送');
                    end;

                    else
                    begin
                        Showmessage('骨料输送窗体通讯失败!');
                    end;
                end;

                MsCommStateInUntAggrConcAttr := CntMsCmStaInUntAggConcAttrIsIdle;    //通讯状态
            end;
        end;
    end;

    Timer1.Enabled := True;
end;

procedure TFrmAggrConceyorHopperAttr.MsCmRecProgInUtAggConcAttr();
begin
    case MscmSendCmdInUntAggrConcAttr of    //发送命令名称
        CntMscmSndCmdInUtAggConAttrIsSaveNewPara :    //发送到仪表的命令是保存新的参数值
        begin
            MscmRecProgForSaveNewPara();
        end;
    end;

end;

procedure TFrmAggrConceyorHopperAttr.MscmRecProgForSaveNewPara();
begin
    case StepsOfAggrConcParaModify of    //骨料输送参数修改步骤
        CntStepsOfAggrConcParaMfyIsIdle                    :     //空闲
        begin

        end;
        CntStepsOfAggrConcParaMfyIsGetNewParaVaue          :     //获取新的参数值
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtAggrModeToIns;
        end;
        CntStepsOfAggrConcParaMfyIsWtAggrModeToIns         :    //写骨料生产模式到下
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns;
        end;
        CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns       :    //写骨料参数组1到仪表
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtParaArray2ToIns;
        end;
        CntStepsOfAggrConcParaMfyIsWtParaArray2ToIns       :    //写骨料参数组2到仪表
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtAggrDschIntervalToIns;
        end;
        CntStepsOfAggrConcParaMfyIsWtAggrDschIntervalToIns :    //写骨料称卸料阀间隔时间到仪表
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsEnd;
        end;
        CntStepsOfAggrConcParaMfyIsEnd                     :    //写骨料输送参数结束
        begin
            //StepsOfAggrConcParaModify :=
        end;
    end;
end;

end.
