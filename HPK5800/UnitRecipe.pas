unit UnitRecipe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinManager, ComCtrls, sPageControl, Buttons, sSpeedButton,
  ExtCtrls, sPanel, StdCtrls, sBitBtn, sComboBoxes, sComboBox, sEdit,
  sLabel, Grids, AdvObj, BaseGrid, AdvGrid, Mask, sMaskEdit,
  sCustomComboEdit, sToolEdit, sMemo, DB, ADODB;

type
  TFrmRecipe = class(TForm)
    sPageControl1: TsPageControl;
    sTabRecipeLst: TsTabSheet;
    sTabRecipeDetails: TsTabSheet;
    sPanel1: TsPanel;
    sBitBtnAddRecipe: TsBitBtn;
    sBitBtnDelRecipe: TsBitBtn;
    sCmbBoxSearchType: TsComboBox;
    sLabel1: TsLabel;
    sEdtSearchDetails: TsEdit;
    sBitBtnPrtRecipeLst: TsBitBtn;
    sBitBtnSearch: TsBitBtn;
    sBitBtnSaveRecipe: TsBitBtn;
    sBitBtnPrtRecipeDetails: TsBitBtn;
    AdvStringGrid1: TAdvStringGrid;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    AdvStrGrdRecipeDetails: TAdvStringGrid;
    sLabel5: TsLabel;
    sCmbBoxRecipeState: TsComboBox;
    sLabel6: TsLabel;
    sMemoTechReq: TsMemo;
    sCmbBoxRecipeCode: TsComboBox;
    sCmbBoxRecipeVariety: TsComboBox;
    sEdtMatrialRation: TsEdit;
    sLabel7: TsLabel;
    sCmbBoxRecipeStrength: TsComboBox;
    sLabel8: TsLabel;
    sCmbBoxSlump: TsComboBox;
    sLabel9: TsLabel;
    sDateEdit1: TsDateEdit;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    sCmbBoxRecipeTstr: TsComboBox;
    sCmbBoxRecipeAssessor: TsComboBox;
    sBitBtn1: TsBitBtn;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    sEdtRecipeId: TsEdit;
    sLabel12: TsLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AdvStringGrid1GetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormCreate(Sender: TObject);
    procedure sTabRecipeLstShow(Sender: TObject);
    procedure sTabRecipeDetailsShow(Sender: TObject);
    procedure sBitBtnAddRecipeClick(Sender: TObject);
    procedure AdvStrGrdRecipeDetailsCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure AdvStrGrdRecipeDetailsCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure AdvStrGrdRecipeDetailsGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure AdvStrGrdRecipeDetailsGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sCmbBoxRecipeCodeChange(Sender: TObject);
    procedure sCmbBoxRecipeVarietyChange(Sender: TObject);
    procedure sCmbBoxRecipeStrengthChange(Sender: TObject);
    procedure sCmbBoxSlumpChange(Sender: TObject);
    procedure sEdtMatrialRationChange(Sender: TObject);
    procedure sMemoTechReqChange(Sender: TObject);
    procedure sCmbBoxRecipeStateChange(Sender: TObject);
    procedure sCmbBoxRecipeTstrChange(Sender: TObject);
    procedure sCmbBoxRecipeAssessorChange(Sender: TObject);
    procedure sDateEdit1Change(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sTabRecipeDetailsExit(Sender: TObject);
    procedure sBitBtnSaveRecipeClick(Sender: TObject);
    procedure AdvStrGrdRecipeDetailsCellsChanged(Sender: TObject;
      R: TRect);
    procedure sCmbBoxSearchTypeChange(Sender: TObject);
    procedure AdvStringGrid1DblClick(Sender: TObject);
    procedure sBitBtnDelRecipeClick(Sender: TObject);
  private
    { Private declarations }
    IsAddRecipe : Boolean;
    ModifyStr : String;
    CanEditRecipe   : Boolean;
    procedure InitPermissonForRecipe();
  public
    { Public declarations }
    procedure UpdateSums;
    procedure IniRecipeDetailsForAddNew();
    function CreateNewRecipeCode() : String;
    procedure LoadRecipeVarietyIntoComboBox();
    procedure LoadRecipeStrengthIntoComboBox();
    procedure LoadRecipeSlumpIntoComboBox();
    procedure LoadRecipeTstrIntoComboBox();
    procedure LoadRecipeAssessorIntoComboBox();
    function WtNewRecipeIntoDb() : Integer;
    procedure RdRecipeFromDbToRecipeLst();          //从数据库中读取配比信息到配比列表中
    procedure RdSelectRecipeFromDbToFrmDetails();   //从数据库中读取配比内容到显示窗体中
    function ModufyRecipeInDb() : Integer;          //修改配比存储
  end;

var
  FrmRecipe: TFrmRecipe;

implementation

uses UnitGlobeVar , UnitMain, UnitRWDb, UnitPersonnelMangement;

{$R *.dfm}

procedure TFrmRecipe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmRecipeCrt := False;
    Action := caFree;
end;

procedure TFrmRecipe.FormCreate(Sender: TObject);
begin
    sBitBtnSaveRecipe.Left := sBitBtnSearch.Left;
    
    ADOQuery1.Connection := FrmMain.ADOConnection;

    sCmbBoxRecipeCode.Font.Color := clRed;

    IsAddRecipe := False;

    sCmbBoxSearchType.ItemIndex := 1;

    {权限初始化}
    InitPermissonForRecipe();

end;

procedure TFrmRecipe.InitPermissonForRecipe();
begin
    if pos('[' + CntPermissonCode[CntPermIsRecipe] + 'e', PersonnelPermit ) >= 1 then
    begin
        CanEditRecipe := True;
        
        sBitBtnAddRecipe.Enabled := True;
        sBitBtnDelRecipe.Enabled := True;

        sCmbBoxRecipeCode.Enabled := True;
        sEdtRecipeId.Enabled      := True;
        sDateEdit1.Enabled        := True;
        sCmbBoxRecipeVariety.Enabled := True;
        sCmbBoxRecipeStrength.Enabled := True;
        sCmbBoxSlump.Enabled      := True;
        sEdtMatrialRation.Enabled := True;
        //AdvStrGrdRecipeDetails.Enabled := True;
        sCmbBoxRecipeState.Enabled := True;
        sCmbBoxRecipeTstr.Enabled  := true;
        sCmbBoxRecipeAssessor.Enabled := True;

    end
    else
    begin
        CanEditRecipe := False;

        sBitBtnAddRecipe.Enabled := false;
        sBitBtnDelRecipe.Enabled := False;

        sCmbBoxRecipeCode.Enabled := False;
        sEdtRecipeId.Enabled      := False;
        sDateEdit1.Enabled        := False;
        sCmbBoxRecipeVariety.Enabled := False;
        sCmbBoxRecipeStrength.Enabled := False;
        sCmbBoxSlump.Enabled      := False;
        sEdtMatrialRation.Enabled := False;
        //AdvStrGrdRecipeDetails.Enabled := False;
        sCmbBoxRecipeState.Enabled := False;
        sCmbBoxRecipeTstr.Enabled := False;
        sCmbBoxRecipeAssessor.Enabled := False;
        
    end;
end;

procedure TFrmRecipe.FormShow(Sender: TObject);
var
    i : Integer;
begin
   sPageControl1.ActivePageIndex := 0;

   {配比列表页}
   AdvStringGrid1.Cells[0, 0] := '序号' ;
   AdvStringGrid1.ColWidths[0] := 40 ;
   AdvStringGrid1.Cells[1, 0] := 'IDInDb';
   AdvStringGrid1.ColWidths[1] := 0 ;
   AdvStringGrid1.Cells[2, 0] := '配比编号';
   AdvStringGrid1.ColWidths[2] := 150 ;
   AdvStringGrid1.Cells[3, 0] := '配比类别' ;
   AdvStringGrid1.ColWidths[3] := 100 ;
   AdvStringGrid1.Cells[4, 0] := '制定日期' ;
   AdvStringGrid1.ColWidths[4] := 90 ;
   AdvStringGrid1.Cells[5, 0] := '强度等级' ;
   AdvStringGrid1.ColWidths[5] := 70 ;
   AdvStringGrid1.Cells[6, 0] := '设计比例' ;
   AdvStringGrid1.ColWidths[6] := 100 ;
   AdvStringGrid1.Cells[7, 0] := '坍落度' ;
   AdvStringGrid1.ColWidths[7] := 80 ;
   AdvStringGrid1.Cells[8, 0] := '配比状态' ;
   AdvStringGrid1.ColWidths[8] := 80 ;
   AdvStringGrid1.Cells[9, 0] := '实验员' ;
   AdvStringGrid1.ColWidths[9] := 80 ;
   AdvStringGrid1.Cells[10, 0] := '审核员' ;
   AdvStringGrid1.ColWidths[10] := 80 ;
   AdvStringGrid1.Cells[11, 0] := '技术要求' ;
   AdvStringGrid1.ColWidths[11] := 140 ;

   sEdtSearchDetails.Text := '';
   

   {配比明细页}
   AdvStrGrdRecipeDetails.Cells[0, 0] := '序号';
   AdvStrGrdRecipeDetails.ColWidths[0] := 50;
   AdvStrGrdRecipeDetails.Cells[1, 0] := 'MaterialID' ;
   AdvStrGrdRecipeDetails.ColWidths[1] := 0;
   AdvStrGrdRecipeDetails.Cells[2, 0] := '材料名称' ;
   AdvStrGrdRecipeDetails.ColWidths[2] := 150;
   AdvStrGrdRecipeDetails.Cells[3, 0] := '型号规格' ;
   AdvStrGrdRecipeDetails.ColWidths[3] := 150;
   AdvStrGrdRecipeDetails.Cells[4, 0] := '用量/立方(kg)' ;
   AdvStrGrdRecipeDetails.ColWidths[4] := 110;
   AdvStrGrdRecipeDetails.Cells[5, 0] := '备注' ;
   AdvStrGrdRecipeDetails.ColWidths[5] := 190;
   
   AdvStrGrdRecipeDetails.AutoNumberCol(0);

   //获取原材料信息
   ADOQuery1.Close;
   ADOQuery1.SQL.Clear;
   ADOQuery1.SQL.Text := 'select * from Material order by ID';
   ADOQuery1.Open;
   AdvStrGrdRecipeDetails.RowCount := ADOQuery1.RecordCount + 2;
   ADOQuery1.First;
   i := 1;
   while not ADOQuery1.Eof do
   begin
       AdvStrGrdRecipeDetails.Cells[1, i] := ADOQuery1.FieldByName('ID').AsString;
       AdvStrGrdRecipeDetails.Cells[2, i] := ADOQuery1.FieldByName('MaterName').AsString;
       AdvStrGrdRecipeDetails.Cells[3, i] := ADOQuery1.FieldByName('MaterSpecs').AsString;
       i := i + 1;
       ADOQuery1.Next;
   end;

   AdvStrGrdRecipeDetails.Cells[0, AdvStrGrdRecipeDetails.RowCount -1] := '总重';
   UpdateSums;

   ADOQuery1.Close;
end;

procedure TFrmRecipe.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    if ARow = 0 then HAlign := taCenter;
end;

procedure TFrmRecipe.AdvStrGrdRecipeDetailsCellValidate(Sender: TObject;
  ACol, ARow: Integer; var Value: String; var Valid: Boolean);
begin
    UpdateSums;
end;

procedure TFrmRecipe.UpdateSums;
var
  i: Integer;
begin
  AdvStrGrdRecipeDetails.Floats[4, AdvStrGrdRecipeDetails.RowCount - 1] :=
    AdvStrGrdRecipeDetails.ColumnSum(4, 1, AdvStrGrdRecipeDetails.RowCount - 2);
  AdvStrGrdRecipeDetails.FloatingFooter.Invalidate;
end;

procedure TFrmRecipe.AdvStrGrdRecipeDetailsCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
    if CanEditRecipe then
    begin
        case ACol of
            4,5 :
            begin

            end;
            else
            begin
                CanEdit := False;
            end;
        end;
    end
    else
    begin
        CanEdit := False;
    end;
end;

procedure TFrmRecipe.AdvStrGrdRecipeDetailsGetCellColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
    if( ARow > 0 ) and ( ARow < AdvStrGrdRecipeDetails.RowCount - 1) then
    begin
        case ACol of
            2,3:
            begin
                ABrush.Color := clBtnFace;
            end;
        end;
    end;
end;

procedure TFrmRecipe.AdvStrGrdRecipeDetailsGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    if ARow = 0 then HAlign := taCenter
    else
    begin
        case ACol of
            0:    HAlign := taCenter;
            4:    HAlign := taRightJustify;
        end;
    end;
end;

procedure TFrmRecipe.sTabRecipeLstShow(Sender: TObject);
begin
    IsAddRecipe := False;

    sBitBtnAddRecipe.Visible := True;
    sBitBtnDelRecipe.Visible := True;
    sBitBtnPrtRecipeDetails.Left := 136;
    sBitBtnSaveRecipe.Visible := False;
    sCmbBoxSearchType.Visible := True;
    //sLabel1.Visible := True;
    //sEdtSearchDetails.Visible := True;
    //sBitBtnSearch.Visible := True;
    //sBitBtnPrtRecipeLst.Visible := True;

    RdRecipeFromDbToRecipeLst();
end;

procedure TFrmRecipe.RdRecipeFromDbToRecipeLst();
var
    SearchType : String;
    GrdWtRow : Integer;
begin
    SearchType := sCmbBoxSearchType.Text ;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    if SearchType = '所有配比' then begin
        ADOQuery1.SQL.Text := 'select * from RecipeInfo Order by Code';
    end
    else if SearchType = '正常配比' then begin
        ADOQuery1.SQL.Text := 'select * from RecipeInfo where Flag=' + '''' + '0' + '''' +' Order by Code';
    end
    else if SearchType = '停用配比' then begin
        ADOQuery1.SQL.Text := 'select * from RecipeInfo where Flag<>' + '''' + '0' + '''' +' Order by Code';
    end
    else if SearchType = '配比类别' then begin

    end
    else if SearchType = '配比编号' then begin

    end
    else if SearchType = '坍落度' then begin

    end
    else if SearchType = '强度等级' then begin

    end
    else if SearchType = '实验员' then begin

    end
    else if SearchType = '审核员' then begin

    end;
    if ADOQuery1.SQL.Text <> '' then
    begin
        ADOQuery1.Open;
        if ADOQuery1.Eof then
        begin
            AdvStringGrid1.RowCount := 2;
            AdvStringGrid1.Rows[1].Clear;
        end
        else
        begin
            AdvStringGrid1.RowCount := ADOQuery1.RecordCount + 1;
            ADOQuery1.First;
            GrdWtRow := 1;
            while not ADOQuery1.Eof do
            begin
                AdvStringGrid1.Cells[0,  GrdWtRow] := inttostr(GrdWtRow);
                AdvStringGrid1.Cells[1,  GrdWtRow] := ADOQuery1.FieldByName('ID').AsString;
                AdvStringGrid1.Cells[2,  GrdWtRow] := ADOQuery1.FieldByName('Code').AsString;
                AdvStringGrid1.Cells[3,  GrdWtRow] := ADOQuery1.FieldByName('Variety').AsString;     //'配比类别' ;
                AdvStringGrid1.Cells[4,  GrdWtRow] := ADOQuery1.FieldByName('DtTm').AsString;        //制定日期' ;
                AdvStringGrid1.Cells[5,  GrdWtRow] := ADOQuery1.FieldByName('Strength').AsString;    //强度等级' ;
                AdvStringGrid1.Cells[6,  GrdWtRow] := ADOQuery1.FieldByName('Ration').AsString;      //设计比例' ;
                AdvStringGrid1.Cells[7,  GrdWtRow] := ADOQuery1.FieldByName('Slump').AsString;       //坍落度' ;
                if ADOQuery1.FieldByName('Flag').AsString = '0' then
                    AdvStringGrid1.Cells[8,  GrdWtRow] := '正常使用'
                else
                    AdvStringGrid1.Cells[8,  GrdWtRow] := '停止使用';
                AdvStringGrid1.Cells[9,  GrdWtRow] := ADOQuery1.FieldByName('Tstr').AsString;       //实验员' ;
                AdvStringGrid1.Cells[10, GrdWtRow] := ADOQuery1.FieldByName('Assessor').AsString;   //审核员' ;
                AdvStringGrid1.Cells[11, GrdWtRow] := ADOQuery1.FieldByName('TechReq').AsString;    //技术要求' ;
                GrdWtRow := GrdWtRow +1;
                ADOQuery1.Next;
            end;
        end;
    end;
end;

procedure TFrmRecipe.sTabRecipeDetailsShow(Sender: TObject);
begin
    sBitBtnAddRecipe.Visible := False;
    sBitBtnDelRecipe.Visible := False;
    sBitBtnPrtRecipeDetails.Left := sBitBtnPrtRecipeLst.Left ;
    sBitBtnSaveRecipe.Visible := True;
    sCmbBoxSearchType.Visible := False;
    sLabel1.Visible := False;
    sEdtSearchDetails.Visible := False;
    sBitBtnSearch.Visible := False;
    sBitBtnPrtRecipeLst.Visible := False;

    //装载各个下拉框
    LoadRecipeVarietyIntoComboBox();
    LoadRecipeStrengthIntoComboBox();
    LoadRecipeSlumpIntoComboBox();
    LoadRecipeTstrIntoComboBox();
    LoadRecipeAssessorIntoComboBox();

    if Not IsAddRecipe then
    begin
        RdSelectRecipeFromDbToFrmDetails();
    end;

     sBitBtnSaveRecipe.Enabled := False;
end;

procedure TFrmRecipe.LoadRecipeVarietyIntoComboBox();
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from BasiInfo where Code=' + '''' + 'RV' + '''';
    ADOQuery1.Open;
    sCmbBoxRecipeVariety.Items.Clear;
    while not ADOQuery1.Eof do
    begin
        sCmbBoxRecipeVariety.Items.Add(ADOQuery1.FieldByName('RdValues').AsString);
        ADOQuery1.Next;
    end;
end;

procedure TFrmRecipe.LoadRecipeStrengthIntoComboBox();
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from BasiInfo where Code=' + '''' + 'RSt' + '''';
    ADOQuery1.open;
    sCmbBoxRecipeStrength.Items.Clear;
    while not ADOQuery1.Eof do
    begin
        sCmbBoxRecipeStrength.Items.Add(ADOQuery1.FieldByName('RdValues').AsString);
        ADOQuery1.Next;
    end;
end;

procedure TFrmRecipe.LoadRecipeSlumpIntoComboBox();
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from BasiInfo where Code=' + '''' + 'RSl' + '''';
    ADOQuery1.Open;
    sCmbBoxSlump.Items.Clear;
    while not ADOQuery1.Eof do
    begin
        sCmbBoxSlump.Items.Add(ADOQuery1.FieldByName('RdValues').AsString);
        ADOQuery1.Next;
    end;
end;

procedure TFrmRecipe.LoadRecipeTstrIntoComboBox();
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from BasiInfo where Code=' + '''' + 'Rstr' + '''';
    ADOQuery1.Open;
    sCmbBoxRecipeTstr.Items.Clear;
    while not ADOQuery1.Eof do
    begin
        sCmbBoxRecipeTstr.Items.Add(ADOQuery1.FieldByName('RdValues').AsString);
        ADOQuery1.Next;
    end;
end;

procedure TFrmRecipe.LoadRecipeAssessorIntoComboBox();
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from BasiInfo where Code=' + '''' + 'RAss' + '''';
    ADOQuery1.Open;
    sCmbBoxRecipeAssessor.Items.Clear;
    while not ADOQuery1.Eof do
    begin
        sCmbBoxRecipeAssessor.Items.Add(ADOQuery1.FieldByName('RdValues').AsString);
        ADOQuery1.Next;
    end;
end;

procedure TFrmRecipe.RdSelectRecipeFromDbToFrmDetails();
var
    SelectRow : Integer;
    SelectRecipeIdInDb : String;
    ExResult : Boolean;
    RecipeMateId : String;
    i : Integer;
begin
     SelectRow := AdvStringGrid1.Row;
     SelectRecipeIdInDb := Trim(AdvStringGrid1.Cells[1, SelectRow]) ;
     sEdtRecipeId.Text := SelectRecipeIdInDb;

     if SelectRecipeIdInDb = '' then
     begin
        ExResult := False;
        Exit;
     end;

     ADOQuery1.Close;
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Text := 'select * from RecipeInfo where ID=' + SelectRecipeIdInDb ;
     ADOQuery1.Open;
     if not ADOQuery1.Eof then
     begin
         sCmbBoxRecipeCode.Text := ADOQuery1.FieldByName('Code').AsString;
         sDateEdit1.Date := ADOQuery1.FieldByName('DtTm').AsDateTime;
         sCmbBoxRecipeVariety.Text := ADOQuery1.FieldByName('Variety').AsString;
         sCmbBoxRecipeStrength.Text := ADOQuery1.FieldByName('Strength').AsString;
         sCmbBoxSlump.Text := ADOQuery1.FieldByName('Slump').AsString;
         sEdtMatrialRation.Text := ADOQuery1.FieldByName('Ration').AsString;

         if ADOQuery1.FieldByName('Flag').AsInteger = 0 then
           sCmbBoxRecipeState.ItemIndex := 0
         else
           sCmbBoxRecipeState.ItemIndex := 1;

         sCmbBoxRecipeTstr.Text := ADOQuery1.FieldByName('Tstr').AsString;
         sCmbBoxRecipeAssessor.Text := ADOQuery1.FieldByName('Assessor').AsString;
         sMemoTechReq.Text := ADOQuery1.FieldByName('TechReq').AsString;
     end
     else
     begin
         Showmessage('无效的配比索引');
     end;

     for i:=1 to AdvStrGrdRecipeDetails.RowCount -2 do
     begin
         AdvStrGrdRecipeDetails.Cells[4,i] := '0';
     end;

     ADOQuery1.Close;
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Text := 'select * from RecipeLst where RecipeInfoId=' + SelectRecipeIdInDb + ' ' + 'order by MaterId';
     ADOQuery1.Open;
     while not ADOQuery1.Eof do
     begin
         RecipeMateId := ADOQuery1.FieldByName('MaterId').AsString;
         ExResult := False;
         for i:=1 to AdvStrGrdRecipeDetails.RowCount -2 do
         begin
             if RecipeMateId = AdvStrGrdRecipeDetails.Cells[1,i] then
             begin
                 AdvStrGrdRecipeDetails.Cells[4,i] := ADOQuery1.FieldByName('Amount').AsString;
                 ExResult := True;
                 Break;
             end;
         end;
         if Not ExResult then Showmessage('配比材料用量显示失败');
         ADOQuery1.Next;
     end;
end;

procedure TFrmRecipe.sBitBtnAddRecipeClick(Sender: TObject);
var
    i : Integer;
begin
    IsAddRecipe := True;
    ModifyStr := '';
    IniRecipeDetailsForAddNew();
    sTabRecipeDetails.Show;
    for i:=1 to AdvStrGrdRecipeDetails.RowCount - 2 do
    begin
        AdvStrGrdRecipeDetails.Cells[4, i] := '0';
    end;
end;

procedure TFrmRecipe.IniRecipeDetailsForAddNew();
begin
    //新配方自动编码
    sCmbBoxRecipeCode.Text := CreateNewRecipeCode();
    sDateEdit1.Date := Date();
    sCmbBoxRecipeVariety.Text := '';
    sCmbBoxRecipeStrength.Text := '';
    sCmbBoxSlump.Text := '';
    sEdtMatrialRation.Text := '';
    sMemoTechReq.Text := '';
    sCmbBoxRecipeState.ItemIndex := 0;
    sCmbBoxRecipeTstr.Text := '';
    sCmbBoxRecipeAssessor.Text := '';
    sEdtRecipeId.Text := '';
end;

Function TFrmRecipe.CreateNewRecipeCode() : String;
var
    RecordCount : Integer;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select count(*) as RecCount from RecipeInfo where DtTm=:CurrentDate';
    ADOQuery1.Parameters.ParamByName('CurrentDate').Value := Date();
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
        RecordCount := ADOQuery1.FieldByName('RecCount').AsInteger
    else
        RecordCount := 0;
    Result := formatDateTime('yy', date) + formatDateTime('mm',date) + formatDateTime('dd',date) + Format('%.3d', [RecordCount+1]);
end;

procedure TFrmRecipe.sCmbBoxRecipeCodeChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sCmbBoxRecipeVarietyChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sCmbBoxRecipeStrengthChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sCmbBoxSlumpChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sEdtMatrialRationChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.AdvStrGrdRecipeDetailsCellsChanged(Sender: TObject;
  R: TRect);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sMemoTechReqChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sCmbBoxRecipeStateChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sCmbBoxRecipeTstrChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sCmbBoxRecipeAssessorChange(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sDateEdit1Change(Sender: TObject);
begin
    sBitBtnSaveRecipe.Enabled := True;
end;

procedure TFrmRecipe.sBitBtn1Click(Sender: TObject);
begin
    sCmbBoxSlump.SetFocus;
    sCmbBoxSlump.SelText := sCmbBoxSlump.Text + '±';
end;

procedure TFrmRecipe.sTabRecipeDetailsExit(Sender: TObject);
begin
   // Showmessage('Exit');
   //IsAddRecipe := False;
end;

procedure TFrmRecipe.sBitBtnSaveRecipeClick(Sender: TObject);
var
    RecipeCode : String;
    RecipeVariety : String ;
    RecipeStrength : String;
    RecipeSlump : String;
    RecipeTstr : String;
    RecipeAssessot : String;
    WtDbResult : integer;
begin
    if CanEditRecipe then
    begin
        RecipeVariety := Trim(sCmbBoxRecipeVariety.Text);
        if RecipeVariety <> '' then WtNewBasicInfoIntoDb('RV', RecipeVariety);   //保存配比类别

        RecipeStrength := Trim(sCmbBoxRecipeStrength.Text);    //保存强度等级
        if RecipeStrength <> '' then WtNewBasicInfoIntoDb('RSt',RecipeStrength);

        RecipeSlump := Trim(sCmbBoxSlump.Text);
        if RecipeSlump <> '' then WtNewBasicInfoIntoDb('RSl', RecipeSlump);    //保存坍落度

        RecipeTstr := Trim(sCmbBoxRecipeTstr.Text);
        if RecipeTstr <> '' then WtNewBasicInfoIntoDb('Rstr', RecipeTstr);  //保存实验员

        RecipeAssessot := Trim(sCmbBoxRecipeAssessor.Text) ;
        if RecipeAssessot <> '' then WtNewBasicInfoIntoDb('RAss',RecipeAssessot);   //保存审核员

        LoadRecipeVarietyIntoComboBox();
        LoadRecipeStrengthIntoComboBox();
        LoadRecipeSlumpIntoComboBox();
        LoadRecipeTstrIntoComboBox();
        LoadRecipeAssessorIntoComboBox();

        RecipeCode := Trim(sCmbBoxRecipeCode.Text);
        if RecipeCode = '' then
        begin
            Showmessage('无效的配比编号');
            exit;
        end;

        if IsAddRecipe then    //添加配比
        begin
            WtDbResult := WtNewRecipeIntoDb();
            case WtDbResult of
                0:
                begin
                    sBitBtnSaveRecipe.Enabled := False;
                    IsAddRecipe := False;
                end;
                1:    Showmessage('配比编号重复');
                2:    Showmessage('添加配比信息失败');
                3:    Showmessage('获取新配比ID失败');
                4:    Showmessage('初始化配比明细表出错');
                5:    Showmessage('添加配比明细失败!');
            end;
        end
        else    //更改配比
        begin
            WtDbResult := ModufyRecipeInDb();
            case WtDbResult of
                0:
                begin
                    sBitBtnSaveRecipe.Enabled := False;
                end;
                1:    Showmessage('配比信息不存在');
                2:    Showmessage('修改配比信息失败');
                3:    Showmessage('修改配比用量失败');
                4:    Showmessage('配比修改失败');
            end;
        end;
    end;


end;

function TFrmRecipe.WtNewRecipeIntoDb() : Integer;
//返回值 0：成功  1：配比编号重复  2：添加配比信息失败  3:读取新配比ID失败
//       4: 配比明细表中有同RecipeInfoID记录    5：添加配比明细失败
Var
    Recipecode : String;
    ExContinue : Boolean;
    NewRecipeIDInDb : Integer;
    i : Integer;
begin
    Recipecode := Trim(sCmbBoxRecipeCode.Text);
    //检查相同编号的配比是否已经存在
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select ID from RecipeInfo where Code=' + '''' + Recipecode + '''';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        Result := 1;
        Exit;
    end;

    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'insert into RecipeInfo (Code,Variety,Strength,Slump,'
                             +'Ration,Flag,Tstr,Assessor,TechReq,DtTm) values ('
                             +':Code,:Variety,:Strength,:Slump,:Ration,:Flag,'
                             +':Tstr,:Assessor,:TechReq,:DtTm)';
        ADOQuery1.Parameters.ParamByName('Code').Value     := Recipecode;
        ADOQuery1.Parameters.ParamByName('Variety').Value  := Trim(sCmbBoxRecipeVariety.Text);
        ADOQuery1.Parameters.ParamByName('Strength').Value := Trim(sCmbBoxRecipeStrength.Text);
        ADOQuery1.Parameters.ParamByName('Slump').Value    := Trim(sCmbBoxSlump.Text);
        ADOQuery1.Parameters.ParamByName('Ration').Value   := Trim(sEdtMatrialRation.Text);
        ADOQuery1.Parameters.ParamByName('Flag').Value     := IntToStr(sCmbBoxRecipeState.ItemIndex);
        ADOQuery1.Parameters.ParamByName('Tstr').Value     := Trim(sCmbBoxRecipeTstr.Text);
        ADOQuery1.Parameters.ParamByName('Assessor').Value := Trim(sCmbBoxRecipeAssessor.Text);
        ADOQuery1.Parameters.ParamByName('TechReq').Value  := Trim(sMemoTechReq.Text);
        ADOQuery1.Parameters.ParamByName('DtTm').Value     := sDateEdit1.Date;
        ADOQuery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
        ExContinue := True;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Result := 2;
        ExContinue := False;
        Exit;
    end;

    if ExContinue then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select Max(ID) as LastId from RecipeInfo';
        ADOQuery1.Open;
        if ADOQuery1.Eof then
        begin
            Result := 3;
            ExContinue := False;
            Exit;
        end
        else
        begin
            NewRecipeIDInDb := ADOQuery1.FieldByName('LastId').AsInteger;
            ExContinue := True;
        end;
    end;
    if ExContinue then    //删除配比明细表中所有该ID值得RecipeInfoId记录
    begin
        try
            FrmMain.ADOConnection.BeginTrans;
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'delete from RecipeLst where RecipeInfoID=' + inttostr(NewRecipeIDInDb);
            ADOQuery1.ExecSQL;
            FrmMain.ADOConnection.CommitTrans;
            ExContinue := True;
        except
            FrmMain.ADOConnection.RollbackTrans;
            Result := 4;
            ExContinue := False;
        end;
    end;
    if ExContinue then    //添加配比用量到配比明细表中
    begin
        Try
            FrmMain.ADOConnection.BeginTrans;
            for i:=1 to AdvStrGrdRecipeDetails.RowCount -2 do
            begin
                ADOQuery1.Close ;
                ADOQuery1.SQL.Text := 'insert into RecipeLst ('
                                    + 'RecipeInfoID,MaterId,Amount,Remark) values ('
                                    + ':RecipeInfoID,:MaterId,:Amount,:Remark)';
                ADOQuery1.Parameters.ParamByName('RecipeInfoID').Value := NewRecipeIDInDb;
                ADOQuery1.Parameters.ParamByName('MaterId').Value      := AdvStrGrdRecipeDetails.Cells[1, i] ;
                ADOQuery1.Parameters.ParamByName('Amount').Value       := AdvStrGrdRecipeDetails.Cells[4, i] ;
                ADOQuery1.Parameters.ParamByName('Remark').Value       := AdvStrGrdRecipeDetails.Cells[5, i] ;
                ADOQuery1.ExecSQL;
             end;
            FrmMain.ADOConnection.CommitTrans;
            ExContinue := True;
        except
            FrmMain.ADOConnection.RollbackTrans;
            ExContinue := False;
            Result := 5;
        end;
    end;

    if ExContinue then
    begin
        Result := 0;
        sEdtRecipeId.Text := Inttostr(NewRecipeIDInDb) ;
    end
    else
    begin
        Result := 6;
    end;
end;

function TFrmRecipe.ModufyRecipeInDb() : Integer;
//返回值：0: 执行成功  1：配比信息不存在  2:更改配比信息失败  3:修改数据库中配比用量失败
//        4：修改失败
var
    ModifyRecipeId : String;
    ExResult : Boolean;
    i : Integer;
    //RdIsExist : Boolean;
    RecipeLstId : Integer;
begin
    ModifyRecipeId := Trim(sEdtRecipeId.Text);

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from RecipeInfo where ID=' + ModifyRecipeId;
    ADOQuery1.Open;
    if ADOQuery1.Eof then
    begin
        ExResult := False;
        Result := 1;
        Exit;
    end
    else
    begin
        ExResult := True;
    end;

    if ExResult then
    begin
        Try
            FrmMain.ADOConnection.BeginTrans;
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'update RecipeInfo set '
                                + 'Code=' + '''' + Trim(sCmbBoxRecipeCode.Text) + ''''
                                + ','
                                + 'Variety=' + '''' + Trim(sCmbBoxRecipeVariety.Text) + ''''
                                + ','
                                + 'Strength=' + '''' + Trim(sCmbBoxRecipeStrength.Text) + ''''
                                + ','
                                + 'Slump=' + '''' + Trim(sCmbBoxSlump.Text) + ''''
                                + ','
                                + 'Ration=' + '''' + Trim(sEdtMatrialRation.Text) + ''''
                                + ','
                                + 'Flag=' + '''' + IntToStr(sCmbBoxRecipeState.ItemIndex) + ''''
                                + ','
                                + 'Tstr=' + '''' + Trim(sCmbBoxRecipeTstr.Text) + ''''
                                + ','
                                + 'Assessor=' + '''' + Trim(sCmbBoxRecipeAssessor.Text) + ''''
                                + ','
                                + 'TechReq=' + '''' + Trim(sMemoTechReq.Text) + ''''
                                + ','
                                + 'DtTm=' + '''' + sDateEdit1.Text + ''''
                                + ' ' + 'where ID=' + ModifyRecipeId;
            ADOQuery1.ExecSQL;
            FrmMain.ADOConnection.CommitTrans;
            ExResult := True;
        except
            FrmMain.ADOConnection.RollbackTrans;
            ExResult := False;
            Result := 2;
        end;
    end;

    if ExResult then
    begin
        try
            FrmMain.ADOConnection.BeginTrans;
            for i:=1 to AdvStrGrdRecipeDetails.RowCount -2 do
            begin
                ADOQuery1.Close;
                ADOQuery1.SQL.Text := 'select ID from RecipeLst where RecipeInfoID=' + Trim(sEdtRecipeId.Text)
                                    + ' ' + 'and' + ' '
                                    + 'MaterId=' + AdvStrGrdRecipeDetails.Cells[1, i];
                ADOQuery1.Open;
                if not ADOQuery1.Eof then
                    RecipeLstId := ADOQuery1.FieldByName('ID').AsInteger
                else
                    RecipeLstId := 0;

                if RecipeLstId > 0 then    //记录存在
                begin
                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Text := 'update RecipeLst set Amount=:NewAmount,Remark=:NewRemark where ID=:ModifyId';
                    ADOQuery1.Parameters.ParamByName('NewAmount').Value := AdvStrGrdRecipeDetails.Cells[4,i];
                    ADOQuery1.Parameters.ParamByName('NewRemark').Value := AdvStrGrdRecipeDetails.Cells[5,i];
                    ADOQuery1.Parameters.ParamByName('ModifyId').Value := RecipeLstId;
                    ADOQuery1.ExecSQL;
                end
                else                 //记录不存在
                begin
                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Text := 'insert into RecipeLst (RecipeInfoID'
                                        + ',MaterId'
                                        + ',Amount'
                                        + ',Remark'
                                        + ') values ('
                                        + ':RecipeInfoID'
                                        + ',:MaterId'
                                        + ',:Amount'
                                        + ',:Remark'
                                        + ')';
                    ADOQuery1.Parameters.ParamByName('RecipeInfoID').Value := ModifyRecipeId;
                    ADOQuery1.Parameters.ParamByName('MaterId').Value      := AdvStrGrdRecipeDetails.Cells[1,i];
                    ADOQuery1.Parameters.ParamByName('Amount').Value       := AdvStrGrdRecipeDetails.Cells[4,i];
                    ADOQuery1.Parameters.ParamByName('Remark').Value       := AdvStrGrdRecipeDetails.Cells[5,i];
                    ADOQuery1.ExecSQL;
                end;
            end;
            FrmMain.ADOConnection.CommitTrans;
            ExResult := True;
        except
            FrmMain.ADOConnection.RollbackTrans;
            ExResult := False;
            Result := 3;
        end;
    end;

    if ExResult then
        Result := 0
    else
        Result := 4;

end;

procedure TFrmRecipe.sCmbBoxSearchTypeChange(Sender: TObject);
begin
    RdRecipeFromDbToRecipeLst();
end;

procedure TFrmRecipe.AdvStringGrid1DblClick(Sender: TObject);
begin
    sTabRecipeDetails.Show;
end;

procedure TFrmRecipe.sBitBtnDelRecipeClick(Sender: TObject);
var
    DelRecipeID : String;
    DelRecipeCode : String;
begin
    DelRecipeCode := AdvStringGrid1.Cells[2, AdvStringGrid1.Row];
    DelRecipeID := AdvStringGrid1.Cells[1, AdvStringGrid1.Row];

    if messagebox(getfocus,pchar('确定要删除配比: ' +DelRecipeCode + ' 吗?'), '提示信息', MB_YESNO) = idYES then
    begin
        if DelRecipeID <>'' then
        begin
            Try
                FrmMain.ADOConnection.BeginTrans;
                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Text := 'delete from RecipeLst where RecipeInfoID=' + DelRecipeID;    //删除配比用量数据
                ADOQuery1.ExecSQL;

                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Text := 'delete from RecipeInfo where ID=' + DelRecipeID;             //删除配比信息
                ADOQuery1.ExecSQL;

                FrmMain.ADOConnection.CommitTrans;
                RdRecipeFromDbToRecipeLst();
                Showmessage('删除成功!!');
            except
                FrmMain.ADOConnection.RollbackTrans;
                Showmessage('删除失败!');
            end;
        end;
    end;
end;

end.
