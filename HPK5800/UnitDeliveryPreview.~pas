unit UnitDeliveryPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ExtCtrls, sEdit, sPanel, Mask,
  sMaskEdit, sCustomComboEdit, sToolEdit, sCheckBox, sGroupBox, sComboBox,
  DB, ADODB, sSpinEdit, frxDesgn, frxClass;

type
  TFrmDeliveryPreview = class(TForm)
    sPanel2: TsPanel;
    Label4: TLabel;
    Shape1: TShape;
    sEdit2: TsEdit;
    Label1: TLabel;
    sCBProdTaskId: TsComboBox;
    Label45: TLabel;
    edtContractNO: TsEdit;
    sGroupBox1: TsGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    sCBTaskCharacter: TsComboBox;
    sCBCustomer: TsComboBox;
    sCbTaskType: TsComboBox;
    sCBProjGrade: TsComboBox;
    sCBProjNm: TsComboBox;
    sCBProjAddr: TsComboBox;
    sCBCastPart: TsComboBox;
    sEtDistance: TsEdit;
    sGroupBox2: TsGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label38: TLabel;
    sCBConcrVariety: TsComboBox;
    sCBConcrStrength: TsComboBox;
    sCBConcrSeepage: TsComboBox;
    sCBConcrFrost: TsComboBox;
    sCBCementSpec: TsComboBox;
    sCBStoneSpec: TsComboBox;
    sCBStoneSize: TsComboBox;
    sCBAddLiq: TsComboBox;
    sCBConcrSlump: TsComboBox;
    sCBMixLast: TsComboBox;
    sCBPourMethod: TsComboBox;
    sEtTecReq: TsEdit;
    sBitBtn2: TsBitBtn;
    sChkBxWinterWork: TsCheckBox;
    sDtEdtBegin: TsDateEdit;
    sDtEdtEndDt: TsDateEdit;
    sGroupBox3: TsGroupBox;
    sPanel1: TsPanel;
    Label2: TLabel;
    sCBProdRecipe: TsComboBox;
    Label3: TLabel;
    sEtProdAmount: TsEdit;
    Label5: TLabel;
    sEtTotalAmount: TsEdit;
    Label26: TLabel;
    sEtTotVehs: TsEdit;
    Label28: TLabel;
    Label31: TLabel;
    sDtProd: TsDateEdit;
    Label32: TLabel;
    sEtProducor: TsEdit;
    sEtDispatcher: TsEdit;
    Label33: TLabel;
    sCBTruck: TsComboBox;
    Label34: TLabel;
    sCBDriver: TsComboBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    sEdtProdId: TsEdit;
    ADOQuery1: TADOQuery;
    sTPLeave: TsTimePicker;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    sBitBtn3: TsBitBtn;
    sBitBtn1: TsBitBtn;
    sBitBtnSeekPrtTask: TsBitBtn;
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sBitBtnSeekPrtTaskClick(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDeliveryPreview: TFrmDeliveryPreview;

implementation

uses UnitGlobeVar, UnitMain;

{$R *.dfm}

procedure TFrmDeliveryPreview.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;

    try
        frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) + '\Delivery\Delivery.fr3', true);
    except
        Showmessage('发货单信息加载失败');
    end;
end;

procedure TFrmDeliveryPreview.sBitBtn1Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmDeliveryPreview.FormShow(Sender: TObject);
begin
    if ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_IdInDb > 0 then
    begin
        sEdtProdId.Text := format('%.d', [ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_IdInDb]);

        //生产单信息
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select * from Produce where ID=' + inttostr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_IdInDb);
        ADOQuery1.Open;
        if not ADOQuery1.Eof then
        begin
            sCBProdTaskId.Text    := ADOQuery1.FieldByName('Code').AsString;
            edtContractNO.Text    := ADOQuery1.FieldByName('ContractNO').AsString;
            sCBTaskCharacter.Text := ADOQuery1.FieldByName('Characters').AsString;
            sCbTaskType.Text      := ADOQuery1.FieldByName('ProjType').AsString;                     //工程类别
            sCBProjGrade.Text     := ADOQuery1.FieldByName('ProjGrade').AsString;                    //工程级别
            sEtDistance.Text      := format('%.1f', [ADOQuery1.FieldByName('Distance').AsFloat]);    //运行距离
            sCBCustomer.Text      := ADOQuery1.FieldByName('Customer').AsString;                     //客户名称
            sCBProjNm.Text        := ADOQuery1.FieldByName('ProjName').AsString;                     //工程名称
            sCBProjAddr.Text      := ADOQuery1.FieldByName('ProjAdr').AsString;                      //工程地址
            sCBCastPart.Text      := ADOQuery1.FieldByName('ConsPos').AsString;                      //施工部位

            sCBConcrVariety.Text  := ADOQuery1.FieldByName('Variety').AsString;                      //砼品种
            sCBConcrStrength.Text := ADOQuery1.FieldByName('BetLev').AsString;;                      //强度等级
            sCBConcrSeepage.Text  := ADOQuery1.FieldByName('Filter').AsString;                       //抗渗等级
            sCBConcrFrost.Text    := ADOQuery1.FieldByName('Freeze').AsString;                       //抗冻等级
            sCBCementSpec.Text    := ADOQuery1.FieldByName('Cement').AsString;                       //水泥品种
            sCBStoneSpec.Text     := ADOQuery1.FieldByName('Stone').AsString;                        //石子规格
            sCBStoneSize.Text     := ADOQuery1.FieldByName('BnSize').AsString;                       //骨料粒径
            sCBAddLiq.Text        := ADOQuery1.FieldByName('AddLiq').AsString;                       //外剂要求
            sCBConcrSlump.Text    := ADOQuery1.FieldByName('Lands').AsString;;                       //坍落度
            sCBMixLast.Text       := ADOQuery1.FieldByName('MixLast').AsString;                      //搅拌时间
            sCBPourMethod.Text    := ADOQuery1.FieldByName('Pour').AsString;                         //浇筑方式
            sEtTecReq.Text        := ADOQuery1.FieldByName('Request').AsString;                      //技术要求
            //sDtEdtBegin.Text      := ADOQuery1.FieldByName('    -  -  ').AsString;    //供货起始日期

            //生产任务单信息
            sCBProdRecipe.Text    := ADOQuery1.FieldByName('Recipe').AsString;                       //生产配比
            sCBTruck.Text         := ADOQuery1.FieldByName('Vehicle').AsString;                      //运输车辆
            sCBDriver.Text        := ADOQuery1.FieldByName('Driver').AsString;                       //司机
            sEtProdAmount.Text    := format('%.1f', [ADOQuery1.FieldByName('ProdMete').AsFloat]);  //本车方量
            sEtTotalAmount.Text   := format('%.1f', [ADOQuery1.FieldByName('TotMete').AsFloat]);   //累计方量
            sEtTotVehs.Text       := ADOQuery1.FieldByName('TotVehs').AsString;                      //累计车次
        end
        else
        begin
            sCBProdTaskId.Text    := '';
            sCBTaskCharacter.Text := '';
            sCbTaskType.Text      := '';
            sCBStoneSpec.Text     := '';
            sEtDistance.Text      := '';    //运输距离
            sCBCustomer.Text      := '';    //客户名称
            sCBProjNm.Text        := '';    //工程名称
            sCBProjAddr.Text      := '';    //工程地址
            sCBCastPart.Text      := '';    //施工部位

            sCBConcrVariety.Text  := '';    //砼品种
            sCBConcrStrength.Text := '';    //强度等级
            sCBConcrSeepage.Text  := '';    //抗渗等级
            sCBConcrFrost.Text    := '';    //抗冻等级
            sCBCementSpec.Text    := '';    //水泥品种
            sCBStoneSpec.Text     := '';    //石子规格
            sCBStoneSize.Text     := '';    //骨料粒径
            sCBAddLiq.Text        := '';    //外剂要求
            sCBConcrSlump.Text    := '';    //坍落度
            sCBMixLast.Text       := '';    //搅拌时间
            sCBPourMethod.Text    := '';    //浇筑方式
            sEtTecReq.Text        := '';    //技术要求
            //sDtEdtBegin.Text      := '    -  -  ';    //供货起始日期

            //生产任务单信息
            sCBProdRecipe.Text    := '';    //生产配比
            sCBTruck.Text         := '';    //运输车辆
            sCBDriver.Text        := '';    //司机
            sEtProdAmount.Text    := '0';   //本车方量
            sEtTotalAmount.Text   := '0';   //累计方量
            sEtTotVehs.Text       := '';    //累计车次
        end;
    end
    else
    begin
        sEdtProdId.Text := '';

        //生产单信息
        sCBProdTaskId.Text := '';
        sCBTaskCharacter.Text := '';
        sCbTaskType.Text      := '';
        sCBProjGrade.Text     := '';
        sEtDistance.Text      := '';    //运输巨鹿
        sCBCustomer.Text      := '';    //客户名称
        sCBProjNm.Text        := '';    //工程名称
        sCBProjAddr.Text      := '';    //工程地址
        sCBCastPart.Text      := '';    //施工部位
        
        sCBConcrVariety.Text  := '';    //砼品种
        sCBConcrStrength.Text := '';    //强度等级
        sCBConcrSeepage.Text  := '';    //抗渗等级
        sCBConcrFrost.Text    := '';    //抗冻等级
        sCBCementSpec.Text    := '';    //水泥品种
        sCBStoneSpec.Text     := '';    //石子规格
        sCBStoneSize.Text     := '';    //骨料粒径
        sCBAddLiq.Text        := '';    //外剂要求
        sCBConcrSlump.Text    := '';    //坍落度
        sCBMixLast.Text       := '';    //搅拌时间
        sCBPourMethod.Text    := '';    //浇筑方式
        sEtTecReq.Text        := '';    //技术要求
        //sDtEdtBegin.Text      := '    -  -  ';    //供货起始日期

        //生产任务单信息
        sCBProdRecipe.Text    := '';    //生产配比
        sCBTruck.Text         := '';    //运输车辆
        sCBDriver.Text        := '';    //司机
        sEtProdAmount.Text    := '0';   //本车方量
        sEtTotalAmount.Text   := '0';   //累计方量
        sEtTotVehs.Text       := '';    //累计车次
    end;

    sDtProd.Date  := Date();
    sTPLeave.Time := Time();
    //调度员
    //质检员
    sEtProducor.Text := LoginNm;  //生产员
end;



procedure TFrmDeliveryPreview.sBitBtnSeekPrtTaskClick(Sender: TObject);
begin
    //更新报表中的变量
    frxReport1.Variables.Variables['合同编号'] := '''' + trim(edtContractNO.Text) + '''';
    frxReport1.Variables.Variables['生产单号'] := '''' + trim(sEdtProdId.Text)    + '''';
    frxReport1.Variables.Variables['用户名称'] := '''' + trim(sCBCustomer.Text     ) + '''';
    frxReport1.Variables.Variables['工程名称'] := '''' + trim(sCBProjNm.Text       ) + '''';
    frxReport1.Variables.Variables['施工部位'] := '''' + trim(sCBCastPart.Text     ) + '''';
    frxReport1.Variables.Variables['施工地址'] := '''' + trim(sCBProjAddr.Text     ) + '''';
    frxReport1.Variables.Variables['任务性质'] := '''' + trim(sCBTaskCharacter.Text) + '''';
    frxReport1.Variables.Variables['工程类别'] := '''' + trim(sCbTaskType.Text     ) + '''';
    frxReport1.Variables.Variables['工程级别'] := '''' + trim(sCBProjGrade.Text    ) + '''';
    frxReport1.Variables.Variables['运输距离'] := '''' + trim(sEtDistance.Text     ) + '''';

    frxReport1.Variables.Variables['砼品种  '] := '''' + trim(sCBConcrVariety.Text ) + '''';
    frxReport1.Variables.Variables['强度等级'] := '''' + trim(sCBConcrStrength.Text) + '''';
    frxReport1.Variables.Variables['抗渗等级'] := '''' + trim(sCBConcrSeepage.Text ) + '''';
    frxReport1.Variables.Variables['抗冻等级'] := '''' + trim(sCBConcrFrost.Text   ) + '''';
    frxReport1.Variables.Variables['水泥品种'] := '''' + trim(sCBCementSpec.Text   ) + '''';
    frxReport1.Variables.Variables['石子规格'] := '''' + trim(sCBStoneSpec.Text    ) + '''';
    frxReport1.Variables.Variables['骨料粒径'] := '''' + trim(sCBStoneSize.Text    ) + '''';
    frxReport1.Variables.Variables['外剂要求'] := '''' + trim(sCBAddLiq.Text       ) + '''';
    frxReport1.Variables.Variables['坍落度  '] := '''' + trim(sCBConcrSlump.Text   ) + '''';
    frxReport1.Variables.Variables['搅拌时间'] := '''' + trim(sCBMixLast.Text      ) + '''';
    frxReport1.Variables.Variables['浇筑方式'] := '''' + trim(sCBPourMethod.Text   ) + '''';
    frxReport1.Variables.Variables['技术要求'] := '''' + sEtTecReq.Text              + '''';
    frxReport1.Variables.Variables['供货起始'] := '''' + trim(sDtEdtBegin.Text     ) + '''';
    frxReport1.Variables.Variables['供货截止'] := '''' + trim(sDtEdtEndDt.Text     ) + '''';

    frxReport1.Variables.Variables['生产配比'] := '''' + trim(sCBProdRecipe.Text   ) + '''';
    frxReport1.Variables.Variables['运输车辆'] := '''' + trim(sCBTruck.Text        ) + '''';
    frxReport1.Variables.Variables['送货司机'] := '''' + trim(sCBDriver.Text       ) + '''';
    frxReport1.Variables.Variables['本车方量'] := '''' + trim(sEtProdAmount.Text   ) + '''';
    frxReport1.Variables.Variables['累计方量'] := '''' + trim(sEtTotalAmount.Text  ) + '''';
    frxReport1.Variables.Variables['累计车次'] := '''' + trim(sEtTotVehs.Text      ) + '''';
    frxReport1.Variables.Variables['生产日期'] := '''' + trim(sDtProd.Text         ) + '''';
    frxReport1.Variables.Variables['出站时间'] := '''' + trim(sTPLeave.Text        ) + '''';

    frxReport1.Variables.Variables['调度员  '] := '''' + trim(sEtDispatcher.Text   ) + '''';
    frxReport1.Variables.Variables['操作员  '] := '''' + trim(sEtProducor.Text     ) + '''';
    
    frxReport1.PrepareReport();
    //frxReport1.ShowPreparedReport();
    frxReport1.ShowPreparedReport();
    //frxReport1.PrintOptions.ShowDialog := False;
    frxReport1.Print;

    self.Close;
end;

procedure TFrmDeliveryPreview.sBitBtn3Click(Sender: TObject);
begin
    frxReport1.DesignReport();
end;

end.
