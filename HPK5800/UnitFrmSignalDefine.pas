unit UnitFrmSignalDefine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, StdCtrls, sEdit, sGroupBox, Buttons,
  sBitBtn, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid, DB, ADODB, sLabel,
  acProgressBar, sPanel;

type
  TFrmSignalDefine = class(TForm)
    sPageControl1: TsPageControl;
    sTabShtDoProg: TsTabSheet;
    sTabShtDiProg: TsTabSheet;
    GBxOutBord1: TsGroupBox;
    sGroupBox5: TsGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sEtDo3Set: TsEdit;
    Label4: TLabel;
    sEtDo4Set: TsEdit;
    Label5: TLabel;
    sEtDo5Set: TsEdit;
    Label6: TLabel;
    sEtDo6Set: TsEdit;
    Label7: TLabel;
    sEtDo7Set: TsEdit;
    Label8: TLabel;
    sEtDo8Set: TsEdit;
    Label9: TLabel;
    sEtDo9Set: TsEdit;
    Label10: TLabel;
    sEtDo10Set: TsEdit;
    Label11: TLabel;
    sEtDo11Set: TsEdit;
    Label12: TLabel;
    sEtDo12Set: TsEdit;
    Label13: TLabel;
    sEtDo13Set: TsEdit;
    Label14: TLabel;
    sEtDo14Set: TsEdit;
    Label15: TLabel;
    sEtDo15Set: TsEdit;
    Label16: TLabel;
    sEtDo16Set: TsEdit;
    sEtDo2Set: TsEdit;
    sEtDo1Set: TsEdit;
    GBxOutBord2: TsGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    sEtDo19Set: TsEdit;
    sEtDo20Set: TsEdit;
    sEtDo21Set: TsEdit;
    sEtDo22Set: TsEdit;
    sEtDo23Set: TsEdit;
    sEtDo24Set: TsEdit;
    sEtDo25Set: TsEdit;
    sEtDo26Set: TsEdit;
    sEtDo27Set: TsEdit;
    sEtDo28Set: TsEdit;
    sEtDo29Set: TsEdit;
    sEtDo30Set: TsEdit;
    sEtDo31Set: TsEdit;
    sEtDo32Set: TsEdit;
    sEtDo18Set: TsEdit;
    sEtDo17Set: TsEdit;
    GBxOutBord3: TsGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    sEtDo35Set: TsEdit;
    sEtDo36Set: TsEdit;
    sEtDo37Set: TsEdit;
    sEtDo38Set: TsEdit;
    sEtDo39Set: TsEdit;
    sEtDo40Set: TsEdit;
    sEtDo41Set: TsEdit;
    sEtDo42Set: TsEdit;
    sEtDo43Set: TsEdit;
    sEtDo44Set: TsEdit;
    sEtDo45Set: TsEdit;
    sEtDo46Set: TsEdit;
    sEtDo47Set: TsEdit;
    sEtDo48Set: TsEdit;
    sEtDo34Set: TsEdit;
    sEtDo33Set: TsEdit;
    GBxOutExpBord: TsGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    sEtDo51Set: TsEdit;
    sEtDo52Set: TsEdit;
    sEtDo53Set: TsEdit;
    sEtDo54Set: TsEdit;
    sEtDo55Set: TsEdit;
    sEtDo56Set: TsEdit;
    sEtDo50Set: TsEdit;
    sEtDo49Set: TsEdit;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    sBtRdCopy: TsBitBtn;
    sBtSendProgToInstru: TsBitBtn;
    sBtRdProgFromInstru: TsBitBtn;
    sBtSaveCopy: TsBitBtn;
    AdvStringGrid1: TAdvStringGrid;
    ADOQuery1: TADOQuery;
    sPanel1: TsPanel;
    sProgressBar1: TsProgressBar;
    sLabel1: TsLabel;
    Timer1: TTimer;
    GBxInBord1: TsGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    sEtDi3Set: TsEdit;
    sEtDi4Set: TsEdit;
    sEtDi5Set: TsEdit;
    sEtDi6Set: TsEdit;
    sEtDi7Set: TsEdit;
    sEtDi8Set: TsEdit;
    sEtDi9Set: TsEdit;
    sEdit8: TsEdit;
    sEtDi2Set: TsEdit;
    sEtDi1Set: TsEdit;
    GBxInBord2: TsGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    sEtDi12Set: TsEdit;
    sEtDi13Set: TsEdit;
    sEtDi14Set: TsEdit;
    sEtDi15Set: TsEdit;
    sEtDi16Set: TsEdit;
    sEdit14: TsEdit;
    sEtDi11Set: TsEdit;
    sEtDi10Set: TsEdit;
    GBxInBord3: TsGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    sEtDi19Set: TsEdit;
    sEtDi20Set: TsEdit;
    sEtDi21Set: TsEdit;
    sEtDi22Set: TsEdit;
    sEtDi23Set: TsEdit;
    sEtDi24Set: TsEdit;
    sEdit27: TsEdit;
    sEtDi18Set: TsEdit;
    sEtDi17Set: TsEdit;
    sGroupBox9: TsGroupBox;
    AdvStringGrid2: TAdvStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sTabShtDoProgShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtSendProgToInstruClick(Sender: TObject);
    procedure sTabShtDiProgShow(Sender: TObject);
    procedure sBtSaveCopyClick(Sender: TObject);
    procedure sBtRdCopyClick(Sender: TObject);
    procedure sBtRdProgFromInstruClick(Sender: TObject);
  private
    { Private declarations }
    procedure DiProgDspFromInstru(CommRecieveBlockPt : Integer);
    procedure SendDoProgToInstrun();
    procedure SendDiProgToInstrun();
    procedure SaveDoProgToDb();
    procedure SaveDiProgToDb();
    procedure RdDoProgFromDb();
    procedure RdDiProgFromDb();
    procedure RdDoProgFromInstru();
    procedure RdDiProgFromInstru();

  public
    { Public declarations }
  end;

var
  FrmSignalDefine: TFrmSignalDefine;

  RWInstruType        : Integer;
Const
  CnRWInstruTpIsIdle            = 0;
  CnRWInstruTpIsRd              = 1;
  CnRWInstruTpIsWt              = 2;
var
  RdInstruWaitReplyPt : Integer;
  RWInstruSteps       : Integer;
Const
  CnRWInstruStepsIsRdDoPort1Set = 1;
  CnRWInstruStepsIsRdDoPort2Set = 2;
  CnRWInstruStepsIsRdDoPort3Set = 3;
  CnRWInstruStepsIsRdDoPort4Set = 4;
  CnRWInstruStepsIsRdDoExpandEn = 5;     //读输出扩展是否使用

  CnRWInstruStepsIsRdDiPortSet  = 11;    //读取输入设置

  CnRWInstruStepsIsWtDoExpandEn = 21;    //写输出扩展使能
  CnRWInstruStepsIsWtDoPort1Set = 22;    //写端口1设置
  CnRWInstruStepsIsWtDoPort2Set = 23;    //写端口1设置
  CnRWInstruStepsIsWtDoPort3Set = 24;    //写端口1设置
  CnRWInstruStepsIsWtDoPort4Set = 25;    //写端口1设置

  CnRWInstruStepsIsWtDiPortSet  = 31;    //写输入设置
var
  RWInstruTmr : Integer;
Const
  CnRdDoSetFromInstruInfo : array[1..5] of array[1..2] of Integer
    = ( ($0380, $10),
        ($0390, $10),
        ($03A0, $10),
        ($03B0, $10),
        ($03CF, $01)
      );
Const    //通讯地址对应的端口号
  CnCommAddrToPortAddr : array[1..64] of array[1..3] of Integer
    = ( ($0380, $01, $01),
        ($0381, $01, $02),
        ($0382, $01, $03),
        ($0383, $01, $04),
        ($0384, $01, $05),
        ($0385, $01, $06),
        ($0386, $01, $07),
        ($0387, $01, $08),
        ($0388, $01, $09),
        ($0389, $01, $0A),
        ($038A, $01, $0B),
        ($038B, $01, $0C),
        ($038C, $01, $0D),
        ($038D, $01, $0E),
        ($038E, $01, $0F),
        ($038F, $01, $10),

        ($0390, $02, $01),
        ($0391, $02, $02),
        ($0392, $02, $03),
        ($0393, $02, $04),
        ($0394, $02, $05),
        ($0395, $02, $06),
        ($0396, $02, $07),
        ($0397, $02, $08),
        ($0398, $02, $09),
        ($0399, $02, $0A),
        ($039A, $02, $0B),
        ($039B, $02, $0C),
        ($039C, $02, $0D),
        ($039D, $02, $0E),
        ($039E, $02, $0F),
        ($039F, $02, $10),

        ($03A0, $03, $01),
        ($03A1, $03, $02),
        ($03A2, $03, $03),
        ($03A3, $03, $04),
        ($03A4, $03, $05),
        ($03A5, $03, $06),
        ($03A6, $03, $07),
        ($03A7, $03, $08),
        ($03A8, $03, $09),
        ($03A9, $03, $0A),
        ($03AA, $03, $0B),
        ($03AB, $03, $0C),
        ($03AC, $00, $00),
        ($03AD, $00, $00),
        ($03AE, $00, $00),
        ($03AF, $00, $00),

        ($03B0, $03, $0D),
        ($03B1, $03, $0E),
        ($03B2, $03, $0F),
        ($03B3, $03, $10),
        ($03B4, $04, $01),
        ($03B5, $04, $02),
        ($03B6, $04, $03),
        ($03B7, $04, $04),
        ($03B8, $04, $05),
        ($03B9, $04, $06),
        ($03BA, $04, $07),
        ($03BB, $04, $08),
        ($03BC, $00, $00),
        ($03BD, $00, $00),
        ($03BE, $00, $00),
        ($03BF, $00, $00)
      );
var
  SndDoProgValueByComm : array[1..64] of Integer;    //按通讯地址排列
  
implementation

uses UnitMain, UnitRWInstrument1MscommBuf, UnitGlobeVar, UnitPersonnelMangement;

{$R *.dfm}

procedure TFrmSignalDefine.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;

    if pos('[' + CntPermissonCode[CntSignalDefine] + 'e', PersonnelPermit) >= 1 then
    begin
        sBtRdCopy.Enabled := True;
        sBtSaveCopy.Enabled := True;
        sBtRdProgFromInstru.Enabled := True;
        sBtSendProgToInstru.Enabled := True;

        GBxOutBord1.Enabled := True;
        GBxOutBord2.Enabled := True;
        GBxOutBord3.Enabled := True;
        GBxOutExpBord.Enabled := True;

        GBxInBord1.Enabled := True;
        GBxInBord2.Enabled := True;
        GBxInBord3.Enabled := True;
    end
    else
    begin
        sBtRdCopy.Enabled := False;
        sBtSaveCopy.Enabled := False;
        sBtRdProgFromInstru.Enabled := False;
        sBtSendProgToInstru.Enabled := False;

        GBxOutBord1.Enabled := False;
        GBxOutBord2.Enabled := False;
        GBxOutBord3.Enabled := False;
        GBxOutExpBord.Enabled := False;

        GBxInBord1.Enabled := False;
        GBxInBord2.Enabled := False;
        GBxInBord3.Enabled := False;
    end;

end;

procedure TFrmSignalDefine.FormShow(Sender: TObject);
begin
    //

end;

procedure TFrmSignalDefine.sTabShtDoProgShow(Sender: TObject);
var
    GrdRow : Integer;
begin
    AdvStringGrid1.Cells[1,0] := '功能定义';
    AdvStringGrid1.Cells[2,0] := '设置值';

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from SignalProgHlp where SignalTp = 1 order by DspOrder';
    ADOQuery1.Open;
    GrdRow := 1;
    AdvStringGrid1.RowCount := ADOQuery1.RecordCount + 1;
    while not ADOQuery1.Eof do
    begin
        AdvStringGrid1.Cells[1 ,  GrdRow] := ADOQuery1.FieldByName('SignalNm').AsString;
        AdvStringGrid1.Cells[2 ,  GrdRow] := ADOQuery1.FieldByName('ProgDesc').AsString;
        GrdRow := GrdRow +1;
        ADOQuery1.Next;
    end;

    sBtRdCopy.Caption           := '读取输出备份配置';
    sBtSaveCopy.Caption         := '当前输出配置备份';
    sBtRdProgFromInstru.Caption := '读取控制器输出配置';
    sBtSendProgToInstru.Caption := '发送输出配置到控制器';

    //从控制器中读取输出设置
    sPanel1.Visible := True;
    sLabel1.Caption := '正在从控制器中读取输出设置，请耐心等待......';
    RWInstruTmr   := 0;
    RWInstruSteps := 1;
    ReadWordsFromInstrument1(RdInstruWaitReplyPt, CnRdDoSetFromInstruInfo[1][1], CnRdDoSetFromInstruInfo[1][2] );
    RWInstruType  := CnRWInstruTpIsRd;
    sProgressBar1.Position := 10;
end;

procedure TFrmSignalDefine.sTabShtDiProgShow(Sender: TObject);
var
    GrdRow : Integer;
begin
    AdvStringGrid2.Cells[1,0] := '功能定义';
    AdvStringGrid2.Cells[2,0] := '设置值';

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from SignalProgHlp where SignalTp = 2 order by DspOrder';
    ADOQuery1.Open;
    GrdRow := 1;
    AdvStringGrid2.RowCount := ADOQuery1.RecordCount + 1;
    while not ADOQuery1.Eof do
    begin
        AdvStringGrid2.Cells[1 ,  GrdRow] := ADOQuery1.FieldByName('SignalNm').AsString;
        AdvStringGrid2.Cells[2 ,  GrdRow] := ADOQuery1.FieldByName('ProgDesc').AsString;
        GrdRow := GrdRow +1;
        ADOQuery1.Next;
    end;

    sBtRdCopy.Caption           := '读取输入备份配置';
    sBtSaveCopy.Caption         := '当前输入配置备份';
    sBtRdProgFromInstru.Caption := '读取控制器输入配置';
    sBtSendProgToInstru.Caption := '发送输入配置到控制器';

    //从控制器中读取输入编程
    sPanel1.Visible := True;
    sLabel1.Caption := '正在从控制器中读取输入设置，请耐心等待......';
    RWInstruTmr   := 0;
    RWInstruSteps := CnRWInstruStepsIsRdDiPortSet;
    ReadWordsFromInstrument1(RdInstruWaitReplyPt, $0350, $18 );
    RWInstruType  := CnRWInstruTpIsRd;
    sProgressBar1.Position := 30;
end;

procedure TFrmSignalDefine.Timer1Timer(Sender: TObject);
var
    i : Integer;
    DoPortNum,
    DoBitNum  : Integer;
    sEdt : TsEdit;
    SendData : Array of Integer;
begin
    if RWInstruType <> CnRWInstruTpIsIdle then
    begin
        if (RWInstruSteps >=1) and (RWInstruSteps <=CnRWInstruStepsIsRdDoExpandEn) then    //读输出配置相关
        begin
            if Instruction1ReceiveBuf[RdInstruWaitReplyPt].Active then
            begin
                Instruction1ReceiveBuf[RdInstruWaitReplyPt].Active := False;

                if RWInstruSteps <= CnRWInstruStepsIsRdDoPort4Set then    //读输出定义
                begin
                    for i:=1 to Instruction1ReceiveBuf[RdInstruWaitReplyPt].ReceiveByteCount div 2 do
                    begin
                        DoPortNum := CnCommAddrToPortAddr[(RWInstruSteps-1) *$10 + i][2];
                        DoBitNum  := CnCommAddrToPortAddr[(RWInstruSteps-1) *$10 + i][3];
                        if ( (DoPortNum >= $01) and (DoPortNum <= $04) ) and ( (DoBitNum >=$01) and (DoBitNum <= $10) ) then
                        begin
                            sEdt := TsEdit(FindComponent('sEtDo' + IntToStr((DoPortNum-1)*$10 + DoBitNum) + 'Set'));
                            sEdt.Text := IntToHex(Instruction1ReceiveBuf[RdInstruWaitReplyPt].ReceiveByte[(i-1)*2] *256 + Instruction1ReceiveBuf[RdInstruWaitReplyPt].ReceiveByte[(i-1)*2 +1] , 2);
                        end;
                    end;
                end
                else    //读是否使用扩展输出
                begin
                    if RWInstruSteps = CnRWInstruStepsIsRdDoExpandEn then       //扩展输出是否使用
                    begin
                        if Instruction1ReceiveBuf[RdInstruWaitReplyPt].ReceiveByte[0] *256 + Instruction1ReceiveBuf[RdInstruWaitReplyPt].ReceiveByte[1] = $01 then
                        begin
                            CheckBox1.Checked  := True;
                        end
                        else
                        begin
                            CheckBox1.Checked  := False;
                        end;
                    end;
                end;

                RWInstruSteps := RWInstruSteps + 1;
                if RWInstruSteps <= CnRWInstruStepsIsRdDoExpandEn then
                begin
                    ReadWordsFromInstrument1(RdInstruWaitReplyPt, CnRdDoSetFromInstruInfo[RWInstruSteps][1], CnRdDoSetFromInstruInfo[RWInstruSteps][2] );
                    sProgressBar1.Position := RWInstruSteps *20 +10;
                end
                else
                begin
                    RWInstruType := CnRWInstruTpIsIdle ;
                    sPanel1.Visible := False;
                end;
            end
            else
            begin
                RWInstruTmr := RWInstruTmr + Timer1.Interval;

                if RWInstruTmr >= 2000 then
                begin
                    RWInstruType := CnRWInstruTpIsIdle;
                    Showmessage('读取控制器输出设置失败!');
                end;
            end;
        end

        else if RWInstruSteps = CnRWInstruStepsIsRdDiPortSet then    //读输入编程
        begin
            if Instruction1ReceiveBuf[RdInstruWaitReplyPt].Active then
            begin
                Instruction1ReceiveBuf[RdInstruWaitReplyPt].Active := False;

                if (Instruction1ReceiveBuf[RdInstruWaitReplyPt].ReceiveCmd and $80) = $00 then
                begin
                    RWInstruType := CnRWInstruTpIsIdle;
                    DiProgDspFromInstru(RdInstruWaitReplyPt);
                    sProgressBar1.Position := 100;
                    sPanel1.Visible := False;
                end
                else
                begin
                    RWInstruType := CnRWInstruTpIsIdle;
                    Showmessage('读取控制器输入编程失败!');
                    sPanel1.Visible := False;
                end;

            end
            else
            begin
                RWInstruTmr := RWInstruTmr + Timer1.Interval;
                if RWInstruTmr >= 2000 then
                begin
                    RWInstruType := CnRWInstruTpIsIdle;
                    Showmessage('读取控制器输入编程失败!');
                    sPanel1.Visible := False;
                end;
            end;
        end

        else if (RWInstruSteps >=CnRWInstruStepsIsWtDoExpandEn) and (RWInstruSteps <=CnRWInstruStepsIsWtDoPort4Set) then    //读输出配置相关
        begin
            if Instruction1ReceiveBuf[RdInstruWaitReplyPt].Active then
            begin
                Instruction1ReceiveBuf[RdInstruWaitReplyPt].Active := False;

                if (Instruction1ReceiveBuf[RdInstruWaitReplyPt].ReceiveCmd and $80) = $00 then
                begin
                    RWInstruSteps := RWInstruSteps +1;
                    if (RWInstruSteps <= CnRWInstruStepsIsWtDoPort4Set) then
                    begin
                        SetLength(SendData, $10);
                        for i:=1 to $10 do
                        begin
                            SendData[i-1] := SndDoProgValueByComm[(RWInstruSteps - CnRWInstruStepsIsWtDoPort1Set) *$10 +i];
                        end;
                        WtWordSToInstucment1MscommBuf( RdInstruWaitReplyPt,
                                                       CnCommAddrToPortAddr[(RWInstruSteps - CnRWInstruStepsIsWtDoPort1Set) *$10 +1][1],
                                                       SendData,
                                                       $10);
                        sProgressBar1.Position := (RWInstruSteps - CnRWInstruStepsIsWtDoExpandEn +1) *20 + 10;
                    end
                    else
                    begin
                        RWInstruType    := CnRWInstruTpIsIdle;
                        messagebox(getfocus,pchar('写输出编程到控制器完成!'), '提示信息', MB_OK) ;
                        sPanel1.Visible := False;
                    end;
                end
                else
                begin
                    RWInstruType  := CnRWInstruTpIsIdle;
                    Showmessage('写输出编程到控制器失败!');
                    sPanel1.Visible := False;
                end;
            end
            else
            begin
                RWInstruTmr := RWInstruTmr + Timer1.Interval;
                if RWInstruTmr >= 2000 then
                begin
                    RWInstruType  := CnRWInstruTpIsIdle;
                    Showmessage('写输出编程到控制器失败!');
                    sPanel1.Visible := False;
                end;
            end;
        end

        else if RWInstruSteps = CnRWInstruStepsIsWtDiPortSet then
        begin
            if Instruction1ReceiveBuf[RdInstruWaitReplyPt].Active then
            begin
                Instruction1ReceiveBuf[RdInstruWaitReplyPt].Active := False;

                if (Instruction1ReceiveBuf[RdInstruWaitReplyPt].ReceiveCmd and $80) = $00 then
                begin
                    sProgressBar1.Position := 100;
                    RWInstruSteps := CnRWInstruTpIsIdle;
                    sPanel1.Visible := False;
                    Showmessage('发送输入编程到控制器成功!');

                end
                else
                begin
                    RWInstruType  := CnRWInstruTpIsIdle;
                    Showmessage('发送输入编程到控制器失败!');
                    sPanel1.Visible := False;
                end;
            end
            else
            begin
                RWInstruTmr := RWInstruTmr + Timer1.Interval;
                if RWInstruTmr >= 2000 then
                begin
                    RWInstruType  := CnRWInstruTpIsIdle;
                    Showmessage('写输如编程到控制器失败!');
                    sPanel1.Visible := False;
                end;
            end;
         {----------------------------------------------------------------------
        RWInstruTmr := 0;
        RWInstruType  := CnRWInstruTpIsWt;
        RWInstruSteps := CnRWInstruStepsIsWtDoExpandEn;

        sProgressBar1.Position := 10;
        --------------------------------------------------------------------- }
        end;
    end;
    {------------------------------------------------------------------------
        RdInstruWaitReplyPt : Integer;
  RWInstruSteps       : Integer;
Const
  CnRWInstruStepsIsRdDoPort1Set = 1;
  CnRWInstruStepsIsRdDoPort2Set = 2;
  CnRWInstruStepsIsRdDoPort3Set = 3;
  CnRWInstruStepsIsRdDoPort4Set = 4;
  CnRWInstruStepsIsRdDoExpandEn = 5;     //读输出扩展是否使用

    CnRWInstruStepsIsRdDiPortSet  = 11;    //读取输入设置

  CnRWInstruStepsIsWtDoExpandEn = 21;    //写输出扩展使能
  CnRWInstruStepsIsWtDoPort1Set = 22;    //写端口1设置
  CnRWInstruStepsIsWtDoPort2Set = 23;    //写端口1设置
  CnRWInstruStepsIsWtDoPort3Set = 24;    //写端口1设置
  CnRWInstruStepsIsWtDoPort4Set = 25;    //写端口1设置

  CnRWInstruStepsIsWtDiPortSet  = 31;    //写输入设置
        ------------------------------------------------------------------------ }


    
end;

procedure TFrmSignalDefine.DiProgDspFromInstru(CommRecieveBlockPt : Integer);
var
    i    : Integer;
    sEdt : TsEdit;
begin
    for i:= 1 to Instruction1ReceiveBuf[CommRecieveBlockPt].ReceiveByteCount div 2 do
    begin
        sEdt := TsEdit(FindComponent('sEtDi' + inttostr(i) +'Set'));
        sEdt.Text := IntToHex( Instruction1ReceiveBuf[CommRecieveBlockPt].ReceiveByte[(i-1) *2] *256 + Instruction1ReceiveBuf[CommRecieveBlockPt].ReceiveByte[(i-1) *2 +1], 2 );
    end;
end;

procedure TFrmSignalDefine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmSignalDefineCrt := False;
    Action := caFree;
end;

procedure TFrmSignalDefine.sBtSendProgToInstruClick(Sender: TObject);
begin
    if sPageControl1.ActivePage = sTabShtDoProg then
    begin
        SendDoProgToInstrun();
    end
    else if sPageControl1.ActivePage = sTabShtDiProg then
    begin
        SendDiProgToInstrun();
    end;
end;

procedure TFrmSignalDefine.SendDoProgToInstrun();
var
    i : Integer;
    PortNum ,
    BitNum  : Integer;
    sEdt    : TsEdit;
begin
    if messagebox(getfocus, Pchar('确定要把新的输出编程，下载到控制器吗?'), '系统询问', MB_YESNO) = idYes then
    begin
        for i:=1 to 64 do
        begin
            PortNum := CnCommAddrToPortAddr[i][2];
            BitNum  := CnCommAddrToPortAddr[i][3];
            if ( PortNum>=$01) and (PortNum<=$04 ) and (BitNum>=$01) and (BitNum<=$10) then
            begin
                sEdt := TsEdit(FindComponent('sEtDo' + inttostr((PortNum -1) *$10 + BitNum) +'Set'));
                if Trim(sEdt.Text) <> '' then
                begin
                    SndDoProgValueByComm[i] := StrToInt('$' + Trim(sEdt.Text)) ;

                end
                else
                begin
                    SndDoProgValueByComm[i] := $00;
                end;
            end
            else
            begin
                SndDoProgValueByComm[i] := $00;
            end;
        end;


        sLabel1.Caption := '写新的编程到控制器';
        sPanel1.Visible := True;

        if CheckBox1.Checked then
            WtAWordToInstument1MscommBuf(RdInstruWaitReplyPt, $03CF, $0001)               //写一个字到通讯缓冲区
        else
            WtAWordToInstument1MscommBuf(RdInstruWaitReplyPt, $03CF, $0000);

        RWInstruTmr := 0;
        RWInstruType  := CnRWInstruTpIsWt;
        RWInstruSteps := CnRWInstruStepsIsWtDoExpandEn;

        sProgressBar1.Position := 10;
    end;
end;

procedure TFrmSignalDefine.SendDiProgToInstrun();
var
    i    : Integer;
    sEdt : TsEdit;
    SendDiProgValue : array[0..$18 -1] of Integer;
begin
    if messagebox(getfocus, Pchar('确定要把新的输出编程，下载到控制器吗?'), '系统询问', MB_YESNO) = idYes then
    begin
        sLabel1.Caption := '写新的输入编程到控制器';
        sPanel1.Visible := True;

        for i:= 0 to $18 -1 do
        begin
            sEdt := TsEdit(FindComponent('sEtDi' + inttostr(i+1) +'Set'));
            SendDiProgValue[i] := StrToInt('$' + Trim(sEdt.Text));
        end;
        WtWordSToInstucment1MscommBuf(RdInstruWaitReplyPt, $0350, SendDiProgValue, $18);

        RWInstruTmr := 0;
        RWInstruType  := CnRWInstruTpIsWt;
        RWInstruSteps := CnRWInstruStepsIsWtDiPortSet;

        sProgressBar1.Position := 30;
    end;
end;

procedure TFrmSignalDefine.sBtSaveCopyClick(Sender: TObject);
begin
    if sPageControl1.ActivePage = sTabShtDoProg then
    begin
        SaveDoProgToDb();
    end
    else if sPageControl1.ActivePage = sTabShtDiProg then
    begin
        SaveDiProgToDb();
    end;
end;

procedure TFrmSignalDefine.SaveDoProgToDb();
var
    i : Integer;
    PortNum ,
    BitNum  : Integer;
    sEdt    : TsEdit;
begin
    if messagebox(getfocus, Pchar('确定要把新的输出编程，备份到本地计算机吗?'), '系统询问', MB_YESNO) = idYes then
    begin
        sLabel1.Caption := '输出编程备份到本地计算机...';
        sPanel1.Visible := True;

        try
            FrmMain.ADOConnection.BeginTrans;

            sProgressBar1.Position := 36;

            for i:=1 to 64 do
            begin
                PortNum := CnCommAddrToPortAddr[i][2];
                BitNum  := CnCommAddrToPortAddr[i][3];
                if ( PortNum>=$01) and (PortNum<=$04 ) and (BitNum>=$01) and (BitNum<=$10) then
                begin
                    sEdt := TsEdit(FindComponent('sEtDo' + inttostr((PortNum -1) *$10 + BitNum) +'Set'));
                    if Trim(sEdt.Text) <> '' then
                    begin
                        SndDoProgValueByComm[i] := StrToInt('$' + Trim(sEdt.Text)) ;
                    end
                    else
                    begin
                        SndDoProgValueByComm[i] := $00;
                    end;
                end
                else
                begin
                    SndDoProgValueByComm[i] := $00;
                end;

                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Text := 'update SignalProg set SignalProg=' + inttostr(SndDoProgValueByComm[i]) + ' ' + 'where SignalTp=1 and SignalNumb=' + inttostr(i);
                ADOQuery1.ExecSQL;

                sProgressBar1.Position := sProgressBar1.Position +1;;
            end;

            FrmMain.ADOConnection.CommitTrans;
            Showmessage('备份输出编程到本地计算机成功!');
            sPanel1.Visible := False;

        except
            FrmMain.ADOConnection.RollbackTrans;
            Showmessage('备份输出编程到本地计算机失败!');
        end;
    end;
end;

procedure TFrmSignalDefine.SaveDiProgToDb();
var
    i    : Integer;
    sEdt : TsEdit;
begin
    if messagebox(getfocus, Pchar('确定要把新的输入编程，备份到本地计算机吗?'), '系统询问', MB_YESNO) = idYes then
    begin
        sLabel1.Caption := '输入编程备份到本地计算机...';
        sPanel1.Visible := True;

        try
            FrmMain.ADOConnection.BeginTrans;

            sProgressBar1.Position := 4;

            for i:= 1 to $18 do
            begin
                sEdt := TsEdit(FindComponent('sEtDi' + inttostr(i) +'Set'));

                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Text := 'update SignalProg set SignalProg=' + inttostr(StrToInt('$' + Trim(sEdt.Text))) + ' ' + 'where SignalTp=2 and SignalNumb=' + inttostr(i);
                ADOQuery1.ExecSQL;

                sProgressBar1.Position := sProgressBar1.Position + 4;
            end;

            FrmMain.ADOConnection.CommitTrans;
            Showmessage('备份输入编程到本地计算机成功!');
            sPanel1.Visible := False;

        except
            FrmMain.ADOConnection.RollbackTrans;
            Showmessage('备份输入编程到本地计算机失败!');
        end;
    end;
end;

procedure TFrmSignalDefine.sBtRdCopyClick(Sender: TObject);
begin
    if sPageControl1.ActivePage = sTabShtDoProg then
    begin
        RdDoProgFromDb();
    end
    else if sPageControl1.ActivePage = sTabShtDiProg then
    begin
        RdDiProgFromDb();
    end;
end;

procedure TFrmSignalDefine.RdDoProgFromDb();
var
    sEdt : TsEdit;
    PortNum ,
    BitNum  : Integer;
    SinganlNumb : Integer;
begin
    if messagebox(getfocus, Pchar('确定要读取输出编程备份吗?'), '系统询问', MB_YESNO) = idYes then
    begin
        sLabel1.Caption := '读取输出编程备份...';
        sPanel1.Visible := True;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select * from SignalProg where SignalTp=1 and SignalNumb <= 64';
        ADOQuery1.Open;

        sProgressBar1.Position := 36;

        while not ADOQuery1.Eof do
        begin
            SinganlNumb := ADOQuery1.fieldByName('SignalNumb').AsInteger;
            PortNum := CnCommAddrToPortAddr[SinganlNumb][2];
            BitNum  := CnCommAddrToPortAddr[SinganlNumb][3];
            if ( PortNum>=$01) and (PortNum<=$04 ) and (BitNum>=$01) and (BitNum<=$10) then
            begin
                sEdt := TsEdit(FindComponent('sEtDo' + inttostr((PortNum -1) *$10 + BitNum) +'Set'));
                sEdt.Text := IntToHex(ADOQuery1.FieldByName('SignalProg').AsInteger, 2);
            end;

            sProgressBar1.Position := sProgressBar1.Position + 1;

            ADOQuery1.Next;
        end;

        ADOQuery1.Close;
        Showmessage('读取输出编程备份，完成');
        sPanel1.Visible := False;
    end;
end;

procedure TFrmSignalDefine.RdDiProgFromDb();
var
    sEdt : TsEdit;
    SinganlNumb : Integer;
begin
    if messagebox(getfocus, Pchar('确定要读取输入编程备份吗?'), '系统询问', MB_YESNO) = idYes then
    begin
        sLabel1.Caption := '读取输入编程备份...';
        sPanel1.Visible := True;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select * from SignalProg where SignalTp=2 and SignalNumb <= 24';
        ADOQuery1.Open;

        sProgressBar1.Position := 4;

        while not ADOQuery1.Eof do
        begin
            SinganlNumb := ADOQuery1.fieldByName('SignalNumb').AsInteger;

            sEdt := TsEdit(FindComponent('sEtDi' + inttostr(SinganlNumb) +'Set'));
            sEdt.Text := IntToHex(ADOQuery1.FieldByName('SignalProg').AsInteger, 2);

            sProgressBar1.Position := sProgressBar1.Position + 4;

            ADOQuery1.Next;
        end;

        ADOQuery1.Close;
        Showmessage('读取输入编程备份，完成');
        sPanel1.Visible := False;
    end;
end;

procedure TFrmSignalDefine.sBtRdProgFromInstruClick(Sender: TObject);
begin
    if sPageControl1.ActivePage = sTabShtDoProg then
    begin
        RdDoProgFromInstru();
    end
    else if sPageControl1.ActivePage = sTabShtDiProg then
    begin
        RdDiProgFromInstru();
    end;
end;

procedure TFrmSignalDefine.RdDoProgFromInstru();
begin
    //从控制器中读取输出设置
    sPanel1.Visible := True;
    sLabel1.Caption := '正在从控制器中读取输出设置，请耐心等待......';
    RWInstruTmr   := 0;
    RWInstruSteps := 1;
    ReadWordsFromInstrument1(RdInstruWaitReplyPt, CnRdDoSetFromInstruInfo[1][1], CnRdDoSetFromInstruInfo[1][2] );
    RWInstruType  := CnRWInstruTpIsRd;
    sProgressBar1.Position := 10;
end;

procedure TFrmSignalDefine.RdDiProgFromInstru();
begin
    //从控制器中读取输入编程
    sPanel1.Visible := True;
    sLabel1.Caption := '正在从控制器中读取输入设置，请耐心等待......';
    RWInstruTmr   := 0;
    RWInstruSteps := CnRWInstruStepsIsRdDiPortSet;
    ReadWordsFromInstrument1(RdInstruWaitReplyPt, $0350, $18 );
    RWInstruType  := CnRWInstruTpIsRd;
    sProgressBar1.Position := 30;
end;

end.
