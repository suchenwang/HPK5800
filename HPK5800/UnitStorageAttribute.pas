unit UnitStorageAttribute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sMemo, sComboBox, sEdit, sGroupBox, ComCtrls,
  sPageControl, Grids, AdvObj, BaseGrid, AdvGrid, Buttons, sBitBtn, DB,
  ADODB, ExtCtrls, math, acProgressBar, UnitGlobeVar;

type
  TFrmStorageAttribute = class(TForm)
    sPageControl1: TsPageControl;
    sTbBasicInfo: TsTabSheet;
    sTabSheet2: TsTabSheet;
    GbxStorageBaicInfo: TsGroupBox;
    Label1: TLabel;
    sEtStoargeNmInStorAttri: TsEdit;
    Label2: TLabel;
    sCmbMaterialInfo: TsComboBox;
    Label3: TLabel;
    Label4: TLabel;
    sEtFineInStorAttr: TsEdit;
    Label5: TLabel;
    sEtFreeFallInStorAttr: TsEdit;
    LbStorageMoisture: TLabel;
    sEtStorageMoisture: TsEdit;
    sMemo1: TsMemo;
    LbStorageStocks: TLabel;
    Label8: TLabel;
    sEtStorageStocks: TsEdit;
    LbStorageSafeCap: TLabel;
    sEtStorageSafeCap: TsEdit;
    AdvStrGdStorateAttr: TAdvStringGrid;
    sBtnOk: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sMemo2: TsMemo;
    ADOQuery1: TADOQuery;
    LbUtStorageMoisture: TLabel;
    LbUtStorageMaxCap: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TmrMscommInStorAttri: TTimer;
    sCmbMaterID: TsComboBox;
    sProgressBar1: TsProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TmrMscommInStorAttriTimer(Sender: TObject);
    procedure AdvStrGdStorateAttrGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStrGdStorateAttrGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure AdvStrGdStorateAttrCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure sBtnOkClick(Sender: TObject);
    procedure sEtStoargeNmInStorAttriChange(Sender: TObject);
    procedure sCmbMaterialInfoChange(Sender: TObject);
    procedure sEtStorageMoistureChange(Sender: TObject);
    procedure sEtStorageSafeCapChange(Sender: TObject);
    procedure sMemo1Change(Sender: TObject);
    procedure sEtFineInStorAttrKeyPress(Sender: TObject; var Key: Char);
    procedure sEtFreeFallInStorAttrKeyPress(Sender: TObject;
      var Key: Char);
    procedure sEtStorageSafeCapKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure AdvStrGdStorateAttrComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String);
    procedure AdvStrGdStorateAttrEditCellDone(Sender: TObject; ACol,
      ARow: Integer);
    procedure sBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    CanEditStorageAttr : boolean;

    EditStoraInfo,             //料仓基本信息编辑
    EdtCoarceInStorAttr,       //料仓快计量值
    EdtFreeFallInStorAttr,     //料仓落差值
    EdtVibraModeinStorAttr,    //振动器模式
    EditStoraParaInStorAttr    //料仓参数编辑
      : Boolean;

    CoarseValueI : Integer;    //快计量值
    FreeFallI    : Integer;     //落差值

    NewStorageParaInStorAttr : array[1..CntStorageParaCount] of StorageParaRd;

    procedure MscommReceiveDataInUtStorAttri();                                     //通讯接收数据
    procedure DspStorParaInfoInUtStorAttr(StorVibraMode : Integer);                 //料仓基本信息显示
    procedure DspStorParaValueInUtStorAttr();                                       //料仓参数显示

    function ModifyNewStorInfoInDb(CoarseValue : Double;
      FreeFallF : Double; StorMoisture : double; StorSafetyStocks : double) : Integer;              //保存料仓基本信息

    procedure InitPermissonInFrmStorageAttr();
  public
    { Public declarations }
  end;

var
  FrmStorageAttribute: TFrmStorageAttribute;

var
  MscommWaitPtInUtStorAttr : Integer;    //料仓属性单元中的通讯等待指针

var
  MsCommStateInUtStorAttr : Integer;     //称属性单元中的通讯状态

Const
  CntMsCommStateInUtStorAttrIsIdle      = 0;    //通讯空闲
  CntMsCommStateInUtStorAttrIsWaitReply = 1;    //通讯等待应答

var
  MsCommTmrUtStorAttr : Integer;               //通讯计时器

var
  MsCommCommandNameInUtStorAttr : Integer;        //通讯命令名称

Const
  CntMscCmdNmInUtStorAttrIsIdle       = 0;
  CntMscCmdNmInUtStorAttrIsRdLoadPara = 1;        //读料仓计量参数
  CntMscCmdNmInUtStorAttrIsWtLoarPara = 2;        //写料仓计量参数
  CntMscCmdNmInUrStorAttrIsWtVibrOara = 3;        //写振动器参数

var
  SendDataToInstuctmentInUtStorAttr : Boolean;    //通讯是否在发送

var
  CheckModify : Boolean;

var
  ResultOfSendParaToInstruInStorAttri : Boolean;


implementation

uses  UnitMain, UnitRWInstrument1MscommBuf, UnitRWDb, UnitPersonnelMangement;

{$R *.dfm}

procedure TFrmStorageAttribute.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    i : Integer;
    ParaValue : Integer;
begin
    if ResultOfSendParaToInstruInStorAttri then
    begin
        try
            FrmMain.ADOConnection.BeginTrans;

            for i:=1 to CntStorageParaCount do
            begin
                if CntStorageParaInfo[i].CodeInDb = '' then Continue;
                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ParaValue := StoragePara[PMStorageId][CntStorageParaInfo[i].BufIndex].Value;
                ADOQuery1.SQL.Text := 'update StorageParam set StorageParam.Value=' + inttostr(ParaValue)
                                    + ' ' + 'where StorageId=' + inttostr(PMStorageId)
                                    + ' ' + 'and Code=' + '''' + CntStorageParaInfo[i].CodeInDb + '''';
                ADOQuery1.ExecSQL;
            end;

            FrmMain.ADOConnection.CommitTrans;
            sProgressBar1.Position := 100;
            FrmStorageAttributeCrt := False;
            Action := caFree;
        except
            FrmMain.ADOConnection.RollbackTrans;
            Showmessage('保存参数修改到数据库失败!');
            Action := caNone;
        end;

    end
    else
    begin
        FrmStorageAttributeCrt := False;
        Action := caFree;
    end;
end;

procedure TFrmStorageAttribute.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection ;

    CheckModify := False;

    InitPermissonInFrmStorageAttr();

end;

procedure TFrmStorageAttribute.InitPermissonInFrmStorageAttr();
begin
    if pos('[' + CntPermissonCode[CntPermIsPara] + 'e]', PersonnelPermit) >= 1 then
    begin
        CanEditStorageAttr := True;

        sBtnOk.Enabled := True;

        GbxStorageBaicInfo.Enabled := True;    
    end
    else
    begin
        CanEditStorageAttr := False;

        sBtnOk.Enabled := False;

        GbxStorageBaicInfo.Enabled := False;
    end;
end;

procedure TFrmStorageAttribute.FormShow(Sender: TObject);
var
    i : Integer;
    RdInstruAddr : Integer;
begin
    Self.Caption := StorageInfo[PMStorageId].Name + ' 属性' ;

    {基本信息标签页}
    sEtStoargeNmInStorAttri.Text := StorageInfo[PMStorageId].Name ;

    ADOQuery1.Close ;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from Material order by ID';
    ADOQuery1.Open;
    sCmbMaterialInfo.Items.Clear;
    sCmbMaterID.Items.Clear;
    while not ADOQuery1.Eof do
    begin
        sCmbMaterialInfo.Items.Add(ADOQuery1.FieldByName('MaterName').AsString + ' ' + ADOQuery1.FieldByName('MaterSpecs').AsString);
        sCmbMaterID.Items.Add(ADOQuery1.FieldByName('ID').AsString);
        ADOQuery1.Next;
    end;

    sCmbMaterialInfo.ItemIndex := sCmbMaterialInfo.IndexOf(StorageInfo[PMStorageId].MaterName + ' ' + StorageInfo[PMStorageId].MaterSpec);
    sCmbMaterID.ItemIndex := sCmbMaterialInfo.ItemIndex;
    
    case StorageInfo[PMStorageId].Model of
        CntAggregateStorage :    //骨料仓
        begin
            LbStorageMoisture.Visible := True;
            sEtStorageMoisture.Visible := True;
            sEtStorageMoisture.Text := Format('%.f', [StorageInfo[PMStorageId].Moisture]);
            LbUtStorageMoisture.Caption := '%';

            {粉料仓属性}
            LbStorageStocks.Visible := False;
            sEtStorageStocks.Visible := False;

            LbStorageSafeCap.Visible := False;
            sEtStorageSafeCap.Visible := False;
            LbUtStorageMaxCap.Visible := False;
        end;
        CntPowderStorage :       //粉料仓
        begin
            LbStorageMoisture.Visible := False;
            sEtStorageMoisture.Visible := False;
            LbUtStorageMoisture.Caption := 'kg';
            {粉料仓属性}
            LbStorageStocks.Left := LbStorageMoisture.Left;
            LbStorageStocks.Top := LbStorageMoisture.Top;
            LbStorageStocks.Visible := True;
            sEtStorageStocks.Left := sEtStorageMoisture.Left;
            sEtStorageStocks.Top := sEtStorageMoisture.Top;

            LbStorageSafeCap.Visible   := True;
            sEtStorageSafeCap.Visible  := True;
            LbUtStorageMaxCap.Visible := True;
        end;
        //CntLiquidStorage :       //液体仓
        CntWaterStorage   ,      //水仓
        CntAddtiveStorage :      //外剂仓
        begin
            LbStorageMoisture.Visible := False;
            sEtStorageMoisture.Visible := False;
            LbUtStorageMoisture.Caption := 'kg';
            {粉料仓属性}
            LbStorageStocks.Left := LbStorageMoisture.Left;
            LbStorageStocks.Top := LbStorageMoisture.Top;
            LbStorageStocks.Visible := True;
            sEtStorageStocks.Left := sEtStorageMoisture.Left;
            sEtStorageStocks.Top := sEtStorageMoisture.Top;

            LbStorageSafeCap.Visible   := True;
            sEtStorageSafeCap.Visible  := True;
            LbUtStorageMaxCap.Visible := True;
        end;
    end;

    {计量参数标签页}
    AdvStrGdStorateAttr.Cells[1, 0] := '序号';
    AdvStrGdStorateAttr.Cells[2, 0] := '参数名称';
    AdvStrGdStorateAttr.Cells[3, 0] := '参数值';
    AdvStrGdStorateAttr.Cells[4, 0] := '单位';
    AdvStrGdStorateAttr.Cells[5, 0] := '代号';
    AdvStrGdStorateAttr.ColWidths[5] := 0;

    //料仓参数基本信息显示
    DspStorParaInfoInUtStorAttr(StoragePara[PMStorageId][CntVibraModeIndexInBuf].Value);      //料仓基本信息显示

    DspStorParaValueInUtStorAttr();     //料仓参数显示


    {读料仓的计量参数——快计量值和计量落差}
    RdInstruAddr := $0900 + (StorageInfo[PMStorageId].InstrumentId -1) * $14 + (StorageInfo[PMStorageId].LoadNo -1) * $05;
    ReadWordsFromInstrument1(MscommWaitPtInUtStorAttr, RdInstruAddr, $03 ) ;

    MsCommStateInUtStorAttr := CntMsCommStateInUtStorAttrIsWaitReply ;     //称属性单元中的通讯状态 = 通讯等待应答

    MsCommCommandNameInUtStorAttr := CntMscCmdNmInUtStorAttrIsRdLoadPara;       //通讯命令名称 = 读料仓计量参数
    MsCommTmrUtStorAttr := 0;                                                   //清零通讯计时器
    TmrMscommInStorAttri.Enabled := True;

    EditStoraInfo           := False;    //料仓基本信息编辑
    EdtCoarceInStorAttr     := False;    //料仓快计量值
    EdtFreeFallInStorAttr   := False;    //料仓落差值
    EdtVibraModeinStorAttr  := False;    //振动器模式
    EditStoraParaInStorAttr := False;    //料仓参数编辑

end;

procedure TFrmStorageAttribute.DspStorParaInfoInUtStorAttr(StorVibraMode : Integer);    //料仓基本信息显示
var
    i : Integer;
    RowPt : Integer;
    BeginRow : Integer;
begin
    RowPt := 2;
    BeginRow := 1;
    for i:=1 to CntStorageParaCount do
    begin
        if pos('A', StoragePara[PMStorageId][i].Flags) >= 1 then
        begin
            //是否振动器
            if pos('v', StoragePara[PMStorageId][i].Flags) >= 1 then
            begin
                if not StorageInfo[PMStorageId].Vibrator then Continue;
                if pos('f', StoragePara[PMStorageId][i].Flags) >= 1 then
                begin
                    if StorVibraMode = 0 then Continue;
                end
                else if pos('t', StoragePara[PMStorageId][i].Flags) > 0 then
                begin
                    if StorVibraMode = 1 then Continue;
                end;
            end;

            AdvStrGdStorateAttr.Cells[1, RowPt] := IntToStr(RowPt -1);    //序号
            AdvStrGdStorateAttr.Cells[2, RowPt] := CntStorageParaInfo[i].ParaName;    //参数名称

            AdvStrGdStorateAttr.Cells[4, RowPt] := CntStorageParaInfo[i].Units ;          //单位
            AdvStrGdStorateAttr.Cells[5, RowPt] := Inttostr(CntStorageParaInfo[i].ParaCode) ;       //代号

            RowPt := RowPt +1;
        end;
    end;
    if RowPt = 2 then
    begin
        AdvStrGdStorateAttr.RowCount := 2;
        AdvStrGdStorateAttr.RowHeights[1] := 0;
    end
    else
    begin
        AdvStrGdStorateAttr.RowCount := RowPt;
        AdvStrGdStorateAttr.AddNode(BeginRow, RowPt -BeginRow);
        AdvStrGdStorateAttr.Cells[1, 1] := '计量控制参数';
    end;
end;

procedure TFrmStorageAttribute.DspStorParaValueInUtStorAttr();     //料仓参数显示
var
    i           : Integer;
    ParaCode    : Integer;
    WeigDecimal : Integer;    //称小数位数
begin
    for i:=1 to AdvStrGdStorateAttr.RowCount -1 do
    begin
        if Trim(AdvStrGdStorateAttr.Cells[5 , i]) <> '' then
        begin
            try
                ParaCode := StrToInt(Trim(AdvStrGdStorateAttr.Cells[5 , i])) ;
            except
                ParaCode := 0;
            end;

            case ParaCode of

                CntStorParaIsVibraMode       :       //振动模式
                begin
                    if StoragePara[PMStorageId][CntVibraModeIndexInBuf].Value = 0 then
                        AdvStrGdStorateAttr.Cells[3, i] := '按时间振动'
                    else
                        AdvStrGdStorateAttr.Cells[3, i] := '按流量振动';
                end;

                CntStorParaIsVibraStartDelay :       //振动延迟时间
                begin
                    AdvStrGdStorateAttr.Cells[3, i] := IntToStr(StoragePara[PMStorageId][CntStorParaIsVibraStartDelay].Value);
                end;

                CntStorParaIsVibraRunLong    :       //振动时间
                begin
                    AdvStrGdStorateAttr.Cells[3, i] := IntToStr(StoragePara[PMStorageId][CntVibraRunLongIndexInBuf].Value) ;
                end;

                CntStorParaIsVibraOffLong    :       //振动间隔时间
                begin
                    AdvStrGdStorateAttr.Cells[3, i] := IntToStr(StoragePara[PMStorageId][CntVibraOffLongIndexInBuf].Value);
                end;

                CntStorParaIsVibraRunFlow    :       //振动边际流量
                begin
                    WeigDecimal := WeigherPara[StorageInfo[PMStorageId].InstrumentId][CntWeigherDecimalIndex].Value;
                    AdvStrGdStorateAttr.Cells[3, i] := Format('%.' + inttostr(WeigDecimal) + 'f', [ StoragePara[PMStorageId][CntVibraRunFlowIndexInBuf].Value / power(10, WeigDecimal) ] );
                end;
            end;
        end;
    end;
end;

procedure TFrmStorageAttribute.TmrMscommInStorAttriTimer(Sender: TObject);
var
    WtFstAddr   : Integer;
    WtDataCount : Integer;
    WtDada      : array[0..12] of Integer;
begin
    TmrMscommInStorAttri.Enabled := False;

    case MsCommStateInUtStorAttr of            //料仓属性单元中的通讯状态
        CntMsCommStateInUtStorAttrIsIdle :    //通讯空闲
        begin
            case MsCommCommandNameInUtStorAttr of        //通讯命令名称
                CntMscCmdNmInUtStorAttrIsRdLoadPara :        //读料仓计量参数
                begin

                end;

                CntMscCmdNmInUtStorAttrIsWtLoarPara :        //写料仓计量参数
                begin
                    WtFstAddr := 0;
                    WtDataCount := 0;
                    if  EdtFreeFallInStorAttr       then    //料仓落差值
                    begin
                        WtFstAddr := $0900 + $0014 * (StorageInfo[PMStorageId].InstrumentId -1)
                                   + $0005 * (StorageInfo[PMStorageId].LoadNo -1);

                        WtDada[WtDataCount] := FreeFallI;

                        WtDataCount := WtDataCount +1;
                    end;

                    //精计量值
                    if WtDataCount <= 0 then
                    begin
                        WtFstAddr := $0900 + $0014 * (StorageInfo[PMStorageId].InstrumentId -1)
                                   + $0005 * (StorageInfo[PMStorageId].LoadNo -1) +1;
                    end;
                    WtDada[WtDataCount] := CoarseValueI;
                    WtDataCount := WtDataCount +1;

                    //写振动器模式
                    if (NewStorageParaInStorAttr[CntStorParaIsVibraMode].Value = 0) then    //新的振动器工作模式是：按时间振动
                        WtDada[WtDataCount] := 0
                    else                                                                   //新的振动器工作模式是：按流量振动
                        WtDada[WtDataCount] := NewStorageParaInStorAttr[CntVibraRunFlowIndexInBuf].Value;
                    WtDataCount := WtDataCount +1;

                    WtWordSToInstucment1MscommBuf(MscommWaitPtInUtStorAttr, WtFstAddr, WtDada, WtDataCount);    //写多个数到通讯缓冲区

                    MsCommStateInUtStorAttr := CntMsCommStateInUtStorAttrIsWaitReply;
                    MsCommTmrUtStorAttr := 0;
                    
                end;

                CntMscCmdNmInUrStorAttrIsWtVibrOara :        //写振动器参数
                begin
                    if (NewStorageParaInStorAttr[CntStorParaIsVibraMode].Value = 0) then   //新的振动器工作模式是：按时间振动
                    begin
                        WtFstAddr := $AA0 + $0010 * (StorageInfo[PMStorageId].InstrumentId -1)
                                   + $0004 * (StorageInfo[PMStorageId].LoadNo -1);
                        WtDataCount := 3;
                        WtDada[0] := NewStorageParaInStorAttr[ CntVibraStartDelayIndexInBuf ].Value;    //振动延迟时间
                        WtDada[1] := NewStorageParaInStorAttr[ CntVibraRunLongIndexInBuf    ].Value;    //振动时间
                        WtDada[2] := NewStorageParaInStorAttr[ CntVibraOffLongIndexInBuf    ].Value;    //振动间隔时间

                        WtWordSToInstucment1MscommBuf(MscommWaitPtInUtStorAttr, WtFstAddr, WtDada, WtDataCount);    //写多个数到通讯缓冲区

                        MsCommStateInUtStorAttr := CntMsCommStateInUtStorAttrIsWaitReply;
                        MsCommTmrUtStorAttr := 0;
                    end
                    else
                    begin
                        MsCommCommandNameInUtStorAttr := CntMscCmdNmInUtStorAttrIsIdle;
                        sProgressBar1.Position := 90;
                        Self.Close;
                    end;

                end;
            end;



    //        if SendDataToInstuctmentInUtWeigAttr then
    //        begin
    //            if WeigDschPreChanged then    //下发新的卸料落差值
    //            begin
    //                DschPreF := StrToFloat(Trim(sEtDschPre.Text));
    //                DschPreI := Trunc(RoundTo(DschPreF * Power(10, WeigherPara[PmWeigherId][CntWeigherDecimalIndex].Value), -0)) ;
    //                MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtDschPre ;         //写卸料落差
    //                WtAWordToInstument1MscommBuf(MscommWaitPtInUtWeigAttr, $0790 + (PmWeigherId-1), DschPreI) ;              //写卸料落差值到发送缓冲区
    //                WeigDschPreChanged := False;
    //
    //                MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtDschPre ;    //写称卸料落差值
    //                MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
    //                MsCommTmrUtWeigAttr := 0;
    //            end
    //            else if WeigParaChanged then
    //            begin
    //                if WtWeighParaSteps <= 5 then
    //                begin
    //                    sProgressBar1.Position :=10 + WtWeighParaSteps * 10;
    //                    WtWeigherParaToInstruction();    //写称参数到控制器
    //                    WtWeighParaSteps := WtWeighParaSteps +1;
    //                    MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtWeigPara;   //写称参数
    //                    MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
    //                    MsCommTmrUtWeigAttr := 0;
    //                end
    //                else
    //                begin
    //                    {更新内存中的称参数}
    //                    UpdateWeigherParaInBuf();
    //                    sProgressBar1.Position := 60 +20;
    //
    //                    {保存新的称参数到数据库中}
    //                    SaveNewWeigherParaToDb();
    //                    sProgressBar1.Position := 100;
    //
    //                    Self.Close;
    //                end;
    //            end
    //            else
    //            begin
    //                sProgressBar1.Position := 100;
    //                SendDataToInstuctmentInUtWeigAttr := False;
    //                Self.Close;
    //            end;
    //        end
    //        else
    //        begin
    //            MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsRdLoad ;    //读称传感器信号
    //            MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
    //            MsCommTmrUtWeigAttr := 0;
    //            Instruction1ReadWeigherLoadCellValue(PmWeigherId, MscommWaitPtInUtWeigAttr) ;    //通讯读取传感器信号;
    //        end;


        end;

        CntMsCommStateInUtStorAttrIsWaitReply :    //等待接收
        begin
            if Instruction1ReceiveBuf[MscommWaitPtInUtStorAttr].Active then
            begin
                MscommReceiveDataInUtStorAttri();    //通讯接收数据
                Instruction1ReceiveBuf[MscommWaitPtInUtStorAttr].Active := False;
                MsCommStateInUtStorAttr := CntMsCommStateInUtStorAttrIsIdle ;
            end
            else
            begin
                MsCommTmrUtStorAttr := MsCommTmrUtStorAttr + TmrMscommInStorAttri.Interval;
                if MsCommTmrUtStorAttr > 5000 then
                begin
                    case MsCommCommandNameInUtStorAttr of        //通讯命令名称
                        CntMscCmdNmInUtStorAttrIsWtLoarPara , //写料仓计量参数
                        CntMscCmdNmInUrStorAttrIsWtVibrOara : //写振动器参数
                        begin
                            if messagebox(getfocus, pchar('发送新的参数到控制器失败!'), '系统提示', MB_OK) = idOK then
                            begin
                                MsCommStateInUtStorAttr := CntMsCommStateInUtStorAttrIsIdle ;
                                MsCommCommandNameInUtStorAttr := CntMscCmdNmInUtStorAttrIsIdle;
                                sProgressBar1.Visible := False;
                                ResultOfSendParaToInstruInStorAttri := False;
                            end;
                        end;
                        else
                        begin
                            MsCommStateInUtStorAttr := CntMsCommStateInUtStorAttrIsIdle ;
                        end;
                    end;
                end;
            end;
        end;
    end;

    TmrMscommInStorAttri.Enabled := True;

end;

procedure TFrmStorageAttribute.MscommReceiveDataInUtStorAttri();    //通讯接收数据
var
    RecData : Integer;
    WeightPoint : Integer;
    WeigherId : Integer;
begin
    case MsCommCommandNameInUtStorAttr of            //通讯命令名称

        CntMscCmdNmInUtStorAttrIsRdLoadPara :        //读料仓计量参数
        begin
            WeigherId := StorageInfo[PMStorageId].InstrumentId;
            WeightPoint := WeigherPara[WeigherId][CntWeigherDecimalIndex].Value;

            RecData := Instruction1ReceiveBuf[MscommWaitPtInUtStorAttr].ReceiveByte[0] *$100
                     + Instruction1ReceiveBuf[MscommWaitPtInUtStorAttr].ReceiveByte[1] ;
            if RecData > 32767 then
                sEtFreeFallInStorAttr.Text := Format('%.' + inttostr(WeightPoint) + 'f', [(RecData - 65536) / power(10,WeightPoint)])
            else
                sEtFreeFallInStorAttr.Text := Format('%.' + inttostr(WeightPoint) + 'f', [RecData / power(10,WeightPoint)]) ;

            RecData := Instruction1ReceiveBuf[MscommWaitPtInUtStorAttr].ReceiveByte[2] *$100
                     + Instruction1ReceiveBuf[MscommWaitPtInUtStorAttr].ReceiveByte[3] ;
            if RecData > 32767 then
                sEtFineInStorAttr.Text := Format('%.' + inttostr(WeightPoint) + 'f', [(RecData - 65536) / power(10,WeightPoint)])
            else
               sEtFineInStorAttr.Text := Format('%.' + inttostr(WeightPoint) + 'f', [RecData / power(10,WeightPoint)]) ;
        end;

        CntMscCmdNmInUtStorAttrIsWtLoarPara :        //写料仓计量参数
        begin
            if ( (Instruction1ReceiveBuf[MscommWaitPtInUtStorAttr].ReceiveCmd and $80) = $00 ) then
            begin
                sProgressBar1.Position := 60;

                {更新内存}
                StoragePara[PMStorageId][CntVibraModeIndexInBuf].Value := NewStorageParaInStorAttr[CntVibraModeIndexInBuf].Value;    //振动模式
                if StoragePara[PMStorageId][CntVibraModeIndexInBuf].Value = 1 then
                  StoragePara[PMStorageId][CntVibraRunFlowIndexInBuf].Value := NewStorageParaInStorAttr[CntVibraRunFlowIndexInBuf].Value;    //振动边际流量

                //{更新数据库}——改为关闭窗体时更新数据库

                MsCommCommandNameInUtStorAttr := CntMscCmdNmInUrStorAttrIsWtVibrOara;

                ResultOfSendParaToInstruInStorAttri := True;
            end
            else
            begin
                if messagebox(getfocus, Pchar('向控制器写入参数失败，请点击“确定”按钮，重新写入'), '系统提示', MB_OK) = idOK then
                begin
                    sProgressBar1.Visible := False;

                    ResultOfSendParaToInstruInStorAttri := False;
                end;
            end;
        end;

        CntMscCmdNmInUrStorAttrIsWtVibrOara :        //写振动器参数
        begin
            if ( (Instruction1ReceiveBuf[MscommWaitPtInUtStorAttr].ReceiveCmd and $80) = $00 ) then
            begin
                sProgressBar1.Position := 90;

                {更新内存}
                StoragePara[PMStorageId][CntVibraStartDelayIndexInBuf].Value := NewStorageParaInStorAttr[CntVibraStartDelayIndexInBuf].Value;    //振动延迟时间
                StoragePara[PMStorageId][CntVibraRunLongIndexInBuf].Value := NewStorageParaInStorAttr[CntVibraRunLongIndexInBuf].Value;          //振动时间
                StoragePara[PMStorageId][CntVibraOffLongIndexInBuf].Value := NewStorageParaInStorAttr[CntVibraOffLongIndexInBuf].Value;          //振动间隔时间
                //{更新数据库}——改为关闭窗体时更新数据库

                MsCommCommandNameInUtStorAttr := CntMscCmdNmInUtStorAttrIsIdle;
                ResultOfSendParaToInstruInStorAttri := True;
                Self.Close;
            end
            else
            begin
                if messagebox(getfocus, Pchar('向控制器写入参数失败，请点击“确定”按钮，重新写入'), '系统提示', MB_OK) = idOK then
                begin
                    sProgressBar1.Visible := False;
                    MsCommCommandNameInUtStorAttr := CntMscCmdNmInUtStorAttrIsIdle;
                    
                    //ResultOfSendParaToInstruInStorAttri : = False;
                end;
            end;
        end;
    end;
end;

procedure TFrmStorageAttribute.AdvStrGdStorateAttrGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
    if (ARow = 0) or (ACol= 0) or (ACol= 1) then
    begin
        HAlign := taCenter;
    end;
end;

procedure TFrmStorageAttribute.AdvStrGdStorateAttrGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
var
    ParaType    : Integer;
    WeigDecimal : Integer;
begin
    if (Acol = 3) and (AdvStrGdStorateAttr.Cells[5, ARow] <> '') then
    begin
        try
            ParaType := StrToInt(Trim(AdvStrGdStorateAttr.Cells[5, ARow]));
        except
            ParaType := 0;
        end;

        case ParaType of
            CntStorParaIsVibraMode       :       //振动模式
            begin
                AEditor := edComboList ;
                AdvStrGdStorateAttr.ClearComboString;
                AdvStrGdStorateAttr.AddComboString('按时间振动');
                AdvStrGdStorateAttr.AddComboString('按流量振动');
            end;
            
            CntStorParaIsVibraStartDelay ,       //振动延迟时间
            CntStorParaIsVibraRunLong    ,       //振动时间
            CntStorParaIsVibraOffLong    :       //振动间隔时间
            begin
                AEditor := edSpinEdit;
            end;

            CntStorParaIsVibraRunFlow    :       //振动边际流量
            begin
                AEditor := edFloatSpinEdit;
                WeigDecimal := WeigherPara[StorageInfo[PMStorageId].InstrumentId][CntWeigherDecimalIndex].Value;
                AdvStrGdStorateAttr.SpinEdit.IncrementFloat := 1 / Power(10, WeigDecimal);
                AdvStrGdStorateAttr.FloatFormat := '%.' + inttostr(WeigDecimal) + 'f';
                
            end;
        end;
    end
    else
    begin
        AEditor := edNormal;
    end;
end;

procedure TFrmStorageAttribute.AdvStrGdStorateAttrCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
    if CanEditStorageAttr then
    begin
        if (Acol = 3) and (AdvStrGdStorateAttr.Cells[5, ARow] <> '') then
            CanEdit := True
        else
            CanEdit := False;
    end
    else
    begin
        CanEdit := False;
    end;
end;

procedure TFrmStorageAttribute.sBtnOkClick(Sender: TObject);
var
    ExResult : Integer;

    CoarseValueF : Double;
    FreeFallF : Double;

    StorMoisture : Double;

    SafetyStock : Double;

    WeighDecimal : Integer;

    WtInstrumentDataCount : Integer;

    paracd : Integer;
    i      : Integer;
    ValueI : Integer;
    ValueF : Double;
begin
    if EditStoraInfo or EditStoraParaInStorAttr then
    begin
        sProgressBar1.Visible := True;

        WeighDecimal := WeigherPara[StorageInfo[PMStorageId].InstrumentId][CntWeigherDecimalIndex].Value ;

        if EditStoraInfo then;    //料仓基本信息编辑
        begin

            {获取精计量值}
            try
                CoarseValueF := StrToFloat(Trim(sEtFineInStorAttr.Text));
                CoarseValueF := RoundTo(CoarseValueF, -WeighDecimal);
            except
                CoarseValueF := 0.0;
            end;
            CoarseValueI := Trunc(RoundTo(CoarseValueF * Power(10,WeighDecimal), -0));
            {获取落差值}
            try
                FreeFallF := StrToFloat(Trim(sEtFreeFallInStorAttr.Text));
                FreeFallF := RoundTo(FreeFallF, -WeighDecimal);
            except
                FreeFallF := 0.0;
            end;
            FreeFallI := Trunc(RoundTo(FreeFallF *Power(10,WeighDecimal), -0));
            {含水率}
            try
                StorMoisture := StrToFloat(Trim(sEtStorageMoisture.Text));
                StorMoisture := RoundTo(StorMoisture, -1);
            except
                StorMoisture := 0.0;
            end;
            {安全库存}
            try
                SafetyStock := StrToFloat(Trim(sEtStorageSafeCap.Text));
                SafetyStock := RoundTo( SafetyStock, -3);
            except
                SafetyStock := 0.0;
            end;

            {更新数据库}
            ExResult := ModifyNewStorInfoInDb(CoarseValueF, FreeFallF, StorMoisture
                    , SafetyStock);    //保存料仓基本信息
            if ExResult = 0 then
            begin
                StorageInfo[PMStorageId].Name := Trim(sEtStoargeNmInStorAttri.Text);    //更新内存变量值
                StorageInfo[PMStorageId].MaterId := StrToInt(Trim(sCmbMaterID.Text));   //更新内存变量值——材料编号
                LoadMaterialInfoFromDbToStorage(PMStorageId);                           //更新内存变量——材料名称、材料规格
                 //更新内存变量——精计量值
                 //更新内存变量——落差值
                StorageInfo[PMStorageId].Moisture := StorMoisture;                      //更新内存变量——含水率
                 //更新内存变量——安全库存
                 //更新内存变量——料仓备注

                FrmMain.LbMaterialNameInFrmMain[PMStorageId].Caption := StorageInfo[PMStorageId].MaterName;    //更新主界面料仓信息——原料名称
                FrmMain.LbMaterialSpecInFrmMain[PMStorageId].Caption := StorageInfo[PMStorageId].MaterSpec;    //更新主界面料仓信息——原料规格
                if StorageInfo[PMStorageId].Model = CntAggregateStorage then    //骨料仓
                begin
                    FrmMain.StorageWaterParaLab[PMStorageId].Caption := Format('%.1f', [StorageInfo[PMStorageId].Moisture]) ;    //原料含水率
                end;


                EditStoraInfo := False;
            end;
        end;

        if ExResult = 0 then
        begin
            sProgressBar1.Position := 30;

            for i:=1 to AdvStrGdStorateAttr.RowCount -1 do
            begin
                //NewStorageParaInStorAttr
                //NewStorageParaInStorAttr : array[1..CntStorageParaCount] of StorageParaRd;
                if trim(AdvStrGdStorateAttr.Cells[5, i]) <> '' then
                begin
                    paracd := StrToInt(Trim(AdvStrGdStorateAttr.Cells[5, i]));

                    case ParaCd of
                        CntStorParaIsVibraMode       :       //振动模式
                        begin
                            if Trim(AdvStrGdStorateAttr.Cells[3, i]) = '按时间振动' then
                                NewStorageParaInStorAttr[CntVibraModeIndexInBuf].Value := 0
                            else
                                NewStorageParaInStorAttr[CntVibraModeIndexInBuf].Value := 1;
                        end;

                        CntStorParaIsVibraStartDelay :       //振动延迟时间
                        begin
                            try
                                ValueI := StrToInt(AdvStrGdStorateAttr.Cells[3, i]);
                            except
                                ValueI := 0;
                            end;
                            NewStorageParaInStorAttr[CntVibraStartDelayIndexInBuf].Value := ValueI;
                        end;

                        CntStorParaIsVibraRunLong    :       //振动时间
                        begin
                            try
                                ValueI := StrToInt(AdvStrGdStorateAttr.Cells[3, i]);
                            except
                                ValueI := 0;
                            end;
                            NewStorageParaInStorAttr[CntVibraRunLongIndexInBuf].Value := ValueI;
                        end;

                        CntStorParaIsVibraOffLong    :       //振动间隔时间
                        begin
                            try
                                ValueI := StrToInt(AdvStrGdStorateAttr.Cells[3, i]);
                            except
                                ValueI := 0;
                            end;
                            NewStorageParaInStorAttr[CntVibraOffLongIndexInBuf].Value := ValueI;
                        end;

                        CntStorParaIsVibraRunFlow    :       //振动边际流量
                        begin
                            try
                                ValueF := StrToFloat(AdvStrGdStorateAttr.Cells[3, i]);
                                ValueI := Trunc(RoundTo(ValueF *Power(10, WeighDecimal), -0));
                            except
                                ValueI := 0;
                            end;
                            NewStorageParaInStorAttr[CntVibraRunFlowIndexInBuf].Value := ValueI;
                        end;
                    end;
                end;
            end;

            MsCommCommandNameInUtStorAttr := CntMscCmdNmInUtStorAttrIsWtLoarPara;        //通讯命令名称 = 写料仓计量参数
            ResultOfSendParaToInstruInStorAttri := False;
        end;
    end
    else
    begin
        Self.close;
    end;
end;

function TFrmStorageAttribute.ModifyNewStorInfoInDb(CoarseValue : Double;
  FreeFallF : Double; StorMoisture : double; StorSafetyStocks : double) : Integer;    //保存料仓基本信息
//Result = 0：保存成功     =1：保存失败

begin

    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'update Storage set'
                        + ' ' + 'Name=' + '''' + Trim(sEtStoargeNmInStorAttri.Text) + ''''    //料仓名称
                        + ',' + 'Mater=' + Trim(sCmbMaterID.Text)                             //原料编号
                        + ',' + 'Coarse=' + FloatToStr(CoarseValue)                           //精计量值
                        + ',' + 'Fall=' + FloatToStr(FreeFallF)                               //落差值
                        + ',' + 'Moisture=' + FloatToStr(StorMoisture)                        //含水率
                        + ',' + 'SafeCap=' + FloatToStr(StorSafetyStocks)                     //安全库存
                        + ',' + 'Notes=' + '''' + Trim(sMemo1.Text) + ''''                    //料仓备注
                        + ' ' + 'where ID=' + IntToStr(PMStorageId);
        ADOQuery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
        Result := 0;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Result := 1;
    end;
end;

procedure TFrmStorageAttribute.sEtStoargeNmInStorAttriChange(
  Sender: TObject);
begin
    if CheckModify then EditStoraInfo := True;    //料仓基本信息编辑
end;

procedure TFrmStorageAttribute.sCmbMaterialInfoChange(Sender: TObject);
begin
    if CheckModify then
    begin
        EditStoraInfo := True;    //料仓基本信息编辑
        sCmbMaterID.ItemIndex := sCmbMaterialInfo.ItemIndex;
    end;
end;

procedure TFrmStorageAttribute.sEtStorageMoistureChange(Sender: TObject);
begin
    if CheckModify then EditStoraInfo := True;    //料仓基本信息编辑
end;

procedure TFrmStorageAttribute.sEtStorageSafeCapChange(Sender: TObject);
begin
    if CheckModify then EditStoraInfo := True;    //料仓基本信息编辑
end;

procedure TFrmStorageAttribute.sMemo1Change(Sender: TObject);
begin
    if CheckModify then EditStoraInfo := True;    //料仓基本信息编辑
end;

procedure TFrmStorageAttribute.sEtFineInStorAttrKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (key in ['0'..'9','.',#8]) then
        Key := #0
    else
    begin
        EditStoraInfo       := True;   //料仓基本信息编辑
        EdtCoarceInStorAttr := True;   //料仓快计量值
    end;

end;

procedure TFrmStorageAttribute.sEtFreeFallInStorAttrKeyPress(
  Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9','.',#8]) then
        Key := #0
    else
    begin
        EditStoraInfo         := True;    //料仓基本信息编辑
        EdtFreeFallInStorAttr := True;    //料仓落差值
    end;
end;

procedure TFrmStorageAttribute.sEtStorageSafeCapKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (key in ['0'..'9','.',#8]) then Key := #0;
end;

procedure TFrmStorageAttribute.FormActivate(Sender: TObject);
begin
    CheckModify := True;
end;

procedure TFrmStorageAttribute.AdvStrGdStorateAttrComboChange(
  Sender: TObject; ACol, ARow, AItemIndex: Integer; ASelection: String);
var
    ParaCd : Integer;
begin
    if (ACol = 3) and (AdvStrGdStorateAttr.Cells[5, ARow] <> '') then
    begin
        ParaCd := StrToInt(Trim(AdvStrGdStorateAttr.Cells[5, ARow]));
        case ParaCd of
            CntStorParaIsVibraMode :    //振动模式
            begin
                EdtVibraModeinStorAttr := True;    //振动器模式
                EditStoraParaInStorAttr := True;   //料仓参数编辑
                if AdvStrGdStorateAttr.Combobox.Text = '按时间振动' then
                    DspStorParaInfoInUtStorAttr(0)       //料仓基本信息显示——振动器按时间振动
                else
                    DspStorParaInfoInUtStorAttr(1);      //料仓基本信息显示——振动器按流量振动

                DspStorParaValueInUtStorAttr();     //料仓参数显示
            end;
        end;
    end;
end;

procedure TFrmStorageAttribute.AdvStrGdStorateAttrEditCellDone(
  Sender: TObject; ACol, ARow: Integer);
begin
    if (ACol = 3) and (AdvStrGdStorateAttr.Cells[5, ARow] <> '') then
    begin
        EditStoraParaInStorAttr := True;   //料仓参数编辑
    end;
end;

procedure TFrmStorageAttribute.sBitBtn2Click(Sender: TObject);
begin
    Self.Close;
end;

end.
