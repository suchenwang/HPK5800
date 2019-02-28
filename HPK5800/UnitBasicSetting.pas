unit UnitBasicSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sBitBtn, StdCtrls, sButton, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, cxControls, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC, sMemo,
  sEdit, sListBox, sCheckListBox, sScrollBox, DB, ADODB, ComCtrls,
  sTreeView, Grids, RzGrids, AdvObj, BaseGrid, AdvGrid, AdvUtil, Mask,
  AdvSpin, AdvEdit, AdvEdBtn, AsgSpin;

type
  TFrmBasicSetting = class(TForm)
    cBtnOk: TcxButton;
    cxButton1: TcxButton;
    cxPageControl1: TcxPageControl;
    ShtBasicInfo: TcxTabSheet;
    cShtMaterialInfo: TcxTabSheet;
    cShtTruck: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    ADOQuery1: TADOQuery;
    AdvGdMaterial: TAdvStringGrid;
    AdvGdTruck: TAdvStringGrid;
    AdvSpinEdit2: TAdvSpinEdit;
    gpbxBasicInfo: TGroupBox;
    sMoNote: TsMemo;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sEtCompanyName: TsEdit;
    sEtStationId: TsEdit;
    sEtStationTel: TsEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cBtnOkClick(Sender: TObject);
    procedure ShtBasicInfoShow(Sender: TObject);
    procedure cShtMaterialInfoShow(Sender: TObject);
    procedure cShtTruckShow(Sender: TObject);
    procedure AdvGdTruckGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvGdTruckGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure AdvGdTruckButtonClick(Sender: TObject; ACol, ARow: Integer);
    procedure AdvGdTruckGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure AdvGdTruckClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure AdvSpinEdit2Exit(Sender: TObject);
    procedure AdvGdTruckCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    DelTruckIdsStr : String;

    function WtBasicInfoToDb() : Integer;
    function RdBasicInfoToFrm() : Integer;
    function WtMaterialIntoDb() : Integer ;
    procedure UpdateAdvGdTruckOperBtn();         //更新运输车辆表格的操作按钮
    procedure UpdateInfoToAdvGdTruck();          //更新运输车辆信息到车辆表格
    function UpdateTruckInfotoDb() : Integer;    //更新数据库中的车辆信息
  public
    { Public declarations }
  end;

var
  FrmBasicSetting: TFrmBasicSetting;

implementation

{$R *.dfm}

uses UnitGlobeVar, UnitMain, UnitInicontrolPanel;

procedure TFrmBasicSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FrmBasicSettingCrt then
    begin
        FrmBasicSettingCrt := False;
    end;
    Action := caFree;
end;

procedure TFrmBasicSetting.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection ;
    DelTruckIdsStr := '';

    AdvGdTruck.Btn.Cursor := crHandPoint;
    AdvGdTruck.Btn.DragCursor := crHandPoint;
    AdvGdTruck.Btn.Enabled := False;

    { 权限设置 }
    //基本信息
    if pos( 'A', PersonnelPermit ) >= 1 then
    begin
        gpbxBasicInfo.Visible := True;
        
        if pos('Ae', PersonnelPermit) >= 1 then
        begin
            gpbxBasicInfo.Enabled := True;
        end
        else
        begin
            gpbxBasicInfo.Enabled := False;
        end;
    end
    else
    begin
        gpbxBasicInfo.Visible := False;
    end;

    //原料设置
    if pos( 'B', PersonnelPermit ) >=1 then
    begin
        AdvGdMaterial.Visible := True;

        if pos( 'Be', PersonnelPermit) >= 1 then
        begin
            AdvGdMaterial.Enabled := True;
        end
        else
        begin
            AdvGdMaterial.Enabled := False;
        end;
    end
    else
    begin
        AdvGdMaterial.Visible := False;
    end;

    //砼车管理
    if pos( 'C', PersonnelPermit ) >= 1 then
    begin
        AdvGdTruck.Visible := True;

        if pos( 'Ce', PersonnelPermit ) >= 1 then
        begin
            AdvGdTruck.Enabled := True;
        end
        else
        begin
            AdvGdTruck.Enabled := False;
        end;
    end
    else
    begin
        AdvGdTruck.Visible := False;
    end;

    //生产过程
    //if pos( 'D', PersonnelPermit ) >= 1 then
    //begin

    //end
    //else
    //begin

    //end;
end;

procedure TFrmBasicSetting.FormShow(Sender: TObject);
begin
    cxPageControl1.ActivePageIndex := 0;

{    if pos( 'B', PersonnelPermit ) >= 1 then
    begin
        if pos('Be', PersonnelPermit) >= 1 then
        begin
            gpbxBasicInfo.Enabled := True;
        end
        else
        begin
            gpbxBasicInfo.Enabled := False;
        end;
    end
    else
    begin
        gpbxBasicInfo.Visible := False;
    end;
}
end;

procedure TFrmBasicSetting.ShtBasicInfoShow(Sender: TObject);
var
    ExResult : Integer;
begin



    //ExResult := RdBasicInfoToFrm();
    //case ExResult of
    //    0:    //读取成功
    //    begin
    //
    //    end;
    //    1:
    //    begin
    //        Showmessage('读取基本信息失败!');
    //    end;
    //end;


end;

procedure TFrmBasicSetting.cShtMaterialInfoShow(Sender: TObject);
var
    RowPt : Integer;
begin
    AdvGdMaterial.Cells[0, 0 ] := '序号';
    AdvGdMaterial.ColWidths[0] := 50;
    AdvGdMaterial.Cells[1, 0 ] := ' 材料名称';
    AdvGdMaterial.ColWidths[1] := 120;
    AdvGdMaterial.Cells[2, 0 ] := ' 型号规格';
    AdvGdMaterial.ColWidths[2] := 120;
    AdvGdMaterial.Cells[3, 0 ] := ' 备注';
    AdvGdMaterial.ColWidths[3] := 120;
    AdvGdMaterial.Cells[4, 0 ] := ' IdInDb';
    AdvGdMaterial.ColWidths[4] := 0;

    ADOQuery1.Close ;
    ADOQuery1.SQL.Clear ;
    ADOQuery1.SQL.Text := 'select * from Material';
    ADOQuery1.Open;
    AdvGdMaterial.RowCount := ADOQuery1.RecordCount +1;
    RowPt := 1;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        AdvGdMaterial.Cells[0, RowPt] := inttostr(RowPt);
        AdvGdMaterial.Cells[1, RowPt] := ADOQuery1.FieldByName('MaterName').AsString;
        AdvGdMaterial.Cells[2, RowPt] := ADOQuery1.FieldByName('MaterSpecs').AsString;
        AdvGdMaterial.Cells[3, RowPt] := ADOQuery1.FieldByName('Rek').AsString;
        AdvGdMaterial.Cells[4, RowPt] := ADOQuery1.FieldByName('ID').AsString;
        RowPt := RowPt + 1;
        ADOQuery1.Next;
    end;
    ADOQuery1.Close ;
end;

procedure TFrmBasicSetting.cShtTruckShow(Sender: TObject);
begin
    AdvGdTruck.Cells[0, 0 ] := '序号';
    AdvGdTruck.ColWidths[0] := 40;
    AdvGdTruck.Cells[1, 0 ] := '编号';
    AdvGdTruck.ColWidths[1] := 70;
    AdvGdTruck.Cells[2, 0 ] := '核载方量';
    AdvGdTruck.ColWidths[2] := 70;
    AdvGdTruck.Cells[3, 0 ] := '驾驶员';
    AdvGdTruck.ColWidths[3] := 80;
    AdvGdTruck.Cells[4, 0 ] := '备注';
    AdvGdTruck.ColWidths[4] := 148;
    AdvGdTruck.Cells[5, 0 ] := '操作';
    AdvGdTruck.ColWidths[5] := 34;//(AdvGdTruck.Width -4
                             //- AdvGdTruck.ColWidths[0]
                             //- AdvGdTruck.ColWidths[1]
                             //- AdvGdTruck.ColWidths[2]
                             //- AdvGdTruck.ColWidths[3]
                             //- AdvGdTruck.ColWidths[4]) div 2 ;
    AdvGdTruck.ColWidths[6] := 34;//(AdvGdTruck.Width -4
                             //- AdvGdTruck.ColWidths[0]
                             //- AdvGdTruck.ColWidths[1]
                             //- AdvGdTruck.ColWidths[2]
                             //- AdvGdTruck.ColWidths[3]
                             //- AdvGdTruck.ColWidths[4]) div 2 ;
    AdvGdTruck.MergeCells(5,0,2,1) ;

    AdvGdTruck.Cells[7, 0 ] := '数据库中的ID值' ;
    AdvGdTruck.ColWidths[7] := 0;

    

    UpdateInfoToAdvGdTruck();     //更新运输车辆信息到车辆表格中
    UpdateAdvGdTruckOperBtn();    //更新运输车辆表格的操作按钮
    
    //AdvGdTruck.Cells[2,1] := '2';
    //AdvGdTruck.AddButton(4,1,50,20,'a', haLeft, vaCenter);
    //AdvGdTruck.AddButton(4,2,50,20,'a', haRight, vaCenter);
    //AdvGdTruck.add
    //AdvGdTruck.addb
end;

procedure TFrmBasicSetting.UpdateInfoToAdvGdTruck();     //更新运输车辆信息到车辆表格
var
    Qry : TADOQuery;
    RowPt : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;
    Qry.Close;
    Qry.SQL.Text := 'select * from Truck Order by Code';
    Qry.Open;
    Qry.First;
    if Qry.RecordCount < 1 then
    begin
        AdvGdTruck.RowCount := 2;
        AdvGdTruck.Rows[1].Clear;
        AdvGdTruck.Cells[2,1] := '0';
    end
    else
    begin
        AdvGdTruck.RowCount := Qry.RecordCount +1;
        RowPt := 1;
        while not Qry.Eof do
        begin
            AdvGdTruck.Rows[RowPt].Clear;
            AdvGdTruck.Cells[1, RowPt] := Qry.FieldByName('Code').AsString;
            AdvGdTruck.Cells[2, RowPt] := Qry.FieldByName('Capacity').AsString;
            AdvGdTruck.Cells[3, RowPt] := Qry.FieldByName('Driver1').AsString;
            AdvGdTruck.Cells[4, RowPt] := Qry.FieldByName('Rek').AsString;
            AdvGdTruck.Cells[7, RowPt] := Qry.FieldByName('ID').AsString;
            RowPt := RowPt + 1;
            Qry.Next;
        end;
    end;

end;

procedure TFrmBasicSetting.UpdateAdvGdTruckOperBtn();    //更新运输车辆表格的操作按钮
var
    i : Integer;
begin
    for i:= 1 to AdvGdTruck.RowCount - 1 do
    begin
        AdvGdTruck.Cells[0,i] := inttostr(i);

        if AdvGdTruck.Cells[7,i] = '' then
        begin
            AdvGdTruck.MergeCells(5,i,2,1);
            //AdvGdTruck.CreateBitButton(5,i,20,20,'+',haCenter, vaCenter);
            AdvGdTruck.AddButton(5,i,20,20,'+',haCenter, vaCenter);
        end
        else
        begin
            if i < AdvGdTruck.RowCount - 1 then
            begin
                AdvGdTruck.MergeCells(5,i,2,1);
                //AdvGdTruck.CreateBitButton(5,i,20,20,'-',haCenter, vaCenter);
                AdvGdTruck.AddButton(5,i,20,20,'-',haCenter, vaCenter);
            end
            else
            begin
                AdvGdTruck.SplitCells(5,i);
                //AdvGdTruck.CreateBitButton(5,i,20,20,'-',haCenter, vaCenter);
                //AdvGdTruck.CreateBitButton(6,i,20,20,'+',haCenter, vaCenter);
                AdvGdTruck.AddButton(5,i,20,20,'-',haCenter, vaCenter);
                AdvGdTruck.AddButton(6,i,20,20,'+',haCenter, vaCenter);
            end;
        end;
    end;

end;

procedure TFrmBasicSetting.cBtnOkClick(Sender: TObject);
var
    ExResult : Integer;
begin
    //写基本信息到数据库
    ExResult := WtBasicInfoToDb();    
    case ExResult of
        0 :    //写成功
        begin

        end;
        1:    //写失败
        begin
            Showmessage('写基本信息失败');
        end;
    end;
    //写材料信息到数据库
    if ExResult = 0 then
    begin
        ExResult := WtMaterialIntoDb();
        case ExResult of
            0:    //写成功
            begin
                IniStorageMaterialInfo();    //料仓材料信息
            end;
            1:    //写失败了
            begin
                Showmessage('写材料信息到数据库失败');
            end;
        end;
    end;
    //更新运输车辆数据库
    if ExResult = 0 then
    begin
        ExResult := UpdateTruckInfotoDb();
        case ExResult of
            0: begin

            end;
            1: begin
                //if Application.MessageBox(pchar('第 ' + inttostr(i) + ' 行车辆编号无效'), '初始化失败', MB_OK) = MB_OK then ;
            end;
        end;
    end;
    if ExResult = 0 then Self.Close;
end;

function TFrmBasicSetting.RdBasicInfoToFrm() : Integer;
begin
    ADOQuery1.Close;

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select UserName, StationId, StationTel, Note2 from Equipment '
                        + 'where ID=1';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        sEtCompanyName.Text := ADOQuery1.FieldByName('UserName').AsString ;
        sEtStationId.Text   := ADOQuery1.FieldByName('StationId').AsString ;
        sEtStationTel.Text  := ADOQuery1.FieldByName('StationTel').AsString ;
        sMoNote.Text        := ADOQuery1.FieldByName('Note2').AsString ;
        Result := 0;
    end
    else
    begin
        sEtCompanyName.Text := '';
        sEtStationId.Text   := '';
        sEtStationTel.Text  := '';
        sMoNote.Text        := '';
        Result := 1;
    end;
    ADOQuery1.Close;
end;

function TFrmBasicSetting.WtBasicInfoToDb() : Integer;
begin
    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'update Equipment set UserName=:NewUserName,'
                             + 'StationId=:NewId, StationTel=:NewTel, Note2=:NewNote '
                             + 'where ID=1';
        ADOQuery1.Parameters.ParamByName('NewUserName').Value := Trim(sEtCompanyName.Text) ;
        ADOQuery1.Parameters.ParamByName('NewId').Value       := Trim(sEtStationId.Text);
        ADOQuery1.Parameters.ParamByName('NewTel').Value      := Trim(sEtStationTel.Text);
        ADOQuery1.Parameters.ParamByName('NewNote').Value     := Trim(sMoNote.Text);
        ADOQuery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
        Result := 0;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Result := 1;
    end;

    ADOQuery1.Close;
end;

function TFrmBasicSetting.WtMaterialIntoDb() : Integer ;
var
    RowCount : Integer;
    i : Integer;
begin
    RowCount := AdvGdMaterial.RowCount;
    ADOQuery1.Close;
    try
        FrmMain.ADOConnection.BeginTrans;
        for i:=RowCount downto 1 do
        begin
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'update Material set  MaterName=:NewName,'
                                + 'MaterSpecs=:NewSpec, Rek=:NewNot where Id=:EditId' ;
            ADOQuery1.Parameters.ParamByName('NewName').Value := Trim(AdvGdMaterial.Cells[1,i]);
            ADOQuery1.Parameters.ParamByName('NewSpec').Value := Trim(AdvGdMaterial.Cells[2,i]);
            ADOQuery1.Parameters.ParamByName('NewNot').Value  := Trim(AdvGdMaterial.Cells[3,i]);
            ADOQuery1.Parameters.ParamByName('EditId').Value  := Trim(AdvGdMaterial.Cells[4,i]);
            ADOQuery1.ExecSQL;
        end;
        FrmMain.ADOConnection.CommitTrans;
        Result := 0;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Result := 1;
    end;
    ADOQuery1.Close;
end;

function TFrmBasicSetting.UpdateTruckInfotoDb() : Integer;         //更新数据库中的车辆信息
//返回：  1：车辆编号空    2：车辆编号重复  3：车辆核载方量无效   4:写数据库失败    5:更新数据库失败
//        6: 删除记录失败
var
    i, k : Integer;
    TruckCode : String;
    TruckLoadAmt : Double;
    SubStrIndx : Integer;
    SubStr : String;
begin
    //检查车辆编号和核载方量
    for i:=1 to AdvGdTruck.RowCount -1 do
    begin
        TruckCode := Trim(AdvGdTruck.Cells[1, i]);

        if Trim(AdvGdTruck.Cells[7, i]) <> '' then
        begin
            //车辆编号是否为空
            if TruckCode = '' then
            begin
                if Application.MessageBox(pchar('车辆表格中第 ' + inttostr(i) + ' 行车辆编号无效'), '车辆管理', MB_OK) = idOK then
                begin
                    Result := 1;
                    Exit;
                end;
            end;
            //车辆编号是否重复
            for k:= i +1 to AdvGdTruck.RowCount - 1 do
            begin
                if TruckCode = Trim(AdvGdTruck.Cells[1, k]) then
                begin
                    if Application.MessageBox(pchar('车辆表格中第 ' + inttostr(i) + ' 与第 ' + inttostr(k) + ' 行车辆编号重复'), '车辆管理', MB_OK) = idOK then
                    begin
                        Result := 2;
                        Exit;
                    end;
                end;
            end;
            //核载方量
            TruckLoadAmt := StrToFloat(Trim(AdvGdTruck.Cells[2, i]));
            if TruckLoadAmt < 0.5 then
            begin
                if Application.MessageBox(pchar('车辆表格中第 ' + inttostr(i) + ' 行车辆核载方量无效'), '车辆管理', MB_OK) = idOK then
                begin
                    Result := 3;
                    Exit;
                end;
            end;
        end;
    end;

    //删除车辆信息
    while (DelTruckIdsStr <> '') do
    begin
        SubStrIndx := Pos('[',DelTruckIdsStr);
        if SubStrIndx >0 then
        begin
            Delete(DelTruckIdsStr, 1, SubStrIndx);
            SubStrIndx := Pos(']', DelTruckIdsStr);
            SubStr := copy(DelTruckIdsStr, 1, SubStrIndx -1);
            if SubStr <> '' then
            begin
                try
                    FrmMain.ADOConnection.BeginTrans;
                    ADOQuery1.Close;
                    ADOquery1.SQL.Text := 'delete from Truck where ID=' + SubStr ;
                    ADOQuery1.ExecSQL;
                    FrmMain.ADOConnection.CommitTrans;
                    Result := 0;
                except
                    FrmMain.ADOConnection.RollbackTrans;
                    DelTruckIdsStr := '[' + DelTruckIdsStr;
                    if Application.MessageBox(pchar('删除车辆信息失败!'), '车辆管理', MB_OK) = idOK then
                    begin
                        Result := 6;
                        break;
                    end;
                end;
            end;
        end
        else
        begin
            Break;
        end;
    end;

    //向数据库中添加新的车辆信息
    for i:=1 to AdvGdTruck.RowCount -1 do
    begin
        if AdvGdTruck.Cells[7, i] = '0' then
        begin
            try
                FrmMain.ADOConnection.BeginTrans;
                ADOQuery1.Close;
                ADOQuery1.SQL.Text := 'insert into Truck (Code,Driver1,Capacity,Rek) values ('
                                    + ':Code,:Driver1,:Capacity,:Rek)';
                ADOQuery1.Parameters.ParamByName('Code').Value     := Trim(AdvGdTruck.Cells[1, i]);
                ADOQuery1.Parameters.ParamByName('Driver1').Value  := Trim(AdvGdTruck.Cells[3, i]);
                ADOQuery1.Parameters.ParamByName('Capacity').Value := Trim(AdvGdTruck.Cells[2, i]);
                ADOQuery1.Parameters.ParamByName('Rek').Value      := Trim(AdvGdTruck.Cells[4, i]);
                ADOQuery1.ExecSQL;
                FrmMain.ADOConnection.CommitTrans;
                ADOQuery1.Close;
                ADOQuery1.SQL.Text := 'select ID from Truck where Code=' + '''' + Trim(AdvGdTruck.Cells[1, i]) + '''';
                ADOQuery1.Open;
                if ADOQuery1.Eof then
                begin
                    Result := 4;
                end
                else
                begin
                    AdvGdTruck.Cells[7, i] := ADOQuery1.FieldByName('ID').AsString;
                    Result := 0;
                end;
            except
                FrmMain.ADOConnection.RollbackTrans;
                if Application.MessageBox(pchar('车辆表格中第 ' + inttostr(i) + ' 行车辆核载方量无效'), '车辆管理', MB_OK) = idOK then ;
                Result := 4;
            end;
        end
        else if AdvGdTruck.Cells[7, i] <> '' then
        begin
            try
                FrmMain.ADOConnection.BeginTrans;
                ADOQuery1.Close;
                ADOQuery1.SQL.Text := 'update Truck Set Code=:NewCode, Driver1=:NewDriver, Capacity=:NewCapacity, Rek=:NewRek where ID=:EditId';
                ADOQuery1.Parameters.ParamByName('NewCode').Value     := Trim(AdvGdTruck.Cells[1, i]);
                ADOQuery1.Parameters.ParamByName('NewDriver').Value   := Trim(AdvGdTruck.Cells[3, i]);
                ADOQuery1.Parameters.ParamByName('NewCapacity').Value := Trim(AdvGdTruck.Cells[2, i]);
                ADOQuery1.Parameters.ParamByName('NewRek').Value      := Trim(AdvGdTruck.Cells[4, i]);
                ADOQuery1.Parameters.ParamByName('EditId').Value      := Trim(AdvGdTruck.Cells[7, i]);
                ADOQuery1.ExecSQL;
                FrmMain.ADOConnection.CommitTrans;
                Result := 0;
            except
                FrmMain.ADOConnection.RollbackTrans;
                if Application.MessageBox(pchar('车辆表格中第 ' + inttostr(i) + ' 行更新数据库失败!'), '车辆管理', MB_OK) = idOK then
                begin
                    Result := 5;
                end;
            end;
        end;
    end;
end;

procedure TFrmBasicSetting.AdvGdTruckGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    if ARow = 0 then
    begin
        HAlign := taCenter;
    end
    else
    begin
        case ACol of
            0:  HAlign := taCenter;
            2 : HAlign := taRightJustify;   //数字型                
        end;
    end;
end;

procedure TFrmBasicSetting.AdvGdTruckGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
    if ( ARow >0 ) then
    begin
        case Acol of
            5,6 :
            begin
                AEditor := edNone;
            end;
            2 :
            begin
                AEditor := edNone;
            end;

        end;
 
    end;
end;

procedure TFrmBasicSetting.AdvGdTruckButtonClick(Sender: TObject; ACol,
  ARow: Integer);
var
    GrdRow : Integer;
begin
    case Acol of
        6:    //添加车辆
        begin
            GrdRow := AdvGdTruck.RowCount;
            AdvGdTruck.RowCount := GrdRow + 1;
            AdvGdTruck.Cells[2, GrdRow] := '0.00';
            AdvGdTruck.Cells[7, GrdRow] := '0';
            
            UpdateAdvGdTruckOperBtn();    //更新运输车辆表格的操作按钮
        end;
        5:
        begin
            if Trim(AdvGdTruck.Cells[7, ARow]) = '' then    //添加按钮
            begin
                AdvGdTruck.Rows[ARow].Clear;
                AdvGdTruck.Cells[2, ARow] := '0';
                AdvGdTruck.Cells[7, ARow] := '0';
            end
            else
            begin    //删除按钮

                //是否记录该删除操作
                if AdvGdTruck.Cells[7, ARow] = '0' then    //内存中新添加的记录
                begin

                end
                else    //数据库中已有的记录
                begin
                    DelTruckIdsStr := DelTruckIdsStr + '[' + AdvGdTruck.Cells[7, ARow] + ']';
                end;

                //是否删除该行
                if AdvGdTruck.RowCount = 2 then    //表格中只有一行
                begin
                    AdvGdTruck.Rows[ARow].Clear;
                    AdvGdTruck.Cells[2, ARow] := '0';
                    AdvGdTruck.Cells[7, ARow] := '';
                end
                else
                begin
                    AdvGdTruck.RemoveRows(ARow, 1);   //删除该行
                end;
            end;
            
            UpdateAdvGdTruckOperBtn();    //更新运输车辆表格的操作按钮
        end;
    end;
end;

procedure TFrmBasicSetting.AdvGdTruckGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
    case ACol of
        0:  FloatFormat:='%.0f';     //保留2位小数
        1:  IsFloat := False;
        2:  FloatFormat:='%.2f';     //保留2位小数
    end;
end;

procedure TFrmBasicSetting.AdvGdTruckClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
    i : Integer;
    EtLeft : Integer;
begin
    if (ARow > 0) and (Acol = 2) then
    begin
        EtLeft := AdvGdTruck.Left + AdvGdTruck.ColWidths[0];
        for i:=AdvGdTruck.LeftCol to 1 do
        begin
            EtLeft := EtLeft + AdvGdTruck.ColWidths[i];
        end;
        AdvSpinEdit2.Left := EtLeft;

        AdvSpinEdit2.Top := AdvGdTruck.Top + AdvGdTruck.DefaultRowHeight * (ARow -AdvGdTruck.TopRow +1) - AdvGdTruck.GridLineWidth;

        AdvSpinEdit2.Width := AdvGdTruck.ColWidths[2];
        AdvSpinEdit2.Visible := True;
        AdvSpinEdit2.Text := AdvGdTruck.Cells[2, ARow];
        AdvSpinEdit2.SetFocus;
    end
    else
    begin
        if AdvSpinEdit2.Visible then
        begin
            AdvGdTruck.Cells[2, ARow] := AdvSpinEdit2.Text;
            AdvSpinEdit2.Visible := False;
        end;
    end;
end;

procedure TFrmBasicSetting.AdvSpinEdit2Exit(Sender: TObject);
begin
    if AdvSpinEdit2.Visible then
    begin
        AdvGdTruck.Cells[2, AdvGdTruck.Row] := AdvSpinEdit2.Text;
        AdvSpinEdit2.Visible := False;
    end;
end;

procedure TFrmBasicSetting.AdvGdTruckCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
    if (Acol = 1) and (AdvGdTruck.Cells[7, ARow] = '') then CanEdit := False;

end;

procedure TFrmBasicSetting.cxButton1Click(Sender: TObject);
begin
    Self.Close;
end;

end.
