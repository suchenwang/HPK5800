unit UnitWeighCalValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, Mask, sMaskEdit, math;

type
  TFrmWeigherCalValue = class(TForm)
    Label1: TLabel;
    sMaskEdit1: TsMaskEdit;
    Label2: TLabel;
    sBitBtn1: TsBitBtn;
    procedure sMaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SendWeighCalValue();
    
  public
    { Public declarations }
  end;

var
  FrmWeigherCalValue: TFrmWeigherCalValue;

implementation

uses UnitGlobeVar, UnitRWInstrument1MscommBuf, UnitMain;

{$R *.dfm}

procedure TFrmWeigherCalValue.sMaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (key in ['0'..'9', '.', #8, #13]) then Key := #0;

    if Key=#13 then
    begin
        SendWeighCalValue();
    end;
end;

procedure TFrmWeigherCalValue.SendWeighCalValue();
var
    CalVauleF : Double;
    CalValueI : Integer;
    SendData : array[0..2] of Integer;
begin
    try
        CalVauleF := StrToFloat(Trim(sMaskEdit1.Text));
    except
        CalVauleF := 0.0 ;
        Showmessage('无效的砝码值!');
        exit;
    end;

    CalVauleF := CalVauleF * Power(10, WeigherPara[PmWeigherId][CntWeigherDecimalIndex].Value);
    CalValueI := Trunc(RoundTo(CalVauleF, -0));

    SendData[0] := PmWeigherId -1;
    SendData[1] := CalValueI;

    MscommStateInFrmMain := CntMscommCmdIsCalValue;
    MscommTmrInFrmMain := 0;
    FrmMain.TmrMscomStateDsp.Enabled := True;
    WtWordSToInstucment1MscommBuf(MscommReceiveBufPfInFrmMain, $0202, SendData, 2);    //写多个数到通讯缓冲区
        
end;

procedure TFrmWeigherCalValue.sBitBtn1Click(Sender: TObject);
begin
    SendWeighCalValue();
end;

procedure TFrmWeigherCalValue.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmWeigherCalValueCrt := False;
    Action := caFree;
end;

end.
