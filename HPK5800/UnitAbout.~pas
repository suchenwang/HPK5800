unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, DB, ADODB;

type
  TFrmAbout = class(TForm)
    GroupBox1: TGroupBox;
    RzLabel1: TRzLabel;
    Label1: TLabel;
    LbProjectNm: TLabel;
    LbProjectId: TLabel;
    ADOQuery1: TADOQuery;
    LbDbVer: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbout: TFrmAbout;

implementation

{$R *.dfm}

uses UnitGlobeVar, UnitMain;

procedure TFrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmSysAboutCrt := False;
    Action := caFree;
end;

procedure TFrmAbout.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;
end;

procedure TFrmAbout.FormShow(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from DbVef where ID=1';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        LbProjectNm.Caption := ADOQuery1.FieldByName('Des').AsString;
        LbProjectId.Caption := ADOQuery1.FieldByName('Vef').AsString;
        LbDbVer.Caption     := ADOQuery1.FieldByName('Ver').AsString;
    end
    else
    begin
        LbProjectNm.Caption := '';
        LbProjectId.Caption := '';
        LbDbVer.Caption     := '';
    end;
end;

end.
