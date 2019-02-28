program TSC;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FrmMain},
  UnitSplash in 'UnitSplash.pas' {FrmSplash},
  UntLogin in 'UntLogin.pas' {FrmLogin},
  UnitGlobeVar in 'UnitGlobeVar.pas',
  UnitGlobeSub in 'UnitGlobeSub.pas',
  UnitMixerPara in 'UnitMixerPara.pas' {FrmMixPara},
  UnitRWDb in 'UnitRWDb.pas',
  UnitIniInstrument in 'UnitIniInstrument.pas',
  UnitRWInstrument1MscommBuf in 'UnitRWInstrument1MscommBuf.pas',
  UnitInicontrolPanel in 'UnitInicontrolPanel.pas',
  UnitAbout in 'UnitAbout.pas' {FrmAbout},
  UnitBasicSetting in 'UnitBasicSetting.pas' {FrmBasicSetting},
  UnitRecipe in 'UnitRecipe.pas' {FrmRecipe},
  UnitTask in 'UnitTask.pas' {FrmTask},
  UnitProceNotice in 'UnitProceNotice.pas' {FrmProdNotice},
  UnitWeigherAttribute in 'UnitWeigherAttribute.pas' {FrmWeigherAttribute},
  UnitWeigDschRemain in 'UnitWeigDschRemain.pas' {FrmWeigDschRemain},
  UnitWeighCalValue in 'UnitWeighCalValue.pas' {FrmWeigherCalValue},
  UnitPersonnelMangement in 'UnitPersonnelMangement.pas' {FrmPersonnelMangement},
  UnitSetPassWord in 'UnitSetPassWord.pas' {FrmSetPassWord},
  UnitStorageAttribute in 'UnitStorageAttribute.pas' {FrmStorageAttribute},
  UnitAggrConceyorHopperAttr in 'UnitAggrConceyorHopperAttr.pas' {FrmAggrConceyorHopperAttr},
  UnitDeliveryPreview in 'UnitDeliveryPreview.pas' {FrmDeliveryPreview},
  UnitFrmCommunicationSet in 'UnitFrmCommunicationSet.pas' {FrmCommunicationSet},
  UnitFrmSignalDefine in 'UnitFrmSignalDefine.pas' {FrmSignalDefine},
  UnitSoftAuthorization in 'UnitSoftAuthorization.pas',
  UnitSysUnlock in 'UnitSysUnlock.pas' {FrmSysUnlock},
  UnitLftHopper in 'UnitLftHopper.pas' {FrmLftHopper},
  UnitConfig in 'UnitConfig.pas' {FrmConfig},
  UnitMaterialStorage in 'UnitMaterialStorage.pas' {FrmMaterialStorage},
  UnitMaterialLst in 'UnitMaterialLst.pas' {FrmMaterialLst},
  UnitModifyStocks in 'UnitModifyStocks.pas' {FrmModifyStocks},
  UnitStocks in 'UnitStocks.pas' {FrmStocks};

{$R *.res}
var
    i : Integer;
begin
  Application.Initialize;

  {窗体状态}
  FrmLoginCrt                  := False;
  FrmBasicSettingCrt           := False;        //基本设置
  FrmRecipeCrt                 := False;              //配方窗体
  FrmTaskCrt                   := False;
  FrmWeigAttrCrt               := False;        //称属性窗体
  FrmWeigDschRemainCrt         := False;      //称卸料扣料窗体
  FrmWeigherCalValueCrt        := False;
  FrmPersonnelMangementCrt     := False;
  FrmSetPassWordCrt            := False;
  FrmStorageAttributeCrt       := False;      //料仓属性
  FrmAggrConceyorHopperAttrCrt := False;
  FrmMixParaCrt                := False;
  FrmCommunicationSetCrt       := False;
  FrmSignalDefineCrt           := False;
  FrmSysUnlockCrt              := False;
  FrmLftHopperCrt              := False;
  FrmSysAboutCrt               := False;
  FrmConfigCrt                 := False;     //设备设置窗体
  FrmMaterialStorageCrt        := False;     //原料入库窗体
  FrmMaterialLstCrt            := False;     //原料列表
  FrmModifyStocksCrt           := False;     //库存调整窗体

  {公共变量}
  SoftAuthorCheckIntervai      := 0;          //授权检测周期

  Instru1MscommFails           := 0;          //通讯失败次数

  StoraLdTgtModiInfo.Ena := False;
  ProdBatchsModiInfo.Ena := False;

  {鼠标进入控件标识}
  mouseEnterBellImg := false;     //鼠标未进入电铃图片

  FrmSplash := TFrmSplash.Create(Nil);
  FrmSplash.Show;



  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmProdNotice, FrmProdNotice);
  Application.CreateForm(TFrmDeliveryPreview, FrmDeliveryPreview);
  Application.CreateForm(TFrmSysUnlock, FrmSysUnlock);
  Application.CreateForm(TFrmLftHopper, FrmLftHopper);
  Application.Run;
end.
