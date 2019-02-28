unit UnitWeigDschRemain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, Math;

type
  TFrmWeigDschRemain = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SendRemainToInstrument();
  public
    { Public declarations }
  end;

var
  FrmWeigDschRemain: TFrmWeigDschRemain;

implementation

uses UnitGlobeVar, UnitRWInstrument1MscommBuf;

{$R *.dfm}

procedure TFrmWeigDschRemain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmWeigDschRemainCrt := False;
    Action := caFree;
end;

procedure TFrmWeigDschRemain.FormShow(Sender: TObject);
begin
    Label1.Caption := WeigherInfo[PMWeigherId].Name;
end;

procedure TFrmWeigDschRemain.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in['0'..'9', '.', #8, #13]) then Key := #0;

    if Key = #13 then
    begin
        SendRemainToInstrument();
    end;
end;

procedure TFrmWeigDschRemain.sBitBtn2Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmWeigDschRemain.sBitBtn1Click(Sender: TObject);
begin
    SendRemainToInstrument();
end;

procedure TFrmWeigDschRemain.SendRemainToInstrument();
var
    WeigDecimal : Integer;
    InputFloate : Double;
    RemainValue : Integer;
    MscommReceiveBufPf : Integer;
begin
    WeigDecimal := WeigherPara[PMWeigherId][CntWeigherDecimalIndex].Value ;

    try
        InputFloate := StrToFloat(Trim(Edit1.Text));
    except
        InputFloate := 0.0;
    end;

    if InputFloate < 0.00001 then exit;

    RemainValue := Trunc( RoundTo(InputFloate * power(10, WeigDecimal), -0) );

    WtAWordToInstument1MscommBuf(MscommReceiveBufPf, $040D + (PMWeigherId -1) *$20, RemainValue);                //写一个字到通讯缓冲区

    Self.Close;
end;



end.
