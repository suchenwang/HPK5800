unit UnitSysUnlock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, ExtCtrls, sPanel, sButton, sEdit, sGroupBox, Inifiles
  ;

type
  TFrmSysUnlock = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sLbSerialNumber: TsLabel;
    sLabel3: TsLabel;
    sLbRequstCode: TsLabel;
    sGroupBox2: TsGroupBox;
    EtDecode1: TsEdit;
    EtDecode2: TsEdit;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    EtDecode3: TsEdit;
    sLabel7: TsLabel;
    EtDecode4: TsEdit;
    sBtUnlock: TsButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EtDecode1KeyPress(Sender: TObject; var Key: Char);
    procedure EtDecode2KeyPress(Sender: TObject; var Key: Char);
    procedure EtDecode3KeyPress(Sender: TObject; var Key: Char);
    procedure EtDecode4KeyPress(Sender: TObject; var Key: Char);
    procedure EtDecode1Change(Sender: TObject);
    procedure EtDecode2Change(Sender: TObject);
    procedure EtDecode3Change(Sender: TObject);
    procedure EtDecode4Change(Sender: TObject);
    procedure sBtUnlockClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSysUnlock: TFrmSysUnlock;

implementation

uses UnitGlobeVar,
     UnitSoftAuthorization, UnitMain;

{$R *.dfm}

procedure TFrmSysUnlock.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmSysUnlockCrt := False;
    Action := caFree;
end;

procedure TFrmSysUnlock.FormShow(Sender: TObject);
var
    IniFile : TIniFile;
    RequstCode : String;
begin
    sLbSerialNumber.Caption := HaspKeyId;

    IniFile := TInifile.Create(ExtractFilePath(Application.ExeName) + 'set.ini');
    RequstCode := IniFile.ReadString('Application', 'Code', '') ;
    if RequstCode = '' then
    begin
        randomize;
        IniFile.WriteString ( 'Application', 'Code', format('%.4d', [random(9999)]) );
        RequstCode := IniFile.ReadString('Application', 'Code', '') ;
    end;
    IniFile.Free;

    sLbRequstCode.Caption := RequstCode;
end;

procedure TFrmSysUnlock.EtDecode1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9']) then Key:=#0;
end;

procedure TFrmSysUnlock.EtDecode2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9']) then Key:=#0;
end;

procedure TFrmSysUnlock.EtDecode3KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9']) then Key:=#0;
end;

procedure TFrmSysUnlock.EtDecode4KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9']) then Key:=#0;
end;

procedure TFrmSysUnlock.EtDecode1Change(Sender: TObject);
var
    DecodeStr : String;
begin
    DecodeStr := EtDecode1.Text;
    if Length(DecodeStr) >= 6 then
    begin
        EtDecode1.Text := copy(DecodeStr, 1, 6);
        delete(Decodestr, 1, 6);
        EtDecode2.Text := Decodestr;
        EtDecode2.SetFocus;
    end;
end;

procedure TFrmSysUnlock.EtDecode2Change(Sender: TObject);
var
    DecodeStr : String;
begin
    DecodeStr := EtDecode2.Text;
    if Length(DecodeStr) >= 6 then
    begin
        EtDecode2.Text := copy(DecodeStr, 1, 6);
        delete(Decodestr, 1, 6);
        EtDecode3.Text := Decodestr;
        EtDecode3.SetFocus;
    end;
end;

procedure TFrmSysUnlock.EtDecode3Change(Sender: TObject);
var
    DecodeStr : String;
begin
    DecodeStr := EtDecode3.Text;
    if Length(DecodeStr) >= 6 then
    begin
        EtDecode3.Text := copy(DecodeStr, 1, 6);
        delete(Decodestr, 1, 6);
        EtDecode4.Text := Decodestr;
        EtDecode4.SetFocus;
    end;
end;

procedure TFrmSysUnlock.EtDecode4Change(Sender: TObject);
var
    DecodeStr : String;
begin
    DecodeStr := EtDecode4.Text;
    if Length(DecodeStr) >= 6 then
    begin
        EtDecode4.Text := copy(DecodeStr, 1, 6);
    end;
end;

procedure TFrmSysUnlock.sBtUnlockClick(Sender: TObject);
var
    DecodeStr : String;
    UnlockInfo : String;
    ExUnlockRlt : Integer;
    IniFile : TIniFile;
    RequstCode : String;
begin
    DecodeStr := Trim(EtDecode1.Text)
               + Trim(EtDecode2.Text)
               + Trim(EtDecode3.Text)
               + Trim(EtDecode4.Text);

    IniFile := TInifile.Create(ExtractFilePath(Application.ExeName) + 'set.ini');
    RequstCode := IniFile.ReadString('Application', 'Code', '') ;
    if RequstCode = '' then
    begin
        randomize;
        IniFile.WriteString ( 'Application', 'Code', format('%.4d', [random(9999)]) );
        RequstCode := IniFile.ReadString('Application', 'Code', '') ;
    end;
    IniFile.Free;

               
    ExUnlockRlt := HaspKeyUnlock( DecodeStr, UnlockInfo, RequstCode );
    if ExUnlockRlt = 0 then
    begin
        IniFile := TInifile.Create(ExtractFilePath(Application.ExeName) + 'set.ini');
        IniFile.WriteString ( 'Application', 'Code', '') ;
        IniFile.Free;

        FrmMain.Panel2.Visible := False;
        Self.Close;
    end
    else
    begin
        Showmessage('Ω‚À¯ ß∞‹! ' + UnlockInfo );
    end;
end;

end.
