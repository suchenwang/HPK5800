unit UnitConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, StdCtrls,
  sComboBox, sGroupBox, cxPC, DB, ADODB;

type
  TFrmConfig = class(TForm)
    cxPageControl1: TcxPageControl;
    ShtMixer: TcxTabSheet;
    Button1: TButton;
    sGBxMixerDschMode: TsGroupBox;
    Label6: TLabel;
    sCmbBxTaskCode: TsComboBox;
    Query1: TADOQuery;
    shtLeftBelt: TcxTabSheet;
    sGBxBelt: TsGroupBox;
    radBtnBeltRun: TRadioButton;
    radBtnRunStop: TRadioButton;
    procedure ShtMixerShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sCmbBxTaskCodeChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure shtLeftBeltShow(Sender: TObject);
    procedure radBtnBeltRunClick(Sender: TObject);
    procedure radBtnRunStopClick(Sender: TObject);
  private
    { Private declarations }
    procedure WtMixerDschModeIntoDb(DschMode : Integer);
    procedure InitPermissonInFrmConfig();
    
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

  ConfigChange : Boolean;

implementation

uses UnitGlobeVar, UnitMain, UnitSetPassWord, UnitPersonnelMangement;

{$R *.dfm}

procedure TFrmConfig.FormCreate(Sender: TObject);
begin
    ConfigChange := False;
    Query1.Connection := FrmMain.ADOConnection;

    cxPageControl1.ActivePageIndex := 0;

    //权限初始化
    InitPermissonInFrmConfig();
end;

procedure TFrmConfig.InitPermissonInFrmConfig();
begin
    if pos('[' + CntPermissonCode[CntSysConfig] + 'e', PersonnelPermit) >= 1 then
    begin
        sGBxMixerDschMode.Enabled := True;
        sGBxBelt.Enabled          := True;
    end
    else
    begin
        sGBxMixerDschMode.Enabled := False;
        sGBxBelt.Enabled          := False;
    end;
end;

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if ConfigChange then
        Showmessage('设备配置发生改变，须重新启动软件，方能生效');

    FrmConfigCrt := False;
    Action       := caFree;
end;

procedure TFrmConfig.ShtMixerShow(Sender: TObject);
begin
    case MixerInfo.DschMode of
        CntMixerDischOne :    //单气缸气动卸料
        begin
            sCmbBxTaskCode.ItemIndex := 0;
        end;

        CntMixerDischTwo :    // 液压卸料
        begin
            sCmbBxTaskCode.ItemIndex := 1;
        end;
    end;
end;

procedure TFrmConfig.sCmbBxTaskCodeChange(Sender: TObject);
begin
    if (MixerInfo.DschMode = CntMixerDischOne) and (sCmbBxTaskCode.Text <> '卸料门自动复位—气动卸料') then
    begin
        WtMixerDschModeIntoDb(CntMixerDischTwo);
        ConfigChange := True;
    end
    else if (MixerInfo.DschMode = CntMixerDischTwo) and (sCmbBxTaskCode.Text <> '卸料门自保持——液压卸料') then
    begin
        WtMixerDschModeIntoDb(CntMixerDischOne);
        ConfigChange := True;
    end;
end;

procedure TFrmConfig.WtMixerDschModeIntoDb(DschMode : Integer);
var
    MixerInfo : String;
    SubStrPos : Integer;
begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Text := 'select * from Mixer where ID=1';
    Query1.Open;
    if not Query1.Eof then
    begin
        MixerInfo := Query1.FieldByName('Attribute').AsString;
    end
    else
    begin
        Showmessage('获取数据库失败');
        exit;
    end;

    case DschMode of
        CntMixerDischOne :    //单气缸气动卸料
        begin
            MixerInfo := StringReplace(MixerInfo, 'b', 'c',[rfReplaceAll, rfIgnoreCase]);
        end;

        CntMixerDischTwo :
        begin
            MixerInfo := StringReplace(MixerInfo, 'c', 'b',[rfReplaceAll, rfIgnoreCase]);
        end;
    end;

    try
        FrmMain.ADOConnection.BeginTrans;
        Query1.Close;
        Query1.SQL.Clear;
        Query1.SQL.Text := 'update Mixer set Attribute=' + '''' + MixerInfo + '''';
        Query1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        showmessage('更新数据库失败');
    end; 
end;

procedure TFrmConfig.Button1Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmConfig.shtLeftBeltShow(Sender: TObject);
var
    BeltFlags : String;
begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Text := 'select * from AggreConveyorEquip where id>=1 and id<=6 and Flags like ' + '''' + '%1%' + '''';
    Query1.Open;
    if not Query1.Eof then
    begin
        BeltFlags := Query1.FieldByName('Flags').AsString;
        if pos('d', BeltFlags) < 1 then
            radBtnBeltRun.Checked := True
        else
            radBtnRunStop.Checked := True;
    end
    else
    begin
        Showmessage('获取平皮带设置失败');
    end;
end;

procedure TFrmConfig.radBtnBeltRunClick(Sender: TObject);
var
    BeltFlags : String;
    subStrPos : Integer;
    RdId      : Integer;
begin
    if radBtnBeltRun.Focused then
    begin
        if radBtnBeltRun.Checked then
        begin
            Query1.Close;
            Query1.SQL.Clear;
            Query1.SQL.Text := 'select * from AggreConveyorEquip where id>=1 and id<=6 and Flags like ' + '''' + '%1%' + '''';
            Query1.Open;
            if not Query1.Eof then
            begin
                BeltFlags := Query1.FieldByName('Flags').AsString;
                RdId      := Query1.FieldByName('id').AsInteger;
                subStrPos := pos('d', BeltFlags) ;
                if subStrPos >= 1 then
                begin
                    delete(BeltFlags, subStrPos, 1);
                end;
            end
            else
            begin
                Showmessage('获取平皮带设置失败');
            end;
            
            try
                FrmMain.ADOConnection.BeginTrans;
                Query1.Close;
                Query1.SQL.Text := 'update AggreConveyorEquip set Flags=' + '''' + BeltFlags + '''' + ' where ID=' + inttostr(RdId);
                Query1.ExecSQL;
                FrmMain.ADOConnection.CommitTrans;
            except
                FrmMain.ADOConnection.RollbackTrans;
                Showmessage('更新数据库失败');
            end;

            ConfigChange := True;
        end;
    end;
end;

procedure TFrmConfig.radBtnRunStopClick(Sender: TObject);
var
    BeltFlags : String;
    subStrPos : integer;
    RdId      : integer;
begin
    if radBtnRunStop.Focused then
    begin
        if radBtnRunStop.Checked then
        begin
            Query1.Close;
            Query1.SQL.Clear;
            Query1.SQL.Text := 'select * from AggreConveyorEquip where id>=1 and id<=6 and Flags like ' + '''' + '%1%' + '''';
            Query1.Open;
            if not Query1.Eof then
            begin
                BeltFlags := Query1.FieldByName('Flags').AsString;
                RdId      := Query1.FieldByName('id').AsInteger;
                subStrPos := pos('d', BeltFlags) ;
                if subStrPos < 1 then
                begin
                    BeltFlags := BeltFlags + 'd';
                end;
            end
            else
            begin
                Showmessage('获取平皮带设置失败');
            end;
            
            try
                FrmMain.ADOConnection.BeginTrans;
                Query1.Close;
                Query1.SQL.Text := 'update AggreConveyorEquip set Flags=' + '''' + BeltFlags + '''' + ' where ID=' + inttostr(RdId);
                Query1.ExecSQL;
                FrmMain.ADOConnection.CommitTrans;
            except
                FrmMain.ADOConnection.RollbackTrans;
                Showmessage('更新数据库失败');
            end;

            ConfigChange := True;
        end;
    end;
end;

end.
