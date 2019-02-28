unit UnitPersonnelMangement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, Grids, AdvObj, BaseGrid, AdvGrid,
  DB, ADODB;

type
  TFrmPersonnelMangement = class(TForm)
    grdPerson: TAdvStringGrid;
    sBtnAddPerson: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBtnSaveExit: TsBitBtn;
    ADOQuery1: TADOQuery;
    grdPeimission: TAdvStringGrid;
    sBtnDelPerson: TsBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grdPersonGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormShow(Sender: TObject);
    procedure grdPeimissionGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sBtnAddPersonClick(Sender: TObject);
    procedure grdPersonCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure grdPersonClick(Sender: TObject);
    procedure grdPeimissionCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure grdPeimissionGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure grdPeimissionCellsChanged(Sender: TObject; R: TRect);
    procedure sBtnSaveExitClick(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure grdPersonCellsChanged(Sender: TObject; R: TRect);
    procedure sBtnDelPersonClick(Sender: TObject);
  private
    { Private declarations }
    procedure DspPersonnelLst();      //��ʾ��Ա�б�
    procedure PersonnelPowerDsp();    //��ԱȨ����ʾ
    Function SavePersonChange() : Integer;
//    procedure GetPerssonelPermission(var PermissonStr : String);    //��ȡ��ԱȨ��
    procedure InitPermissonInFrmPersson();    //��ʼ��Ȩ��
  public
    { Public declarations }
  end;

var
  FrmPersonnelMangement: TFrmPersonnelMangement;

Type
  PermissionInfoRd = Record
    Name : String[20];
    Code : Integer;
  end;
Const
  CntPermissionCount = 15;
Const    //Ȩ�޴���
  CntPermIsBasiInfo     = 1 ;    //������Ϣ
  CntPermIsMatrialSet   = 2 ;    //ԭ������
  CntPermIsTruckSet     = 3 ;    //��������
  CntPermIsProLineSet   = 4 ;    //������������
  CntPermIsPersonMang   = 5;     //��Ա����
  CntPermIsRecipe       = 6 ;    //��ȹ���
  CntPermIsProdTask     = 7 ;    //�����������
  CntCommunicate        = 8 ;    //ͨѶ����
  CntSysConfig          = 9 ;    //�豸����
  CntSignalDefine       = 10;    //�źŶ���
  CntPermIsMaterialStock= 11;    //ԭ�Ͽ��
  CntPermIsProdData     = 12;    //�������ݲ�ѯ
  CntPermIsWeigCalZero  = 13;    //��ֵ����
  CntPermIsWeigCalValue = 14;    //��ֵУ׼
  CntPermIsPara         = 15;    //��������

//  CntPermIsProdNotice   = 4 ;    //�����ɳ�
//  CntPermIsProdOper     = 5 ;    //����������
//  CntPermIsEquipPara    = 6 ;    //���ղ�������


  CntPermIsDigtalProg   = 10;    //���������
Const
  CntPermissionInfo : array[1..CntPermissionCount] of PermissionInfoRd
    =(
        (Name : '������Ϣ';
         Code : CntPermIsBasiInfo  ),    //������Ϣ

        (Name : 'ԭ������';
         Code : CntPermIsMatrialSet),   //��ȹ���

        (Name : '�ų�����';
         Code : CntPermIsTruckSet),     //�ų�����

        (Name : '��������';
         Code : CntPermIsProLineSet),   //������������

        (Name : '��Ա����';
         Code : CntPermIsPersonMang),   //��Ա����

        (Name : '��ȹ���';
         Code : CntPermIsRecipe  ),     //��ȹ���

        (Name : '��������';
         Code : CntPermIsProdTask),     //�����������

        (Name : '�����ɳ�';
         Code : CntCommunicate),       //ͨѶ����

        (Name : '�豸����';
         Code : CntSysConfig ),        //�豸����

        (Name : '�źŶ���';
         Code : CntSignalDefine ),    //�źŶ���

        (Name : 'ԭ�Ͽ��';
         Code : CntPermIsMaterialStock),

        (Name : '��������';
         Code : CntPermIsProdData ),

        (Name : '��ֵ����';
         Code : CntPermIsWeigCalZero),

        (Name : '��ֵУ׼';
         Code : CntPermIsWeigCalValue),

        (Name : '��������';
         Code : CntPermIsPara )

         
//        (Name : '�����ɳ�';
//         Code : CntPermIsProdNotice),      //�����ɳ�
//        (Name : '����������';
//         Code : CntPermIsProdOper),        //����������
//        (Name : '���ղ�������';
//         Code : CntPermIsEquipPara),        //���ղ�������
//        (Name : '��ֵ����';
//         Code : CntPermIsWeigCalZero),      //��ֵ����
//        (Name : '��ֵУ׼';
//         Code : CntPermIsWeigCalValue),    //��ֵУ׼
//        (Name : '�������ݲ�ѯ';
//         Code : CntPermIsProdData),        //�������ݲ�ѯ
//        (Name : '���������';
//         Code : CntPermIsDigtalProg),       //���������

//        (Name : '���������';
//         Code : CntPermIsDigtalProg),
//        (Name : '���������';
//         Code : CntPermIsDigtalProg),
//        (Name : '���������';
//         Code : CntPermIsDigtalProg),
//        (Name : '���������';
//         Code : CntPermIsDigtalProg),
//        (Name : '���������';
//         Code : CntPermIsDigtalProg),
//        (Name : '���������';
//         Code : CntPermIsDigtalProg),
//        (Name : '���������';
//         Code : CntPermIsDigtalProg)

     );
Const
  CntPermissonCode : array[1..CntPermissionCount] of String[1]
    =('A' ,    //������Ϣ����
      'B' ,    //ԭ������
      'C' ,    //��������
      'D' ,    //������������
      'E' ,    //��Ա����
      'F' ,    //��ȹ���
      'G' ,    //�����������
      'H' ,    //ͨѶ����
      'I' ,    //�豸����
      'K' ,    //�źŶ���
      'L' ,    //ԭ�Ͽ��
      'M' ,    //�������ݲ�ѯ
      'N' ,    //��ֵ����
      'O' ,    //��ֵУ׼
      'P'     //��������

//      'N' ,    //�����ɳ�
//      'C' ,    //����������
//      'E' ,    //���ղ�������
//      'Z' ,    //��ֵ����
//      'V' ,    //��ֵУ׼
//      'D' ,    //�������ݲ�ѯ
//      'P',      //���������

//      '',      //
//      '',      //
//      '',      //
//      '',      //
//      '',      //
//      '',      //
//      ''       //
     );

Const    //��Ա���� �༭״̬
  CntPersonIsAddNew = 1;    //�����ӵ���Ա
  CntPersonIsModify = 2;    //�޸���Ա
  
var
  SaveToDbEnableInUtPersonelManege : Boolean;

  grdCanEdit : Boolean;    //�����ܷ�༭

implementation

uses UnitGlobeVar, UnitMain, UnitSetPassWord, UnitWeigherAttribute;

{$R *.dfm}

procedure TFrmPersonnelMangement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmPersonnelMangementCrt := False;
    Action := caFree;
end;

procedure TFrmPersonnelMangement.FormCreate(Sender: TObject);
var
    i : Integer;
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;
    SaveToDbEnableInUtPersonelManege := False;

    grdPerson.Cells[0 , 0] := '���';
    grdPerson.Cells[1 , 0] := '��¼��';
    grdPerson.Cells[2 , 0] := 'ID' ;
    grdPerson.Cells[3 , 0] := 'Ȩ�޴���';
    grdPerson.Cells[4 , 0] := '�༭״̬';
    grdPerson.Cells[5 , 0] := '��½����';
    grdPerson.ColWidths[2] := 0;
    grdPerson.ColWidths[3] := 0;
    grdPerson.ColWidths[4] := 0;
    grdPerson.ColWidths[5] := 0;

    grdPeimission.Cells[0 , 0] := '���';
    grdPeimission.Cells[1 , 0] := '��������';
    grdPeimission.Cells[2 , 0] := '��Ȩ״̬';
    grdPeimission.Cells[3 , 0] := '���������';
    grdPeimission.ColWidths[3] := 0;
    grdPeimission.RowCount     := CntPermissionCount +1;
    //{Ȩ���б�}
    for i:=1 to CntPermissionCount do //CntPermissionCount do
    begin
        grdPeimission.Cells[0 , i ] := inttostr(i);
        grdPeimission.Cells[1 , i ] := CntPermissionInfo[i].Name;
        grdPeimission.Cells[3 , i ] := IntToStr(CntPermissionInfo[i].Code);
    end;

    {��ʼ��Ȩ��}
    InitPermissonInFrmPersson();
end;

procedure TFrmPersonnelMangement.InitPermissonInFrmPersson();
begin
    if pos( '[' + CntPermissonCode[CntPermIsPersonMang] + 'e', PersonnelPermit ) >= 1 then
    begin
        sBtnAddPerson.Enabled := True;
        sBtnDelPerson.Enabled := True;
        sBitBtn2.Enabled      := True;
        grdCanEdit            := True;
        sBtnSaveExit.Caption  := '�����˳�';
    end
    else
    begin
        sBtnAddPerson.Enabled := False;
        sBtnDelPerson.Enabled := False;
        sBitBtn2.Enabled      := False;
        grdCanEdit            := False;
        sBtnSaveExit.Caption  := '�˳�';
    end;
end;

procedure TFrmPersonnelMangement.grdPersonGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
    if (ARow = 0) or (ACol = 0) then HAlign := taCenter;
end;

procedure TFrmPersonnelMangement.grdPeimissionGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
    if (ARow = 0) or (ACol = 0) then
    begin
        HAlign := taCenter;
    end;
end;

procedure TFrmPersonnelMangement.FormShow(Sender: TObject);
begin
    DspPersonnelLst();
    grdPerson.Row := 1;
    PersonnelPowerDsp();
end;

procedure TFrmPersonnelMangement.DspPersonnelLst();
var
    Row : Integer;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOquery1.SQL.Text := 'select * from Staff where State=' + '''' + '1' + '''';
    ADOQuery1.Open;
    Row := 1;
    while not ADOQuery1.Eof do
    begin
        grdPerson.Cells[0 , Row] := Inttostr(Row);
        grdPerson.Cells[1 , Row] := ADOQuery1.FieldByName('LoginNm').AsString;      //��¼��
        grdPerson.Cells[2 , Row] := ADOQuery1.FieldByName('StaffID').AsString;      //ID
        grdPerson.Cells[3 , Row] := ADOQuery1.FieldByName('Permit').AsString;       //Ȩ�޴���';
        grdPerson.Cells[4 , Row] := '';
        grdPerson.Cells[5 , Row] := ADOQuery1.FieldByName('Passwords').AsString;     //��¼����
        ADOQuery1.Next;
        Row := Row +1;
    end;
    grdPerson.RowCount := Row;
end;

procedure TFrmPersonnelMangement.sBtnAddPersonClick(Sender: TObject);
var
    Row : Integer;
begin
    Row := grdPerson.RowCount;
    grdPerson.RowCount := Row + 1;
    grdPerson.Cells[0, Row] := IntToStr(Row);
    grdPerson.Cells[4, Row] := IntToStr(CntPersonIsAddNew);
    grdPerson.Cells[5, Row] := '';
    SaveToDbEnableInUtPersonelManege := True;
end;

procedure TFrmPersonnelMangement.grdPersonCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
    if not grdCanEdit then CanEdit := False;
    
    if grdPerson.Cells[2 , ARow]= '1' then CanEdit := False;
end;

procedure TFrmPersonnelMangement.PersonnelPowerDsp();    //��ԱȨ����ʾ
var
    DspRow : Integer;
    i : Integer;
    PermCodeI : Integer;
    PermcodeStr : String;
begin
    DspRow := grdPerson.Row ;
    if grdPerson.Cells[2, DspRow] <> '' then
    begin
        if grdPerson.Cells[2, DspRow] = '1' then    //����Ա
        begin
            for i:=1 to grdPeimission.RowCount do
            begin
                grdPeimission.Cells[2, i] := '�����༭';
            end;
        end
        else
        begin
            for i:=1 to grdPeimission.RowCount -1 do
            begin
                try
                    PermCodeI := StrToInt(Trim(grdPeimission.Cells[3,i]));
                except
                    PermCodeI := 0;
                end;

                if (PermCodeI >= 1) and (PermCodeI <= CntPermissionCount) then
                begin
                    PermcodeStr := '[' + CntPermissonCode[PermCodeI];
                    if Pos( PermcodeStr +'e', Trim(grdPerson.Cells[3, grdPerson.Row])) > 0 then
                    begin
                        grdPeimission.Cells[2, i] := '��������' ;
                    end
                    else if Pos( PermcodeStr , Trim(grdPerson.Cells[3, grdPerson.Row])) > 0 then
                    begin
                        grdPeimission.Cells[2, i] := '�����鿴' ;
                    end
                    else
                    begin
                        grdPeimission.Cells[2, i] := '��ֹ����';
                    end;
                end
                else
                begin
                    Showmessage('��Ч�Ĳ�����У�' + inttostr(i)) ;
                    Continue;
                end;
            end;
        end;
    end
    else
    begin
        for i:=1 to grdPeimission.RowCount do
        begin
            grdPeimission.Cells[2, i] := '��ֹ����';
        end;
    end;
end;

procedure TFrmPersonnelMangement.grdPersonClick(Sender: TObject);
begin
    PersonnelPowerDsp();    //��ԱȨ����ʾ
end;

procedure TFrmPersonnelMangement.grdPeimissionCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
    if grdCanEdit then
    begin
        if ACol <> 2 then
        begin
            CanEdit := False;
        end
        else
        begin
            if grdPerson.Cells[2, grdPerson.Row] = '1' then
                CanEdit := False
            else
                CanEdit := True;
        end;
    end
    else
    begin
        CanEdit := False;
    end;
end;

procedure TFrmPersonnelMangement.grdPeimissionGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
var
    SelPermissonCode : Integer;
begin
    if Acol = 2 then
    begin
        AEditor := edComboList;
        grdPeimission.ClearComboString;

        try
            SelPermissonCode := StrToInt(Trim(grdPeimission.Cells[3, ARow]));
        except
            SelPermissonCode := 0;
        end;

        case SelPermissonCode of
            0:
            begin
                ;
            end;

            CntPermIsMaterialStock ,    //ԭ�Ͽ��
            CntPermIsProdData      ,     //�������ݲ�ѯ
            CntPermIsWeigCalZero   ,    //��ֵ����
            CntPermIsWeigCalValue  :    //��ֵУ׼
            begin
                grdPeimission.AddComboString('��ֹ����');
                grdPeimission.AddComboString('��������');
            end;

            else
            begin
                grdPeimission.AddComboString('��ֹ����');
                grdPeimission.AddComboString('�����鿴');
                grdPeimission.AddComboString('��������');
            end;
        end;
    end; 
end;

procedure TFrmPersonnelMangement.grdPeimissionCellsChanged(
  Sender: TObject; R: TRect);
var
    permission : String;
    EditPermissionCode : String;
    grdPeimissionRow : integer;
    editPermissonNum : integer;
    editPersonGrdRow : integer;
    editNewPermson   : string;
    temppermson      : string;
    firstChrPos,
    endChrPos       : integer;
begin
    if grdPerson.Cells[4, grdPerson.Row] = '' then
    begin
        grdPerson.Cells[4, grdPerson.Row] := IntToStr(CntPersonIsModify) ;
    end;
    SaveToDbEnableInUtPersonelManege := True;

    // ����Ȩ��
    permission := grdPerson.Cells[3, grdPerson.Row];

    grdPeimissionRow := grdPeimission.Row;
    editPermissonNum := strToInt(grdPeimission.cells[3, grdPeimissionRow]);
    EditPermissionCode := '[' + CntPermissonCode[editPermissonNum];

    editPersonGrdRow := grdPerson.Row ;

    editNewPermson := trim(grdPeimission.Cells[2 , grdPeimissionRow]) ;

    if editNewPermson = '��ֹ����' then
    begin
        firstChrPos := pos(EditPermissionCode, permission) ;
        if firstChrPos >=1 then
        begin
            tempPermson := permission;
            delete(tempPermson, 1, firstChrPos -1);
            endChrPos := pos(']', tempPermson);
            delete( permission, firstChrPos, endChrPos );
            grdPerson.Cells[3, editPersonGrdRow] := permission;
        end;
    end
    else if editNewPermson = '�����鿴' then
    begin
        firstChrPos := pos(EditPermissionCode, permission) ;
        if firstChrPos >=1 then
        begin
            tempPermson := permission;
            delete(tempPermson, 1, firstChrPos -1);
            endChrPos := pos(']', tempPermson);
            delete( permission, firstChrPos, endChrPos );
        end;
        permission := permission + '[' + CntPermissonCode[editPermissonNum] + ']';
        grdPerson.Cells[3, editPersonGrdRow] := permission;
    end
    else if editNewPermson = '��������' then
    begin
        firstChrPos := pos(EditPermissionCode, permission) ;
        if firstChrPos >=1 then
        begin
            tempPermson := permission;
            delete(tempPermson, 1, firstChrPos -1);
            endChrPos := pos(']', tempPermson);
            delete( permission, firstChrPos, endChrPos );
        end;
        permission := permission + '[' + CntPermissonCode[editPermissonNum] + 'e]';
        grdPerson.Cells[3, editPersonGrdRow] := permission;
    end
    else
    begin
        Showmessage('��Ч����Ȩ����');
    end;

end;

procedure TFrmPersonnelMangement.sBtnSaveExitClick(Sender: TObject);
var
    SaveResult : Integer;
begin
    if grdCanEdit then
    begin
        SaveResult := SavePersonChange();
        if SaveResult = 0 then
        begin
            Self.Close;
        end
        else
        begin
            Showmessage('����ʧ��!');
        end;
    end
    else
    begin
        Self.Close;
    end;
end;

Function TFrmPersonnelMangement.SavePersonChange() : Integer;
//˵����Result = 0������ɹ�
//      Result = 1����Ч�ĵ�¼�˺�
//      Resule = 2����½�˺��Ѿ�����
//      Result = 3�����ݿ�������ʧ��
//      Result = 4���������ݿ�ʧ��
var
    i,k : Integer;
    EditCode : Integer;
    EXResult : Integer;
    PermissionStr : String;
    NewLoginNm : String;
begin
    EXResult := 0;
    if SaveToDbEnableInUtPersonelManege then
    begin
        for i:=1 to grdPerson.RowCount -1 do
        begin
            if Trim(grdPerson.Cells[4, i]) <> '' then    //������Ҫ����
            begin
                try
                    EditCode := StrToInt( Trim(grdPerson.Cells[4, i]) ) ;
                except
                    EditCode := 0;
                end;

//                {����Ȩ������}
//                GetPerssonelPermission( PermissionStr );

                PermissionStr := grdPerson.Cells[3 ,i];

                case EditCode of
                    CntPersonIsAddNew :    //�����ӵ���Ա
                    begin
                        NewLoginNm := Trim(grdPerson.Cells[1, i]);
                        if NewLoginNm = '' then
                        begin
                            Showmessage('��Ч�ĵ�¼�˺ţ���' + Inttostr(i));
                            ExResult := 1;
                            Break;
                        end;

                        ADOQuery1.Close;
                        ADOQuery1.SQL.Clear;
                        ADOQuery1.SQL.Text := 'select StaffID from Staff where LoginNm=' + '''' + NewLoginNm + '''';
                        ADOQuery1.Open;
                        if not ADOQuery1.Eof then
                        begin
                            Showmessage('��¼�˺��Ѿ����ڣ���' + inttostr(i) );
                            ExResult := 2;
                            Break;
                        end;

                        Try
                            FrmMain.ADOConnection.BeginTrans;
                            ADOQuery1.Close;
                            ADOQuery1.SQL.Clear;
                            ADOQuery1.SQL.Text := 'insert into Staff (LoginNm'
                                                + ',Permit'
                                                + ',state'
                                                + ',Passwords'
                                                + ')'
                                                + ' values (' + '''' + NewLoginNm + ''''
                                                + ', ' + '''' + PermissionStr + ''''
                                                + ', ' + '''' + '1' + ''''
                                                + ', ' + '''' + Trim(grdPerson.Cells[5, i]) + ''''
                                                + ')';
                            ADOQuery1.ExecSQL;
                            FrmMain.ADOConnection.CommitTrans;
                        except
                            FrmMain.ADOConnection.RollbackTrans;
                            ExResult := 3;
                            break;
                        end;

                    end;

                    CntPersonIsModify :    //�޸���Ա
                    begin
                        NewLoginNm := Trim(grdPerson.Cells[1, i]);
                        if NewLoginNm = '' then
                        begin
                            Showmessage('��Ч�ĵ�¼�˺ţ���' + Inttostr(i));
                            ExResult := 1;
                            Break;
                        end;

                        for k:=1 to grdPerson.RowCount -1 do
                        begin
                            if (Trim(grdPerson.Cells[1, k]) = NewLoginNm ) and (i <> k) then
                            begin
                                Showmessage('��ͬ�ĵ�¼�� ��' + inttostr(i) + '��' + inttostr(k));
                                ExResult := 2;
                                break;
                            end;
                        end;
                        if ExResult <> 0 then Break;

                        Try
                            FrmMain.ADOConnection.BeginTrans;
                            ADOQuery1.Close;
                            ADOQuery1.SQL.Clear;
                            ADOQuery1.SQL.Text := 'update Staff set'
                                                + ' LoginNm =' + '''' + NewLoginNm + ''''
                                                + ',Permit=' + '''' + PermissionStr + ''''
                                                + ',Passwords=' + '''' + Trim(grdPerson.Cells[5, i]) + ''''
                                                + ' where StaffID ='   + Trim(grdPerson.Cells[2,i]);
                            ADOQuery1.ExecSQL;
                            FrmMain.ADOConnection.CommitTrans;
                        except
                            FrmMain.ADOConnection.RollbackTrans;
                            ExResult := 4;
                            Break;
                        end;
                    end;

                    Else
                    begin

                    end;

                end;
            end;
        end;
    end;

    Result := ExResult ;
end;

//procedure TFrmPersonnelMangement.GetPerssonelPermission(var PermissonStr : String);    //��ȡ��ԱȨ��
//var
//    i : Integer;
//    TempSrt : String;
//    PermCode : Integer;
//begin
//    TempSrt := '';
//    for i:=1 to grdPeimission.RowCount do
//    begin
//        if Trim( grdPeimission.Cells[3, i] ) <> '' then
//        begin
//            try
//                PermCode := StrToInt( Trim( grdPeimission.Cells[3, i] ) );
//            except
//                PermCode := 0;
//            end;
//
//            if (PermCode >=1) and (PermCode <=CntPermissionCount) then
//            begin
//                if grdPeimission.Cells[2, i] <> '��ֹ����' then
//                begin
//                    TempSrt := TempSrt + '[' + CntPermissonCode[PermCode];
//                    if grdPeimission.Cells[2, i] = '��������' then
//                        TempSrt := TempSrt + 'e]'
//                    else
//                        TempSrt := TempSrt + ']';
//                end;
//            end
//            else
//            begin
//                Showmessage('Ԥ��������Ĳ�������У�' + inttostr(i));
//            end;
//        end;
//    end;
//    PermissonStr := TempSrt ;
//end;

procedure TFrmPersonnelMangement.sBitBtn2Click(Sender: TObject);
begin
    if not FrmSetPassWordCrt then
    begin
        FrmSetPassWord := TFrmSetPassWord.Create(Nil);
        FrmSetPassWordCrt := True;
    end;
    FrmEditMode := FrmEdtMdIsSetPasdForPersonnelMange ;    //��Ա������������
    FrmSetPassWord.ShowModal ;
end;

procedure TFrmPersonnelMangement.grdPersonCellsChanged(
  Sender: TObject; R: TRect);
begin
    if grdPerson.Cells[4, grdPerson.Row] = '' then
    begin
        grdPerson.Cells[4, grdPerson.Row] := IntToStr(CntPersonIsModify) ;
    end;
    SaveToDbEnableInUtPersonelManege := True;
end;

procedure TFrmPersonnelMangement.sBtnDelPersonClick(Sender: TObject);
begin
    if Messagebox(Getfocus, Pchar('ȷ��Ҫɾ���û� "' + Trim(grdPerson.Cells[1, grdPerson.Row]) + '" ��'), 'ѯ����Ϣ', MB_YESNO) = idYes then
    begin
        if Trim(grdPerson.Cells[2, grdPerson.Row]) = '1' then
        begin
            Showmessage('ϵͳĬ�Ϲ���Ա������ɾ��!');
            exit;
        end;
        Try
            FrmMain.ADOConnection.BeginTrans;
            ADOquery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'delete from Staff where StaffID=' + Trim(grdPerson.Cells[2, grdPerson.Row]);
            ADOQuery1.ExecSQL;
            FrmMain.ADOConnection.CommitTrans;
        except
            FrmMain.ADOConnection.RollbackTrans;
            Showmessage('ɾ��ʧ��!');
        end;
        DspPersonnelLst();
        grdPerson.Row := 1;
        PersonnelPowerDsp();
    end;
end;

end.