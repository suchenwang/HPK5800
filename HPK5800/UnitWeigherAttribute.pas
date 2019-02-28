unit UnitWeigherAttribute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ComCtrls, sPageControl, Grids,
  AdvObj, BaseGrid, AdvGrid, sGroupBox, sEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, Mask, sMaskEdit, ExtCtrls, math, sSpinEdit, UnitGlobeVar,
  acProgressBar, sPanel, DB, ADODB;

type
  TFrmWeigherAttribute = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    BtnReadDb: TsBitBtn;
    BtnRestore: TsBitBtn;
    sBitBtn4: TsBitBtn;
    AdvStrGdWeigAttri: TAdvStringGrid;
    Label1: TLabel;
    sEtWeigherName: TsEdit;
    GpDischPreact: TsGroupBox;
    Label2: TLabel;
    sGroupBox2: TsGroupBox;
    Label3: TLabel;
    sEtLoadCell: TsEdit;
    Label4: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    sEtDschPre: TsEdit;
    Memo1: TMemo;
    sBtBtnOK: TsBitBtn;
    sPanel1: TsPanel;
    sProgressBar1: TsProgressBar;
    ADOQuery1: TADOQuery;
    Label6: TLabel;
    sEtWeigherId: TsEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvStrGdWeigAttriGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Timer1Timer(Sender: TObject);
    procedure AdvStrGdWeigAttriGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure AdvStrGdWeigAttriCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure AdvStrGdWeigAttriComboObjectChange(Sender: TObject; ACol,
      ARow, AItemIndex: Integer; ASelection: String; AObject: TObject);
    procedure AdvStrGdWeigAttriComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String);
    procedure AdvStrGdWeigAttriCellsChanged(Sender: TObject; R: TRect);
    procedure sEtDschPreKeyPress(Sender: TObject; var Key: Char);
    procedure sBtBtnOKClick(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    CanEditWgrAttr : Boolean;

    WeigParaInUtWeigAttr : array[1..CntWeigherParaCount] of WeigherParaRd ;
    WeigDschPreChanged ,
    WeigParaChanged : Boolean;

    procedure DspMscommReceiveData();

    procedure IniWeigParaInfoToUtWeigAttr();    //初始化称参数信息到界面

    procedure WtWeigherParaToInstruction();     //发送称参数到控制器
    procedure UpdateWeigherParaInBuf();         //更新内存中的称参数
    procedure SaveNewWeigherParaToDb();         //保存新的称参数到数据库中

    procedure DspWeigParaToUtWeigAttr(ParaInfoId : Integer; GrdRow, GrdCol : Integer);    //显示称参数到界面

    procedure InitPermissonInWgrAttr();

  public
    { Public declarations }


  end;

var
  FrmWeigherAttribute: TFrmWeigherAttribute;

  MscommWaitPtInUtWeigAttr : Integer;    //称属性单元中的通讯等待指针

  MsCommStateInUtWeigAttr : Integer;     //称属性单元中的通讯状态
Const
  CntMsCommStateInUtWeigAttrIsIdle      = 0;    //通讯空闲
  CntMsCommStateInUtWeigAttrIsWaitReply = 1;    //通讯等待应答

var
  SendDataToInstuctmentInUtWeigAttr : Boolean;

var
  MsCommTmrUtWeigAttr : Integer;               //通讯计时器

var
  MsCommCommandNameInUtWeigAttr : Integer;        //通讯命令名称
Const
  CntMscCmdNmInUtWeigAttrIsRdDschPre  = 1;        //读称卸料落差
  CntMscCmdNmInUtWeigAttrIsRdLoad     = 2;        //读称传感器信号
  CntMscCmdNmInUtWeigAttrIsWtDschPre  = 3;        //写卸料落差
  CntMscCmdNmInUtWeigAttrIsWtWeigPara = 4;        //写称参数
var
  WeigDecimalInUtWeigAttr : Integer;              //称属性中的小数位数（临时）

var
    WtWeighParaSteps : Integer;                    //写称参数


implementation

{$R *.dfm}

uses  UnitGlobeSub, UnitRWInstrument1MscommBuf, UnitMain,UnitPersonnelMangement ;

procedure TFrmWeigherAttribute.FormShow(Sender: TObject);
var
   i : Integer;
    //RowCount : Integer;
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;

    Self.Caption := WeigherInfo[PmWeigherId].Name + ' ' + '属性设置';

    //设置通讯内容
    MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsRdDschPre;      //读称卸料落差
    Instruction1ReadWeigherDischPreAct(PmWeigherId, MscommWaitPtInUtWeigAttr);    //读取该称卸料落差值
    if (MscommWaitPtInUtWeigAttr <0) or (MscommWaitPtInUtWeigAttr >= CntCommunicateBufLen) then Showmessage('无效的返回数据');
    MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
    MsCommTmrUtWeigAttr := 0;
    Timer1.Enabled := True;

    sEtWeigherName.Text := WeigherInfo[PmWeigherId].Name ;
    sEtWeigherId.Text := inttostr( PmWeigherId ) ;

    WeigDecimalInUtWeigAttr := WeigherPara[PmWeigherId][CntWeigherDecimalIndex].Value ;

    AdvStrGdWeigAttri.Cells[1 ,0] := '序号';
    AdvStrGdWeigAttri.Cells[2 ,0] := '参数名称';
    AdvStrGdWeigAttri.Cells[3 ,0] := '参数值';
    AdvStrGdWeigAttri.Cells[4 ,0] := '单位' ;

    for i:= 1 to CntWeigherParaCount do
    begin
        WeigParaInUtWeigAttr[i] := WeigherPara[PmWeigherId][i];
    end;

    IniWeigParaInfoToUtWeigAttr();    //初始化称参数信息到界面

    WeigDschPreChanged := False;
    WeigParaChanged := False;
    SendDataToInstuctmentInUtWeigAttr := False;
end;

procedure TFrmWeigherAttribute.IniWeigParaInfoToUtWeigAttr();    //初始化称参数信息到界面
var
    i, k          : Integer;
    BeginRow,
    RowPt         : Integer;
    ParaFlags     : String;
    ParaInfoIndex : Integer;
begin
    AdvStrGdWeigAttri.Clear;

    {汇总控制参数}
    AdvStrGdWeigAttri.Cells[1, 1] := '卸料控制参数';
    BeginRow := 1;
    RowPt := 1;
    for i:= 1 to CntWeigherParaCount do
    begin
        ParaFlags := WeigherPara[PmWeigherId][i].Flags;
        if pos('b', ParaFlags) > 0 then
        begin
            if pos('v',ParaFlags ) > 0 then    //振动器参数
            begin
                if WeigherInfo[PmWeigherId].DischVibrator then
                begin
                    if pos('t', ParaFlags) > 0 then
                    begin
                        if (WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value = 0) then    //按时间振动
                        begin
                            GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                            AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                            AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                            DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                            AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                            AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                            RowPt := RowPt +1;
                        end;
                    end
                    else if pos('f', ParaFlags) >0 then
                    begin
                        if (WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value <> 0) then    //按流量振动
                        begin
                            GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                            AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                            AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                            DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                            AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                            AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                            RowPt := RowPt +1;
                        end;
                    end
                    else
                    begin
                        GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                        AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                        AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                        DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                        AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                        AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                        RowPt := RowPt +1;
                    end;
                end;
            end
            else
            begin
                GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                RowPt := RowPt +1;
            end;
        end;
    end;
    AdvStrGdWeigAttri.AddNode(BeginRow, RowPt);

    {汇总称参数}
    BeginRow := RowPt +1;
    AdvStrGdWeigAttri.Cells[1, BeginRow] := '称设置参数';
    RowPt := 1;
    for i:= 1 to CntWeigherParaCount do
    begin
        ParaFlags := WeigParaInUtWeigAttr[i].Flags;
        if pos('a', ParaFlags) > 0 then
        begin
            if pos('d', ParaFlags) > 0 then
            begin
                if (WeigherInfo[PmWeigherId].LdDsIsPumpAndValve = True) then    //上料、卸料泵阀控制
                begin
                    GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                    AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                    AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                    DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                    AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                    AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                    RowPt := RowPt +1;
                end;
            end
            else if pos('f', ParaFlags) > 0 then
            begin
                if (WeigherInfo[PmWeigherId].LoadIsFine = True) then            //双配料门
                begin
                    GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                    AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                    AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                    DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                    AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                    AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                    RowPt := RowPt +1;
                end;
            end
            else
            begin
                GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                RowPt := RowPt +1;
            end;
        end;
    end;
    AdvStrGdWeigAttri.AddNode(BeginRow, RowPt);

    AdvStrGdWeigAttri.RowCount := BeginRow + RowPt +1;
end;

procedure TFrmWeigherAttribute.DspWeigParaToUtWeigAttr(ParaInfoId : Integer; GrdRow, GrdCol : Integer);    //显示称参数到界面
var
    ParaDecimal : Integer;
    paraValue   : Integer;
begin
    case CntWeigherParaInfo[ParaInfoId].ParaCode of
        CntWeigParaIsCap :          // 称量程
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(WeigDecimalInUtWeigAttr) + 'f', [paraValue / power(10, WeigDecimalInUtWeigAttr)]);
        end;

        CntWeigParaIsDivision :     // 称分度值
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d', [paraValue]);
        end;

        CntWeigParaIsTrack    :     // 零点跟踪范围
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [paraValue ]);
        end;

        CntWeigParaIsDvSep    :     // 卸料泵阀间隔时间（1位定点小数）
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsIDT      :     // 延迟判断落差时间（带小数）
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsZeroBand    :     // 零位范围
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(WeigDecimalInUtWeigAttr) + 'f', [paraValue / power(10, WeigDecimalInUtWeigAttr)]);
        end;

        CntWeigParaIsFilter      :     // 数字滤波系数
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsDecimal     :     // 称小数位数
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsTRG         :     // 允差范围
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsTDC         :     // 延迟卸料控制时间（带小数）
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsDlyUld      :     // 延迟投料时间
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsSXXLZL      :     // 顺序卸料剩余重量
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsUDC         :     // 扣称 0：否   1：允许
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '否'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '是';
        end;

        //CntWeigParaIsRemain      = $0E;     // 扣料重量
        CntWeigParaIsPvSep       :     // 上料泵阀间隔时间（1位定点小数）
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        //CntWeigParaIs         = $10
        //CntWeigParaIs          = $11

        CntWeigParaIsUFC         :     // 落差修正方式 0：固定 1：自动
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '固定落差'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '自动修正';
        end;

        //CntWeigParaIs          = $13

        CntWeigParaIsSrtDly      :     // 延迟启动时间
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsNVL         :     // 补称  0：否  1： 是
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '否'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '是';
        end;

        //CntWeigParaIs          = $16;
        //CntWeigParaIs          = $17;
        //CntWeigParaIs          = $18;
        //CntWeigParaIs          = $19;

        CntWeigParaIsZFM         :   //19 主副门输出方式 1：   0：
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '同时输出'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '先副后主';
        end;

        //CntWeigParaIs           = $1B

        CntWeigParaIsPLBJX       :   //1B 配料误差报警限
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        //CntWeigParaIs           = $1D;
        //CntWeigParaIs           = $1E;
        //CntWeigParaIs           = $1F;
        //CntWeigParaIs           = $20;

        CntWeigParaIsPLBJ        :   // 配料误差报警限
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '不报警'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '报警';
        end;

        CntWeigParaIsINS_QIV_MDL :   // 振动模式
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '按时间振动'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '按流量振动';
        end;

        CntWeigParaIsINS_QIV_DLY :   // 延迟振动时间
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsINS_QIV_LST :   // 振动时间
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsINS_QIV_STP :   // 振动间隔时间
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        //CntWeigParaIs            = $26;

        CntWeigParaIsINS_QIV_FLW :   //振动边际流量
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        else
            ;
    end;
end;

procedure TFrmWeigherAttribute.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmWeigAttrCrt := False;
    Action := caFree;
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
    if ARow = 0 then
    begin
         HAlign := taCenter;
    end;

    if ACol = 1 then
    begin
        HAlign := taCenter;
    end;

    VAlign := vtaCenter ;

end;

procedure TFrmWeigherAttribute.Timer1Timer(Sender: TObject);
var
    DschPreF : Double;
    DschPreI : Integer;
begin
    Timer1.Enabled := False;

    case MsCommStateInUtWeigAttr of
        CntMsCommStateInUtWeigAttrIsIdle :    //通讯空闲
        begin
            if SendDataToInstuctmentInUtWeigAttr then
            begin
                if WeigDschPreChanged then    //下发新的卸料落差值
                begin
                    DschPreF := StrToFloat(Trim(sEtDschPre.Text));
                    DschPreI := Trunc(RoundTo(DschPreF * Power(10, WeigherPara[PmWeigherId][CntWeigherDecimalIndex].Value), -0)) ;
                    MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtDschPre ;         //写卸料落差
                    WtAWordToInstument1MscommBuf(MscommWaitPtInUtWeigAttr, $0790 + (PmWeigherId-1), DschPreI) ;              //写卸料落差值到发送缓冲区
                    WeigDschPreChanged := False;

                    MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtDschPre ;    //写称卸料落差值
                    MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
                    MsCommTmrUtWeigAttr := 0;
                end
                else if WeigParaChanged then
                begin
                    if WtWeighParaSteps <= 5 then
                    begin
                        sProgressBar1.Position :=10 + WtWeighParaSteps * 10;
                        WtWeigherParaToInstruction();    //写称参数到控制器
                        WtWeighParaSteps := WtWeighParaSteps +1;
                        MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtWeigPara;   //写称参数
                        MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
                        MsCommTmrUtWeigAttr := 0;
                    end
                    else
                    begin
                        {更新内存中的称参数}
                        UpdateWeigherParaInBuf();
                        sProgressBar1.Position := 60 +20;

                        {保存新的称参数到数据库中}
                        SaveNewWeigherParaToDb();
                        sProgressBar1.Position := 100;

                        Self.Close;
                    end;
                end
                else
                begin
                    sProgressBar1.Position := 100; 
                    SendDataToInstuctmentInUtWeigAttr := False;
                    Self.Close;
                end;
            end
            else
            begin
                MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsRdLoad ;    //读称传感器信号
                MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
                MsCommTmrUtWeigAttr := 0;
                Instruction1ReadWeigherLoadCellValue(PmWeigherId, MscommWaitPtInUtWeigAttr) ;    //通讯读取传感器信号;
            end;
        end;

        CntMsCommStateInUtWeigAttrIsWaitReply :    //等待接收
        begin
            if Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].Active then
            begin
                DspMscommReceiveData();
                Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].Active := False;
                MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsIdle ;
            end
            else
            begin
                MsCommTmrUtWeigAttr := MsCommTmrUtWeigAttr + Timer1.Interval;
                if MsCommTmrUtWeigAttr > 5000 then
                begin
                    if SendDataToInstuctmentInUtWeigAttr then
                    begin
                        if messagebox(getfocus, pchar('发送新的参数到控制器失败!'), '系统提示', MB_OK) = idOK then
                        begin
                            SendDataToInstuctmentInUtWeigAttr := False;
                            MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsIdle ;
                        end;
                    end
                    else
                    begin
                        MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsIdle ;
                    end;
                end;
            end;
        end;
    end;

    Timer1.Enabled := True;
end;

procedure TFrmWeigherAttribute.WtWeigherParaToInstruction();
var
    SendData : Array[0..$0E] of Integer;
    //SendDataCount : Integer;
    i : Integer;
    ParaBuId : Integer;
begin
    case WtWeighParaSteps of
        0:    //写称基本参数
        begin
            for i:=1 to $0D do
            begin
                ParaBuId := CntWeigherParaInfo[i].BufIndex;
                SendData[i-1] := WeigParaInUtWeigAttr[ParaBuId].Value;
            end;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0400 + (PmWeigherId-1) *$0020, SendData, $0D);
        end;

        1:    //写上料泵阀间隔时间（1位定点小数）
        begin
            ParaBuId := CntWeigherPvSepIndex;
            SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $040E + (PmWeigherId-1) *$0020, SendData, 1);
        end;

        2:    //写落差修正方式 0：固定 1：自动
        begin
            ParaBuId := CntWeigherUFCIndex;
            SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0411 + (PmWeigherId-1) *$0020, SendData, 1);
        end;

        3:    //写[延迟启动时间]、[补称  0：否  1： 是]
        begin
            ParaBuId := CntWeigherSrtDlyIndex;
            SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;
            ParaBuId := CntWeigherNVLIndex;
            SendData[1] := WeigParaInUtWeigAttr[ParaBuId].Value;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0413 + (PmWeigherId-1) *$0020, SendData, 2);
        end;

        4:    //写【主副门输出方式 1：   0：】、【】、【配料误差报警限】
        begin
            ParaBuId := CntWeigherZFMIndex;
            SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;

            //ParaBuId := ;
            SendData[1] := 0;

            ParaBuId := CntWeigherPLBJXIndex;
            SendData[2] := WeigParaInUtWeigAttr[ParaBuId].Value;

            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0419 + (PmWeigherId-1) *$0020, SendData, 3);
        end;

        5:    //写称卸料振动参数
        begin
            if WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value = 0 then    //按时间振动
            begin
                ParaBuId := CntWeigherINS_QIV_DLYIndex;            //延迟振动时间
                SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;
                ParaBuId := CntWeigherINS_QIV_LSTIndex;            //振动时间
                SendData[1] := WeigParaInUtWeigAttr[ParaBuId].Value;
                ParaBuId := CntWeigherINS_QIV_STPIndex;            //振动间隔时间
                SendData[2] := WeigParaInUtWeigAttr[ParaBuId].Value;
                //ParaBuId := ;
                SendData[3] := 0;
                //ParaBuId := CntWeigherINS_QIV_FLWIndex;
                SendData[4] := 0;
            end
            else
            begin
                //ParaBuId := CntWeigherINS_QIV_DLYIndex;            //延迟振动时间
                SendData[0] := 0;
                //ParaBuId := CntWeigherINS_QIV_LSTIndex;            //振动时间
                SendData[1] := 0;
                //ParaBuId := CntWeigherINS_QIV_STPIndex;            //振动间隔时间
                SendData[2] := 0;
                //ParaBuId := ;
                SendData[3] := 0;
                ParaBuId := CntWeigherINS_QIV_FLWIndex;            //振动边际流量
                SendData[4] := WeigParaInUtWeigAttr[ParaBuId].Value;;
            end;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0A40 + (PmWeigherId-1) *6, SendData, 5)
        end;
    end;
end;

procedure TFrmWeigherAttribute.UpdateWeigherParaInBuf();    //更新内存中的称参数
var
   i : Integer ;
begin
    for i:=1 to CntWeigherParaCount do
    begin
        WeigherPara[PmWeigherId][i] := WeigParaInUtWeigAttr[i];
    end;
end;

procedure TFrmWeigherAttribute.SaveNewWeigherParaToDb();    //保存新的称参数到数据库中
var
    i : Integer;
begin
    ADOQuery1.Close;
    try
        FrmMain.ADOConnection.BeginTrans;
        for i:=1 to CntWeigherParaCount do
        begin
            if Trim(CntWeigherParaInfo[i].CodeInDb) = '' then Continue;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'update InstrumentPara set ParaValue=' +inttostr(WeigherPara[PmWeigherId][i].Value) + ' where InstrumentId=' + inttostr(PmWeigherId) + ' and Code=' + '''' + CntWeigherParaInfo[i].CodeInDb + '''';
            ADOquery1.ExecSQL;
        end;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans
    end;
end;

procedure TFrmWeigherAttribute.DspMscommReceiveData();
var
    PreAct : Integer;
    WeightPoint : Integer;
    LoadCellValue : Integer;
begin
    case MsCommCommandNameInUtWeigAttr of
        CntMscCmdNmInUtWeigAttrIsRdDschPre :
        begin
            PreAct := Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].ReceiveByte[0] *$100
                    + Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].ReceiveByte[1] ;
            WeightPoint := WeigherPara[PmWeigherId][CntWeigherDecimalIndex].Value;
            sEtDschPre.Text := Format('%.' + inttostr(WeightPoint) + 'f',[PreAct / power(10,WeightPoint)]);
        end;

        CntMscCmdNmInUtWeigAttrIsRdLoad :
        begin
            LoadCellValue := Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].ReceiveByte[0] *$100
                           + Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].ReceiveByte[1] ;
            sEtLoadCell.Text := Format('%.2f', [LoadCellValue /100]);
        end;
    end;
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
var
    ParaInfoId : Integer;
    i : Integer ;
Const
    WeighCapItems : Array[1..14] of Integer =
    ( 500  , 1000 , 1200 , 1500 , 2000 , 2500 , 3000 , 4000 ,
      5000 , 60000, 8000 , 10000, 20000, 30000 );
begin
    if ACol = 3 then
    begin
        if Trim(AdvStrGdWeigAttri.Cells[5, ARow]) <> '' then
        begin
            ParaInfoId := StrToInt(Trim(AdvStrGdWeigAttri.Cells[5, ARow]));

            case CntWeigherParaInfo[ParaInfoId].ParaCode of
                CntWeigParaIsCap       :         // 称量程
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    for i:=1 to 14 do
                        AdvStrGdWeigAttri.AddComboString( format('%.' + inttostr(WeigDecimalInUtWeigAttr) + 'f', [WeighCapItems[i] / power(10, WeigDecimalInUtWeigAttr)]) );
                end;

                CntWeigParaIsDivision  :     // 称分度值
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('1');
                    AdvStrGdWeigAttri.AddComboString('2');
                    AdvStrGdWeigAttri.AddComboString('5');
                end;

                CntWeigParaIsTrack     :     // 零点跟踪范围
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 8;
                end;

                CntWeigParaIsDvSep     :     // 卸料泵阀间隔时间（1位定点小数）
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.0;
                end;

                CntWeigParaIsIDT       :     // 延迟判断落差时间（带小数）
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.1;
                end;

                CntWeigParaIsZeroBand  :     // 零位范围
                begin
                    if WeigDecimalInUtWeigAttr = 0 then
                    begin
                        AEditor := edSpinEdit;
                        AdvStrGdWeigAttri.SpinEdit.MaxValue := 500;
                        AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                    end
                    else
                    begin
                        AEditor := edFloatSpinEdit;
                        AdvStrGdWeigAttri.SpinEdit.Precision := WeigDecimalInUtWeigAttr;
                        AdvStrGdWeigAttri.SpinEdit.MaxValue := 500;
                        AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                        AdvStrGdWeigAttri.SpinEdit.IncrementFloat := 1 / power(10, WeigDecimalInUtWeigAttr);
                    end;
                end;

                CntWeigParaIsFilter      :     // 数字滤波系数
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 8;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsDecimal     :     // 称小数位数
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('0');
                    AdvStrGdWeigAttri.AddComboString('1');
                    AdvStrGdWeigAttri.AddComboString('2');
                    AdvStrGdWeigAttri.AddComboString('3');
                end;

                CntWeigParaIsTRG         :     // 允差范围
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.1;
                end;
    
                CntWeigParaIsTDC         :     // 延迟卸料控制时间（带小数）
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.1;
                end;

                CntWeigParaIsDlyUld      :     // 延迟投料时间
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 99;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsSXXLZL      :     // 顺序卸料剩余重量
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 2000;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsUDC         :     // 扣称 0：否   1：允许
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('否');
                    AdvStrGdWeigAttri.AddComboString('是');
                end;

                //CntWeigParaIsRemain      = $0E;     // 扣料重量

                CntWeigParaIsPvSep       :     // 上料泵阀间隔时间（1位定点小数）
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.0;
                end;

                //CntWeigParaIs         = $10
                //CntWeigParaIs          = $11

                CntWeigParaIsUFC         :     // 落差修正方式 0：固定 1：自动
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('固定落差');
                    AdvStrGdWeigAttri.AddComboString('自动修正');
                end;

                //CntWeigParaIs          = $13
                CntWeigParaIsSrtDly      :     // 延迟启动时间
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 20.0;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 3.0;
                end;

                CntWeigParaIsNVL         :     // 补称  0：否  1： 是
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('否');
                    AdvStrGdWeigAttri.AddComboString('是');
                end;

                //CntWeigParaIs          = $16;
                //CntWeigParaIs          = $17;
                //CntWeigParaIs          = $18;
                //CntWeigParaIs          = $19;

                CntWeigParaIsZFM         :   //19 主副门输出方式 1：   0：
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('同时输出');
                    AdvStrGdWeigAttri.AddComboString('先副后主');
                end;

                //CntWeigParaIs           = $1B

                CntWeigParaIsPLBJX       :   //1B 配料误差报警限
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 100.0;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.1;
                end;

                //CntWeigParaIs           = $1D;
                //CntWeigParaIs           = $1E;
                //CntWeigParaIs           = $1F;
                //CntWeigParaIs           = $20;

                CntWeigParaIsPLBJ        :   // 配料误差报警
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('不报警');
                    AdvStrGdWeigAttri.AddComboString('报警');
                end;

                CntWeigParaIsINS_QIV_MDL  :   // 振动模式
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('按时间振动');
                    AdvStrGdWeigAttri.AddComboString('按流量振动');
                end;

                CntWeigParaIsINS_QIV_DLY :   // 延迟振动时间
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 99;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsINS_QIV_LST :   // 振动时间
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 99;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsINS_QIV_STP :   // 振动间隔时间
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 99;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                //:CntWeigParaIs            = $26;

                CntWeigParaIsINS_QIV_FLW :   //振动边际流量
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 999;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                else
                    AEditor := edNormal ;
            end;
        end;
    end;
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
    if CanEditWgrAttr then
    begin
        if ACol <> 3 then
            CanEdit := False
        else
            CanEdit := True;
    end
    else
    begin
        CanEdit := False;
    end;

end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriComboObjectChange(
  Sender: TObject; ACol, ARow, AItemIndex: Integer; ASelection: String;
  AObject: TObject);
//var
//    Row : Integer ;
//    WeigParaId : Integer;
begin
    {WeigParaId := 0;

    Row := ARow;

    if AdvStrGdWeigAttri.Cells[5, Row] <> '' then
    begin
        try
            WeigParaId := StrToInt(Trim(AdvStrGdWeigAttri.Cells[5, Row]));
        except
            WeigParaId := 0;
        end;
    end;

    if WeigParaId > 0 then
    begin
        case CntWeigherParaInfo[WeigParaId].ParaCode of
            CntWeigParaIsINS_QIV_MDL :    //$22 振动模式
            begin
                AdvStrGdWeigAttri.Clear;
                sBitBtn3.SetFocus;

                WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value := AItemIndex;    //振动模式

                IniWeigParaInfoToUtWeigAttr();    //初始化称参数信息到界面
            end;

            CntWeigParaIsDecimal :        // 称小数位数
            begin
            //    AdvStrGdWeigAttri.Clear;
            //    sBitBtn3.SetFocus;
            //
                WeigDecimalInUtWeigAttr :=  AItemIndex;
                //WeigParaInUtWeigAttr[CntWeigherDecimalIndex].Value := AItemIndex;
            //
                IniWeigParaInfoToUtWeigAttr();    //初始化称参数信息到界面
            end;
        end; 

    end; }
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriComboChange(
  Sender: TObject; ACol, ARow, AItemIndex: Integer; ASelection: String);
var
    Row : Integer ;
    WeigParaId : Integer;
begin
    WeigParaId := 0;

    Row := ARow;

    if AdvStrGdWeigAttri.Cells[5, Row] <> '' then
    begin
        try
            WeigParaId := StrToInt(Trim(AdvStrGdWeigAttri.Cells[5, Row]));
        except
            WeigParaId := 0;
        end;
    end;

    if WeigParaId > 0 then
    begin
        case CntWeigherParaInfo[WeigParaId].ParaCode of
            CntWeigParaIsINS_QIV_MDL :    //$22 振动模式
            begin
                AdvStrGdWeigAttri.Clear;

                WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value := AItemIndex;    //振动模式

                IniWeigParaInfoToUtWeigAttr();    //初始化称参数信息到界面
            end;

            CntWeigParaIsDecimal :        // 称小数位数
            begin
                AdvStrGdWeigAttri.Clear;

                WeigDecimalInUtWeigAttr :=  AItemIndex;
                WeigParaInUtWeigAttr[CntWeigherDecimalIndex].Value := AItemIndex;

                IniWeigParaInfoToUtWeigAttr();    //初始化称参数信息到界面
            end;
        end;

    end;
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriCellsChanged(
  Sender: TObject; R: TRect);
begin
    WeigParaChanged := True;
end;

procedure TFrmWeigherAttribute.sEtDschPreKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Not (Key in ['0'..'9','.']) then Key := #0;

    if Key <> #0 then
    begin
        WeigDschPreChanged := True;
    end;

end;

procedure TFrmWeigherAttribute.sBtBtnOKClick(Sender: TObject);
var
    DschPreF : Double;
    DschPreI : Integer;
    i : Integer;
    ParaInfoId : Integer;
    ParaBufId : Integer;
    ParaValueF : double;
    ParaValueI : Integer;
    ParaDecimal : Integer;
begin
    if WeigDschPreChanged or WeigParaChanged then
    begin
        if messagebox(getfocus,Pchar('您更改了参数值，是否将新的参数值发送到控制器'), '系统询问', MB_YESNO) = idYes then
        begin
            if WeigParaChanged then
            begin
                WtWeighParaSteps := 0;

                //整理新的参数值
                for i:=1 to AdvStrGdWeigAttri.RowCount do
                begin
                    if Trim(AdvStrGdWeigAttri.Cells[5, i]) <> '' then
                    begin
                        ParaInfoId := StrToInt(AdvStrGdWeigAttri.Cells[5, i]);
                        ParaBufId := CntWeigherParaInfo[ParaInfoId].BufIndex ;

                        case CntWeigherParaInfo[ParaInfoId].ParaCode of
                            {称小数位数决定小数位数}
                            CntWeigParaIsCap         ,      // 称量程
                            CntWeigParaIsZeroBand    ,      //$06 零位范围
                            CntWeigParaIsSXXLZL      ,      //$0C 顺序卸料剩余重量
                            CntWeigParaIsINS_QIV_FLW :      //$27 振动边际流量

                            begin
                                ParaValueF := StrToFloat(Trim(AdvStrGdWeigAttri.Cells[3, i]));
                                ParaValueI := Trunc(RoundTo(ParaValueF * Power(10,WeigDecimalInUtWeigAttr), -0) );
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            {整数型参数值}
                            CntWeigParaIsDivision    ,      // 称分度值
                            CntWeigParaIsTrack       ,      // 零点跟踪范围

                            CntWeigParaIsFilter      ,      //$07 数字滤波系数
                            CntWeigParaIsDecimal     ,      //$0; 称小数位数
                            CntWeigParaIsINS_QIV_DLY ,      //$23 延迟振动时间
                            CntWeigParaIsINS_QIV_LST ,      //$24 振动时间
                            CntWeigParaIsINS_QIV_STP :      //$25 振动间隔时间
                            begin
                                ParaValueI := StrToInt(Trim(AdvStrGdWeigAttri.Cells[3, i]));
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            

                            {浮点数}
                            CntWeigParaIsDvSep       ,      // 卸料泵阀间隔时间（1位定点小数）
                            CntWeigParaIsIDT         ,      //$05 延迟判断落差时间（带小数）
                            CntWeigParaIsTRG         ,      //$09 允差范围
                            CntWeigParaIsTDC         ,      //$0A 延迟卸料控制时间（带小数）
                            CntWeigParaIsDlyUld      ,      //$0B 延迟投料时间
                            CntWeigParaIsPvSep       ,      //$0F 上料泵阀间隔时间（1位定点小数）
                            CntWeigParaIsSrtDly      :      //$14 延迟启动时间

                            begin
                                ParaValueF := StrToFloat(Trim(AdvStrGdWeigAttri.Cells[3, i]));
                                ParaDecimal := WeigherPara[PmWeigherId][ParaBufId].Decimal;
                                ParaValueI := Trunc(RoundTo(ParaValueF * Power(10,ParaDecimal), -0) );
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsPLBJX       :      //$1C 配料误差报警限
                            begin
                                ParaValueF := StrToFloat(Trim(AdvStrGdWeigAttri.Cells[3, i]));
                                ParaDecimal := WeigherPara[PmWeigherId][ParaBufId].Decimal;
                                ParaValueI := Trunc(RoundTo(ParaValueF * Power(10,ParaDecimal), -0) );
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsUDC         ,      //$0D 扣称 0：否   1：允许
                            CntWeigParaIsNVL         :      //$15 补称  0：否  1： 是
                            begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '是' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsUFC         :      //$12 落差修正方式 0：固定 1：自动
                            begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '自动修正' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsZFM         :    //$1A 主副门输出方式 1：   0：
                            begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '先副后主' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                           CntWeigParaIsPLBJ        :    //$21 配料误差报警
                           begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '报警' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsINS_QIV_MDL :    //$22 振动模式
                            begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '按流量振动' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                        end;
                    end;

                end;
            end;

            SendDataToInstuctmentInUtWeigAttr := True;
            sPanel1.Visible := True;
        end
        else
        begin
            Self.Close;
        end;
    end
    else
    begin
        Self.Close;
    end;
end;

procedure TFrmWeigherAttribute.sBitBtn4Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmWeigherAttribute.FormCreate(Sender: TObject);
begin
    InitPermissonInWgrAttr();
end;

procedure TFrmWeigherAttribute.InitPermissonInWgrAttr();
begin
    if pos('[' + CntPermissonCode[CntPermIsPara] + 'e', PersonnelPermit) >= 1 then
    begin
        CanEditWgrAttr := True;

        BtnReadDb.Enabled := True;
        BtnRestore.Enabled := True;
        sBtBtnOK.Enabled   := True;
        GpDischPreact.Enabled := True;
    end
    else
    begin
        CanEditWgrAttr := False;
        
        BtnReadDb.Enabled := False;
        BtnRestore.Enabled := False;
        sBtBtnOK.Enabled   := False;
        GpDischPreact.Enabled := False;
    end;
end;

end.
