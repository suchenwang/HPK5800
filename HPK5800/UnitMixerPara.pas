unit UnitMixerPara;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, acProgressBar, StdCtrls, Buttons, sBitBtn, Grids,
  AdvObj, BaseGrid, AdvGrid, sGroupBox, sEdit, sPageControl, sMemo,
  sCheckBox, math, UnitGlobeVar, ExtCtrls, DB, ADODB;

type
  TFrmMixPara = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    AdvStrGdMixerPara: TAdvStringGrid;
    Memo2: TMemo;
    BrnReadDb: TsBitBtn;
    BtnRestore: TsBitBtn;
    sBitBtn4: TsBitBtn;
    sBtBtnOK: TsBitBtn;
    GBxMixerBasicInfo: TsGroupBox;
    sProgressBar1: TsProgressBar;
    sEtEquipName: TsEdit;
    Label1: TLabel;
    Label2: TLabel;
    sEdit1: TsEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GbxMixerDschSetting: TsGroupBox;
    sCkBFstDschDisable: TsCheckBox;
    sCkBMixerDschLinkToPowderLd: TsCheckBox;
    GbxRemark: TsGroupBox;
    sMemo1: TsMemo;
    Timer1: TTimer;
    ADOQuery1: TADOQuery;
    EtMixCap: TsEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sCkBFstDschDisableClick(Sender: TObject);
    procedure sCkBMixerDschLinkToPowderLdClick(Sender: TObject);
    procedure AdvStrGdMixerParaCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure AdvStrGdMixerParaGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStrGdMixerParaGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure AdvStrGdMixerParaCellsChanged(Sender: TObject; R: TRect);
    procedure sBtBtnOKClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EtMixCapKeyPress(Sender: TObject; var Key: Char);
    procedure EtMixCapChange(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
  private
    { Private declarations }

    CanEditMixPara : Boolean;

    procedure DspMixerParaInfo();
    procedure GetNewMixerParaValue();
    procedure WtNewMixerParaToInstruction();        //写新的搅拌机参数值到仪表中
    Function SaveNewMixerParaToDd() : Integer;      //保存新的搅拌机参数到数据库中

    procedure InitPermissonInFrmMixerAttr();
    { Public declarations }
  end;

var
  FrmMixPara: TFrmMixPara;

  MixerBasicInfoChanged : boolean;       //搅拌机基本信息变化
  MixerParaGrdEdt       : Boolean;       //搅拌机参数表格 编辑

  FrmMixParaIsIni : Boolean;         //窗体初始化

var
  FstMixerDschDsaEdt : Boolean;      //首盘禁止卸料 编辑

var
  MixerParaInUtMixerPara : array[1..CntMixerParaCount] of MixerParaRd;

var
  WtNewMixerParaToInstrPt : Integer;     //写参数到仪表指针
Const
  WtNewMixerParaToInstrPtMax = 4;        //写参数到仪表指针的允许最大值
Const
  WtNwMxrPaToInstrPtIsIdle       = 0 ;     //写参数到仪表指针 是 空闲
  WtNwMxrPaToInstrPtIsMixLng     = 1 ;     //写参数到仪表指针 是 写搅拌时长
  WtNwMxrPaToInstrPtIsDschPa     = 2 ;     //写参数到仪表指针 是 写卸料参数
  WtNwMxrPaToInstrPtIsMxStrTmr   = 3 ;     //写参数到仪表指针 是 搅拌计时起始时刻
  WtNwMxrPaToInstrPtIsFstDschDis = 4 ;     //写参数到仪表指针 是 写首盘禁止卸料状态

var
  MsCommStateInUtMixerPara : integer;    //搅拌机参数单元中的通讯状态
Const
  MsCmSatInMxrPaIsIdle = 1 ;            //空闲
  MsCmSatImMxrPaIsWtPaToInst = 2 ;      //通讯状态是写参数到仪表
var
  MsCommWtInstruInUtMixerPara : Boolean;    //通讯写仪表状态
var
  TmrOfMsCommToInsInUtMixerPara : Integer;    //写仪表通讯计时器
var
  MsccomWaitRecBufPtInUtMsrPa : Integer;      //通讯等待接收 Buf 指针
  
implementation

uses UnitRWInstrument1MscommBuf, UnitMain, UnitPersonnelMangement;

{$R *.dfm}

procedure TFrmMixPara.FormCreate(Sender: TObject);
var
    i : Integer;
begin
    FrmMixParaIsIni := True;
    MsCommWtInstruInUtMixerPara := False;

    ADOQuery1.Connection := FrmMain.ADOConnection;

    {搅拌机参数表格}
    //AdvStrGdMixerPara
    AdvStrGdMixerPara.Cells[1, 0] := '序号';
    AdvStrGdMixerPara.Cells[2, 0] := '参数名称';
    AdvStrGdMixerPara.Cells[3, 0] := '参数值';
    AdvStrGdMixerPara.Cells[4, 0] := '单位';
    AdvStrGdMixerPara.Cells[5, 0] := 'IdInMixerParaInfoArray';    //搅拌机参数信息数组Id值
    //AdvStrGdMixerPara.ColWidths[5] := 0;

    {搅拌机参数信息}
    DspMixerParaInfo();

    MixerBasicInfoChanged := False ;
    MixerParaGrdEdt    := False ;      //搅拌机参数表格 编辑

    for i:=1 to CntMixerParaCount do
    begin
         MixerParaInUtMixerPara[i] := MixerPara[i];
    end;

    //权限初始化
    InitPermissonInFrmMixerAttr();
end;

procedure TFrmMixPara.InitPermissonInFrmMixerAttr();
begin
    if pos('[' + CntPermissonCode[CntPermIsPara] + 'e]', PersonnelPermit) >= 1 then
    begin
        CanEditMixPara := True;

        BrnReadDb.Enabled := True;
        BtnRestore.Enabled := True;
        sBtBtnOK.Enabled := True;

        GBxMixerBasicInfo.Enabled := True;
        GbxMixerDschSetting.Enabled := True;
        GbxRemark.Enabled := True;
    end
    else
    begin
        CanEditMixPara := False;

        BrnReadDb.Enabled := False;
        BtnRestore.Enabled := False;
        sBtBtnOK.Enabled := False;

        GBxMixerBasicInfo.Enabled := False;
        GbxMixerDschSetting.Enabled := False;
        GbxRemark.Enabled := False;
    end;
end;

procedure TFrmMixPara.DspMixerParaInfo();
var
    i, k : Integer;
    ParaFlags : string;
    BeginRow : Integer;
    WtRowOffset : Integer;
    ParaIDInParaValueArray : Integer;    //参数 在 参数值数组中 的ID
    //ParaIDInParaInfoArray : Integer;    //参数 在 参数信息数组中 的ID
begin
    BeginRow := 1;
    WtRowOffset := 1;
    for i:=1 to CntMixerParaCount do    //按参数信息组顺序显示
    begin
        ParaIDInParaValueArray := CntMixerParaInfo[i].IndexInParaArray;
        ParaFlags := MixerPara[ParaIDInParaValueArray].Flags;

        if pos('s', ParaFlags) >=1 then Continue;    //多次搅拌参数

        if (pos('q',ParaFlags) >=1) and (MixerInfo.DschMode <> CntMixerDischOne) then Continue;

        if (pos('y',ParaFlags) >=1) and (MixerInfo.DschMode <> CntMixerDischTwo) then Continue;

        AdvStrGdMixerPara.Cells[1, BeginRow + WtRowOffset] := IntToStr(WtRowOffset);                     //序号
        AdvStrGdMixerPara.Cells[2, BeginRow + WtRowOffset] := MixerPara[ParaIDInParaValueArray].Name;    //参数名称

        AdvStrGdMixerPara.Cells[3, BeginRow + WtRowOffset] := Format('%.' + inttostr(MixerPara[ParaIDInParaValueArray].Decimal) + 'f',
          [ MixerPara[ParaIDInParaValueArray].Value / Power(10, MixerPara[ParaIDInParaValueArray].Decimal) ] );
        AdvStrGdMixerPara.Cells[4, BeginRow + WtRowOffset] := MixerPara[ParaIDInParaValueArray].Unt;
        AdvStrGdMixerPara.Cells[5, BeginRow + WtRowOffset] := inttostr(i);

        WtRowOffset := WtRowOffset +1;
    end;

    AdvStrGdMixerPara.RowCount := BeginRow + WtRowOffset;
    AdvStrGdMixerPara.AddNode(BeginRow, WtRowOffset);
    AdvStrGdMixerPara.Cells[1, BeginRow] := '控制参数';
    AdvStrGdMixerPara.Cells[2, BeginRow] := '共 ' + inttostr(WtRowOffset -1) + ' 个参数';
end;

procedure TFrmMixPara.FormShow(Sender: TObject);
begin
    {搅拌机基本信息}
    EtMixCap.Text := Format('%.3f', [MixerInfo.MaxCap]);

    if MixerInfo.FstDschEn then    //首盘禁止卸料
        sCkBFstDschDisable.Checked := False
    else
        sCkBFstDschDisable.Checked := True;

    if MixerInfo.MixerDschLinkToPowderLoad then
        sCkBMixerDschLinkToPowderLd.Checked := True
    else
        sCkBMixerDschLinkToPowderLd.Checked := false;

    {搅拌机参数}


    FrmMixParaIsIni := False;
end;

procedure TFrmMixPara.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmMixParaCrt := False;
    Action := caFree;
end;


procedure TFrmMixPara.sCkBFstDschDisableClick(Sender: TObject);
begin
    if not FrmMixParaIsIni then
        MixerBasicInfoChanged := True;
end;

procedure TFrmMixPara.sCkBMixerDschLinkToPowderLdClick(Sender: TObject);
begin
    if not FrmMixParaIsIni then
        MixerBasicInfoChanged := True;
end;

procedure TFrmMixPara.AdvStrGdMixerParaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
    if CanEditMixPara then
    begin
        if (ARow <> 0)    //0行
          and (AdvStrGdMixerPara.Cells[5, ARow] <> '' )
          and (ACol = 3) then
        begin
            CanEdit := True;
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

procedure TFrmMixPara.AdvStrGdMixerParaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    //
end;

procedure TFrmMixPara.AdvStrGdMixerParaGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
var
    ParaCode : Integer;
begin
    if ( ARow >0 ) and ( Trim(AdvStrGdMixerPara.Cells[5, ARow]) <> '' ) then
    begin
        try
            ParaCode := StrToInt( Trim(AdvStrGdMixerPara.Cells[5, ARow]) );
        except
            ParaCode := 0;
        end;
        if ParaCode >0 then ParaCode := CntMixerParaInfo[ParaCode].ParaCode;

        Case ParaCode of
            CntMixerParaCodeIsMixingSetLng       ,          //0702H 搅拌时间
            CntMixerParaCodeIsSndMixingSetLng    ,          //0703参数 二次搅拌时间
            CntMixerParaCodeIs3rdMixingSetLng    ,          //0704参数 三次搅拌时间
            CntMixerParaCodeIs4thMixingSetLng    ,          //0705参数 四次搅拌时间
            CntMixerParaCodeIs5thMixingSetLng    :          //0706参数 五次搅拌时间
            begin
                AEditor := edSpinEdit ;
                AdvStrGdMixerPara.SpinEdit.MinValue := 0;
                AdvStrGdMixerPara.SpinEdit.MaxValue := 900;
            end;

            CntMixerParaCodeIsDschSetLng         :          //0707参数 全开门卸砼时间
            begin
                AEditor := edSpinEdit ;
                AdvStrGdMixerPara.SpinEdit.MinValue := 5;
                AdvStrGdMixerPara.SpinEdit.MaxValue := 900;
            end;

            CntMixerParaCodeIsInchDschCount      :          //0708参数 点动开门次数
            begin
                AEditor := edSpinEdit ;
                AdvStrGdMixerPara.SpinEdit.MinValue := 0;
                AdvStrGdMixerPara.SpinEdit.MaxValue := 20;
            end;

            CntMixerParaCodeIsInchOpenLng        ,          //0709参数 点动开门时间
            CntMixerParaCodeIsInchCloseLng       :          //070A参数 点动关门时间
            begin
                AEditor := edSpinEdit ;
                AdvStrGdMixerPara.SpinEdit.MinValue := 0;
                AdvStrGdMixerPara.SpinEdit.MaxValue := 60;
            end;

            CntMixerParaCodeIsHalfDschLng        :          //070B参数 半开门持续时间
            begin
                AEditor := edSpinEdit ;
                AdvStrGdMixerPara.SpinEdit.MinValue := 0;
                AdvStrGdMixerPara.SpinEdit.MaxValue := 60;
            end;

            CntMixerParaCodeIsHalfDschCkeckDelay :          //070C参数 延迟检查半开门时间
            begin
                AEditor := edFloatSpinEdit;
                AdvStrGdMixerPara.SpinEdit.Precision := 1;
                AdvStrGdMixerPara.SpinEdit.MinFloatValue := 0;
                AdvStrGdMixerPara.SpinEdit.MaxFloatValue := 9.9;
            end;

            CntMixerParaCodeIsMixingTmrStart     :          //070D参数 搅拌计时起始时刻
            begin
                AEditor := edSpinEdit ;
                AdvStrGdMixerPara.SpinEdit.MaxValue := 2;
                AdvStrGdMixerPara.SpinEdit.MinValue := 0;
            end;
        end;
    end
    else
    begin
        AEditor := edNone ;
    end;
end;

procedure TFrmMixPara.AdvStrGdMixerParaCellsChanged(Sender: TObject;
  R: TRect);
begin
    MixerParaGrdEdt := True;
end;

procedure TFrmMixPara.sBtBtnOKClick(Sender: TObject);
begin
    sProgressBar1.Visible := True;

    {获取新的参数值}
    if MixerParaGrdEdt then
        GetNewMixerParaValue();
    sProgressBar1.Position := 10;

    {写下位机参数}
    WtNewMixerParaToInstrPt := 1;
    WtNewMixerParaToInstruction();
    MsCommWtInstruInUtMixerPara := True;

    //MixerBasicInfoChanged : boolean;    //搅拌机基本信息变化
    //MixerParaGrdEdt       : Boolean;       //搅拌机参数表格 编辑
end;

procedure TFrmMixPara.GetNewMixerParaValue();
var
    i, k : Integer;
    ParaCode : Integer;
    ParaValueF : Double;
    ParaValueI : Integer;
begin
    for i:=1 to AdvStrGdMixerPara.RowCount -1 do
    begin
        if Trim(AdvStrGdMixerPara.Cells[5, i]) = '' then Continue;

        try
            ParaCode := StrToInt( Trim(AdvStrGdMixerPara.Cells[5, i]) );
        except
            ParaCode := 0;
        end;

        if Paracode > 0 then
          ParaCode := CntMixerParaInfo[ParaCode].ParaCode;

        case Paracode of
            CntMixerParaCodeIsMixingSetLng       ,          //0702H 搅拌时间
            CntMixerParaCodeIsSndMixingSetLng    ,          //0703参数 二次搅拌时间
            CntMixerParaCodeIs3rdMixingSetLng    ,          //0704参数 三次搅拌时间
            CntMixerParaCodeIs4thMixingSetLng    ,          //0705参数 四次搅拌时间
            CntMixerParaCodeIs5thMixingSetLng    :          //0706参数 五次搅拌时间
            begin
                try
                    ParaValueI := StrToInt( Trim(AdvStrGdMixerPara.Cells[3, i]) );
                except
                    ParaValueI := 0;
                end;

                for k:=1 to CntMixerParaCount do
                begin
                    if CntMixerParaInfo[k].ParaCode = ParaCode then break;
                end;
                if k > CntMixerParaCount then
                begin
                    Showmessage('参数代号无效!');
                end
                else
                begin
                    MixerParaInUtMixerPara[CntMixerParaInfo[k].IndexInParaArray].Value := ParaValueI;
                end;
            end;

            CntMixerParaCodeIsDschSetLng         :          //0707参数 全开门卸砼时间
            begin
                try
                    ParaValueI := StrToInt( Trim(AdvStrGdMixerPara.Cells[3, i]) );
                except
                    ParaValueI := 0;
                end;

                MixerParaInUtMixerPara[CntIndexOfDschSetLngInArray].Value := ParaValueI;
            end;

            CntMixerParaCodeIsInchDschCount      :          //0708参数 点动开门次数
            begin
                try
                    ParaValueI := StrToInt( Trim(AdvStrGdMixerPara.Cells[3, i]) );
                except
                    ParaValueI := 0;
                end;

                MixerParaInUtMixerPara[CntIndexOfInchDschCountInArray].Value := ParaValueI;
            end;
            
            CntMixerParaCodeIsInchOpenLng        ,          //0709参数 点动开门时间
            CntMixerParaCodeIsInchCloseLng       :          //070A参数 点动关门时间
            begin
                try
                    ParaValueI := StrToInt( Trim(AdvStrGdMixerPara.Cells[3, i]) );
                except
                    ParaValueI := 0;
                end;

                for k:=1 to CntMixerParaCount do
                begin
                    if CntMixerParaInfo[k].ParaCode = ParaCode then break;
                end;
                if k > CntMixerParaCount then
                begin
                    Showmessage('参数代号无效!');
                end
                else
                begin
                    MixerParaInUtMixerPara[CntMixerParaInfo[k].IndexInParaArray].Value := ParaValueI;
                end;
            end;

            CntMixerParaCodeIsHalfDschLng        :          //070B参数 半开门持续时间
            begin
                try
                    ParaValueI := StrToInt( Trim(AdvStrGdMixerPara.Cells[3, i]) );
                except
                    ParaValueI := 0;
                end;

                MixerParaInUtMixerPara[CntIndexOfHalfDschLngInArray].Value := ParaValueI;
            end;

            CntMixerParaCodeIsHalfDschCkeckDelay :          //070C参数 延迟检查半开门时间
            begin
                try
                    ParaValueF := StrToFloat( Trim(AdvStrGdMixerPara.Cells[3, i]) );
                    ParaValueF := RoundTo( ParaValueF * 10, -0 );
                    ParaValueI := Trunc(ParaValueF);
                except
                    ParaValueI := 0;
                end;

                MixerParaInUtMixerPara[CntIndexOfHalfDschCkeckDelayInArray].Value := ParaValueI;
            end;

            CntMixerParaCodeIsMixingTmrStart     :          //070D参数 搅拌计时起始时刻
            begin
                try
                    ParaValueI := StrToInt( Trim(AdvStrGdMixerPara.Cells[3, i]) );
                except
                    ParaValueI := 0;
                end;

                MixerParaInUtMixerPara[CntIndexOfMixingTmrStartInArray].Value := ParaValueI;
            end;
        end;
    end;
end;

procedure TFrmMixPara.WtNewMixerParaToInstruction();    //写新的搅拌机参数值到仪表中
var
    WtData : array of Integer;
begin
    case WtNewMixerParaToInstrPt of
        WtNwMxrPaToInstrPtIsIdle       :     //写参数到仪表指针 是 空闲
        begin

        end;

        WtNwMxrPaToInstrPtIsMixLng     :     //写参数到仪表指针 是 写搅拌时长
        begin
            if MixerParaGrdEdt then
            begin
                SetLength(WtData, 2);
                WtData[0] := MixerParaInUtMixerPara[CntIndexOfMixingSetLngInArray   ].Value;
                WtData[1] := MixerParaInUtMixerPara[CntIndexOfSndMixingSetLngInArray].Value;
                WtWordSToInstucment1MscommBuf( MsccomWaitRecBufPtInUtMsrPa, $0702, WtData, $0002 );

                MsCommStateInUtMixerPara := MsCmSatImMxrPaIsWtPaToInst;    //搅拌机参数单元中的通讯状态 是 写参数到仪表
                TmrOfMsCommToInsInUtMixerPara := 0;    //写仪表通讯计时器
            end
            else
            begin
                WtNewMixerParaToInstrPt  := WtNewMixerParaToInstrPt +1;
                MsCommStateInUtMixerPara :=  MsCmSatInMxrPaIsIdle;    //搅拌机参数单元中的通讯状态 = 空闲
            end;
            sProgressBar1.Position := 20; 
        end;

        WtNwMxrPaToInstrPtIsDschPa     :     //写参数到仪表指针 是 写卸料参数
        begin
            if MixerParaGrdEdt then
            begin
                SetLength(WtData, 6);
                WtData[0] := MixerParaInUtMixerPara[CntIndexOfDschSetLngInArray       ].Value;    //0707 全开门卸砼时间
                WtData[1] := MixerParaInUtMixerPara[CntIndexOfInchDschCountInArray     ].Value;   //0708 点动开门次数
                WtData[2] := MixerParaInUtMixerPara[CntIndexOfInchOpenLngInArray       ].Value;   //0709 点动开门时间
                WtData[3] := MixerParaInUtMixerPara[CntIndexOfInchCloseLngInArray      ].Value;   //070A 点动关门时间
                WtData[4] := MixerParaInUtMixerPara[CntIndexOfHalfDschLngInArray       ].Value;   //070B 半开门持续时间
                WtData[5] := MixerParaInUtMixerPara[CntIndexOfHalfDschCkeckDelayInArray].Value;    //070C 延迟检查半开门时间
                WtWordSToInstucment1MscommBuf( MsccomWaitRecBufPtInUtMsrPa, $0707, WtData, $0006 );

                MsCommStateInUtMixerPara := MsCmSatImMxrPaIsWtPaToInst;    //搅拌机参数单元中的通讯状态 是 写参数到仪表
                TmrOfMsCommToInsInUtMixerPara := 0;    //写仪表通讯计时器
            end
            else
            begin
                WtNewMixerParaToInstrPt  := WtNewMixerParaToInstrPt +1;
                MsCommStateInUtMixerPara :=  MsCmSatInMxrPaIsIdle;    //搅拌机参数单元中的通讯状态 = 空闲
            end;

            sProgressBar1.Position := 30;
        end;

        WtNwMxrPaToInstrPtIsMxStrTmr   :     //写参数到仪表指针 是 搅拌计时起始时刻
        begin
            if MixerParaGrdEdt then
            begin
                SetLength(WtData, 1);
                WtData[0] := MixerParaInUtMixerPara[ CntIndexOfMixingTmrStartInArray ].Value;    //070D参数 搅拌计时起始时刻
                WtWordSToInstucment1MscommBuf( MsccomWaitRecBufPtInUtMsrPa, $070D, WtData, $0001 );

                MsCommStateInUtMixerPara := MsCmSatImMxrPaIsWtPaToInst;    //搅拌机参数单元中的通讯状态 是 写参数到仪表
                TmrOfMsCommToInsInUtMixerPara := 0;    //写仪表通讯计时器
            end
            else
            begin
                WtNewMixerParaToInstrPt  := WtNewMixerParaToInstrPt +1;
                MsCommStateInUtMixerPara :=  MsCmSatInMxrPaIsIdle;    //搅拌机参数单元中的通讯状态 = 空闲
            end;

            sProgressBar1.Position := 40;
        end;

        WtNwMxrPaToInstrPtIsFstDschDis :     //写参数到仪表指针 是 写首盘禁止卸料状态
        begin
            if MixerBasicInfoChanged then
            begin
                SetLength(WtData, 1);
                if sCkBFstDschDisable.Checked then
                    WtData[0] := $0001
                else
                    WtData[0] := $0000;
                WtAWordToInstument1MscommBuf( MsccomWaitRecBufPtInUtMsrPa, $0711, WtData[0]);              //写一个字到通讯缓冲区

                MsCommStateInUtMixerPara := MsCmSatImMxrPaIsWtPaToInst;    //搅拌机参数单元中的通讯状态 是 写参数到仪表
                TmrOfMsCommToInsInUtMixerPara := 0;    //写仪表通讯计时器
            end
            else
            begin
                WtNewMixerParaToInstrPt  := WtNewMixerParaToInstrPt +1;
                MsCommStateInUtMixerPara :=  MsCmSatInMxrPaIsIdle;    //搅拌机参数单元中的通讯状态 = 空闲
            end;

            sProgressBar1.Position := 50;
        end;
    end;
end;

procedure TFrmMixPara.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled := False;

    case MsCommStateInUtMixerPara of    //搅拌机参数单元中的通讯状态
        MsCmSatInMxrPaIsIdle :            //空闲
        begin
            if MsCommWtInstruInUtMixerPara then
            begin
                if WtNewMixerParaToInstrPt <= WtNewMixerParaToInstrPtMax then
                begin
                    WtNewMixerParaToInstruction();    //写新的搅拌机参数值到仪表中
                end
                else
                begin
                    MsCommWtInstruInUtMixerPara := False;
                    if SaveNewMixerParaToDd <> 0 then
                    begin
                        Showmessage('新的参数值保存进数据库失败!');
                        MsCommWtInstruInUtMixerPara := False;
                    end
                    else
                    begin
                        Self.Close;
                    end;
                end;
            end;
        end;

        MsCmSatImMxrPaIsWtPaToInst :      //通讯状态是写参数到仪表
        begin
            TmrOfMsCommToInsInUtMixerPara := TmrOfMsCommToInsInUtMixerPara + Timer1.Interval;

            if Instruction1ReceiveBuf[MsccomWaitRecBufPtInUtMsrPa].Active then
            begin
                MsCommStateInUtMixerPara := MsCmSatInMxrPaIsIdle;
                WtNewMixerParaToInstrPt  := WtNewMixerParaToInstrPt +1;
                TmrOfMsCommToInsInUtMixerPara := 0;
            end
            else
            begin
                if TmrOfMsCommToInsInUtMixerPara > 5000 then
                begin
                    MsCommWtInstruInUtMixerPara := False;
                    MsCommStateInUtMixerPara    := MsCmSatInMxrPaIsIdle;
                    Showmessage('写仪表失败!');
                    sProgressBar1.Visible := False;
                    TmrOfMsCommToInsInUtMixerPara := 0;
                end;
            end;
        end;
    end;

    Timer1.Enabled := True;
end;

Function TFrmMixPara.SaveNewMixerParaToDd() : Integer;    //保存新的搅拌机参数到数据库中
//返回0，保存成功
var
    i : Integer;
    Exsult : Integer;
    MixerAttr : String;
    SubStrPos : Integer;
    MixerCap : Double;
begin
    Exsult := 0;
    if MixerParaGrdEdt then    //搅拌机参数
    begin
        try
            FrmMain.ADOConnection.BeginTrans;
            for i:=1 to CntMixerParaCount do
            begin
                if CntMixerParaInfo[i].CedeInDb = '' then Continue;
                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Text := 'update MixerPara set MixerPara.Value=:NewV where MixerPara.Code=:EtParaCode and Equip=1';
                ADOQuery1.Parameters.ParamByName('NewV'      ).Value := IntToStr(MixerParaInUtMixerPara[CntMixerParaInfo[i].IndexInParaArray].Value);
                ADOQuery1.Parameters.ParamByName('EtParaCode').Value := CntMixerParaInfo[i].CedeInDb;
                ADOQuery1.ExecSQL;
                MixerPara[i].Value := MixerParaInUtMixerPara[i].Value;
            end;
            FrmMain.ADOConnection.CommitTrans;
            Exsult := 0;
        except
            FrmMain.ADOConnection.RollbackTrans;
            Exsult := 1;
        end;

    end;

    sProgressBar1.Position := 80;

    if MixerBasicInfoChanged and (Exsult=0) then    //搅拌机基本信息
    begin
        //获取搅拌机属性
        ADOQuery1.Close;
        ADOQuery1.SQL.Text := 'select Attribute from Mixer where MixerNo=1';
        ADOQuery1.Open;
        if not ADOQuery1.Eof then
        begin
            MixerAttr := ADOQuery1.FieldByName('Attribute').AsString;
        end
        else
        begin
            Exsult := 2;
        end;

        if Exsult=0 then
        begin
            SubStrPos := pos('a', MixerAttr);
            if SubStrPos > 0 then delete(MixerAttr, SubStrPos,1) ;
            if sCkBFstDschDisable.Checked then
            begin
                MixerAttr := MixerAttr + 'a';
                MixerInfo.FstDschEn := False
            end
            else
            begin
                MixerInfo.FstDschEn := True;
            end;

            SubStrPos := pos('g', MixerAttr);
            if SubStrPos > 0 then delete(MixerAttr, SubStrPos,1) ;
            if sCkBMixerDschLinkToPowderLd.Checked then
            begin
                MixerAttr := MixerAttr + 'g';
                MixerInfo.MixerDschLinkToPowderLoad := True;
            end
            else
            begin
                MixerInfo.MixerDschLinkToPowderLoad := false;
            end;

            try
                MixerCap := StrToFloat(Trim(EtMixCap.Text));
                MixerCap := RoundTo(MixerCap, -3);
            except
                MixerCap := 0;
            end;

            try
                FrmMain.ADOConnection.BeginTrans;
                ADOQuery1.Close;
                ADOQuery1.SQL.Text := 'update Mixer set Cap=:NewCap, Attribute=:NewAttr where MixerNo=1';
                ADOQuery1.Parameters.ParamByName('NewCap' ).Value := MixerCap;
                ADOQuery1.Parameters.ParamByName('NewAttr').Value := MixerAttr;
                ADOQuery1.ExecSQL;
                FrmMain.ADOConnection.CommitTrans;

                MixerInfo.MaxCap := MixerCap;
                MixerInfo.Flags := MixerAttr;
            except
                FrmMain.ADOConnection.RollbackTrans;
                Exsult := 3;
            end;
        end;
    end;
    sProgressBar1.Position := 100;

    Result := Exsult;
end;

procedure TFrmMixPara.EtMixCapKeyPress(Sender: TObject; var Key: Char);
begin
    //if not (Key in ['0'..'9', '.', #8, #13]) then Key := #0;
end;

procedure TFrmMixPara.EtMixCapChange(Sender: TObject);
begin
    MixerBasicInfoChanged := True;
end;

procedure TFrmMixPara.sBitBtn4Click(Sender: TObject);
begin
    Self.Close;
end;

end.
