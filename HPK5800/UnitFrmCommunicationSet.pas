unit UnitFrmCommunicationSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ExtCtrls, sPanel, ComCtrls,
  sPageControl, sComboBox, sGroupBox, Inifiles;

type
  TFrmCommunicationSet = class(TForm)
    sPageControl1: TsPageControl;
    sTabShtTaskLst: TsTabSheet;
    sGroupBox1: TsGroupBox;
    Label6: TLabel;
    sCBSerialPortLst: TsComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sCBSerialPortLstChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitPermissonInFrmCommunication();
    
  public
    { Public declarations }
  end;

var
  FrmCommunicationSet: TFrmCommunicationSet;

implementation

uses UnitGlobeVar, UnitMain, UnitPersonnelMangement;

{$R *.dfm}

procedure TFrmCommunicationSet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
    FrmCommunicationSetCrt := False;
end;

procedure TFrmCommunicationSet.FormCreate(Sender: TObject);
begin
    //��ʼ��Ȩ��
    InitPermissonInFrmCommunication();
end;

procedure TFrmCommunicationSet.InitPermissonInFrmCommunication();
begin
    if pos('[' + CntPermissonCode[CntCommunicate] + 'e', PersonnelPermit) >= 1 then
    begin
        sCBSerialPortLst.ReadOnly := False;
    end
    else
    begin
        sCBSerialPortLst.ReadOnly := True;
    end;
end;

{--------------------------------------------------------------------------------
procedure TForm1.Button2Click(Sender: TObject);

begin

end;
--------------------------------------------------------------------------------}

procedure TFrmCommunicationSet.FormShow(Sender: TObject);
var
    KeyHandle: HKEY;
    ErrCode, Index: Integer;
    ValueName, Data: string;
    ValueLen, DataLen, ValueType: DWORD;
    TmpPorts: TStringList;

    CurrentComPort : Integer;
begin
    //��ȡ��������
    sCBSerialPortLst.Items.Clear;

    ErrCode := RegOpenKeyEx(HKEY_LOCAL_MACHINE, 'HARDWARE\DEVICEMAP\SERIALCOMM', 0, KEY_READ, KeyHandle);

    if ErrCode <> ERROR_SUCCESS then
    begin
        ShowMessage('�򿪴����б���ע��������');
        Exit;
    end;

    TmpPorts := TStringList.Create;
    try
        Index := 0;
    repeat
        ValueLen := 256;
        DataLen := 256;
        SetLength(ValueName, ValueLen);
        SetLength(Data, DataLen);
        ErrCode := RegEnumValue(KeyHandle, Index, PChar(ValueName),
          Cardinal(ValueLen), nil, @ValueType, PByte(PChar(Data)), @DataLen);

        if ErrCode = ERROR_SUCCESS then
        begin
            SetLength(Data, DataLen);
            TmpPorts.Add(Data);
            //memo1.Lines.Add(Data);
            sCBSerialPortLst.Items.Add(Data);
            Inc(Index);
        end
        else if ErrCode <> ERROR_NO_MORE_ITEMS then
        begin
            ShowMessage('�򿪴����б���ע��������');
            Exit;
        end;

    until (ErrCode <> ERROR_SUCCESS);

        TmpPorts.Sort;
        //Ports.Assign(TmpPorts);
    finally
        RegCloseKey(KeyHandle);
        TmpPorts.Free;
    end;

    //��ȡ1#��������ǰʹ�õĴ���
    CurrentComPort := FrmMain.Instruction1MSComm.CommPort;
    sCBSerialPortLst.Text := 'COM' + inttostr(CurrentComPort);
end;

procedure TFrmCommunicationSet.sCBSerialPortLstChange(Sender: TObject);
var
    NewCommPortStr : String;
    NewCommPort,
    OldCommPort    : Integer;

    SetFile : TIniFile;
begin
    NewCommPortStr := Trim(sCBSerialPortLst.Text);
    if Length(NewCommPortStr) > 3 then
    begin
        delete(NewCommPortStr, 1, 3) ;

        try
            NewCommPort := StrToInt( NewCommPortStr );
        except
            Showmessage('����ȷ�����ѡ��˿ں�!');
            exit;
        end;

        OldCommPort := FrmMain.Instruction1MSComm.CommPort;

        if NewCommPort <> OldCommPort then
        begin
            if Instruction1MscommOpen then
            begin
                Instruction1MscommOpen := False;
                FrmMain.Instruction1MSComm.PortOpen := False;
            end;

            SetFile := TInifile.Create(ExtractFilePath(Application.ExeName) + 'set.ini');
            SetFile.WriteInteger('SerialCommunication', 'Instruction1', NewCommPort);
            SetFile.Free;

            try
                if FrmMain.Instruction1MSComm.PortOpen then
                begin
                    Instruction1MscommOpen := False ;
                    Showmessage('ͨѶ�˿�δ�رգ��µ�ͨѶ�˿ڴ�ʧ��!');
                end
                else
                begin
                    FrmMain.Instruction1MSComm.CommPort := NewCommPort ;   //���˿ں�
                    FrmMain.Instruction1MSComm.Settings := '19200,n,8,1';
                    FrmMain.Instruction1MSComm.InBufferSize := 1024;    //���ý��ջ�������С
                    FrmMain.Instruction1MSComm.OutBufferSize := 1024;    //���÷��ͻ�������С
                    FrmMain.Instruction1MSComm.InputLen := 0;            //һ�ζ�ȡ���ջ������е���������
                    FrmMain.Instruction1MSComm.SThreshold := 0;          //һ�η�����������
                    FrmMain.Instruction1MSComm.InBufferCount := 0;       //��ս��ջ�����
                    FrmMain.Instruction1MSComm.OutBufferCount := 0;      //��շ��ͻ�����
                    FrmMain.Instruction1MSComm.PortOpen := True;
                    Instruction1MscommOpen := True;
                    FrmMain.sStatusBar1.Panels[1].Text := '�˿ںţ�' + inttostr(NewCommPort);
                end;
            except
                Instruction1MscommOpen := False;

                Instru1MscommDspState := Instru1MscomDspIsPortNo ;           //�˿ڲ�����
                FrmMain.sStatusBar1.Panels[2].Text := '��ʧ��';

                Showmessage('�µ�ͨѶ�˿ڴ�ʧ��!');
            end;
        end;
    end
    else
    begin
        Showmessage('����ȷ�����ѡ��˿�!');
    end;
end;


end.