unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Inifiles, DB, ADODB, OleCtrls, MSCommLib_TLB, ExtCtrls, StdCtrls,
  ComCtrls,
  UnitGlobeVar, pngimage, Menus,  acPNG, acImage, Buttons,
  sSpeedButton,
  sColorSelect,
  sUpDown,
  sPanel,
  sComboBox,
  sTreeView,
  acShellCtrls,
  sComboBoxes,
  sStatusBar,
  sButton,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxCheckBox,
  ImgList,
  cxImage,
  cxTextEdit,
  cxMaskEdit,
  cxSpinEdit,
  cxDropDownEdit,
  cxButtonEdit,
  Mask,
  Grids,
  AdvObj,
  BaseGrid,
  AdvGrid,
  AdvSpin,
  bsSkinCtrls,
  bsSkinExCtrls,
  bsSkinBoxCtrls,
  W7Classes,
  W7Buttons,
  AdvSmoothListBox,
  AdvSmoothComboBox,
  AdvSmoothLabel,
  AdvSmoothEdit,
  AdvSmoothEditButton,
  AdvSmoothDatePicker,
  AdvSmoothButton,
  CurvyControls,
  AdvFontCombo,
  AdvTreeComboBox,
  AdvDBLookupComboBox,
  AdvEdit,
  AdvEdBtn,
  DBAdvEdBtn,
  AdvQueryDialog,
  clisted,
  EditBtn,
  sSkinManager,
  sRadioButton,
  sLabel,
  GIFImage,
  sEdit,
  sSpinEdit,

  math,
  AdvGlassButton,
  AdvGlowButton,
  RzButton,
  AdvProgr,
  cxGroupBox, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxEdit, cxContainer, cxControls, cxButtons
  ,ShellAPI, jpeg;

type
  TBellImg = class(TImage)
  public
    procedure MSGEnter(var msg:TMessage);message CM_MOUSEENTER;    //响应进入的消息
    procedure MSGLeave(var msg : TMessage);message CM_MOUSELEAVE;    //响应离开的消息
  end;

type
  TFrmMain = class(TForm)
    ADOConnection: TADOConnection;
    Instruction1MSComm: TMSComm;
    Instruction1MscommTmr: TTimer;
    ADOQuery1: TADOQuery;
    PMWeigher: TPopupMenu;
    NWeigheStart: TMenuItem;
    NWeigherStop: TMenuItem;
    N3: TMenuItem;
    NWeigherrDschRemain: TMenuItem;
    N5: TMenuItem;
    NWeigherCalZero: TMenuItem;
    NWeigherCal: TMenuItem;
    N8: TMenuItem;
    NWeigherParaSet: TMenuItem;
    PMStorage123: TPopupMenu;
    N2: TMenuItem;
    RMStorageReplace1: TMenuItem;
    N6: TMenuItem;
    RMStorageSet1: TMenuItem;
    RMAddMater1: TMenuItem;
    MainMenu1: TMainMenu;
    N9: TMenuItem;
    PMAggregateMidBin: TPopupMenu;
    NMidBinPara: TMenuItem;
    PMMixer: TPopupMenu;
    j1: TMenuItem;
    N4: TMenuItem;
    NPerssonMangement: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    NRecipe: TMenuItem;
    NProdTask: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    Shape2: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Label3: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    sStatusBar1: TsStatusBar;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Label9: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    cxBtnAggreDschDsa: TcxButton;
    cxBtnMixerLoadDsa: TcxButton;
    cxBtnMixerDschDsa: TcxButton;
    BtnStartProd: TcxButton;
    cxBtnProdPause: TcxButton;
    cxBtnRing: TcxButton;
    ImageList1: TImageList;
    BtnIncProdSetCount: TcxButton;
    BtnDecProdSetCount: TcxButton;
    Shape19: TShape;
    Label10: TLabel;
    Shape20: TShape;
    Shape21: TShape;
    Label11: TLabel;
    Shape22: TShape;
    Shape23: TShape;
    sSkinManager1: TsSkinManager;
    AdvStrGdProdNotice: TAdvStringGrid;
    sCmbBxTruckCodeInNoticeInfo: TsComboBox;
    sCmbBxDriverInNoticeInfo: TsComboBox;
    ImageList2: TImageList;
    LbClentInNoticeInfo: TLabel;
    LbProdReciInNoticeInfo: TLabel;
    LbProjInfoInNOticeInfo: TLabel;
    LbProdAmountInNoticeInfo: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape24: TShape;
    LbTotalAmountInNoticeInfo: TLabel;
    LbTruckContInNoticeInfo: TLabel;
    LbPlanAmountInNoticeInfo: TLabel;
    StatusDspTmr: TTimer;
    TmrMscomStateDsp: TTimer;
    N26: TMenuItem;
    m1: TMenuItem;
    PMStorage: TPopupMenu;
    RMAddMater: TMenuItem;
    N28: TMenuItem;
    RMStorageReplace: TMenuItem;
    N27: TMenuItem;
    RMStorageSet: TMenuItem;
    SystemTmr: TTimer;
    cxBtnMixerDischOPen: TRzBitBtn;
    cxBtnMixerDischClose: TRzBitBtn;
    PresStartProd: TAdvProgress;
    TmrStartProd: TTimer;
    AdvStrGdProRd: TAdvStringGrid;
    EtNewLdTarg: TEdit;
    cxGroupBox1: TcxGroupBox;
    cBtnManulPrtDel: TcxButton;
    CkFrstBatchPrtDevl: TcxCheckBox;
    BtnProdContinue: TcxButton;
    Label1: TLabel;
    Shape1: TShape;
    Shape3: TShape;
    Shape18: TShape;
    sPanel1: TsPanel;
    sBtnProdNotice: TcxButton;
    cxButton2: TcxButton;
    cxButton5: TcxButton;
    cxButton3: TcxButton;
    cxButton1: TcxButton;
    NCommunicate: TMenuItem;
    N38: TMenuItem;
    NSysConfig: TMenuItem;
    N40: TMenuItem;
    NSingleDefine: TMenuItem;
    CkLastBatchPrtDevl: TcxCheckBox;
    s2: TMenuItem;
    Panel2: TPanel;
    Lb1SoftAuthor: TLabel;
    Lb2SoftAuthor: TLabel;
    Lb3SoftAuthor: TLabel;
    Panel3: TPanel;
    NMaterialStocks: TMenuItem;
    NProdData: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    SMMixerPara: TMenuItem;
    QryErp: TADOQuery;
    ADOSubErp: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Instruction1MscommTmrTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Instruction1MSCommComm(Sender: TObject);
    procedure ImgMixerContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure NWeigheStartClick(Sender: TObject);
    procedure NWeigherStopClick(Sender: TObject);
    procedure NWeigherrDschRemainClick(Sender: TObject);
    procedure NWeigherCalZeroClick(Sender: TObject);
    procedure NWeigherCalClick(Sender: TObject);
    procedure NWeigherParaSetClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure j1Click(Sender: TObject);
    procedure NRecipeClick(Sender: TObject);
    procedure NProdTaskClick(Sender: TObject);
    procedure AdvStrGdProdNoticeGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStrGdProdNoticeClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure AdvStrGdProdNoticeCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure sBtnProdNoticeClick(Sender: TObject);
    procedure StatusDspTmrTimer(Sender: TObject);
    procedure TmrMscomStateDspTimer(Sender: TObject);
    procedure NPerssonMangementClick(Sender: TObject);
    procedure m1Click(Sender: TObject);
    procedure RMAddMaterClick(Sender: TObject);
    procedure RMStorageReplaceClick(Sender: TObject);
    procedure RMStorageSetClick(Sender: TObject);
    procedure NMidBinParaClick(Sender: TObject);
    procedure AggrHopperOnContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure s1Click(Sender: TObject);
    procedure MixerImgContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure CoarseLoadMouseDn(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CoarseLoadMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadImgMouseDn(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadImgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SiloLdVibraClick(Sender: TObject);
    procedure WghrDschValveImgMouseDn(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WghrDschValveImgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WeigherDschVibraImgClick(Sender: TObject);
    procedure SystemTmrTimer(Sender: TObject);
    procedure AggrConvBeltRunBtnImgClick(Sender: TObject);
    procedure AggrMdHopperDschValveImgClick(Sender : TObject);
    procedure AggrMidBinDschVibraImgClick(Sender : TObject);
    procedure cxBtnMixerDischOPenClick(Sender: TObject);
    procedure cxBtnMixerDischCloseClick(Sender: TObject);
    procedure cxBtnAggreDschDsaClick(Sender: TObject);
    procedure cxBtnMixerLoadDsaClick(Sender: TObject);
    procedure cxBtnMixerDschDsaClick(Sender: TObject);
    procedure cxBtnRingClick(Sender: TObject);
    procedure cxBtnProdPauseClick(Sender: TObject);
    procedure BtnStartProdClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure TmrStartProdTimer(Sender: TObject);
    procedure AdvStrGdProRdClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure EtNewLdTargExit(Sender: TObject);
    procedure AdvStrGdProRdMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure AdvStrGdProRdMouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure EtNewLdTargKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIncProdSetCountClick(Sender: TObject);
    procedure BtnDecProdSetCountClick(Sender: TObject);
    procedure BtnProdContinueClick(Sender: TObject);
    procedure CkFrstBatchPrtDevlClick(Sender: TObject);
    procedure CkLastBatchPrtDevlClick(Sender: TObject);
    procedure cBtnManulPrtDelClick(Sender: TObject);
    procedure NCommunicateClick(Sender: TObject);
    procedure NSingleDefineClick(Sender: TObject);
    procedure LiftBucketGoUpBtnClick(Sender: TObject);
    procedure LiftBucketGoDnBtnClick(Sender: TObject);

    procedure LiftBucketGoDnMouseDn(Sender: TObject; Button: TMouseButton;    //提升斗 下降 按钮 鼠标按下
      Shift: TShiftState; X, Y: Integer);
    procedure LiftBucketGoDnMouseUp(Sender: TObject; Button: TMouseButton;    //提升斗 下降 按钮 鼠标抬起
      Shift: TShiftState; X, Y: Integer);
    procedure LiftBucketGoUpMouseDn(Sender: TObject; Button: TMouseButton;    //提升斗 上升 按钮 鼠标按下
      Shift: TShiftState; X, Y: Integer);
    procedure LiftBucketGoUpMouseUp(Sender: TObject; Button: TMouseButton;    //提升斗 上升 按钮 鼠标抬起
      Shift: TShiftState; X, Y: Integer);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure ImgBellMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgBellMouseDn(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure N18Click(Sender: TObject);
    procedure s3Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure NSysConfigClick(Sender: TObject);
    procedure NProdDataClick(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;

    procedure WeigherContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure StorageContexPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);

    procedure IniAdvStrGdProRd();
    procedure IniAdvStrGdProdNotice();
    procedure IniProdNoticeTb();                                    //初始化生产派车单信息表
    procedure DspSoftAuthorInfo();    //显示软件授权
    procedure DspProdNoticeFromDb();
    procedure DspNoticeInfo(NoticeTabRow : Integer);    //显示派车单信息

    procedure DspLiftBucketState(LiftBucketNum : Integer);    //刷新提升斗状态
      procedure LeftLiftBucketFlash();    //左提升斗动画显示

    procedure StoraLdTargetModifyRec();                 //修改料仓配料目标值接收程序
    procedure ProdBatchsModifyRec();                    //修改生产盘数接收程序
    procedure WritePieceInfoIntoDb();                   //单盘记录信息写进搅拌机
    procedure DspAggrMidHopperState();                  //显示骨料中间仓状态
    procedure MixerFlashDsp();                          //搅拌机动画显示
    procedure DspProdControlBtnState();                 //生产控制按钮状态显示

    procedure DspErpTask();
  public
    { Public declarations }
    {称相关图片}
    WeigherImg : Array[1..WeigherCount] of TImage;
    WeigherDischValveImg : Array[1..WeigherCount] of TImage;                    //称卸料阀图片
    WeigherDischVibraImg : Array[1..WeigherCount] of TImage;                    //称卸料振动器图片
    WeigherDischValveCloseLmtImg : Array[1..WeigherCount] of TImage;            //称卸料阀 关限 图片
    WeigherValueLab : Array[1..WeigherCount] of TLabel;                         //称值标签
    WeigherLoadConterLab : array[1..WeigherCount] of TLabel;                    //称配料计数器器 标签

    //料仓相关图片
    StorageImg              : array[1..CntStorageCount] of TImage;
    StorageLoadImg          : array[1..CntStorageCount] of TImage;              //料仓计量门图片
    StorageFineLoadImg      : array[1..CntStorageCount] of TImage;              //料仓精计量门图片
    StorageVibratorImg      : array[1..CntStorageCount] of TImage;              //料仓振动器图片

    
    //骨料中间仓
    ImgAggregateMidBin     : array[1..2] of TImage;     //骨料中间仓图片
    ImgAggrMidBinDschValve : array[1..2] of TImage;     //骨料中间仓卸料阀
    ImgAggrMidBinOpenLmt   : array[1..2] of Timage;     //骨料中间仓开门限位
    ImgAggrMIdBinCloseLmt  : array[1..2] of TImage;     //骨料中间仓关门限位
    ImgAggrMidBinVibra     : array[1..2] of TImage;     //骨料中间仓振动器
    LabAggrMidBinDschTmr   : array[1..2] of TLabel;     //骨料中间仓卸料计时器标签
    LabAggrMIdBinLdCounter : array[1..2] of TLabel;     //骨料中间仓盘次计数器标签
    ImgMidBinFull          : array[1..2] of TImage;     //中间仓满标识图片

    //骨料输送设备
    ImgAggregateConveyor   : Array[1..6] of TImage;       //骨料输送图片
    ImgAggrConvRunBtn      : array[1..6] of TImage;       //骨料输送设备运行按钮图片
    LabAggrConvHoldTmr     : array[1..2] of TLabel;       //骨料输送持续计时器标签 一共2个标签，对应两条斜皮带

    //骨料提升斗限位  1位左提升斗  2为右提升斗
    ImgLiftBucketBottomLmt : array[1..2] of TImage;       //骨料提升斗下限位
    ImgLiftBucketTopLmt    : array[1..2] of TImage;       //骨料提升斗上限位

    //骨料提升斗按键
    ImgLiftBucketGoUp      : array[1..2] of TImage;       //骨料提升斗上升 按键
    ImgLiftBucketGoDn      : array[1..2] of TImage;       //骨料提升斗下降 按键

    ImgLiftBucket          : array[1..2] of TImage;       //骨料提升斗 图片

    //骨料提升斗
    LabLiftBucketDschLab   : array[1..2] of TLabel;     //骨料提升斗卸料计时名称标签
    LabLiftBucketDschTmr   : array[1..2] of TLabel;     //骨料提升斗卸料计时器标签
    LabLiftBucketPreRisLab : array[1..2] of TLabel;     //骨料提升斗预提升计时器名称标签
    LabLiftBucketPreRisTmr : array[1..2] of TLabel;     //骨料提升斗预提升计时器
    LabLiftBucketLdCountLab: array[1..2] of TLabel;     //骨料提升斗盘次计数器名称标签
    LabLiftBucketLdCounter : array[1..2] of TLabel;     //骨料提升斗盘次计数器标签

    //搅拌机
    ImgMixer            : array[1..2] of TImage;    //搅拌机图片
    ImgMixerDschDoor    : array[1..2] of TImage;    //搅拌机卸料门
    LabMixerProdCounter : array[1..2] of TLabel;    //搅拌机生产盘次计数器标签
    LabMixerDschTmr     : array[1..2] of TLabel;    //搅拌机卸料计时器标签

    LbMaterialNameInFrmMain,                                          //主窗体上的材料名称
    LbMaterialSpecInFrmMain : array[1..CntStorageCount] of TLabel;    //主窗体上的材料规格
    StorageWaterParaLab     : Array[1..6]               of TLabel;    //料仓含水率值标签，最大支持六个骨料仓，且料仓号小于等于6
    StorageLoadTargetLab    : array[1..CntStorageCount] of TLabel;    //料仓配料目标值标签
    StorageLoadValueLab     : array[1..CntStorageCount] of TLabel;    //料仓配料目标值标签

    ImgBell : TBellImg;       //电铃图片

    Btn : TButton;

    //LeftLevelBelt ,
    //RightLevelBelt : TImage;      //左右平皮带

    //LeftInclinedBelt ,
    //RightInclineBelt : TImage;    //左右斜皮带（提升斗）



    procedure WtInstrument1MscommOutputBuf();    //写通讯发送Buf
    procedure Instruction1MscommReceiveProg();    //通讯接收处;

    procedure IniLoadWeigherImg(WeigherId : Integer; X,Y,W,H : Integer);        //装载称图片
    procedure LoadWeigherDischValveImg(WeigherId : Integer; X,Y : Integer);     //装载称卸料阀图片
    procedure DspWeigherDschValveState(WeigherId : Integer; NewState : Integer);//称卸料阀图片更新
    
    procedure LoadWeigherDischVibratorImg(WeigherId : Integer; X,Y : Integer);  //装载称卸料振动器图片
    procedure DspWghrDschVibraState(WeigherId : Integer; NewState : Integer );  //称卸料振动器图片状态更新
    
    procedure LoadWeigherDischValveCloseLmtImg(WeigherId : Integer;
      X,Y : Integer);                                                           //装载称卸料阀关闭限位图片
    procedure DspWghrDschValveCloseLmtImg(WeigherId : Integer; NewState : Integer);    //更新称关限图片状态
    procedure LoadWeigherValueLabel(WeigherId : Integer; X,Y,W,H : Integer);    //装载称值标签

    procedure LoadStorageImgFromFile(ImageNo : Integer ; SourseImgDir : String;
      X,Y : Integer; Width, Height : Integer);                                      //从文件中装载料仓图片
    procedure LoadStorageDischImg(StorageId : Integer; LoadImgType : Integer;
      SourseImgDir : String; X,Y : Integer; Width, Height : Integer);               //加载料仓配料阀图片
    procedure DspSiloLOadVaveState(SiloId : Integer; SiloLoadVaveImgCode : Integer; //更新料仓计量阀图片给
      DigitalState : Integer ) ;

    procedure LoadStorageVibrator(StorageId : Integer;
      SourseImgDir : String; X,Y : Integer; Width, Height : Integer);               //加载料仓振荡器图片
    procedure DSpSiloVibraImgState(DspSiloId : Integer; VibraNewState : Integer);    //更新振动器图片状态

    procedure LoadStorageMaterilInfoLb(StorageId : Integer);
    procedure LoadWeigherLoadCounerLab(WeigherId : Integer; X,Y : integer);      //称配料计数器 标签
    procedure StorageMaterialMoistureLab(StorageId : Integer; X,Y : Integer);    //原料含水率 标签
    procedure LoadStorageLoadTargerLab(StorageId : Integer);                     //加载料仓配料目标值标签

    procedure LoadAggregateConveyorEquip(EquipNumber : Integer;                 //加载骨料输送设备
      SourseImgDir : String; X, Y, Width, Height : Integer);
    procedure LoadAggrConvHolpTmrLab(ConvyorBeltId : Integer; X,Y : Integer);    //加载斜皮带输送骨料持续时间
    procedure LoadAggrDschBeltRunBtn( EquipId : Integer;                         //创建平皮带点动启动按钮
      SourseImgDir : String; X,Y,Width,Height : Integer);
    procedure DSPAggrConvEquipBtnIMgNewState(EquipId : Integer; NewState : Integer);    //更新骨料输送皮带 启停按钮图片 状态

    procedure LoadLiftBucketLmtImg(LiftbucketNum : Integer; SourseImgDir : String;      //创建骨料提升斗限位
      X,Y : Integer; Width, Height : Integer; LmtType : Integer);
    procedure LoadLiftBucketBtnImg(LiftbucketNum : Integer; SourseImgDir : String;     //创建骨料提升斗按钮
      X,Y : Integer; Width, Height : Integer; LmtType : Integer);

    procedure CreatLiftBucketPreRiseLab(LiftbucketNum : Integer; X,Y : Integer;   //加载提升斗预提升标签
      Width, Height : Integer);
    Procedure CreatLiftBucketPreRiseTmrLab(LiftbucketNum : Integer; X,Y : Integer;   //加载提升斗预提升计时器
      Width, Height : Integer);
    procedure CreatLiftBucketDschLab(LiftbucketNum : Integer; X,Y : Integer;         //加载提升斗卸料标签
      Width, Height : Integer);
    procedure CreatLiftBucketDschTmrLab(LiftbucketNum : Integer; X,Y : Integer;      //加载提升斗卸料计时器
      Width, Height : Integer);
    procedure CreatLiftBucketProCountNmLab(LiftbucketNum : Integer; X,Y : Integer;   //加载提升斗生产计数标签
      Width, Height : Integer);
    procedure CreatLiftBucketProCounterLab(LiftbucketNum : Integer; X,Y : Integer;   //加载提升斗生产计数器
      Width, Height : Integer);

    procedure LoadAggregateBinImgFromFile(MidBinId : Integer; SourseImgDir : String;    //创建骨料中间仓图片
      X,Y : Integer; Width, Height : Integer);
    procedure LoadAggregateBinFullImgFromFile(MidBinId : Integer; SourseImgDir : String;    //创建骨料中间仓满标识图片
      X,Y : Integer; Width, Height : Integer);
    procedure LoadAggrMidStorDschValveImg(MidBinId : Integer;                           //装载骨料中间仓卸料阀
      SourseImgDir : String; X,Y : Integer);
    procedure DSpAggrMidHopperDschValveImgNewState(MidBinId : Integer;                  //显示骨料中间仓卸料阀图片 新状态
      NewDschValueState : Integer);
    procedure LoadAggrMidStorOpenLmtImg(MidBinId : Integer; SourseImgDir : String;    //装载中间仓开门限位
      X,Y : Integer );
    procedure LoadAggrMidStorCloseLmtImg(MidBinId : Integer; SourseImgDir : String;    //装载中间仓关门限位
      X,Y : Integer );
    procedure DspAggrMidBinDschValvLmtImgNewState(MidBinId : Integer;      //更新中间斗卸料阀 限位 图片状态
      DschValveLmtNm : Integer; LmtImgNewState : Integer);
    procedure LoadAggrMidStorVibraImg(MidBinId : Integer; SourseImgDir : String;    //装载中间仓振动器
      X,Y : Integer );
    procedure DspAggrMidBInDschVibraImgNewState(MidBinId : Integer;                 //更新骨料中间仓卸料振动器图片状态
      NewVibraImgState : Integer);
    procedure LoadAggrMidBinDschTmrLab(MidBinId : Integer; X,Y : Integer);    //加载中间仓卸料计时器标签
    procedure LoadMidBinLoadCounterLab(MidBinId : Integer; X,Y : Integer);    //加载中间仓装载盘次

    procedure LoadAggrLiftBucketImg(BucketNum : Integer; SourseImgDir : String;    //加载提升斗图片
      X,Y : Integer );

    procedure CreateMixerImg(MixerID : Integer; SourseImgDir : String;    //创建搅拌机图片
      X,Y : Integer; Width, Height : Integer);
    procedure DspMixerFlashNewState(MixerId : Integer; MewState : Integer);    //搅拌机动画更新
    procedure CreateMixerDschDoor(MixerId : Integer; SourseImgDir : String;    //创建搅拌机卸料门图片
      X,Y : Integer; Width, Height : Integer);
    procedure DspMixerDschValveImgNewState(MixerId : Integer; NewState : Integer);     //搅拌机卸料阀图片状态

    procedure DSpBtnMixerDschValveOPenNewState(MixerId : Integer; NewState : Integer);
    procedure DspBtnMixerDschValveCloseNewState(MixerId : Integer; NewState : Integer);
    procedure LoadMixerDschTmrLab(MixerId : Integer; X,Y : Integer);       //加载搅拌机卸料计时器标签
    procedure LoadMixerProdCounterLab(MixerId : Integer; X,Y : Integer);   //加载搅拌机生产计数器标签
    procedure CreatBellImg( X,Y : Integer; Width, Height : Integer);       //加载电铃
    
//    procedure IniCheckerForControlPanel(CheckNm : String; X,Y : Integer;    //初始化复选框
//      Width, Height : Integer; Check : Boolean);
    procedure UpdataBitBtnGlyph(BtnName : String; Check : Boolean);

    Function GetProdRecipeToSiloRecipe(TaskGrdRow : Integer) : Integer;    //获取料仓配方值
    procedure ProdStart(ProdRow : Integer) ;                               //生产启动
    procedure IniProdNoticeInfo(ProdNoticeInfoNumber : Integer);           //初始化生产派车单信息
    procedure IniWeigherLoadInfoForProdStart();                            //生产启动时，仪表配料信息初始化
    procedure IniSiloLoadInfo();                                           //初始化配料信息
    Function TaskBatchsProg(TaskGrdRow : Integer) : Integer;               //任务分盘处理
    Function GetStorageLoadTargetForProdStart() : Integer;                 //启动生产时,获取料仓的配料目标值
    Function DspProdBatchInfoOnFrmMain(ProdNoticeId : Integer) : Integer;  //主界面上显示生产配料信息
    Function DspStorageLoadTargetInFrmMainForProdStart() : Integer;        //在主界面上显示料仓配料目标值
    function GetWeigherLoadTargetForProdStart() : integer;                 //获取称的配料目标值
    function WriteWghrLoadTargetToInstruForProdStart() : Integer;          //写称配料目标值到仪表
    procedure WtStorageReplaceInfo();             //写料仓替换信息到仪表
    function WtProduceTbForProdStart() : Integer;
    function UpdateDbForProdEnd() : Integer;                                  //生产完成，更新数据库
    Function DelProdedNoticeFromDspTab( ProdNoticeId : Integer ) : Integer;    //从派单列表中删除已生产完成的派单
    procedure InitPermissonInFrmMain();                                        //主界面权限初始化
  end;



var
  FrmMain: TFrmMain;
var
    MscommReceiveBufPfInFrmMain : Integer;    //主窗体通讯接收指针

    MscommStateInFrmMain : Integer;    //主窗体通讯计时器
Const
    CntMscommCmdIsInvalid = 0;    //无效
    CntMscommCmdIsCalZero = 1;    //通讯命令是校零
    CntMscommCmdIsCalValue= 2;    //称值校准
var
    MscommTmrInFrmMain : Integer;    //主窗体通讯计时器

var
    PMStorageId : Integer;        //右键菜单 料仓编号

var
    StartProdMscomWaitRevPt : Integer;        //启动生产等待通讯接收缓冲区指针
    StartProdSteps : Integer;
Const
    CtStartProdStepIsWtLdTarget       = 1;    //启动生产步骤为写配料目标值
    CtStartProdStepIsWtProdBatchCount = 2;    //启动生产步骤为写配料盘数
    CtStartProdStepIsWtBatchAmount    = 3;    //启动生产步骤为写单盘方量
    CtStartProdStepIsWtProdAmount     = 4;    //启动生产步骤为写任务方量到仪表
    CtStartProdStepIsWtStorageReplace = 5;    //写料仓替换信息
    CtStartProdStepIsWtStartCmdI      = 6;    //写启动命令I
    CtStartProdStepIsWtStartCmdII     = 7;    //写启动命令II
    CtStartProdStepIsStartFstWtDb     = 8;    //生产启动首次写数据库
var
    StartProdCmdLng : Integer;    //启动生产
    

implementation

uses UnitSplash, UntLogin,  UnitGlobeSub, UnitRWDb, UnitIniInstrument, UnitInicontrolPanel,
  UnitBasicSetting, UnitRecipe, UnitTask, UnitProceNotice,
  UnitWeigherAttribute, UnitRWInstrument1MscommBuf, UnitWeigDschRemain,
  UnitWeighCalValue, UnitPersonnelMangement, UnitSetPassWord,
  UnitStorageAttribute, UnitAggrConceyorHopperAttr, UnitMixerPara,
  UnitDeliveryPreview, UnitFrmCommunicationSet, UnitFrmSignalDefine,
  UnitSoftAuthorization, UnitSysUnlock, UnitLftHopper, UnitAbout,
  UnitConfig, UnitMaterialStorage, UnitModifyStocks, UnitStocks;

{$R *.dfm}

{电铃图片}    
procedure TBellImg.MSGEnter(var msg:TMessage);     //鼠标进入电铃图片的响应进入的消息
begin
    mouseEnterBellImg := true;    //鼠标进入电铃图片
end;

procedure TBellImg.MSGLeave(var msg : TMessage);    //鼠标离开电铃图片的响应离开的消息
begin
    mouseEnterBellImg := false;
end;

{FrmMain}
procedure TFrmMain.CreateParams(var Params: TCreateParams);
begin
    inherited;
    Params.ExStyle := 33554432; //0x 02 00 00 00
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
var
    i : Integer;
begin
    for i:=1 to WeigherCount do
    begin
        if WeigherInfo[i].Enable then WeigherImg[i].Free;
    end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
    SysInfoBuf : Pchar;
    GPrevShortDate,
    GPrevLongDate,
    GPrevTimeFormat : String;
    MessageText : String;
    p : Dword;

    SetFile : TIniFile;
    DbDirtoryStr : String;
    InstructionCommPort : Integer;

    i : integer ;

    SoftAutorizationInfoRlt : Integer;
    SoftAutorizationInfo    : String;
    AuthorRemainDays        : Double;
Const
    CntSysInfoBufSize = 100;

begin

    AppPath := ExtractFilePath(Application.ExeName);
    AppFlashTmrInval := StatusDspTmr.Interval;

    SystemTmr.Interval := CntSystemTmrInterval ;
    SystemTmr.Enabled := True ;

    FrmSplash.LbIniInfo.Caption := '检查系统日期时间格式';
    getmem(SysInfoBuf, CntSysInfoBufSize);
    GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SSHORTDATE, SysInfoBuf, CntSysInfoBufSize);    //取用户设置，短日期格式
    GPrevShortDate := string(SysInfoBuf);

    //GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SLONGDATE, SysInfoBuf, CntSysInfoBufSize);
    //GPRevLongDate := string(SysInfoBuf);

    GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_STIMEFORMAT, SysInfoBuf, CntSysInfoBufSize);    //时间格式
    GPrevTimeFormat := string(SysInfoBuf);

    if ( GPrevShortDate <> 'yyyy-MM-dd') or ( GPrevTimeFormat <> 'HH:mm:ss') then
    begin
        MessageText := '计算机系统日期时间格式与软件要求不否，是否将';
        MessageText := MessageText + #10;
        MessageText := MessageText + '当前系统日期格式：' + '''' + GPrevShortDate + '''' + '，改为：' + '''' + 'yyyy-MM-dd' + '''';
        MessageText := MessageText + #10;
        MessageText := MessageText + '时间格式：' + '''' + GPrevTimeFormat + ''''  + '改为：' + '''' + 'HH:mm:s' + '''' ;
        if messagebox(getfocus, Pchar(MessageText), '警示信息', MB_YESNOCANCEL ) = IDYES then
        begin
            SetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SSHORTDATE, pchar('yyyy-MM-dd') ) ;   //设置短日期格式
            //SetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SLONGDATE,pchar('yyyy''年''M''月 ''d''日'''));
            SetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_STIMEFORMAT,pchar('HH:mm:ss')); //设置时间
            SendMessageTimeOut(HWND_BROADCAST,WM_SETTINGCHANGE,0,0,SMTO_ABORTIFHUNG,10,p);
        end;
    end;

    FreeMem(SysInfoBuf);

    FrmSplash.LbIniInfo.Caption := '连接数据中心';
    //FrmSplash.Update;
    SetFile := TInifile.Create(ExtractFilePath(Application.ExeName) + 'set.ini');
    {连接数据库}
    DbDirtoryStr := SetFile.ReadString('DB', 'Dirtory', '') ;
    if DbDirtoryStr = '' then
    begin
        if messagebox(getfocus,pchar('系统未指定数据存储目录，系统使用默认目录'), '提示信息', MB_OK) = idOK then
        begin
            DbDirtoryStr := ExtractFilePath(Application.ExeName) + '\TSCDB\tscdb.mdb';
        end;
    end;

    if not fileexists (DbDirtoryStr)then
    begin
       ShowMessage('数据库文件不存在或数据库名不正确');
       application.Terminate;
       exit;
    end;

    try
        ADOConnection.Connected := False;
        ADOConnection.ConnectionString :=
                  'Provider=Microsoft.Jet.OLEDB.4.0;'+
                  //'Provider=Microsoft.ACE.OLEDB.12.0;' +
                  'Data Source='+ DbDirtoryStr + ';' +
                  'Persist Security Info=False;' +
                  'Jet OLEDB:Database Password=TSC2016' ;
        ADOConnection.Connected := True;
    except
        Showmessage('连接数据库失败!');
    end;

    ADOQuery1.Connection := ADOConnection ;
    QryErp.Connection    := ADOConnection ;
    ADOSubErp.Connection    := ADOConnection ;
    
    FrmSplash.LbIniInfo.Caption := '连接数据库成功...' ;
    FrmSplash.RzProgressBar1.Percent := 1;

    GetSoftAuthorizationIOnfo( SoftAutorizationInfoRlt, SoftAutorizationInfo );
    case SoftAutorizationInfoRlt of
        0: begin
            if GetAuthorizedRemainingDays(EndRunDate, AuthorRemainDays, SoftAutorizationInfo) = 0 then
            begin
                if AuthorRemainDays <= 3 then
                    Showmessage('软件授权剩余 ' + Format('%.1f' , [AuthorRemainDays]) + ' 天');
            end
            else
            begin
                Showmessage('获取软件授权方式失败！ ' + SoftAutorizationInfo );
            end;
        end;
        else
        begin
            Showmessage( '获取软件授权失败，请检查软件锁是否正常或联系您的供应商！故障信息：'+ SoftAutorizationInfo );
            Application.Terminate;
            exit;
        end;
    end;    //}

    {账号登陆}
    FrmSplash.LbIniInfo.Caption := '用户登陆...' ;

    FrmLogin := TFrmLogin.Create(Nil);
    if (FrmLogin.ShowModal <> mrok)  then
    begin
        Application.Terminate;
        exit;
    end;

    FrmSplash.RzProgressBar1.Percent := 2;

    {初始化内存}
    FrmSplash.LbIniInfo.Caption := '从数据中心读取系统设置...' ;



    ReadMixerDischModeFromDb();           //从数据库中读取搅拌机卸料模式

    ReadEquipmentFlagFromDb();           //从数据库中读取设备属性
    ReadStorageFromDb();                 //从数据库中读取料仓数据

    IniControlPanelInfo();

    SoftRunState := CntSoftIniInstrumentState;    //初始化控制器状态

    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent +1;

    {创建通讯}
    FrmSplash.LbIniInfo.Caption := '创建通讯...';

    //初始化循环通讯命令缓冲区
    IniInstrumentMscomLoopComand();  //初始化通讯循环命令

    InstructionCommPort := SetFile.ReadInteger('SerialCommunication', 'Instruction1', 1);

    sStatusBar1.Panels[1].Text := '端口号：' + inttostr(InstructionCommPort) ;
    sStatusBar1.Panels[2].Text := '正常';
    Instru1MscommDspState := Instru1MscomDspIsNomarl ;

    try
        if Instruction1MSComm.PortOpen then
        begin
            Instruction1MscommOpen := False ;
            Showmessage('通讯端口通讯端口已被占用，通讯失败!');
            //Application.Terminate;
        end
        else
        begin
            Instruction1MSComm.CommPort := InstructionCommPort ;   //赋端口号
            Instruction1MSComm.Settings := '19200,n,8,1';
            Instruction1MSComm.InBufferSize := 1024;    //设置接收缓冲区大小
            Instruction1MSComm.OutBufferSize := 1024;    //设置发送缓冲区大小
            Instruction1MSComm.InputLen := 0;            //一次读取接收缓冲区中的所有数据
            Instruction1MSComm.SThreshold := 0;          //一次发送所有数据
            Instruction1MSComm.InBufferCount := 0;       //清空接收缓冲区
            Instruction1MSComm.OutBufferCount := 0;      //清空发送缓冲区
            Instruction1MSComm.PortOpen := True;
            Instruction1MscommOpen := True;
        end;
    except
        Instruction1MscommOpen := False;

        Instru1MscommDspState := Instru1MscomDspIsPortNo ;           //端口不存在
        sStatusBar1.Panels[2].Text := '打开失败';

        Showmessage('通讯端口打开失败!');
        //Application.Terminate;
    end;
    
    FrmSplash.LbIniInfo.Caption := '通讯端口打开成功...'  ;
    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;

    FrmSplash.LbIniInfo.Caption := '连接控制器...' ;

    {初始化控制器通讯缓冲区}
    for i := 0 to CntCommunicateBufLen -1 do
    begin
        Instruction1SendBuf[i].Active := False;
        Instruction1ReceiveBuf[i].Active := False;
    end;
    Instruction1SendBufWtPt := 0 ;
    Instruction1SendBufRdPt := 0 ;
    Instruction1ReceivePt := 0 ;

    Instruction1MscommState := CntInstruction1MscommIdle;

    Instruction1MscommTmr.Enabled := True;

    {初始化控制器}
    Instruction1Init();

    SoftRunState := CntSoftRuningState;

    setFile.Free;

    {主界面权限初始化}
    InitPermissonInFrmMain();
end;

procedure TFrmMain.InitPermissonInFrmMain();
begin
    //人员管理
    if pos(CntPermissonCode[CntPermIsPersonMang], PersonnelPermit) >=1 then
        NPerssonMangement.Enabled := True
    else
        NPerssonMangement.Enabled := False;

    //配比管理
    if pos( '[' + CntPermissonCode[CntPermIsRecipe], PersonnelPermit) >=1 then
        NRecipe.Enabled := True
    else
        NRecipe.Enabled := false;

    //生产任务
    if pos('[' + CntPermissonCode[CntPermIsProdTask], PersonnelPermit) >= 1 then
        NProdTask.Enabled := True
    else
        NProdTask.Enabled := False;

    //通讯设置
    if pos('[' + CntPermissonCode[CntCommunicate], PersonnelPermit) >= 1 then
        NCommunicate.Enabled := True
    else
        NCommunicate.Enabled := False;
        
    //设备配置
    if pos('[' + CntPermissonCode[CntSysConfig], PersonnelPermit) >= 1 then
        NSysConfig.Enabled := True
    else
        NSysConfig.Enabled := False;

    //信号定义
    if pos('[' + CntPermissonCode[CntSignalDefine], PersonnelPermit) >= 1 then
        NSingleDefine.Enabled := True
    else
        NSingleDefine.Enabled := False;

    //原料管理
    if pos('[' + CntPermissonCode[CntPermIsMaterialStock], PersonnelPermit) >= 1 then     //原料库存
        NMaterialStocks.Enabled := True
    else
        NMaterialStocks.Enabled := False;
        
    //生产数据
    if pos('[' + CntPermissonCode[CntPermIsProdData], PersonnelPermit) >= 1 then          //生产数据查询
        NProdData.Enabled := True
    else
        NProdData.Enabled := False;

    //称校零
    if pos('[' + CntPermissonCode[CntPermIsWeigCalZero] + 'e]', PersonnelPermit) >= 1 then
        NWeigherCalZero.Enabled := True
    else
        NWeigherCalZero.Enabled := false;

    //称校准
    if pos('[' + CntPermissonCode[CntPermIsWeigCalValue] + 'e]', PersonnelPermit) >= 1 then
        NWeigherCal.Enabled := True
    else
        NWeigherCal.Enabled := False;

    //参数设置
    if pos('[' + CntPermissonCode[CntPermIsPara], PersonnelPermit) >= 1 then
    begin
        NWeigherParaSet.Enabled := True;
        RMStorageSet.Enabled    := True;
        NMidBinPara.Enabled     := True;
        SMMixerPara.Enabled     := True;
    end
    else
    begin
        NWeigherParaSet.Enabled := False;
        RMStorageSet.Enabled    := False;
        NMidBinPara.Enabled     := False;
        SMMixerPara.Enabled     := False;
    end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin

    IniAdvStrGdProRd();
    IniAdvStrGdProdNotice();

    IniProdNoticeTb();            //初始化生产派车单信息表

    FrmSplash.Close ;

    DspSoftAuthorInfo();    //显示软件授权

    StatusDspTmr.Enabled := True;
end;

procedure TFrmMain.IniAdvStrGdProRd();
begin
    AdvStrGdProRd.Cells[1, 0] := '原材料';
    AdvStrGdProRd.Cells[2, 0] := '配方值(kg)';
    AdvStrGdProRd.Cells[3, 0] := '设定值(kg)';
    AdvStrGdProRd.Cells[4, 0] := '完成值(kg)';
    AdvStrGdProRd.Cells[5, 0] := '误差(%)';
    AdvStrGdProRd.Cells[6, 0] := '仓号';
    AdvStrGdProRd.Cells[7, 0] := '状态';    //0：表示未完成配料  10表示完成配料
    AdvStrGdProRd.Cells[8, 0] := '盘号';

    AdvStrGdProRd.ColWidths[6] := 0;
    AdvStrGdProRd.ColWidths[7] := 0;
    //AdvStrGdProRd.ColWidths[8] := 0;
end;

procedure TFrmMain.IniAdvStrGdProdNotice();
begin
    AdvStrGdProdNotice.cells[0, 0] := 'ID';
    AdvStrGdProdNotice.ColWidths[0] := 1;
    AdvStrGdProdNotice.cells[2, 0] := '流水号';
    AdvStrGdProdNotice.cells[3, 0] := '任务单编号';
    AdvStrGdProdNotice.cells[4, 0] := '生产配比';
    AdvStrGdProdNotice.cells[5, 0] := '运送车辆';
    AdvStrGdProdNotice.cells[6, 0] := '方量';
    AdvStrGdProdNotice.cells[7, 0] := '工程信息';    //客户名称  功能名称  浇筑部位
    AdvStrGdProdNotice.cells[8, 0] := '技术要求';    //强度等级  坍落度  抗渗等级  技术要求

    DspProdNoticeFromDb();
end;

procedure TFrmMain.IniProdNoticeTb();            //初始化生产派车单信息表
begin
    sCmbBxTruckCodeInNoticeInfo.Text := '';
    sCmbBxTruckCodeInNoticeInfo.Items.Clear;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select distinct(Code) as TruckCode from Truck';
    ADOQuery1.Open;
    while not ADOQuery1.Eof do
    begin
        sCmbBxTruckCodeInNoticeInfo.Items.Add(ADOQuery1.FieldByName('TruckCode').AsString);
        ADOQuery1.Next;
    end;
end;

procedure TFrmMain.DspSoftAuthorInfo();    //显示软件授权
var
    IniFile          : TInifile;
    AuthorRemainDays : Double;
    HaspKeyErrInfo   : String;
    RequstCode       : String;
    Mobile           : String;
begin
    //获取收取剩余天数
    if GetAuthorizedRemainingDays(EndRunDate, AuthorRemainDays, HaspKeyErrInfo) = 0 then
    begin
        if AuthorRemainDays <= 3 then
        begin
            Panel2.Visible := True;
            IniFile := TInifile.Create(ExtractFilePath(Application.ExeName) + 'set.ini');
            RequstCode := IniFile.ReadString('Application', 'Code', '') ;
            if RequstCode = '' then
            begin
                randomize;
                IniFile.WriteString ( 'Application', 'Code', format('%.4d', [random(9999)]) );
                RequstCode := IniFile.ReadString('Application', 'Code', '') ;
            end;
            Mobile := IniFile.ReadString('Equip', 'Mobile', '') ;
            IniFile.Free;
        end;

        if AuthorRemainDays > 0 then
        begin
            Lb1SoftAuthor.Caption := '软件授权剩余 ' + Format('%.1f', [AuthorRemainDays]) + ' 天。请编辑信息：';
            Lb2SoftAuthor.Caption := '"解码01，序号：' + HaspKeyId + ',申请码' + RequstCode + '"';
            Lb3SoftAuthor.Caption := '给您的设备供应商，手机号：' + Mobile;
        end
        else
        begin
            Lb1SoftAuthor.Caption := '软件授权已到期,不能启动生产。请编辑信息：';
            Lb2SoftAuthor.Caption := '"解码01，序号：' + HaspKeyId + ',申请码' + RequstCode + '"';
            Lb3SoftAuthor.Caption := '给您的设备供应商，手机号：' + Mobile;
        end;
    end
    else
    begin
        Showmessage('获取当前时间失败，系统将不能正常启动生产，请检查软件锁是否正常！ ' + HaspKeyErrInfo);
    end;
end;

procedure TFrmMain.AdvStrGdProdNoticeGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    if ARow = 0 then HAlign := taCenter;
end;

procedure TFrmMain.IniLoadWeigherImg(WeigherId : Integer; X,Y,W,H : Integer);
begin

    //创建图片
    WeigherImg[WeigherId] := TImage.Create(FrmMain);
    WeigherImg[WeigherId].Parent := FrmMain;
    WeigherImg[WeigherId].Tag := WeigherId;
    WeigherImg[WeigherId].PopupMenu := PMWeigher;
    WeigherImg[WeigherId].OnContextPopup := WeigherContextPopup;

    WeigherImg[WeigherId].Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Images\Equips\Instruments\Weigher.png');

    WeigherImg[WeigherId].Left := X;
    WeigherImg[WeigherId].Top := Y;
    WeigherImg[WeigherId].Width := W;
    WeigherImg[WeigherId].Height := H;

    WeigherImg[WeigherId].Cursor := crDrag;

end;

procedure TFrmMain.LoadWeigherDischValveImg(WeigherId : Integer; X,Y : Integer);
begin
    WeigherDischValveImg[WeigherId] := TImage.Create(FrmMain);
    WeigherDischValveImg[WeigherId].Parent := FrmMain;
    WeigherDischValveImg[WeigherId].Tag := WeigherId;
    WeigherDischValveImg[WeigherId].Name := 'WeigDischValveImg' + intToStr(WeigherId);
    WeigherDischValveImg[WeigherId].Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Images\Equips\Instruments\WeigDischValveClose.png');
    WeigherDischValveImg[WeigherId].AutoSize := True;
    WeigherDischValveImg[WeigherId].Left := X;
    WeigherDischValveImg[WeigherId].Top := Y;

    WeigherDischValveImg[WeigherId].OnMouseDown := WghrDschValveImgMouseDn;
    WeigherDischValveImg[WeigherId].OnMouseUp   := WghrDschValveImgMouseUp;
end;

procedure TFrmMain.WghrDschValveImgMouseDn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img : TImage;
    InstruId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    InstruId := Img.Tag;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + InstruId -1, $0009 );
end;

procedure TFrmMain.WghrDschValveImgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img : TImage;
    InstruId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    InstruId := Img.Tag;
    showmessage(inttostr(InstruId));
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + InstruId -1, $000A );
end;

procedure TFrmMain.DspWeigherDschValveState(WeigherId : Integer; NewState : Integer);
begin
    case NewState of

        CntWeigDischValveIsClose   :    //卸料阀关闭状态
        begin
            WeigherDischValveImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveClose.png');
            WeigherDischValveImgState[WeigherId] := CntWeigDischValveIsClose;
        end;

        CntWeigDischValveIsOPen    :    //卸料阀打开状态
        begin
            WeigherDischValveImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveOPen.png');
            WeigherDischValveImgState[WeigherId] := CntWeigDischValveIsOPen;
        end;

        else
        begin
            WeigherDischValveImgState[WeigherId] := CntWeigDischValveIsInvalid;
        end;
    end;
end;

procedure TFrmMain.LoadWeigherDischVibratorImg(WeigherId : Integer; X,Y : Integer);
begin
    WeigherDischVibraImg[WeigherId] := TImage.Create(FrmMain);
    WeigherDischVibraImg[WeigherId].Parent := FrmMain;
    WeigherDischVibraImg[WeigherId].Tag := WeigherId;
    WeigherDischVibraImg[WeigherId].Name := 'WeigDischVibraImg' + intToStr(WeigherId);
    WeigherDischVibraImg[WeigherId].Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Images\Equips\Instruments\WeigVibratorClose.png');
    WeigherDischVibraImg[WeigherId].AutoSize := True;
    WeigherDischVibraImg[WeigherId].Left := X;
    WeigherDischVibraImg[WeigherId].Top := Y;
    WeigherDischVibraImg[WeigherId].Cursor := crHandPoint;
    WeigherDischVibraImg[WeigherId].OnClick := WeigherDschVibraImgClick ;
end;

procedure TFrmMain.WeigherDschVibraImgClick(Sender: TObject);
var
    Img : TImage;
    WghrId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    WghrId := Img.Tag ;

    if ( WeigherStateInInstru[WghrId] and $0020 ) <> 0 then    //下位机中 卸料阀状态 为 开
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + WghrId -1, $0014 );    //关闭称卸料振动器
    end
    else
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + WghrId -1, $0013 );    //打开称卸料振动器
    end; 
end;

procedure TFrmMain.DspWghrDschVibraState(WeigherId : Integer; NewState : Integer );
begin
    case NewState of
        CntVibraImgStaIsClose   :    //振动器 图片 关   状态
        begin
            WeigherDischVibraImg[WeigherId].Picture.LoadFromFile( AppPath + '\Images\Equips\Instruments\WeigVibratorClose.png' );
            WeigherDischVibraImgState[WeigherId] := CntVibraImgStaIsClose;      //称卸料振动器图片状态 为 关
        end;
        
        CntVibraImgStaIsOpen    :    //振动器 图片 开   状态
        begin
            WeigherDischVibraImg[WeigherId].Picture.LoadFromFile( AppPath + '\Images\Equips\Instruments\WeigVibratorOpen.png' );
            WeigherDischVibraImgState[WeigherId] := CntVibraImgStaIsOpen ;      //称卸料振动器图片状态 为 开
        end;

        else
        begin
            WeigherDischVibraImgState[WeigherId] := CntVibraImgStaIsInvalid;
        end;
    end;
end;

procedure TFrmMain.LoadWeigherDischValveCloseLmtImg(WeigherId : Integer;
  X,Y : Integer);
begin 
    WeigherDischValveCloseLmtImg[WeigherId] := TImage.Create(FrmMain);
    WeigherDischValveCloseLmtImg[WeigherId].Parent := FrmMain;
    WeigherDischValveCloseLmtImg[WeigherId].Tag := WeigherId;
    WeigherDischValveCloseLmtImg[WeigherId].Name := 'WeigDischValveClsLmtImg' + intToStr(WeigherId);
    WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Images\Equips\Instruments\WeigDischValveLmtInValid.png');
    WeigherDischValveCloseLmtImg[WeigherId].AutoSize := True;
    WeigherDischValveCloseLmtImg[WeigherId].Left := X;
    WeigherDischValveCloseLmtImg[WeigherId].Top := Y;
end;

procedure TFrmMain.DspWghrDschValveCloseLmtImg(WeigherId : Integer; NewState : Integer);    //更新称关限图片状态
begin
    Case NewState of
        CntWghrDschValveClsLmtImgIsInvalid      :    //称卸料阀关限图片 无效     状态
        begin
            WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveLmtInValid.gif' );
            WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsInvalid;
        end;

        CntWghrDschValveClsLmtImgIsValid        :    //称卸料阀关限图片 有效     状态
        begin
            WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveLmtValid.gif' );
            WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsValid;
        end;

        CntWghrDschValveClsLmtImgIsValidFlash   :    //称卸料阀关限图片 有效闪烁 状态
        begin
            WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveLmtValidFlash.gif' );
            WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsValidFlash;
        end;

        CntWghrDschValveClsLmtImgIsInvalidFlash :    //称卸料阀关限图片 无效闪烁 状态
        begin
            WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveLmtInValidFlash.gif' );
            WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsInvalidFlash;
        end;
    end;
end;

procedure TFrmMain.LoadWeigherValueLabel(WeigherId : Integer; X,Y,W,H : Integer);    //称卸料阀图片
begin
    WeigherValueLab[WeigherId]             := TLabel.Create(FrmMain);
    WeigherValueLab[WeigherId].Parent      := FrmMain;
    WeigherValueLab[WeigherId].Tag         := WeigherId;
    WeigherValueLab[WeigherId].Name        := 'WeigValueLab' + inttostr(WeigherId);
    WeigherValueLab[WeigherId].Alignment   := taCenter;
    WeigherValueLab[WeigherId].AutoSize    := False;
    WeigherValueLab[WeigherId].Left        := X;
    WeigherValueLab[WeigherId].Top         := Y;
    WeigherValueLab[WeigherId].Width       := W;
    WeigherValueLab[WeigherId].Height      := H;
    WeigherValueLab[WeigherId].Transparent := True;
    WeigherValueLab[WeigherId].Caption     := '0';
end;

procedure TFrmMain.WeigherContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
    Img : Timage;
begin
    Img := TImage(Sender);
    PMWeigherId := Img.Tag;
end;

procedure TFrmMain.LoadStorageImgFromFile( ImageNo : Integer; SourseImgDir : String ;
  X,Y : Integer; Width, Height : Integer);
begin
    StorageImg[ImageNo] := TImage.Create(FrmMain);
    StorageImg[ImageNo].Parent := FrmMain;
    StorageImg[ImageNo].Tag := ImageNo;
    StorageImg[ImageNo].OnContextPopup := StorageContexPopup;
    StorageImg[ImageNo].PopupMenu := PMStorage ;
    StorageImg[ImageNo].Picture.LoadFromFile(SourseImgDir);
    StorageImg[ImageNo].Left := x;
    StorageImg[ImageNo].Top := y;
    StorageImg[ImageNo].Width := Width;
    StorageImg[ImageNo].Height := Height; //}
end;

procedure TFrmMain.LoadStorageDischImg(StorageId : Integer; LoadImgType : Integer;
  SourseImgDir : String; X,Y : Integer; Width, Height : Integer);
begin
    case LoadImgType of
        CntAggregateLoadImg ,    //骨料计量阀图片
        CntPowderLoadImg    ,    //粉料仓计量阀图片
        CntLiqLoadImg       :    //液仓计量阀图片
        begin
            StorageLoadImg[StorageId] := TImage.Create(FrmMain);
            StorageLoadImg[StorageId].Parent := FrmMain;
            StorageLoadImg[StorageId].Name  := 'ImgLoad' + inttostr(StorageId);    //StorageId #料仓计量门
            StorageLoadImg[StorageId].Transparent := True;
            StorageLoadImg[StorageId].Picture.LoadFromFile(SourseImgDir);
            StorageLoadImg[StorageId].Left := x;
            StorageLoadImg[StorageId].Top := y;
            StorageLoadImg[StorageId].AutoSize := True;
            StorageLoadImg[StorageId].Tag := StorageId;
            //StorageLoadImg[StorageId].Width := Width;
            //StorageLoadImg[StorageId].Height := Height;
            StorageLoadImg[StorageId].OnMouseDown := LoadImgMouseDn ;
            StorageLoadImg[StorageId].OnMouseUp   := LoadImgMouseUp ;
        end;
        CntAggregateFineImg ,    //骨料精计量阀图片
        CntPowderFineImg    ,    //粉料仓精计量阀图片
        CntLiqFineImg       :    //液仓精计量阀图片
        begin
            StorageFineLoadImg[StorageId] := TImage.Create(FrmMain);
            StorageFineLoadImg[StorageId].Parent := FrmMain;
            StorageFineLoadImg[StorageId].Name := 'ImgFineLoad' + inttostr(StorageId);    //StorageId #料仓精计量门
            StorageFineLoadImg[StorageId].Transparent := True;
            StorageFineLoadImg[StorageId].Picture.LoadFromFile(SourseImgDir);
            StorageFineLoadImg[StorageId].Left := x;
            StorageFineLoadImg[StorageId].Top := y;
            StorageFineLoadImg[StorageId].AutoSize := True;
            StorageFineLoadImg[StorageId].Tag := StorageId;
            //StorageFineLoadImg[StorageId].Width := Width;
            //StorageFineLoadImg[StorageId].Height := Height;
            StorageFineLoadImg[StorageId].OnMouseDown := LoadImgMouseDn ;
            StorageFineLoadImg[StorageId].OnMouseUp   := LoadImgMouseUp ;
        end;

        CntAggregateCoLoadImg ,    //骨料粗计量阀图片
        CntPowderCoLoadImg    ,    //粉料粗计量
        CntLiqCoLoadImg       :    //液体仓粗计量阀图片
        begin
            StorageLoadImg[StorageId] := TImage.Create(FrmMain);
            StorageLoadImg[StorageId].Parent := FrmMain;
            StorageLoadImg[StorageId].Name  := 'ImgLoad' + inttostr(StorageId);    //StorageId #料仓计量门
            StorageLoadImg[StorageId].Transparent := True;
            StorageLoadImg[StorageId].Picture.LoadFromFile(SourseImgDir);
            StorageLoadImg[StorageId].Left := x;
            StorageLoadImg[StorageId].Top := y;
            StorageLoadImg[StorageId].AutoSize := True;
            StorageLoadImg[StorageId].Tag := StorageId;
            StorageLoadImg[StorageId].OnMouseDown := CoarseLoadMouseDn;    //块配料图片鼠标按下
            StorageLoadImg[StorageId].OnMouseUp   := CoarseLoadMouseUp     //块配料图片鼠标抬起
        end;
    end;
end;

procedure TFrmMain.CoarseLoadMouseDn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img    : TImage;
    SiloId : Integer;
    WtAddr,
    WtData : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SiloId := Img.Tag;
    WtAddr := $0210 + StorageInfo[SiloId].InstrumentId -1;
    WtData := $0021 + StorageInfo[SiloId].LoadNo -1;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, WtAddr, WtData );                //写一个字到通讯缓冲区
end;

procedure TFrmMain.CoarseLoadMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img    : TImage;
    SiloId : Integer;
    WtAddr,
    WtData : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SiloId := Img.Tag;
    WtAddr := $0210 + StorageInfo[SiloId].InstrumentId -1;
    WtData := $0025 + StorageInfo[SiloId].LoadNo -1;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, WtAddr, WtData );                //写一个字到通讯缓冲区
end;

procedure TFrmMain.LoadImgMouseDn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img    : TImage;
    SiloId : Integer;
    WtAddr,
    WtData : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SiloId := Img.Tag;
    WtAddr := $0210 + StorageInfo[SiloId].InstrumentId -1;
    WtData := $0001 + StorageInfo[SiloId].LoadNo -1;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, WtAddr, WtData );                //写一个字到通讯缓冲区
end;

procedure TFrmMain.LoadImgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img    : TImage;
    SiloId : Integer;
    WtAddr,
    WtData : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SiloId := Img.Tag;
    WtAddr := $0210 + StorageInfo[SiloId].InstrumentId -1;
    WtData := $0005 + StorageInfo[SiloId].LoadNo -1;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, WtAddr, WtData );                //写一个字到通讯缓冲区
end;

procedure TFrmMain.DSpSiloVibraImgState(DspSiloId : Integer; VibraNewState : Integer);    //更新振动器图片状态
begin
    case VibraNewState of
        CntVibraImgStaIsClose   :    //振动器 图片 关   状态
        begin
            StorageVibratorImg[DspSiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\StorVibratorClose.png');    //料仓振动器 图片状态 为 关
            StorageVibratorImgState[DspSiloId] := CntVibraImgStaIsClose ;
        end;

        CntVibraImgStaIsOpen    :    //振动器 图片 开   状态
        begin
            StorageVibratorImg[DspSiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\StorVibratorOpen.png');     //料仓整栋器 图片状态 为 开
            StorageVibratorImgState[DspSiloId] := CntVibraImgStaIsOpen;
        end;

        else
        begin
            StorageVibratorImgState[DspSiloId] := CntVibraImgStaIsInvalid ;
        end;
        
    end;
end;

procedure TFrmMain.DspSiloLOadVaveState(SiloId : Integer; SiloLoadVaveImgCode : Integer;
  DigitalState : Integer ) ;
var
    SourseImgDir : String;
begin
    if SiloLoadVaveImgCode = CntSiloLdValveImgIsLd then   //料仓计量阀图片名称 是 计量阀   图片
    begin
        case StorageInfo[SiloId].Model of
            CntAggregateStorage :    //骨料仓
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //数字量状态是关
                    begin
                        SourseImgDir := AppPath + '\Images\Equips\Storages\AggregateStorageLdClo.bmp';
                        StorageLoadImg[SiloId].Picture.LoadFromFile(SourseImgDir);
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsClose;
                    end;
                    CntLoadImgStateIsOpen  :     //数字量状态是开
                    begin
                        SourseImgDir := AppPath + '\Images\Equips\Storages\AggregateStorageLdOp.bmp';
                        StorageLoadImg[SiloId].Picture.LoadFromFile(SourseImgDir);
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsOpen;
                    end;
                    else
                    begin
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                 end;
            end;

            CntPowderStorage :       //粉料仓
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //数字量状态是关
                    begin
                        StorageLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\PowStorLdClose.bmp') ;    //粉料仓（粗）计量阀关
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //数字量状态是开
                    begin
                        StorageLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\PowStorLdOpen.bmp') ;    //粉料仓(粗)计量阀开
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsOpen;
                    end;

                    else
                    begin
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                end;
            end;

            //CntLiquidStorage19dian :       //液体仓
            CntWaterStorage   ,      //水仓
            CntAddtiveStorage :      //外剂仓
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //数字量状态是关
                    begin
                        StorageLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\LiqStorLdClose.bmp' );    //装载 液剂仓(粗)计量阀 为 关 状态
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //数字量状态是开
                    begin
                        StorageLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\LiqStorLdOpen.bmp' );    //装载 液剂仓(粗)计量阀 为 开状态
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsOpen ;
                    end;
                    else
                    begin
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                end;
            end;
        end;
    end
    else                                              //料仓计量阀图片名称 是 精计量阀 图片
    begin
        case StorageInfo[SiloId].Model of
            CntAggregateStorage :    //骨料仓
            begin

                case DigitalState of
                    CntLoadImgStateIsClose :     //数字量状态是关
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\AggregateStorageLdClo.bmp');
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //数字量状态是开
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\AggregateStorageFnLdOp.bmp');
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsOpen ;
                    end;

                    else
                    begin
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsInvalid ;
                    end;
                end;
            end;

            CntPowderStorage :       //粉料仓
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //数字量状态是关
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\PowStorLdClose.bmp');    //粉料仓精计量阀开
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //数字量状态是开
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\PowStorFnLdOpen.bmp' );    //粉料仓精计量阀开
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsOpen ;
                    end;

                    else
                    begin
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                end;
            end;

            //CntLiquidStorage :       //液体仓
            CntWaterStorage   ,      //水仓
            CntAddtiveStorage :      //外剂仓
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //数字量状态是关
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\LiqStorLdClose.bmp');    //装载 液体仓 精计量阀状态为 关
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //数字量状态是开
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\LiqStorFnLdOpen.bmp');    //装载 液体仓 精计量阀状态为 开
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsOpen ;
                    end;

                    else
                    begin
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                end;
            end;
        end;
    end;
    
end;

procedure TFrmMain.LoadStorageVibrator(StorageId : Integer;
  SourseImgDir : String; X,Y : Integer; Width, Height : Integer);
begin
    StorageVibratorImg[StorageId] := TImage.Create(FrmMain);
    StorageVibratorImg[StorageId].Parent := FrmMain;
    StorageVibratorImg[StorageId].Name  := 'ImgLoadVibrator' + inttostr(StorageId);    //StorageId #料仓计量振动器
    StorageVibratorImg[StorageId].Transparent := True;
    StorageVibratorImg[StorageId].Picture.LoadFromFile(SourseImgDir);
    StorageVibratorImg[StorageId].Left := x;
    StorageVibratorImg[StorageId].Top := y;
    StorageVibratorImg[StorageId].AutoSize := True;
    StorageVibratorImg[StorageId].Tag := StorageId;
    StorageVibratorImg[StorageId].Cursor := crHandPoint;
    StorageVibratorImg[StorageId].OnClick := SiloLdVibraClick;
end;

procedure TFrmMain.SiloLdVibraClick(Sender: TObject);
var
    Img : TImage;
    SelSiloId : Integer;
    SelInstruId : Integer;
    LoadId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SelSiloId := Img.Tag;
    SelInstruId := StorageInfo[SelSiloId].InstrumentId ;
    LoadId := StorageInfo[SelSiloId].LoadNo;

    if ( WeigherStateInInstru[SelInstruId] and ($0100 shl (LoadId -1) ) ) <> 0 then    //振动器为开
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + SelInstruId -1, $000F + LoadId -1 ); //打开振动器
    end
    else    //振动器为关
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + SelInstruId -1, $000B + LoadId -1 ); //打开振动器
    end;
end;

procedure TFrmMain.LoadWeigherLoadCounerLab(WeigherId : Integer; X,Y : integer);    //称配料计数器 标签
begin
    WeigherLoadConterLab[WeigherId] := TLabel.Create(FrmMain);
    WeigherLoadConterLab[WeigherId].Parent := FrmMain;
    WeigherLoadConterLab[WeigherId].Font.Size := 12;
    WeigherLoadConterLab[WeigherId].Font.Style := [fsBold];
    WeigherLoadConterLab[WeigherId].AutoSize := True;
    //WeigherLoadConterLab[WeigherId]
    WeigherLoadConterLab[WeigherId].Alignment := taLeftJustify;
    WeigherLoadConterLab[WeigherId].Left := X;
    WeigherLoadConterLab[WeigherId].Top := Y;
    WeigherLoadConterLab[WeigherId].Visible := False;
    WeigherLoadConterLab[WeigherId].Caption := '0';
end;

procedure TFrmMain.LoadStorageMaterilInfoLb(StorageId : Integer);
begin
    LbMaterialNameInFrmMain[StorageId] := TLabel.Create(FrmMain);
    LbMaterialNameInFrmMain[StorageId].Parent := FrmMain;
    LbMaterialNameInFrmMain[StorageId].Visible := True;
    LbMaterialNameInFrmMain[StorageId].Font.Size := 12;
    LbMaterialNameInFrmMain[StorageId].Font.Style := [fsBold];
    LbMaterialNameInFrmMain[StorageId].AutoSize := True;
    LbMaterialNameInFrmMain[StorageId].Caption := StorageInfo[StorageId].MaterName;
    LbMaterialNameInFrmMain[StorageId].Left :=
      StorageImg[StorageId].Left + (StorageImg[StorageId].Width - LbMaterialNameInFrmMain[StorageId].Width) div 2;
    LbMaterialNameInFrmMain[StorageId].Top := StorageImg[StorageId].Top - 70 ;
    //材料规格
    LbMaterialSpecInFrmMain[StorageId] := TLabel.Create(FrmMain);
    LbMaterialSpecInFrmMain[StorageId].Parent := FrmMain;
    LbMaterialSpecInFrmMain[StorageId].Visible := True;
    LbMaterialSpecInFrmMain[StorageId].Font.Name := '宋体';
    LbMaterialSpecInFrmMain[StorageId].Font.Size := 11;
    LbMaterialSpecInFrmMain[StorageId].Font.Style := [fsBold];
    LbMaterialSpecInFrmMain[StorageId].Caption := StorageInfo[StorageId].MaterSpec ;
    LbMaterialSpecInFrmMain[StorageId].AutoSize := True;
    LbMaterialSpecInFrmMain[StorageId].Left :=
      StorageImg[StorageId].Left +
      (StorageImg[StorageId].Width - LbMaterialSpecInFrmMain[StorageId].Width) div 2;
    LbMaterialSpecInFrmMain[StorageId].Top := StorageImg[StorageId].Top - 53;

end;

procedure TFrmMain.StorageMaterialMoistureLab(StorageId : Integer; X,Y : Integer);    //原料含水率
begin
    if StorageId > 6 then
    begin
        Showmessage('料仓号大于6,无含水率信息');
    end
    else
    begin
        StorageWaterParaLab[StorageId] := TLabel.Create(FrmMain);
        StorageWaterParaLab[StorageId].Parent := FrmMain;
        StorageWaterParaLab[StorageId].Visible := True;
        StorageWaterParaLab[StorageId].Font.Name := '宋体';
        StorageWaterParaLab[StorageId].Font.Size := 11;
        StorageWaterParaLab[StorageId].Font.Style := [];//[fsBold];
        StorageWaterParaLab[StorageId].AutoSize := False;
        StorageWaterParaLab[StorageId].Alignment := taCenter;
        StorageWaterParaLab[StorageId].Width := StorageImg[StorageId].Width;
        StorageWaterParaLab[StorageId].Left := StorageImg[StorageId].Left;
        StorageWaterParaLab[StorageId].Top := StorageImg[StorageId].Top - 15;
        StorageWaterParaLab[StorageId].Caption := Format('%.1f', [StorageInfo[StorageId].Moisture]) + '%';
    end;
end;

procedure TFrmMain.LoadStorageLoadTargerLab(StorageId : Integer);    //加载料仓配料目标值标签  配料目标值标签
begin
    StorageLoadTargetLab[StorageId] := TLabel.Create(FrmMain);
    StorageLoadTargetLab[StorageId].Parent := FrmMain;
    StorageLoadTargetLab[StorageId].Visible := True;
    StorageLoadTargetLab[StorageId].Font.Name := '宋体';
    StorageLoadTargetLab[StorageId].Font.Size := 12;
    StorageLoadTargetLab[StorageId].Font.Style := [];//[fsBold];
    StorageLoadTargetLab[StorageId].AutoSize := False;
    StorageLoadTargetLab[StorageId].Alignment := taCenter;
    StorageLoadTargetLab[StorageId].Width := StorageImg[StorageId].Width;
    StorageLoadTargetLab[StorageId].Left := StorageImg[StorageId].Left;
    StorageLoadTargetLab[StorageId].Top := StorageImg[StorageId].Top - 32;
    StorageLoadTargetLab[StorageId].Caption := '0';

    StorageLOadValueLab[StorageId] := TLabel.Create(FrmMain);
    StorageLOadValueLab[StorageId].Parent := FrmMain;
    StorageLOadValueLab[StorageId].Visible := False;
    StorageLOadValueLab[StorageId].Font.Name := '宋体';
    StorageLOadValueLab[StorageId].Font.Size := 13;
    StorageLOadValueLab[StorageId].Font.Style := [fsBold];
    StorageLOadValueLab[StorageId].Font.Color := clYellow;
    StorageLOadValueLab[StorageId].AutoSize := False;
    StorageLOadValueLab[StorageId].Alignment := taCenter;
    StorageLOadValueLab[StorageId].Width := StorageImg[StorageId].Width;
    StorageLOadValueLab[StorageId].Left := StorageImg[StorageId].Left;
    StorageLOadValueLab[StorageId].Top := StorageImg[StorageId].Top +20;
    StorageLOadValueLab[StorageId].Caption := '9999';
    StorageLOadValueLab[StorageId].Transparent := True;
    //StorageLoadValueLabVisible[StorageId] := False;
end;

procedure TFrmMain.LoadAggregateConveyorEquip(EquipNumber : Integer;                     //加载骨料输送设备
  SourseImgDir : String; X, Y, Width, Height : Integer);
begin
    ImgAggregateConveyor[EquipNumber] := TIMage.Create(FrmMain);
    ImgAggregateConveyor[EquipNumber].Parent := FrmMain;
    ImgAggregateConveyor[EquipNumber].Left := X;
    ImgAggregateConveyor[EquipNumber].Top := Y;
    ImgAggregateConveyor[EquipNumber].Width := Width;
    ImgAggregateConveyor[EquipNumber].Height := Height;
    ImgAggregateConveyor[EquipNumber].Proportional := True;
    ImgAggregateConveyor[EquipNumber].Transparent  := True;
    ImgAggregateConveyor[EquipNumber].Stretch      := True;
    ImgAggregateConveyor[EquipNumber].Picture.LoadFromFile(SourseImgDir);
end;

procedure TFrmMain.LoadAggrConvHolpTmrLab(ConvyorBeltId : Integer; X,Y : Integer);    //加载斜皮带输送骨料持续时间
begin
    LabAggrConvHoldTmr[ConvyorBeltId] := TLabel.Create(FrmMain);
    LabAggrConvHoldTmr[ConvyorBeltId].Parent := FrmMain;
    LabAggrConvHoldTmr[ConvyorBeltId].Left := X;
    LabAggrConvHoldTmr[ConvyorBeltId].Top := Y;
    LabAggrConvHoldTmr[ConvyorBeltId].Font.Size := 14;
    LabAggrConvHoldTmr[ConvyorBeltId].Font.Style := [fsBold];
    LabAggrConvHoldTmr[ConvyorBeltId].AutoSize := True;
    LabAggrConvHoldTmr[ConvyorBeltId].Alignment := taLeftJustify;
    LabAggrConvHoldTmr[ConvyorBeltId].Caption := '0';
end;

procedure TFrmMain.LoadAggrDschBeltRunBtn( EquipId : Integer;   //创建平皮带点动启动按钮
  SourseImgDir : String; X,Y,Width,Height : Integer);
begin
     ImgAggrConvRunBtn[EquipId] := TIMage.Create(FrmMain);
     ImgAggrConvRunBtn[EquipId].Parent := FrmMain;
     ImgAggrConvRunBtn[EquipId].Left := x;
     ImgAggrConvRunBtn[EquipId].Top := y;
     ImgAggrConvRunBtn[EquipId].AutoSize := True;
     ImgAggrConvRunBtn[EquipId].Tag := EquipId;
     ImgAggrConvRunBtn[EquipId].Picture.LoadFromFile(SourseImgDir);
     ImgAggrConvRunBtn[EquipId].Cursor := crHandPoint;
     ImgAggrConvRunBtn[EquipId].OnClick := AggrConvBeltRunBtnImgClick;
end;

procedure TFrmMain.AggrConvBeltRunBtnImgClick(Sender: TObject);
Var
    Img : TImage;
    BeltId : Integer;
    BeltType : Integer;
    WaitWtInstrumentReplyPt : Integer ;
begin
    Img := TImage(Sender);
    BeltId := Img.Tag ;
    BeltType := AggregateConveyorEquipInfo[BeltId].EquipType;

    case BeltType of
        CntAggConveyEquipIsLtLevelBelt    :    //左平皮带
        begin
            if AggrMidHopperStateInInstru and (1 shl 7) <> 0 then    //平皮带输出信号有效
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0006 ); //关闭平皮带
            end
            else    //平皮带输出无效
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0005 ); //打开平皮带
            end;
        end;

        CntAggConveyEquipIsRtLevelBelt    :    //右平皮带
        begin

        end;

        CntAggConveyEquipIsLtInclinedBelt :    //左斜皮带
        begin

        end;

        CntAggConveyEquipIsRtInclinedBelt :    //右斜皮带
        begin

        end;

        //= 5;//左提升斗
        //= 6;//右提升斗
        CntAggConveyEquipIsLtShtLevelBelt :    //左右平皮带
        begin

        end;
    end;
end;

procedure TFrmMain.DSPAggrConvEquipBtnIMgNewState(EquipId : Integer; NewState : Integer);    //更新骨料输送皮带 启停按钮图片 状态
begin
    if AggrConvEquipBtnState[EquipId] <> CtAggrConvEquipBtnIsNone then
    begin
        case NewState of
            CtAggrConvEquipBtnIsInvalid :    //骨料输送设备按钮状态 为 无效
            begin
                ImgAggrConvRunBtn[EquipId].Picture.loadFromFile(AppPath + '\Images\Equips\Straps\RunInvalid.png');
                AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsInvalid;
            end;

            CtAggrConvEquipBtnIsValid   :    //骨料输送设备按钮状态 为 有效
            begin
                ImgAggrConvRunBtn[EquipId].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\RunValid.png');
                AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsValid;
            end;
        end;
    end;
end;

//LmtType = 1 下限位  LmtType=2 上限位
procedure TFrmMain.LoadLiftBucketLmtImg(LiftbucketNum : Integer; SourseImgDir : String;  //创建骨料提升斗限位
  X,Y : Integer; Width, Height : Integer; LmtType : Integer);
begin
    case LmtType of
        1:        //骨料提升斗下限位
        begin
            ImgLiftBucketBottomLmt[LiftbucketNum] := TImage.Create(FrmMain);
            ImgLiftBucketBottomLmt[LiftbucketNum].Parent := FrmMain;
            ImgLiftBucketBottomLmt[LiftbucketNum].Left   := x;
            ImgLiftBucketBottomLmt[LiftbucketNum].Top    := y;
            ImgLiftBucketBottomLmt[LiftbucketNum].Width  := Width;
            ImgLiftBucketBottomLmt[LiftbucketNum].Height := Height;
            ImgLiftBucketBottomLmt[LiftbucketNum].AutoSize := True;
            ImgLiftBucketBottomLmt[LiftbucketNum].Picture.LoadFromFile(SourseImgDir);
        end;
        2:       //骨料提升斗上限位
        begin
            ImgLiftBucketTopLmt[LiftbucketNum] := TImage.Create(FrmMain);
            ImgLiftBucketTopLmt[LiftbucketNum].Parent := FrmMain;
            ImgLiftBucketTopLmt[LiftbucketNum].Left   := x;
            ImgLiftBucketTopLmt[LiftbucketNum].Top    := y;
            ImgLiftBucketTopLmt[LiftbucketNum].Width  := Width;
            ImgLiftBucketTopLmt[LiftbucketNum].Height := Height;
            ImgLiftBucketTopLmt[LiftbucketNum].AutoSize := True;
            ImgLiftBucketTopLmt[LiftbucketNum].Picture.LoadFromFile(SourseImgDir);
        end;
    end;
end;

//LmtType = 1 上升按钮  LmtType=2 下降按钮
//LiftbucketNum =1，左提升斗；LiftbucketNum=2，右提升斗
procedure TFrmMain.LoadLiftBucketBtnImg(LiftbucketNum : Integer; SourseImgDir : String;  //创建骨料提升斗按钮
  X,Y : Integer; Width, Height : Integer; LmtType : Integer);
begin
    case LmtType of
        1:        //骨料提升斗上升
        begin
            ImgLiftBucketGoUp[LiftbucketNum] := TImage.Create(FrmMain);
            ImgLiftBucketGoUp[LiftbucketNum].Parent   := FrmMain;
            ImgLiftBucketGoUp[LiftbucketNum].Left     := x;
            ImgLiftBucketGoUp[LiftbucketNum].Top      := y;
            ImgLiftBucketGoUp[LiftbucketNum].Width    := Width;
            ImgLiftBucketGoUp[LiftbucketNum].Height   := Height;
            ImgLiftBucketGoUp[LiftbucketNum].AutoSize := True;
            ImgLiftBucketGoUp[LiftbucketNum].Cursor   := crHandPoint;
            ImgLiftBucketGoUp[LiftbucketNum].Tag      := LiftbucketNum;
            //ImgLiftBucketGoUp[LiftbucketNum].OnClick  := LiftBucketGoUpBtnClick;
            ImgLiftBucketGoUp[LiftbucketNum].OnMouseDown := LiftBucketGoUpMouseDn ;
            ImgLiftBucketGoUp[LiftbucketNum].OnMouseUp   := LiftBucketGoUpMouseUp ;
            ImgLiftBucketGoUp[LiftbucketNum].Picture.LoadFromFile(SourseImgDir);
        end;

        2:       //骨料提升斗下降
        begin
            ImgLiftBucketGoDn[LiftbucketNum] := TImage.Create(FrmMain);
            ImgLiftBucketGoDn[LiftbucketNum].Parent   := FrmMain;
            ImgLiftBucketGoDn[LiftbucketNum].Left     := x;
            ImgLiftBucketGoDn[LiftbucketNum].Top      := y;
            ImgLiftBucketGoDn[LiftbucketNum].Width    := Width;
            ImgLiftBucketGoDn[LiftbucketNum].Height   := Height;
            ImgLiftBucketGoDn[LiftbucketNum].AutoSize := True;
            ImgLiftBucketGoDn[LiftbucketNum].Cursor   := crHandPoint;
            ImgLiftBucketGoDn[LiftbucketNum].Tag      := LiftbucketNum;
            //ImgLiftBucketGoDn[LiftbucketNum].OnClick  := LiftBucketGoDnBtnClick;
            ImgLiftBucketGoDn[LiftbucketNum].OnMouseDown := LiftBucketGoDnMouseDn ;
            ImgLiftBucketGoDn[LiftbucketNum].OnMouseUp   := LiftBucketGoDnMouseUp ;
            ImgLiftBucketGoDn[LiftbucketNum].Picture.LoadFromFile(SourseImgDir);
        end;
    end;
end;

procedure TFrmMain.CreatLiftBucketPreRiseLab(LiftbucketNum : Integer; X,Y : Integer;   //加载提升斗预提升标签
  Width, Height : Integer);
begin
    LabLiftBucketPreRisLab[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketPreRisLab[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketPreRisLab[LiftbucketNum].Left := x;
    LabLiftBucketPreRisLab[LiftbucketNum].Top  := y ;
    LabLiftBucketPreRisLab[LiftbucketNum].Caption := '预提升';
    LabLiftBucketPreRisLab[LiftbucketNum].Visible := True;;
end;

Procedure TFrmMain.CreatLiftBucketPreRiseTmrLab(LiftbucketNum : Integer; X,Y : Integer;   //加载提升斗预提升计时器
  Width, Height : Integer);
begin
    LabLiftBucketPreRisTmr[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketPreRisTmr[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketPreRisTmr[LiftbucketNum].Left := x;
    LabLiftBucketPreRisTmr[LiftbucketNum].Top  := y ;
    LabLiftBucketPreRisTmr[LiftbucketNum].Caption := '计时器';
    LabLiftBucketPreRisTmr[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.CreatLiftBucketDschLab (LiftbucketNum : Integer; X,Y : Integer;         //加载提升斗卸料标签
  Width, Height : Integer);
begin
    LabLiftBucketDschLab[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketDschLab[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketDschLab[LiftbucketNum].Left := x;
    LabLiftBucketDschLab[LiftbucketNum].Top  := y ;
    LabLiftBucketDschLab[LiftbucketNum].Caption := '卸料计时';
    LabLiftBucketDschLab[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.CreatLiftBucketDschTmrLab(LiftbucketNum : Integer; X,Y : Integer;      //加载提升斗卸料计时器
  Width, Height : Integer);
begin
    LabLiftBucketDschTmr[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketDschTmr[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketDschTmr[LiftbucketNum].Left := x;
    LabLiftBucketDschTmr[LiftbucketNum].Top  := y ;
    LabLiftBucketDschTmr[LiftbucketNum].Caption := '计时器';
    LabLiftBucketDschTmr[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.CreatLiftBucketProCountNmLab(LiftbucketNum : Integer; X,Y : Integer;   //加载提升斗生产计数标签
  Width, Height : Integer);
begin
    LabLiftBucketLdCountLab[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketLdCountLab[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketLdCountLab[LiftbucketNum].Left := x;
    LabLiftBucketLdCountLab[LiftbucketNum].Top  := y ;
    LabLiftBucketLdCountLab[LiftbucketNum].Caption := '盘次：';
    LabLiftBucketLdCountLab[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.CreatLiftBucketProCounterLab(LiftbucketNum : Integer; X,Y : Integer;   //加载提升斗生产计数器
  Width, Height : Integer);
begin
    LabLiftBucketLdCounter[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketLdCounter[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketLdCounter[LiftbucketNum].Left := x;
    LabLiftBucketLdCounter[LiftbucketNum].Top  := y ;
    LabLiftBucketLdCounter[LiftbucketNum].Caption := '计时器';
    LabLiftBucketLdCounter[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.LiftBucketGoUpBtnClick(Sender: TObject);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1，左提升斗；2，右提升斗
begin
    Img := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //左提升斗
        begin
            showmessage('左提升斗上升') ;
        end;

        2 :    //右提升斗
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoDnMouseDn(Sender: TObject; Button: TMouseButton; //提升斗下降 按钮 鼠标 按下
  Shift: TShiftState; X, Y: Integer);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1，左提升斗；2，右提升斗
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //左提升斗
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0003 ); ;
        end;

        2 :    //右提升斗
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoDnMouseUp(Sender: TObject; Button: TMouseButton; //提升斗下降 按钮 鼠标 抬起
  Shift: TShiftState; X, Y: Integer);    
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1，左提升斗；2，右提升斗
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //左提升斗
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0004 );    //关闭提升斗下降
        end;

        2 :    //右提升斗
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoDnBtnClick(Sender: TObject);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1，左提升斗；2，右提升斗
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //左提升斗
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0003 ); ;
        end;

        2 :    //右提升斗
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoUpMouseDn(Sender: TObject; Button: TMouseButton;    //提升斗 上升 按钮 鼠标按下
  Shift: TShiftState; X, Y: Integer);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1，左提升斗；2，右提升斗
    WaitWtInstrumentReplyPt : Integer;
begin
    Img    := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //左提升斗
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0001 );   //命令 提升斗 上升
        end;

        2 :    //右提升斗
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoUpMouseUp(Sender: TObject; Button: TMouseButton;    //提升斗 上升 按钮 鼠标抬起
  Shift: TShiftState; X, Y: Integer);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1，左提升斗；2，右提升斗
    WaitWtInstrumentReplyPt : Integer;
begin
    Img    := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //左提升斗
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0002 );   //命令 提升斗 上升
        end;

        2 :    //右提升斗
        begin

        end;
    end;
end;

procedure TFrmMain.LoadAggregateBinImgFromFile(MidBinId : Integer; SourseImgDir : String;    //创建骨料中间仓图片
  X,Y : Integer; Width, Height : Integer);
begin
    ImgAggregateMidBin[MidBinId] := TImage.Create(FrmMain);
    ImgAggregateMidBin[MidBinId].Parent := FrmMain;
    ImgAggregateMidBin[MidBinId].OnContextPopup := AggrHopperOnContextPopup;
    ImgAggregateMidBin[MidBinId].PopupMenu := PMAggregateMidBin;
    ImgAggregateMidBin[MidBinId].Left := X;
    ImgAggregateMidBin[MidBinId].Top := Y ;
    ImgAggregateMidBin[MidBinId].Width := Width;
    ImgAggregateMidBin[MidBinId].Height := Height;
    ImgAggregateMidBin[MidBinId].Tag := MidBinId;
    ImgAggregateMidBin[MidBinId].Picture.LoadFromFile(SourseImgDir);  //}
end;

procedure TFrmMain.LoadAggregateBinFullImgFromFile(MidBinId : Integer; SourseImgDir : String;    //创建骨料中间仓满标识图片
  X,Y : Integer; Width, Height : Integer);
begin
    ImgMidBinFull[MidBinId] := TImage.Create(FrmMain);
    ImgMidBinFull[MidBinId].Parent := FrmMain;
    ImgMidBinFull[MidBinId].AutoSize := True;
    ImgMidBinFull[MidBinId].Picture.LoadFromFile(SourseImgDir);
    ImgMidBinFull[MidBinId].Top  := ImgAggregateMidBin[MidBinId].Top;
    ImgMidBinFull[MidBinId].Left := ImgAggregateMidBin[MidBinId].Left ;

    MidBinIsFull[MidBinId] := True;
end;

procedure TFrmMain.AggrHopperOnContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
    Img : TImage;    
begin
     Img := TImage(Sender);
     PMAggrHopperId := Img.Tag;
end;

procedure TFrmMain.LoadAggrMidStorDschValveImg(MidBinId : Integer;              //装载骨料中间仓卸料阀
  SourseImgDir : String; X,Y : Integer);
begin
    ImgAggrMidBinDschValve[MidBinId] := TImage.Create(FrmMain);
    ImgAggrMidBinDschValve[MidBinId].Parent := FrmMain;
    ImgAggrMidBinDschValve[MidBinId].Left := X;
    ImgAggrMidBinDschValve[MidBinId].Top  := Y;
    ImgAggrMidBinDschValve[MidBinId].Tag := MidBinId;
    ImgAggrMidBinDschValve[MidBinId].AutoSize := True;
    ImgAggrMidBinDschValve[MidBinId].Cursor := crHandPoint;
    ImgAggrMidBinDschValve[MidBinId].Picture.LoadFromFile(SourseImgDir);  //}
    ImgAggrMidBinDschValve[MidBinId].OnClick := AggrMdHopperDschValveImgClick;
end;

procedure TFrmMain.AggrMdHopperDschValveImgClick(Sender : TObject);
var
    Img : TImage;
    MidBinId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    MidBinId := Img.Tag;

    case MidBinId of
        1:    //1#骨料中间仓
        begin
            if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then     //中间仓卸料阀 有效
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0002 ); //关闭中间仓 卸料阀
            end
            else                                                      //中间仓卸料阀 无效
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0001 ); //打开中间仓 卸料阀
            end;
        end ;

        2:    //2#骨料中间仓
        begin

        end;
    end;
end;

procedure TFrmMain.DSpAggrMidHopperDschValveImgNewState(MidBinId : Integer;     //显示骨料中间仓卸料阀图片 新状态
  NewDschValueState : Integer);
begin
    case NewDschValueState of
        CntMdHopDshValImgIsInvalie :    //中间斗卸料阀状态 为 无效
        begin
            ImgAggrMidBinDschValve[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\DschValveClose.png');
            AggrMidHopperDschValveImgState[MidBinId] := CntMdHopDshValImgIsInvalie;
        end;

        CntMdHopDshValImgIsValid   :    //中间斗卸料阀状态 无 有效
        begin
            ImgAggrMidBinDschValve[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\DschValveOpen.png');
            AggrMidHopperDschValveImgState[MidBinId] := CntMdHopDshValImgIsValid;
        end;
    end;
end;

procedure TFrmMain.LoadAggrMidStorOpenLmtImg(MidBinId : Integer; SourseImgDir : String;    //装载中间仓开门限位
  X,Y : Integer );
begin
    ImgAggrMidBinOpenLmt[MidBinId] := TImage.Create(FrmMain);     //骨料中间仓开门限位
    ImgAggrMidBinOpenLmt[MidBinId].Parent := FrmMain;
    ImgAggrMidBinOpenLmt[MidBinId].Left := X;
    ImgAggrMidBinOpenLmt[MidBinId].Top  := Y;
    ImgAggrMidBinOpenLmt[MidBinId].Tag := MidBinId;
    ImgAggrMidBinOpenLmt[MidBinId].AutoSize := True;
    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile(SourseImgDir);  //}
end;

procedure TFrmMain.LoadAggrMidStorCloseLmtImg(MidBinId : Integer; SourseImgDir : String;    //装载中间仓关门限位
  X,Y : Integer );
begin
    ImgAggrMIdBinCloseLmt[MidBinId] := TImage.Create(FrmMain);     //骨料中间仓关门限位
    ImgAggrMIdBinCloseLmt[MidBinId].Parent := FrmMain;
    ImgAggrMIdBinCloseLmt[MidBinId].Left := X;
    ImgAggrMIdBinCloseLmt[MidBinId].Top  := Y;
    ImgAggrMIdBinCloseLmt[MidBinId].Tag := MidBinId;
    ImgAggrMIdBinCloseLmt[MidBinId].AutoSize := True;
    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile(SourseImgDir);  //}
end;

procedure TFrmMain.DspAggrMidBinDschValvLmtImgNewState(MidBinId : Integer;      //更新中间斗卸料阀 限位 图片状态
  DschValveLmtNm : Integer; LmtImgNewState : Integer);
begin
    case DschValveLmtNm of
        CtMdHopDschValLmtIsClose :       //中间斗卸料门 限位是 关限
        begin
            case LmtImgNewState of
                CtMdHopDschValLmtImgIsInvalid :  //中间斗卸料门 限位图片 无效
                begin
                    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveLmtInValid.png');
                    AggrMdHopperDschValClLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsInvalid;
                end;

                CtMdHopDschValLmtImgIsValid   :  //中间斗卸料门 关限位图片 有效
                begin
                    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveCloLmtValid.gif');
                    AggrMdHopperDschValClLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsValid;
                end;

                CtMdHopDschValLmtImgIsInvSpl  :  //中间斗卸料门 限位图片 无效闪烁
                begin
                    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveLmtInValidFlash.gif');
                    AggrMdHopperDschValClLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsInvSpl;
                end;

                CtMdHopDschValLmtImgIsValSpl  :  //中间斗卸料门 限位图片 有效闪烁
                begin
                    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidbinDschValveLmtValidFlash.gif');
                    AggrMdHopperDschValClLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsValSpl;
                end;
            end; 
        end;

        CtMdHopDschValLmtIsOpen  :       //中间斗卸料门 限位是 开限
        begin
            case LmtImgNewState of
                CtMdHopDschValLmtImgIsInvalid :  //中间斗卸料门 限位图片 无效
                begin
                    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveLmtInValid.png');
                    AggrMdHopperDschValOpLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsInvalid;
                end;

                CtMdHopDschValLmtImgIsValid   :  //中间斗卸料门 限位图片 有效
                begin
                    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveOpLmtValid.png');
                    AggrMdHopperDschValOpLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsValid;
                end;

                CtMdHopDschValLmtImgIsInvSpl  :  //中间斗卸料门 限位图片 无效闪烁
                begin
                    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveLmtInValidFlash.gif');
                    AggrMdHopperDschValOpLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsInvSpl;
                end;

                CtMdHopDschValLmtImgIsValSpl  :  //中间斗卸料门 限位图片 有效闪烁
                begin
                    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidbinDschValveLmtValidFlash.gif');
                    AggrMdHopperDschValOpLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsValSpl;
                end;
            end;
        end;
    end;
end;

procedure TFrmMain.LoadAggrMidStorVibraImg(MidBinId : Integer; SourseImgDir : String;    //装载中间仓振动器
  X,Y : Integer );
begin
    ImgAggrMidBinVibra[MidBinId] := TImage.Create(FrmMain);     //骨料中间仓振动器
    ImgAggrMidBinVibra[MidBinId].Parent := FrmMain;
    ImgAggrMidBinVibra[MidBinId].Left := X;
    ImgAggrMidBinVibra[MidBinId].Top  := Y;
    ImgAggrMidBinVibra[MidBinId].Tag := MidBinId;
    ImgAggrMidBinVibra[MidBinId].AutoSize := True;
    ImgAggrMidBinVibra[MidBinId].Picture.LoadFromFile(SourseImgDir);
    ImgAggrMidBinVibra[MidBinId].Cursor := crHandPoint;
    ImgAggrMidBinVibra[MidBinId].OnClick := AggrMidBinDschVibraImgClick; //}
end;

procedure TFrmMain.AggrMidBinDschVibraImgClick(Sender : TObject);
var
    Img : TImage;
    MidBin : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    MidBin := Img.Tag;

    case MIdBin of
        1:    //1#中间仓振动器
        begin
            if AggrMidHopperStateInInstru and (1 shl 9) <> 0 then    //中间斗卸料振动器 输出 有效
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $000A);    //关闭振动器
            end
            else
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0009);    //打开振动器
            end;
        end;
    end;
end;

procedure TFrmMain.DspAggrMidBInDschVibraImgNewState(MidBinId : Integer;        //更新骨料中间仓卸料振动器图片状态
  NewVibraImgState : Integer);
begin
    case NewVibraImgState of
        CntMdHopDshVibraImgIsInvalie :    //中间斗卸料 振动器图片 无效状态
        begin
            ImgAggrMidBinVibra[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinVibratorInvalid.png');
            AggrMidHopperDschVibraImgState[MidBinId] := CntMdHopDshVibraImgIsInvalie ;
        end;

        CntMdHopDshVibraImgIsValid   :    //中间斗卸料 振动器图片 有效状态
        begin
            ImgAggrMidBinVibra[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinVibratorValid.png');
            AggrMidHopperDschVibraImgState[MidBinId] := CntMdHopDshVibraImgIsValid;
        end;
    end;
end;

procedure TFrmMain.LoadAggrMidBinDschTmrLab(MidBinId : Integer; X,Y : Integer);    //加载中间仓卸料计时器标签
begin
    LabAggrMidBinDschTmr[MidBinId] := TLabel.Create(FrmMain);
    LabAggrMidBinDschTmr[MidBinId].Parent := FrmMain;
    LabAggrMidBinDschTmr[MidBinId].Left := X;
    LabAggrMidBinDschTmr[MidBinId].Top := Y;
    LabAggrMidBinDschTmr[MidBinId].Font.Size := 14;
    LabAggrMidBinDschTmr[MidBinId].Font.Style := [fsBold];
    LabAggrMidBinDschTmr[MidBinId].AutoSize := True;
    LabAggrMidBinDschTmr[MidBinId].Alignment := taLeftJustify;
    LabAggrMidBinDschTmr[MidBinId].Caption := '0';
end;

procedure TFrmMain.LoadMidBinLoadCounterLab(MidBinId : Integer; X,Y : Integer);    //加载中间仓装载盘次
begin
    LabAggrMIdBinLdCounter[MidBinId] := TLabel.Create(FrmMain);
    LabAggrMIdBinLdCounter[MidBinId].Parent := FrmMain;
    LabAggrMIdBinLdCounter[MidBinId].Left := X;
    LabAggrMIdBinLdCounter[MidBinId].Top := Y;
    LabAggrMIdBinLdCounter[MidBinId].Font.Size := 12;
    LabAggrMIdBinLdCounter[MidBinId].Font.Style := [fsBold];
    LabAggrMIdBinLdCounter[MidBinId].AutoSize := True;
    LabAggrMIdBinLdCounter[MidBinId].Alignment := taLeftJustify;
    LabAggrMIdBinLdCounter[MidBinId].Caption := '0';
end;

procedure TFrmMain.LoadAggrLiftBucketImg(BucketNum : Integer; SourseImgDir : String;    //加载提升斗图片
  X,Y : Integer );
begin
    ImgLiftBucket[BucketNum] := TImage.Create(FrmMain);
    ImgLiftBucket[BucketNum].Parent   := FrmMain;
    ImgLiftBucket[BucketNum].Left     := X;
    ImgLiftBucket[BucketNum].Top      := Y;
    ImgLiftBucket[BucketNum].Tag      := BucketNum;
    ImgLiftBucket[BucketNum].AutoSize := True;
    ImgLiftBucket[BucketNum].Picture.LoadFromFile( SourseImgDir );
    ImgLiftBucket[BucketNum].Cursor   := crDrag;
    ImgLiftBucket[BucketNum].PopupMenu:= PMAggregateMidBin;
    ImgLiftBucket[BucketNum].OnContextPopup := AggrHopperOnContextPopup;
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]

end;

procedure TFrmMain.StorageContexPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
    Img : TImage ;
begin
    Img := Timage(Sender);
    PMStorageId := Img.Tag;

    //if StorageInfo[PMStorageId].StockDsp then
    //    RMAddMater.Visible := True
    //else
        RMAddMater.Visible := False;
end;

procedure TfrmMain.CreateMixerImg(MixerID : Integer; SourseImgDir : String;    //创建搅拌机图片
    X,Y : Integer; Width, Height : Integer);
begin
    ImgMixer[MixerID] := TImage.Create(FrmMain);
    ImgMixer[MixerID].Parent := FrmMain;
    ImgMixer[MixerID].PopupMenu := PMMixer ;
    ImgMixer[MixerID].Left := X;
    ImgMixer[MixerID].Top := Y;
    //ImgMixer[ImgNo].Width := Width;
    //ImgMixer[ImgNo].Height := Height;
    ImgMixer[MixerID].Tag := MixerID;
    ImgMixer[MixerID].AutoSize := True;
    ImgMixer[MixerID].Picture.LoadFromFile(SourseImgDir);  //}
end;

procedure TFrmMain.DspMixerFlashNewState(MixerId : Integer; MewState : Integer);    //搅拌机动画更新
begin
    case MewState of
        CtMxrFlashStIsEmptyStop :    //搅拌机动画 空停
        begin
            ImgMixer[MixerID].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Blender1.png');
            MixerFalshState[MixerId] := CtMxrFlashStIsEmptyStop ;
        end;

        CtMxrFlashStIsFullStop  :    //搅拌机动画 满停
        begin
            ImgMixer[MixerID].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Blender3.png');
            MixerFalshState[MixerId] := CtMxrFlashStIsFullStop ;                                                           
        end;

        CtMxrFlashStIsEmptyRun  :    //搅拌机动画 空运行
        begin
            ImgMixer[MixerID].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\BlenderEmptyRun.gif');
            MixerFalshState[MixerId] := CtMxrFlashStIsEmptyRun ;
        end;

        CtMxrFlashStIsFullRun   :    //搅拌机动画 满运行
        begin
            ImgMixer[MixerID].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\BlenderFullRun.gif');
            MixerFalshState[MixerId] := CtMxrFlashStIsFullRun ;
        end;
    end;
end;

procedure TfrmMain.CreateMixerDschDoor(MixerId : Integer; SourseImgDir : String;    //创建搅拌机卸料门图片
  X,Y : Integer; Width, Height : Integer);
begin
    ImgMixerDschDoor[MixerId] := TImage.Create(FrmMain);
    ImgMixerDschDoor[MixerId].Parent := FrmMain ;
    ImgMixerDschDoor[MixerId].Left := X;
    ImgMixerDschDoor[MixerId].Top := Y;
    //ImgMixerDschDoor[MixerId].Width := width;
    //ImgMixerDschDoor[MixerId].Height := Height;
    ImgMixerDschDoor[MixerId].AutoSize := True;
    ImgMixerDschDoor[MixerId].Picture.LoadFromFile(SourseImgDir);
    {      //搅拌机卸料门关闭


    ImgMixerDschDoor[2] := TImage.Create(FrmMain);
    ImgMixerDschDoor[2].Parent := FrmMain;
    ImgMixerDschDoor[2].Left := X;
    ImgMixerDschDoor[2].Top := Y;
    ImgMixerDschDoor[2].Width := Width;
    ImgMixerDschDoor[2].Height := Height;
    ImgMixerDschDoor[1].Picture.LoadFromFile(SourseImgDir + '\Half.png');      //搅拌机卸料门半开

    ImgMixerDschDoor[3] := TImage.Create(FrmMain);
    ImgMixerDschDoor[3].Parent := FrmMain;
    ImgMixerDschDoor[3].Left := X;
    ImgMixerDschDoor[3].Top := Y;
    ImgMixerDschDoor[3].Width := Width;
    ImgMixerDschDoor[3].Height := Height;
    ImgMixerDschDoor[3].Picture.LoadFromFile(SourseImgDir + '\Open.png');      //搅拌机卸料门全开 //}
end;

procedure TFrmMain.DspMixerDschValveImgNewState(MixerId : Integer; NewState : Integer);     //搅拌机卸料阀图片状态
begin
    case NewState of
        CtMxrDschValStIsOpen     :    //搅拌机卸料门 状态  开
        begin
            ImgMixerDschDoor[MixerId].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Open.png');
            MixerDschValveImgState[MixerId] := CtMxrDschValStIsOpen ;
        end;

        CtMxrDschValStIsClose    :    //搅拌机卸料门 状态  关
        begin
            ImgMixerDschDoor[MixerId].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Close.png');
            MixerDschValveImgState[MixerId] := CtMxrDschValStIsClose;
        end;

        CtMxrDschValStIsHalfOpen :    //搅拌机卸料门 状态  半开
        begin
            ImgMixerDschDoor[MixerId].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Half.png');
            MixerDschValveImgState[MixerId] := CtMxrDschValStIsHalfOpen;
        end;

        CtMxrDschValStIsAlarm    :    //搅拌机卸料门 状态   报警
        begin
            ImgMixerDschDoor[MixerId].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\OpenAlarm.png');
            MixerDschValveImgState[MixerId] := CtMxrDschValStIsAlarm;
        end;
    end;
end;

procedure TFrmMain.DSpBtnMixerDschValveOPenNewState(MixerId : Integer; NewState : Integer);
begin
    case NewState of
        CtBtnMxrDschValveOpStIsValid   :    //搅拌机卸料门 开门按钮状态 为 有效
        begin
            cxBtnMixerDischOPen.Color := clLime;

            BtnMxrDschValveOpState[1] := CtBtnMxrDschValveOpStIsValid;
        end;

        CtBtnMxrDschValveOpStIsInvalid :    //搅拌机卸料门 开门按钮状态 为 无效
        begin
            cxBtnMixerDischOPen.Color := clBtnFace;
            
            BtnMxrDschValveOpState[1] := CtBtnMxrDschValveOpStIsInvalid;
        end;
    end;
end;

procedure TFrmMain.DspBtnMixerDschValveCloseNewState(MixerId : Integer; NewState : Integer);
begin
    case NewState of
        CtBtnMxrDschValveClStIsValid   :    //搅拌机卸料门 关门按钮状态 为 有效
        begin
            cxBtnMixerDischClose.Color := clLime;

            BtnMxrDschValveClState[1] := CtBtnMxrDschValveClStIsValid;
        end;

        CtBtnMxrDschValveClStIsInvalid :    //搅拌机卸料门 关门按钮状态 为 无效
        begin
            cxBtnMixerDischClose.Color := clBtnFace;

            BtnMxrDschValveClState[1] := CtBtnMxrDschValveClStIsInvalid;
        end;
    end;
end;

procedure TFrmMain.LoadMixerDschTmrLab(MixerId : Integer; X,Y : Integer);       //加载搅拌机卸料计时器标签
begin
    LabMixerDschTmr[MixerId] := TLabel.Create(FrmMain);
    LabMixerDschTmr[MixerId].Parent := FrmMain;
    LabMixerDschTmr[MixerId].Left := X;
    LabMixerDschTmr[MixerId].Top := Y;
    LabMixerDschTmr[MixerId].Font.Size := 14;
    LabMixerDschTmr[MixerId].AutoSize := True;
    LabMixerDschTmr[MixerId].Alignment := taLeftJustify;
    LabMixerDschTmr[MixerId].Caption := '0';
end;

procedure TFrmMain.LoadMixerProdCounterLab(MixerId : Integer; X,Y : Integer);   //加载搅拌机生产计数器标签
begin
    LabMixerProdCounter[MixerId] := TLabel.Create(FrmMain);     //搅拌机卸料计时器标签
    LabMixerProdCounter[MixerId].Parent := FrmMain;
    LabMixerProdCounter[MixerId].Left := X;
    LabMixerProdCounter[MixerId].Top := Y;
    LabMixerProdCounter[MixerId].Font.Size := 12;
    LabMixerProdCounter[MixerId].AutoSize := True;
    LabMixerProdCounter[MixerId].Alignment := taLeftJustify;
    LabMixerProdCounter[MixerId].Caption := '0';
end;

procedure TFrmMain.CreatBellImg( X,Y : Integer;   //加载电铃
  Width, Height : Integer);
begin
    ImgBell := TBellImg.Create(FrmMain)  ;       //电铃图片
    ImgBell.Parent := FrmMain;
    ImgBell.Left := X;
    ImgBell.Top  := Y;
    ImgBell.AutoSize := True;
    ImgBell.Picture.LoadFromFile( AppPath + '\Images\Equips\Bell\Bell.png');
    ImgBell.Cursor := crHandPoint;
    ImgBellState := ImgBeltStateIsUnRing;
    ImgBell.OnMouseDown := ImgBellMouseDn;
    ImgBell.OnMouseUp   := ImgBellMouseUp;
end;

procedure TFrmMain.ImgBellMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if ( mouseEnterBellImg ) then
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $000C );   //电铃 开
        ImgBellState := ImgBeltStateIsUnRing ;     //电铃图片非响状态
        ImgBell.Picture.LoadFromFile( AppPath + '\Images\Equips\Bell\Bell.png' );
    end;
end;

procedure TFrmMain.ImgBellMouseDn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    //Showmessage(inttostr(x) + ',' + inttostr(y));
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $000B );   //电铃 开
    ImgBellState := IMgBeltStateIsRing ;     //电铃图片响状态
    ImgBell.Picture.LoadFromFile( AppPath + '\Images\Equips\Bell\Ring.png' );
end;
//------------------------------------------------------------------------------

//---------------------------初始化复选框---------------------------------------
//procedure TFrmMain.IniCheckerForControlPanel(CheckNm : String; X,Y : Integer;
//  Width, Height : Integer; Check : Boolean);
//var
//    CheckB : TRZCheckBox;
//begin
    {CheckB := TRZCheckBox(FindComponent(CheckNm));
    try
        CheckB.Left := X;
        CheckB.Top := Y;
        //CheckB.Width := Width;
        //CheckB.Height := Height;
        CheckB.Checked := Check;
    except
        Showmessage('无效的复选框：' + CheckNm);
    end; //}
//end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
procedure TFrmMain.UpdataBitBtnGlyph(BtnName : String; Check : Boolean);
var
    Btn : TcxButton;
begin
    Btn := TcxButton(FindComponent(BtnName));
    if Check then
        ImageList1.GetBitmap(1, Btn.Glyph)
    else
        ImageList1.GetBitmap(0, Btn.Glyph);
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
procedure TFrmMain.Instruction1MscommTmrTimer(Sender: TObject);
//var

    //i : Integer ;
    //ReceiveByte : array of Byte ;
    //ReceiveByteCount : Integer ;
begin
    Instruction1MscommTmr.Enabled := False ;

    case Instruction1MscommState of
        CntInstruction1MscommIdle :    //空闲
        begin
            WtInstrument1MscommOutputBuf();    //写通讯发送Buf
        end;

        CntInstruction1MscommWaitPly :    //等待回复
        begin
            Instruction1MscommLong := Instruction1MscommLong +20;    //通讯计时
        end;

        CntInstruction1MscommReceiving :    //接收中
        begin
            Instruction1MscommLong := Instruction1MscommLong + 20;    //通讯耗时计时器
        end;

    end;

    if (Instruction1MscommLong > 500) and (Instruction1MscommState <> CntInstruction1MscommIdle) then    //通讯超时
    begin
        if Instru1MscommFails < 10 then inc(Instru1MscommFails);

        if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
        begin
            Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
            Instruction1SendBufRdPtInc();
        end;
        Instruction1MscommState := CntInstruction1MscommIdle;    //通讯状态
        //sStatusBar1.Panels[2].Text := '状态： 故障!';
    end
    else
    begin
        //sStatusBar1.Panels[2].Text := '状态： 正常!';
    end;

    Instruction1MscommTmr.Enabled := True ;
end;

procedure TFrmMain.WtInstrument1MscommOutputBuf();    //写通讯发送Buf
var
    SendBinaryData : array of byte ;
    i : integer;
begin
    if (Instruction1SendBuf[Instruction1SendBufRdPt].Active) and
       ((SoftRunState = CntSoftIniInstrumentState) or (Instruction1MscommCommandType <> CntInstruction1MscommRandCmd))
      then    //发送缓冲区非空
    begin
        SetLength(SendBinaryData, Instruction1SendBuf[Instruction1SendBufRdPt].SendByteCounter);
        for i:=0 to Instruction1SendBuf[Instruction1SendBufRdPt].SendByteCounter -1 do
        begin
            SendBinaryData[i] := Instruction1SendBuf[Instruction1SendBufRdPt].SendByte[i];
        end;
        
        if Instruction1MscommOpen then
        begin
            Instruction1MSComm.InBufferCount := 0;       //清空接收缓冲区
            //Instruction1MSComm.OutBufferCount := 0;      //清空发送缓冲区
            Instruction1MSComm.RThreshold := 5;

            Instruction1MSComm.Output := SendBinaryData;
        end;

        Instruction1MscommLong := 0;    //清零通讯计时器
        Instruction1ReceiveBytePt := 0;
        Instruction1ReceivePt := Instruction1SendBufRdPt ;
        Instruction1MscommState := CntInstruction1MscommWaitPly ;
        Instruction1MscommCommandType := CntInstruction1MscommRandCmd;
    end
    else
    begin
        if ( SoftRunState = CntSoftRuningState ) then
        begin
            SetLength(SendBinaryData, 8);

            LoopMscomCommandPt := LoopMscomCommandPt +1;
            if LoopMscomCommandPt >= CntLoopMscomCommandCount then LoopMscomCommandPt := 0;

            for i:=0 to 7 do
            begin
                SendBinaryData[i] := LoopMscommCommand[LoopMscomCommandPt][i];
            end;

            {SendBinaryData[0] := $0A;    SendBinaryData[1] := $03;
            SendBinaryData[2] := $00;    SendBinaryData[3] := $00;
            SendBinaryData[4] := $00;    SendBinaryData[5] := $30;
            ModbusCRCCheck(SendBinaryData, 6) ;  }

            if Instruction1MscommOpen then
            begin
                Instruction1MSComm.InBufferCount := 0;       //清空接收缓冲区
                //Instruction1MSComm.OutBufferCount := 0;      //清空发送缓冲区
                Instruction1MSComm.RThreshold := 5;

                Instruction1MSComm.Output := SendBinaryData;
            end;

            Instruction1MscommLong        := 0;    //清零通讯计时器
            Instruction1ReceiveBytePt     := 0;
            Instruction1ReceivePt         := Instruction1SendBufRdPt ;
            Instruction1MscommCommandType := CntInstruction1MscommLoopCmd;
            Instruction1MscommState       := CntInstruction1MscommWaitPly ;   
        end
        else
        begin

            Instruction1MscommState := CntInstruction1MscommIdle ;
        end;
    end;
end;

procedure TFrmMain.Instruction1MscommReceiveProg();    //通讯接收处;
var
    HiCRCByte ,
    LoCRCByte : Byte ;
    i : integer ;
begin
    {CRC校验}
    if (Instruction1ReceiveBytePt >= 4) and (Instruction1ReceiveBytePt < CntInstruction1ReceiveByteLen ) then     //有效的接收数据
    begin
        HiCRCByte := Instruction1ReceiveByte[Instruction1ReceiveBytePt -1 -1];
        LoCRCByte := Instruction1ReceiveByte[Instruction1ReceiveBytePt -1];
        ModbusCRCCheck(Instruction1ReceiveByte, Instruction1ReceiveBytePt-2);
        if (HiCRCByte = Instruction1ReceiveByte[Instruction1ReceiveBytePt -1 -1]) and (LoCRCByte = Instruction1ReceiveByte[Instruction1ReceiveBytePt -1]) then    //校验成功
        begin
            case Instruction1MscommCommandType of    //通讯命令类型
                CntInstruction1MscommLoopCmd :    //循环命令
                begin
                    case LoopMscomCommandPt of
                        0:    //起始地址=$0000
                        begin
                            //称值，称状态
                            for i:=1 to WeigherCount do
                            begin
                                if 3+ (i-1) *2 +1 >= Instruction1ReceiveBytePt -1 -1 then break;
                                WeigherValueI[i] := Instruction1ReceiveByte[3+ (i-1) *2] *256 + Instruction1ReceiveByte[3+ (i-1) *2 +1];
                                WeigherStateInInstru[i] := Instruction1ReceiveByte[3+ $0010*2 + (i-1) *2] *256 + Instruction1ReceiveByte[3+ $0010*2 + (i-1) *2 +1];
                            end;

                            //搅拌机状态
                            if (Instruction1ReceiveBytePt -1 -1) >= $0020 *2 +1 then
                                MixerStateInInstru := Instruction1ReceiveByte[3+ $0020 *2] *256 + Instruction1ReceiveByte[3+ $0020 *2 +1];

                            //骨料中间仓状态
                            AggrMidHopperStateInInstru := Instruction1ReceiveByte[3+ $0021 *2] *256 + Instruction1ReceiveByte[3+ $0021 *2 +1];
                            //下位机工作状态
                            InstrumentState := Instruction1ReceiveByte[3+ $0024 *2] *256 + Instruction1ReceiveByte[3+ $0024 *2 +1];
                            WgherLoadEnableInInstrument := Instruction1ReceiveByte[3+ $0025 *2] *256 + Instruction1ReceiveByte[3+ $0025 *2 +1];
                            //斜皮带状态
                            if (Instruction1ReceiveBytePt -1 -1) >= $002D *2 + 1 then
                                ConveryBeltStateInInstru := Instruction1ReceiveByte[3+ $002D *2] *256 + Instruction1ReceiveByte[3+ $002D *2 +1];

                            {Label99.Caption := '';
                            Label67.Caption := '';
                            Label31.Caption := '';
                            for i:= $00 to $0F do
                            begin
                                Label99.Caption := Label99.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $00) *2] *256 + Instruction1ReceiveByte[3+ (i + $00) *2 +1], 4 ) + ' ';
                                Label67.Caption := Label67.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $10) *2] *256 + Instruction1ReceiveByte[3+ (i + $10) *2 +1], 4 ) + ' ';
                                Label31.Caption := Label31.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $20) *2] *256 + Instruction1ReceiveByte[3+ (i + $20) *2 +1], 4 ) + ' ';
                            end;    //}
                        end;

                        1:    //起始地址=$0030
                        begin
                            for i:=1 to WeigherCount do
                            begin
                                WeigherLoadCounterInInstu[i] := Instruction1ReceiveByte[3+ (i-1) *2] *256 + Instruction1ReceiveByte[3+ (i-1) *2 +1];
                            end;
                            //搅拌机生产盘数计数器
                            MixerProdCounterInInstru  := Instruction1ReceiveByte[3+ ($0040-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0040-$0030) *2 +1];    //0040H
                            //0041H 搅拌机搅拌计时器
                            MixerMixingTmrInInstu := Instruction1ReceiveByte[3+ ($0041-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0041-$0030) *2 +1];
                            //0042H 搅拌机卸料计时器
                            MixerDschTmrInInstru  := Instruction1ReceiveByte[3+ ($0042-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0042-$0030) *2 +1];
                            //中间仓生产盘数计数器
                            AggrLoadCounterInInstru   := Instruction1ReceiveByte[3+ ($0043-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0043-$0030) *2 +1];    //0043H
                            //下位机中的骨料输送计时器 ——骨料斜皮带输送持续时间 / 提升斗提升延迟时间
                            AggrConveyTmrInInstrument := Instruction1ReceiveByte[3+ ($0044-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0044-$0030) *2 +1];      //0044H
                            //下位机中骨料中间仓投料时间计时器
                            AggrMidBinDschTmrInInstru := Instruction1ReceiveByte[3+ ($0045-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0045-$0030) *2 +1];      //0045H

                            {Label32.Caption := '';
                            Label33.Caption := '';
                            Label34.Caption := '';

                            for i:=0 to $0F do
                            begin
                                Label32.Caption := Label32.Caption + inttohex(Instruction1ReceiveByte[3+ i *2] *256 + Instruction1ReceiveByte[3+ i *2 +1], 4 ) + ' ';
                                Label33.Caption := Label33.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $10) *2] *256 + Instruction1ReceiveByte[3+ (i + $10) *2 +1], 4 ) + ' ';
                                Label34.Caption := Label34.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $20) *2] *256 + Instruction1ReceiveByte[3+ (i + $20) *2 +1], 4 ) + ' ';
                            end;    //}
                        end;

                        2:    //起始地址=$070F
                        begin
                            AutoRingState := Instruction1ReceiveByte[3+ $01 *2] *256 + Instruction1ReceiveByte[3+ $01 *2 +1];

                            {Label36.Caption := '';
                            for i:= 0 to $0B do
                            begin
                                Label36.Caption := Label36.Caption + inttohex(Instruction1ReceiveByte[3+ i *2] *256 + Instruction1ReceiveByte[3+ i *2 +1], 4 ) + ' ';
                            end;    //}
                        end;
                    end;
                end;

                CntInstruction1MscommRandCmd :    //随机命令
                begin
                    case Instruction1ReceiveByte[0] of

                        $0A :
                        begin
                            Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveCmd := Instruction1ReceiveByte[1] ;    //命令代码

                            //if ((Instruction1ReceiveByte[2] = $07) and (Instruction1ReceiveByte[3] = $92)) then
                              //Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveCmd := Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveCmd or $80;
                            //  Showmessage('罗擦');

                            for i:=0 to Instruction1ReceiveByte[2] -1 do
                            begin
                                if i >= CntInstruction1MscommBufLen then break;
                                Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveByte[i] := Instruction1ReceiveByte[3 +i];    //数据
                            end;
                            Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveByteCount := Instruction1ReceiveByte[2];    //字节数量

                            //if not ( (Instruction1ReceiveByte[2] = $0A) and (Instruction1ReceiveByte[3] = $40) ) then
                            Instruction1ReceiveBuf[Instruction1ReceivePt].Active := True ;
                        end;
                    end;
                end;
            end;

            if Instru1MscommFails > 0 then dec(Instru1MscommFails);
        end
        else    //CRC校验失败
        begin
            if Instru1MscommFails < 10 then Inc(Instru1MscommFails);
        end;
    end
    else
    begin    //无效的接收数据
        if Instru1MscommFails < 10 then inc(Instru1MscommFails);
    end;
end;

procedure TFrmMain.Instruction1MSCommComm(Sender: TObject);
var
    ReceiveByte : array of byte ;
    ReceiveByteCount : Integer ;
    RemainReceiveByteCount : Integer ;
    ReceiveDataByteCount : Integer;
    ReceiveByteCountPlan : Integer;
    i : integer;
begin
    ReceiveByteCount := Instruction1MSComm.InBufferCount;
    if ReceiveByteCount > 0 then
    begin
        ReceiveByte := Instruction1MSComm.Input;
        
        for i:=0 to ReceiveByteCount -1 do
        begin
            Instruction1ReceiveByte[Instruction1ReceiveBytePt] := ReceiveByte[i];
            Instruction1ReceiveBytePt := Instruction1ReceiveBytePt +1;
            if Instruction1ReceiveBytePt >= CntInstruction1ReceiveByteLen then Instruction1ReceiveBytePt := 0;
        end;

        case Instruction1MscommState of
            CntInstruction1MscommWaitPly :
            begin
                case ReceiveByte[1] of    //通讯命令类型
                    $03 :
                    begin
                        ReceiveDataByteCount := ReceiveByte[2] ;
                        ReceiveByteCountPlan := 3 + ReceiveDataByteCount + 2;
                        RemainReceiveByteCount := ReceiveByteCountPlan - ReceiveByteCount ;
                        if RemainReceiveByteCount <= 0 then
                        begin
                            if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                            begin
                                Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                                Instruction1SendBufRdPtInc();
                            end;
                            Instruction1MscommReceiveProg();    //通讯接收处理
                            Instruction1MscommState := CntInstruction1MscommIdle;    //通讯状态设置
                        end
                        else
                        begin
                            Instruction1MSComm.RThreshold := RemainReceiveByteCount ;
                            Instruction1MscommState := CntInstruction1MscommReceiving ;
                        end;
                    end;

                    $06 :
                    begin
                        ReceiveByteCountPlan := 8 ;    //命令反馈字节数
                        RemainReceiveByteCount := ReceiveByteCountPlan - ReceiveByteCount ;
                        if RemainReceiveByteCount <= 0 then
                        begin
                            if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                            begin
                                Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                                Instruction1SendBufRdPtInc();
                            end;
                            Instruction1MscommReceiveProg();    //通讯接收处理
                            Instruction1MscommState := CntInstruction1MscommIdle;    //通讯状态设置
                        end
                        else
                        begin
                            Instruction1MSComm.RThreshold := RemainReceiveByteCount ;
                            Instruction1MscommState := CntInstruction1MscommReceiving ;
                        end;
                    end;

                    $10 :
                    begin
                        ReceiveByteCountPlan := 8 ;    //命令反馈字节数
                        RemainReceiveByteCount := ReceiveByteCountPlan - ReceiveByteCount ;
                        if RemainReceiveByteCount <= 0 then
                        begin
                            if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                            begin
                                Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                                Instruction1SendBufRdPtInc();
                            end;
                            Instruction1MscommReceiveProg();    //通讯接收处理
                            Instruction1MscommState := CntInstruction1MscommIdle;    //通讯状态设置
                        end
                        else
                        begin
                            Instruction1MSComm.RThreshold := RemainReceiveByteCount ;
                            Instruction1MscommState := CntInstruction1MscommReceiving ;
                        end;
                    end;

                    $83 ,
                    $86 ,
                    $90 :
                    begin
                        ReceiveByteCountPlan := 8 ;    //命令反馈字节数
                        RemainReceiveByteCount := ReceiveByteCountPlan - ReceiveByteCount ;
                        if RemainReceiveByteCount <= 0 then
                        begin
                            if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                            begin
                                Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                                Instruction1SendBufRdPtInc();
                            end;
                            Instruction1MscommReceiveProg();    //通讯接收处理
                            Instruction1MscommState := CntInstruction1MscommIdle;    //通讯状态设置
                        end
                        else
                        begin
                            Instruction1MSComm.RThreshold := RemainReceiveByteCount ;
                            Instruction1MscommState := CntInstruction1MscommReceiving ;
                        end;
                    end;
                end;
            end;

            CntInstruction1MscommReceiving :
            begin
                if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                begin
                    Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                    Instruction1SendBufRdPtInc();
                end;
                Instruction1MscommReceiveProg();    //通讯接收处理
                Instruction1MscommState := CntInstruction1MscommIdle;;    //通讯状态设置
            end;
        end;
    end;
end;

procedure TFrmMain.ImgMixerContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
    Showmessage('Mixer') ;
end;

procedure TFrmMain.NWeigheStartClick(Sender: TObject);
Var
    MscommReceiveBufPf : Integer;
begin
    WtAWordToInstument1MscommBuf(MscommReceiveBufPf, $0200, $0020 + PMWeigherId -1);              //写一个字到通讯缓冲区
end;

procedure TFrmMain.NWeigherStopClick(Sender: TObject);
Var
    MscommReceiveBufPf : Integer;
begin
    WtAWordToInstument1MscommBuf(MscommReceiveBufPf, $0200, $0030 + PMWeigherId -1);              //写一个字到通讯缓冲区
end;

procedure TFrmMain.NWeigherrDschRemainClick(Sender: TObject);
Var
    MscommReceiveBufPf : Integer;
begin
    if not FrmWeigDschRemainCrt then
    begin
        FrmWeigDschRemain := TFrmWeigDschRemain.Create(Nil);
        FrmWeigDschRemainCrt := True;
    end;
    FrmWeigDschRemain.ShowModal ;
end;

procedure TFrmMain.NWeigherCalZeroClick(Sender: TObject);
Var
    DataValue : array[0..1] of Integer;
begin
    if messagebox(getfocus, pchar('确定要校零点吗？'), '系统询问', MB_YESNO) = idYes then
    begin
        DataValue[0] := PmWeigherId -1;
        DataValue[1] := 0;
        MscommStateInFrmMain := CntMscommCmdIsCalZero ;    //通讯命令是校零
        MscommTmrInFrmMain := 0;
        WtWordSToInstucment1MscommBuf(MscommReceiveBufPfInFrmMain, $0202, DataValue, 2); //写多个数到通讯缓冲区
        TmrMscomStateDsp.Enabled := True;
    end;
end;

procedure TFrmMain.NWeigherCalClick(Sender: TObject);
begin
    if not FrmWeigherCalValueCrt then
    begin
        FrmWeigherCalValue := TFrmWeigherCalValue.Create(Nil);
        FrmWeigherCalValueCrt := True;
    end;
    FrmWeigherCalValue.Caption := WeigherInfo[PmWeigherId].Name + '称值校准' ;
    FrmWeigherCalValue.ShowModal;
end;

procedure TFrmMain.NWeigherParaSetClick(Sender: TObject);
begin
    if not FrmWeigAttrCrt then
    begin
        FrmWeigherAttribute := TFrmWeigherAttribute.Create(Nil);
        FrmWeigAttrCrt := True;
    end;
    FrmWeigherAttribute.ShowModal ;
end;

procedure TFrmMain.RMAddMaterClick(Sender: TObject);
begin
    Showmessage(StorageInfo[PMStorageId].Name + '添料');
end;

procedure TFrmMain.RMStorageReplaceClick(Sender: TObject);
begin
    Showmessage(StorageInfo[PMStorageId].Name + '换仓');
end;

procedure TFrmMain.RMStorageSetClick(Sender: TObject);
begin
    //Showmessage(StorageInfo[PMStorageId].Name + '属性');
    if not FrmStorageAttributeCrt then
    begin
        FrmStorageAttribute    := TFrmStorageAttribute.Create(Nil);
        FrmStorageAttributeCrt := True;
    end;
    FrmStorageAttribute.ShowModal;
end;

procedure TFrmMain.j1Click(Sender: TObject);
begin
    if not FrmBasicSettingCrt then
    begin
        FrmBasicSetting := TFrmBasicSetting.Create(Nil);
        FrmBasicSettingCrt := True;
    end;
    FrmBasicSetting.Show;
end;

procedure TFrmMain.NRecipeClick(Sender: TObject);
begin
    if not FrmRecipeCrt then
    begin
         FrmRecipe := TFrmRecipe.Create(Self);
         FrmRecipeCrt := True;
    end;
    FrmRecipe.Show;
end;

procedure TFrmMain.NProdTaskClick(Sender: TObject);
begin
    if Not FrmTaskCrt then
    begin
        FrmTask := TFrmTask.Create(Nil);
        FrmTaskCrt := True;
    end;
    FrmTask.Show;
end;

procedure TFrmMain.AdvStrGdProdNoticeClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
    ExResult : Integer;
begin
    //非工作状态
    //if ( InstrumentState and $0030 <> $0030 ) then
    if ( InstrumentState and (1 shl 5) ) or ( InstrumentState and (1 shl 4) ) = 0 then 
    begin
        if (ACol=1) and (ARow>0) then
        begin
            AdvStrGdProdNotice.ClearCols(1,1);
            AdvStrGdProdNotice.AddDataImage(1, ARow, 0, haLeft, vaTop);    //标识该派车单被选中

            {显示任务信息}
            DspNoticeInfo(ARow);

            ProdNoticeInfoRdPt := 1;             //生产派车单信息读指针
            ProdNoticeInfoWtPt := 1;             //生产派车单信息写指针

            {任务信息初始化}
            IniProdNoticeInfo(ProdNoticeInfoWtPt);

            {称配料信息初始化}
            IniWeigherLoadInfoForProdStart();

            {配料值信息初始化}
            IniSiloLoadInfo();

            {显示任务信息}
            DspNoticeInfo( ARow );

            {赋值任务信息}
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_Code := Trim(AdvStrGdProdNotice.cells[3, ARow]) ;
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID := StrToInt(Trim(AdvStrGdProdNotice.cells[2, ARow]));

            {获取配比，发送到对应的料仓}
            ExResult := GetProdRecipeToSiloRecipe( ARow );

             {任务分盘}
            if ExResult = 0 then
            begin
                ExResult := TaskBatchsProg( ARow );
            end;

            {配料目标值}
            if ExResult = 0 then
            begin
                ExResult := GetStorageLoadTargetForProdStart();    //启动生产时获取料仓的配料目标值
            end;

            {分盘信息显示}
            DspProdBatchInfoOnFrmMain(ProdNoticeInfoWtPt) ;
        end;
    end;
end;

procedure TFrmMain.DspNoticeInfo(NoticeTabRow : Integer);
var
    NOticeFlowID : String;
begin
    NOticeFlowID := Trim(AdvStrGdProdNotice.cells[0, NoticeTabRow]);

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select'
                        + ' ' + 'A1.ProdRecCode as ProdRecCode'
                        + ',' + 'A1.ProdTaskCode as ProdTaskCode'
                        + ',' + 'A1.Driver as ProdDriver'
                        + ',' + 'A1.ProdTruckCode as ProdTruckCode'
                        + ',' + 'A1.ProdAmount as ProdAmount'
                        + ',' + 'A2.Customer as ProjCustomer'
                        + ',' + 'A2.ProjNm as ProjNm'
                        + ',' + 'A2.CastPart as ProjCastPart'
                        + ',' + 'A2.PlanAmount as ProjPlanAmount'
                        + ',' + 'A2.TolAmount as ProjTolAmount'
                        + ',' + 'A2.TolVehs as ProjTolVehs'
                        + ' ' + 'from'
                        + ' ' + '(ProdNotice A1 LEFT JOIN ProdTask A2 on A1.ProdTaskCode = A2.Code)'
                        + ' ' + 'where A1.ID =' + NOticeFlowID;
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        LbClentInNoticeInfo.Caption    := ADOQuery1.FieldByName('ProjCustomer').AsString;
        LbProdReciInNoticeInfo.Caption := ADOQuery1.FieldByName('ProdRecCode').AsString;
        LbProjInfoInNOticeInfo.Caption := ADOQuery1.FieldByName('ProjNm').AsString
                                        + '/'
                                        + ADOQuery1.FieldByName('ProjCastPart').AsString;
        sCmbBxTruckCodeInNoticeInfo.Text
                                       := ADOQuery1.FieldByName('ProdTruckCode').AsString;
        sCmbBxDriverInNoticeInfo.Text  := ADOQuery1.FieldByName('ProdDriver').AsString;
        LbProdAmountInNoticeInfo.Caption
                                       := ADOQuery1.FieldByName('ProdAmount').AsString;
        LbPlanAmountInNoticeInfo.Caption
                                       := ADOQuery1.FieldByName('ProjPlanAmount').AsString;
        LbTotalAmountInNoticeInfo.Caption
                                       := ADOQuery1.FieldByName('ProjTolAmount').AsString;
        LbTruckContInNoticeInfo.Caption:= ADOQuery1.FieldByName('ProjTolVehs').AsString;
    end;

end;

procedure TFrmMain.AdvStrGdProdNoticeCanClickCell(Sender: TObject; ARow,
  ACol: Integer; var Allow: Boolean);
begin
    if ARow >= 1 then
    begin
        sBtnProdNotice.Caption := '派车修改';
    end
    else
    begin
        AdvStrGdProdNotice.Row := AdvStrGdProdNotice.RowCount -1;
        sBtnProdNotice.Caption := '生产派车';
    end;
end;

procedure TFrmMain.sBtnProdNoticeClick(Sender: TObject);
begin
    FrmProdNotice.ShowModal ;
end;

procedure TFrmMain.DspProdNoticeFromDb();
var
    RdCount : Integer;
    RowPt : Integer;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select A1.ID as FlowID'
                        + ', A1.ProdTaskCode as ProdTaskCode'
                        + ', A1.ProdRecCode as ProdRecCode'
                        + ', A1.ProdTruckCode as TruckCode'
                        + ', A1.ProdAmount as ProdAmount'
                        + ', A2.Customer as Customer'
                        + ', A2.ProjNm as ProjNm'
                        + ', A2.CastPart as CastPart'
                        + ', A2.ConcrStrength as ConcrStrength'
                        + ', A2.ConcrSlump as ConcrSlump'
                        + ', A2.ConcrSeepage as ConcrSeepage'
                        + ', A2.TecReq as TecReq'
                        + ' ' + 'from (ProdNotice A1 LEFT JOIN ProdTask A2 on A1.ProdTaskCode = A2.Code) order by A1.ID';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        RdCount := ADOQuery1.RecordCount;
        RdCount := RdCount + 1;

        RowPt := 1;
        while not ADOQuery1.Eof do
        begin
            AdvStrGdProdNotice.cells[0, RowPt] := ADOQuery1.FieldByName('FlowID').AsString;
            AdvStrGdProdNotice.cells[2, RowPt] := ADOQuery1.FieldByName('FlowID').AsString;    //'流水号';
            AdvStrGdProdNotice.cells[3, RowPt] := ADOQuery1.FieldByName('ProdTaskCode').AsString;    //任务单编号';
            AdvStrGdProdNotice.cells[4, RowPt] := ADOQuery1.FieldByName('ProdRecCode').AsString;  //'生产配比';
            AdvStrGdProdNotice.cells[5, RowPt] := ADOQuery1.FieldByName('TruckCode').AsString;       //'运送车辆';
            AdvStrGdProdNotice.cells[6, RowPt] := ADOQuery1.FieldByName('ProdAmount').AsString;     //'方量';
            AdvStrGdProdNotice.cells[7, RowPt] := ADOQuery1.FieldByName('Customer').AsString 
                                                          + '/' + ADOQuery1.FieldByName('ProjNm').AsString 
                                                          + '/' + ADOQuery1.FieldByName('CastPart').AsString ;    //'工程信息';    //客户名称  工程名称  浇筑部位
            AdvStrGdProdNotice.cells[8, RowPt] := ADOQuery1.FieldByName('ConcrStrength').AsString
                                          + '/' + ADOQuery1.FieldByName('ConcrSlump').AsString
                                          + '/' + ADOQuery1.FieldByName('ConcrSeepage').AsString
                                          + '/' + ADOQuery1.FieldByName('TecReq').AsString;    //(强度等级  坍落度  抗渗等级  技术要求 )
            RowPt := RowPt +1;
            ADOQuery1.Next;
        end;

    end
    else
    begin
        RdCount := 1;
    end;

    AdvStrGdProdNotice.RowCount := RdCount +1;
    AdvStrGdProdNotice.RowHeights[RdCount] := 0;
end;

procedure TFrmMain.StatusDspTmrTimer(Sender: TObject);
var
    i, k : Integer;
    WeigDecimal : Integer;
    StateTest : Integer;

    WgrLoadEnable : Integer;
    DspSiloId : Integer;

    SiloWtLoadPt : Integer;
    LdTargetSiloId : Integer;
    LoadValueI : Integer;
    LoadValueF : Double;

    LdInfoNodeRow : Integer;
    SiloLdTgeRdPt : Integer;
    LdErr : Double;
    PermisErr : Double;
    
    ProdRow : Integer;

    LdSiloCountFowWgr : Integer;
begin
    StatusDspTmr.Enabled := False;

    //通讯状态显示
    if Instruction1MscommOpen then
    begin
        if Instru1MscommFails >= 8 then
        begin
            if Instru1MscommDspState <> Instru1MscomDspIsFault then            //通讯显示状态为故障
            begin
                sStatusBar1.Panels[2].Text := '故障';
                Instru1MscommDspState := Instru1MscomDspIsFault ;
            end;
         end
        else
        begin
            if Instru1MscommDspState <> Instru1MscomDspIsNomarl then            //通讯显示状态为正常
            begin
                sStatusBar1.Panels[2].Text := '正常';
                Instru1MscommDspState := Instru1MscomDspIsNomarl ;
            end;
        end;
    end
    else
    begin
        if Instru1MscommDspState <> Instru1MscomDspIsPortNo then
        begin
            Instru1MscommDspState := Instru1MscomDspIsPortNo ;           //端口不存在
            FrmMain.sStatusBar1.Panels[2].Text := '打开失败';
        end;
    end;

    {称值显示}
    WgrLoadEnable := WgherLoadEnableInInstrument;
    for i:=1 to WeigherCount do
    begin
        if WeigherInfo[i].Enable then
        begin
            {称值显示}
            WeigDecimal := WeigherPara[i][CntWeigherDecimalIndex].Value;
            if WeigherValueI[i] > 32767 then
                WeigherValueLab[i].Caption := Format('%.' + inttostr(WeigDecimal) + 'f',[(WeigherValueI[i] -65536)/ Power(10, WeigDecimal)])
            else
                WeigherValueLab[i].Caption := Format('%.' + inttostr(WeigDecimal) + 'f',[WeigherValueI[i] / Power(10, WeigDecimal)]) ;

            //称配料计数器 标签
            if (InstrumentState and ( (1 shl 4) or (1 shl 5) ) <> 0)     //下位机暂停状态 或 生产进行状态 中
               and
               (WgrLoadEnable and ( 1 shl (i-1) ) <> 0)     //对应的配料仪表有设定值
                then
            begin
                if LbWgrLdCounterVisibleState[i] <> CtLbWgrLdCounterVisibleIsTrue then    //称配料计数器标签的 Visible 为 非True
                begin
                    WeigherLoadConterLab[i].Visible := True;
                    LbWgrLdCounterVisibleState[i] := CtLbWgrLdCounterVisibleIsTrue;
                end;
                WeigherLoadConterLab[i].Caption := IntToStr(WeigherLoadCounterInInstu[i]);
            end
            else
            begin
                if LbWgrLdCounterVisibleState[i] <> CtLbWgrLdCounterVisibleIsFalse then    //称配料计数器标签的 Visible 为 非False
                begin
                    WeigherLoadConterLab[i].Visible := False;
                    LbWgrLdCounterVisibleState[i] := CtLbWgrLdCounterVisibleIsFalse;
                end;
            end;

            {称状态显示}
            //计量输出
            StateTest := $0001;
            for k:=1 to 4 do
            begin
                DspSiloId := WeigherInfo[i].StorageId[k];
                if  DspSiloId > 0 then
                begin
                    if StorageInfo[DspSiloId].DschMode = CntStorageDoubleDsch then    //料仓为双计量门
                    begin
                        if WeigherStateInInstru[i] and StateTest <> 0 then    //精计量输出有效
                        begin
                            if StorageFineLoadImgState[DspSiloId] <> CntLoadImgStateIsOpen then     //图片状态为非开状态
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsFnLd, CntLoadImgStateIsOpen);
                            end;
                        end
                        else
                        begin
                            if StorageFineLoadImgState[DspSiloId] <> CntLoadImgStateIsClose then     //图片状态为非关闭状态
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsFnLd, CntLoadImgStateIsClose);
                            end;
                        end;
                    end
                    else    //料仓为单计量门
                    begin
                        if WeigherStateInInstru[i] and StateTest <> 0 then    //计量输出有效
                        begin
                            if StorageLoadImgState[DspSiloId] <> CntLoadImgStateIsOpen then    //计量门图片为非输出有效状态
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsLd, CntLoadImgStateIsOpen);
                            end;
                        end
                        else
                        begin
                            if StorageLoadImgState[DspSiloId] <> CntLoadImgStateIsClose then
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsLd, CntLoadImgStateIsClose);
                            end;
                        end;
                    end;
                end;
                StateTest := StateTest shl 1;
            end;

            //粗计量输出
            StateTest := $1000;
            for k:=1 to 4 do
            begin
                DspSiloId := WeigherInfo[i].StorageId[k];
                if DspSiloId > 0 then
                begin
                    if StorageInfo[DspSiloId].DschMode = CntStorageDoubleDsch then    //料仓为双计量门
                    begin
                        if WeigherStateInInstru[i] and StateTest <> 0 then    //粗计量输出有效
                        begin
                            if StorageLoadImgState[DspSiloId] <> CntLoadImgStateIsOpen then
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsLd, CntLoadImgStateIsOpen);
                            end;
                        end
                        else
                        begin
                            if StorageLoadImgState[DspSiloId] <> CntLoadImgStateIsClose then
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsLd, CntLoadImgStateIsClose);
                            end;
                        end;
                    end;
                end;
                StateTest := StateTest shl 1;
            end;

            //料仓振动器
            StateTest := $0100 ;
            for k:=1 to 4 do
            begin
                DspSiloId := WeigherInfo[i].StorageId[k];
                if DspSiloId > 0 then    //该称 的 对应的料仓 有使用
                begin
                    if StorageInfo[DspSiloId].Vibrator then    //使用振动器
                    begin
                        if WeigherStateInInstru[i] and StateTest <> 0 then
                        begin
                            if StorageVibratorImgState[DspSiloId] <> CntVibraImgStaIsOpen then    //料仓振动器 非 开状态
                            begin
                                DSpSiloVibraImgState(DspSiloId, CntVibraImgStaIsOpen);
                            end;
                        end
                        else
                        begin
                            if StorageVibratorImgState[DspSiloId] <> CntVibraImgStaIsClose then    //料仓振动器 非 开状态
                            begin
                                DSpSiloVibraImgState(DspSiloId, CntVibraImgStaIsClose);
                            end;
                        end;
                    end;
                end;
                StateTest := StateTest shl 1;
            end;

            //称卸料阀图片
            if ( WeigherStateInInstru[i] and $0010 ) <> 0 then
            begin
                if WeigherDischValveImgState[i] <> CntWeigDischValveIsOPen then    //卸料阀图片 非打开 状态
                begin
                    DspWeigherDschValveState(i, CntWeigDischValveIsOPen);
                end;
            end
            else
            begin
                if WeigherDischValveImgState[i] <> CntWeigDischValveIsClose then   //卸料阀图片 非关闭 状态
                begin
                    DspWeigherDschValveState(i, CntWeigDischValveIsClose);
                end;
            end;

            //称卸料振动器
            if WeigherInfo[i].DischVibrator then
            begin
                if ( WeigherStateInInstru[i] and $0020 ) <> 0 then
                begin
                    if WeigherDischVibraImgState[i] <> CntVibraImgStaIsOpen then        //称卸料振动器图片 非开 状态
                    begin
                        DspWghrDschVibraState(i, CntVibraImgStaIsOpen );
                    end;
                end
                else
                begin
                    if WeigherDischVibraImgState[i] <> CntVibraImgStaIsClose then        //称卸料振动器图片 非关闭 状态
                    begin
                        DspWghrDschVibraState(i, CntVibraImgStaIsClose);
                    end;
                end;
            end;

            //称关门限位
            if WeigherInfo[i].CloseLmt then
            begin
                if ( WeigherStateInInstru[i] and $0010 ) <> 0 then    //称卸料阀 开
                begin
                    if ( WeigherStateInInstru[i] and $0080 ) <> 0 then    //关限有效
                    begin
                        if WeigherDischValveCloseLmtImgState[i] <> CntWghrDschValveClsLmtImgIsValidFlash then    //非 有效闪烁 状态
                        begin
                            DspWghrDschValveCloseLmtImg(i, CntWghrDschValveClsLmtImgIsValidFlash);    //更新限位图片为 有效闪烁 状态
                        end;
                    end
                    else
                    begin
                        if WeigherDischValveCloseLmtImgState[i] <> CntWghrDschValveClsLmtImgIsInvalid then    //非 空 状态
                        begin
                            DspWghrDschValveCloseLmtImg(i, CntWghrDschValveClsLmtImgIsInvalid);    //更新限位图片为 空 状态
                        end;
                    end;
                end
                else    //称卸料阀 关
                begin
                    if ( WeigherStateInInstru[i] and $0080 ) <> 0 then    //关限有效
                    begin
                        if WeigherDischValveCloseLmtImgState[i] <> CntWghrDschValveClsLmtImgIsValid then    //关限图片 为 非有效 状态
                        begin
                            DspWghrDschValveCloseLmtImg(i, CntWghrDschValveClsLmtImgIsValid);    //更新关限图片 为 有效 状态
                        end;
                    end
                    else
                    begin
                        if WeigherDischValveCloseLmtImgState[i] <> CntWghrDschValveClsLmtImgIsInvalidFlash then    //关限图片 为 非无效闪烁 状态
                        begin
                            DspWghrDschValveCloseLmtImg(i, CntWghrDschValveClsLmtImgIsInvalidFlash);    //更新关限图片 为 无效闪烁 状态
                        end;
                    end;
                end;
            end;

            if InstrumentState and ( (1 shl 4) or (1 shl 5) ) <> 0 then    //生产进行或暂停中
            begin
                if ( WeigherStateInInstru[i] and $0040 ) <> 0 then    //配料完成
                begin
                    if not WeigherLoadInfo[i].LoadFactDsp then    //配料值未显示
                    begin
                        ReadWordsFromInstrument1( WeigherLoadInfo[i].RdFactWaitPt , $0100 + (i -1) * $08,  $04 );    //读称配料参数
                        WeigherLoadInfo[i].RdFactLoadEna := True;
                        WeigherLoadInfo[i].LoadFactDsp := True;
                    end
                    else
                    begin
                        if WeigherLoadInfo[i].RdFactLoadEna then
                        begin
                            if Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].Active then
                            begin
                                Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].Active := False;
                                WeigherLoadInfo[i].RdFactLoadEna := False;

                                WeigherLoadInfo[i].RecordBatchCount := WeigherLoadInfo[i].RecordBatchCount + 1;
                                PermisErr := RoundTo(WeigherPara[i][CntWeigherTRGIndex].Value / Power(10, WeigherPara[i][CntWeigherTRGIndex].Decimal) , -WeigherPara[i][CntWeigherTRGIndex].Decimal);

                                for k:=1 to 4 do
                                begin
                                    LdTargetSiloId := WeigherInfo[i].StorageId[k];
                                    //------发现下面是句废话，且会起到负作用，因为每个称的四个配料动作不会都使用----
                                    //if ( LdTargetSiloId < 1 ) and ( LdTargetSiloId > CntStorageCount ) then
                                    //begin
                                    //    Showmessage('无效的记录料仓');
                                    //    exit;
                                    //end;
                                    //-----------------废话去掉结束 2017.05.10 17:43 王素臣-------------------------
                                    if ( StorageInfo[LdTargetSiloId].Enable ) and (ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLoadEn[LdTargetSiloId] ) then    //料仓有使用
                                    begin
                                        LoadValueI := Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].ReceiveByte[(k-1)*2] *256
                                                    + Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].ReceiveByte[(k-1)*2 +1];
                                        LoadValueF := RoundTo(LoadValueI / Power(10, WeigDecimal), -WeigDecimal);

                                        SiloWtLoadPt := SiloLoadInfo[LdTargetSiloId].WtPt;
                                        SiloLoadInfo[LdTargetSiloId].LoadFact[SiloWtLoadPt] := LoadValueF ;

                                        StorageLoadValueLab[LdTargetSiloId].Caption := format('%.' + inttostr(WeigDecimal) + 'f', [LoadValueF]);
                                        StorageLoadValueLab[LdTargetSiloId].Visible := True;

                                        //配料信息值写进实时计量表格中
                                        LdInfoNodeRow := (WeigherLoadInfo[i].RecordBatchCount -1) * (ProdNoticeInfo[ProdNoticeInfoRdPt].LdStorageCounter + 1) +1;
                                        AdvStrGdProRd.ExpandNode(LdInfoNodeRow);
                                        AdvStrGdProRd.AllCells[4, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := format('%.' + inttostr(WeigDecimal) + 'f', [LoadValueF]);

                                        //获取配料目标值
                                        SiloLdTgeRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargRdPt[LdTargetSiloId];
                                        if ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[LdTargetSiloId][SiloLdTgeRdPt].EndBatchNumber > WeigherLoadInfo[i].RecordBatchCount then
                                        begin
                                            SiloLdTgeRdPt := SiloLdTgeRdPt +1;
                                            if SiloLdTgeRdPt > CntProdStorageTargetQueueLen then SiloLdTgeRdPt := 1;
                                            ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargRdPt[LdTargetSiloId] := SiloLdTgeRdPt;
                                        end;
                                        SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt]
                                          := Roundto(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[LdTargetSiloId][SiloLdTgeRdPt].LoadTarget, -WeigDecimal) ;

                                        //计算误差
                                        if SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt] > 0 then
                                        begin
                                            LdErr := (LoadValueF - SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt]) / SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt] *100;
                                            LdErr := RoundTo(LdErr , -1);
                                        end
                                        else
                                        begin
                                            LdErr := 0;
                                        end;

                                        AdvStrGdProRd.AllCells[5, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := format('%.1f', [LdErr]);

                                        if LdErr < 0 then LdErr := -LdErr;
                                        if PermisErr < LdErr then
                                        begin
                                            if LoadValueF > SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt] then
                                                SiloLoadInfo[LdTargetSiloId].ErrorIsOver[SiloWtLoadPt] := CntLdErrIsPositive    //正超差
                                            else
                                                SiloLoadInfo[LdTargetSiloId].ErrorIsOver[SiloWtLoadPt] := CntLdErrIsNegative;    //负超差


                                            AdvStrGdProRd.FontColors[4, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := clRed;
                                            AdvStrGdProRd.FontColors[5, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := clRed;
                                        end
                                        else
                                        begin
                                            SiloLoadInfo[LdTargetSiloId].ErrorIsOver[SiloWtLoadPt] := CntLdErrIsNone ;    //无超差
                                        end;

                                        AdvStrGdProRd.AllCells[7, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := '10';

                                        SiloLoadInfo[LdTargetSiloId].Wt2ndPt := SiloWtLoadPt;
                                        SiloWtLoadPt := SiloWtLoadPt + 1;
                                        if SiloWtLoadPt > CntLoadValueQueueLen then SiloWtLoadPt := 1;
                                        SiloLoadInfo[LdTargetSiloId].WtPt := SiloWtLoadPt;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end
                else    //关闭料仓显示
                begin
                    if WeigherLoadInfo[i].LoadFactDsp then    //配料目标值在显示
                    begin
                        LdSiloCountFowWgr := 0;
                        for k:=1 to 4 do
                        begin
                            LdTargetSiloId := WeigherInfo[i].StorageId[k];
                            if StorageInfo[LdTargetSiloId].Enable then    //料仓有使用
                            begin
                                StorageLoadValueLab[LdTargetSiloId].Visible := False;
                                if (ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLoadEn[LdTargetSiloId] ) then
                                begin
                                    WeigherLoadInfo[i].Rd2ndSiloId := LdTargetSiloId;
                                    LdSiloCountFowWgr := LdSiloCountFowWgr +1;
                                end;
                            end;
                        end;
                        WeigherLoadInfo[i].LoadFactDsp := False;

                        LdTargetSiloId := WeigherLoadInfo[i].Rd2ndSiloId;
                        if (LdSiloCountFowWgr = 1)    //配料料仓只有1个
                          and ( SiloLoadInfo[LdTargetSiloId].ErrorIsOver[SiloLoadInfo[LdTargetSiloId].Wt2ndPt] = CntLdErrIsPositive)    //正超差
                          and (WeigherPara[i][CntWeigherUDCIndex].Value =1)    //允许扣称
                          then
                        begin
                            //读取扣称值
                            ReadWordsFromInstrument1( WeigherLoadInfo[i].RdFactWaitPt , $0103 + (i -1) * $08,  $01 );    //读称配料参数
                            //置标志位
                            WeigherLoadInfo[i].Rd2ndLoadEna := True;
                        end
                        else
                        begin
                            WeigherLoadInfo[i].Rd2ndLoadEna := False;
                        end;
                    end;

                    //等待扣称值回复
                    if WeigherLoadInfo[i].Rd2ndLoadEna then
                    begin
                        if Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].Active then
                        begin
                            Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].Active := False;
                            WeigherLoadInfo[i].Rd2ndLoadEna := False;

                            LoadValueI := Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].ReceiveByte[0] *256
                                        + Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].ReceiveByte[1];
                            LoadValueF := RoundTo(LoadValueI / Power(10, WeigDecimal), -WeigDecimal);

                            if LoadValueF <> 0 then    //防止因为错过时机，读到错误的扣称值
                            begin
                                SiloWtLoadPt := SiloLoadInfo[WeigherLoadInfo[i].Rd2ndSiloId].Wt2ndPt;
                                SiloLoadInfo[WeigherLoadInfo[i].Rd2ndSiloId].LoadFact[SiloWtLoadPt] := LoadValueF ;
                            end;

                            //Showmessage('仓号：' + IntToStr(WeigherLoadInfo[i].Rd2ndSiloId) + '- 记录队列号：' + inttostr(SiloWtLoadPt) + '-扣称值：' + FloatTostr( LoadValueF) );

                        end;
                    end;
                end;
            end;
        end;
    end;

    //--------------------------------------------------------------------------

    {平皮带状态显示}
    //平皮带现定位1#骨料输送设备
    if AggregateConveyorEquipInfo[1].Use then
    begin
        //平皮带输出
        if not AggregateConveyorEquipInfo[1].ContinueRun then
        begin
            if AggrMidHopperStateInInstru and (1 shl 7) <> 0 then
            begin
                if AggrConvEquipBtnState[1] <> CtAggrConvEquipBtnIsValid then    //骨料输送设备按钮状态 为 非有效
                begin
                    DSPAggrConvEquipBtnImgNewState(1, CtAggrConvEquipBtnIsValid);
                end;
            end
            else
            begin
                if AggrConvEquipBtnState[1] <> CtAggrConvEquipBtnIsInvalid then    //骨料输送设备按钮状态 为 非无效
                begin
                    DSPAggrConvEquipBtnImgNewState(1, CtAggrConvEquipBtnIsInvalid);
                end;
            end;
        end;
        //平皮带动画
        if  ( not AggregateConveyorEquipInfo[1].RunLmtCheck ) and ( AggrMidHopperStateInInstru and (1 shl 7) <> 0 ) then //非 限位 运行检查 = 动作输出检查 且平皮带 输出信号 有效
        begin
            if ( (WeigherStateInInstru[1] or WeigherStateInInstru[2] or WeigherStateInInstru[3] or WeigherStateInInstru[4] or WeigherStateInInstru[5] or WeigherStateInInstru[6]) and (1 shl 4) <> 0 ) then
            begin
                //AggrConvEquipFlashTmr[1]   := AggrConvEquipFlashTmr[1] + AppFlashTmrInval;
                //if AggrConvEquipFlashTmr[1] >= 500 then
                begin
                    AggrConvEquipFlashTmr[1] := 0;
                    AggrConvEquipFlashSta[1] := CntBeltFlashStaIsFullRun;     //皮带动画状态 带料运转

                    case AggrConvEquipFlashFrame[1] of
                        1 :
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp2.bmp');
                            AggrConvEquipFlashFrame[1] := 2;
                        end;
                        2 :
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp3.bmp');
                            AggrConvEquipFlashFrame[1] := 3;
                        end;
                        else
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp4.bmp');
                            AggrConvEquipFlashFrame[1] := 1;
                        end;
                    end;
                end;
            end
            else
            begin
                AggrConvEquipFlashTmr[1]   := AggrConvEquipFlashTmr[1] + AppFlashTmrInval;
                if AggrConvEquipFlashTmr[1] >= 500 then
                begin
                    if AggrConvEquipFlashSta[1] <> CntBeltFlashStaIsEmptyRun then
                    begin
                        AggrConvEquipFlashSta[1] := CntBeltFlashStaIsEmptyRun;     //皮带动画状态 空运转
                        ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrpEmptyRun.gif');
                    end;
{                    AggrConvEquipFlashTmr[1] := 0;
                    AggrConvEquipFlashSta[1] := CntBeltFlashStaIsEmptyRun;     //皮带动画状态 空运转

                    case AggrConvEquipFlashFrame[1] of
                        1:
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp1.bmp');
                            AggrConvEquipFlashFrame[1] := 2;
                        end;
                        else
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp0.bmp');
                            AggrConvEquipFlashFrame[1] := 1;
                        end;
                    end;}


                end;
            end;
        end
        else
        begin
            if AggrConvEquipFlashSta[1] <> CntBeltFlashStaIsEmptyStop then     //皮带动画状态 空停止
            begin
                ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp0.bmp');
                AggrConvEquipFlashSta[1] := CntBeltFlashStaIsEmptyStop ;    //皮带动画状态 空停止
            end;
        end;
    end;

    {斜皮带动画}
    //2#设备为左斜皮带
    if AggregateConveyorMode = CntAggregateConveyorBelt then    //骨料输送方式 = 斜皮带
    begin
        if AggregateConveyorEquipInfo[2].Use then    //左斜皮带使用
        begin
            if AggregateConveyorEquipInfo[2].RunLmtCheck and (AggrMidHopperStateInInstru and (1 shl 2) <> 0) then    //斜皮带运转
            begin
                if ( (WeigherStateInInstru[1] or WeigherStateInInstru[2] or WeigherStateInInstru[3] or WeigherStateInInstru[4] or WeigherStateInInstru[5] or WeigherStateInInstru[6]) and (1 shl 4) <> 0 )    //骨料称卸料
                  or (AggrMidHopperStateInInstru and (1 shl 8) <> 0)        //骨料中间仓装料中
                  then
                begin //斜皮带带料运行
                    AggrConvEquipFlashTmr[2] := AggrConvEquipFlashTmr[2] + AppFlashTmrInval;
                    if AggrConvEquipFlashTmr[2] >= 500 then
                    begin
                        AggrConvEquipFlashTmr[2] := 0;
                        AggrConvEquipFlashSta[2] := CntBeltFlashStaIsFullRun;     //皮带动画状态 带料运转

                        case AggrConvEquipFlashFrame[2] of
                            1 :
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp2.bmp');
                                AggrConvEquipFlashFrame[2] := 2;
                            end;
                            2 :
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp3.bmp');
                                AggrConvEquipFlashFrame[2] := 3;
                            end;
                            else
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp4.bmp');
                                AggrConvEquipFlashFrame[2] := 1;
                            end;
                        end;
                    end;
                end
                else    //斜皮带空转
                begin
                    AggrConvEquipFlashTmr[2] := AggrConvEquipFlashTmr[2] + AppFlashTmrInval;
                    if AggrConvEquipFlashTmr[2] >= 500 then
                    begin
                        AggrConvEquipFlashTmr[2] := 0;
                        AggrConvEquipFlashSta[2] := CntBeltFlashStaIsEmptyRun;     //皮带动画状态 空运转

                        case AggrConvEquipFlashFrame[2] of
                            1:
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp1.bmp');
                                AggrConvEquipFlashFrame[2] := 2;
                            end;
                            else
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp0.bmp');
                                AggrConvEquipFlashFrame[2] := 1;
                            end;
                        end;
                    end;
                end;
            end
            else    //斜皮带静止
            begin
                if AggrConvEquipFlashSta[2] <> CntBeltFlashStaIsEmptyStop then     //皮带动画状态 空停止
                begin
                    ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp0.bmp');
                    AggrConvEquipFlashSta[2] := CntBeltFlashStaIsEmptyStop ;    //皮带动画状态 空停止
                end;
            end;

            //斜皮带输送骨料持续计时器
            LabAggrConvHoldTmr[1].Caption := InttoStr(AggrConveyTmrInInstrument);
        end;
    end
    else    //骨料输送方式 = 提升斗
    begin
        //左提升斗
        if AggregateConveyorEquipInfo[5].Use then
        begin
            DspLiftBucketState(1);    //1代表左提升斗
        end;
        //右提升斗
        if AggregateConveyorEquipInfo[6].Use then
         begin
            DspLiftBucketState(2);    //2代表右提升斗
        end;
    end;

    {骨料中间仓}
    if AggregateConveyorMode = CntAggregateConveyorBelt then    //骨料输送方式 = 斜皮带
    begin
        DspAggrMidHopperState();
    end ;


    {搅拌机动画显示}
    MixerFlashDsp();    //搅拌机动画显示

    if ConveryBeltStateInInstru and ( 1 shl 11 ) <> 0 then
        Label10.Caption := '手动模式'
    else
        Label10.Caption := '自动模式';

    {生产画面控制按钮显示}
    DspProdControlBtnState();

    if ( MixerMixingTmrInInstu = 0) then    //搅拌机计时器为0，表示搅拌计时已经结束
    begin
        if (MixerProdCounterInInstru > ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId) and (ProdWtPieceInDbEn) then
        begin
            //写单盘数据记录
            ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId := ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId +1;

            WritePieceInfoIntoDb();

            //从下位机读取任务设定盘数
            if ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId >= ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount then
            begin
                ReadWordsFromInstrument1( ReadPieceNumberInfo.RdBufPt , $0841,  $0001 );    //读称配料参数
                ReadPieceNumberInfo.RdWaitEn := True;
            end;

            ProdWtPieceInDbEn := False;
        end;
    end;

    if ReadPieceNumberInfo.RdWaitEn then
    begin
        if Instruction1ReceiveBuf[ReadPieceNumberInfo.RdBufPt ].Active then
        begin
            Instruction1ReceiveBuf[ReadPieceNumberInfo.RdBufPt].Active := False;
            ReadPieceNumberInfo.RdWaitEn := False;
            
            ReadPieceNumberInfo.SetPieceNumber := Instruction1ReceiveBuf[ReadPieceNumberInfo.RdBufPt].ReceiveByte[0] *256
                                                + Instruction1ReceiveBuf[ReadPieceNumberInfo.RdBufPt].ReceiveByte[1];
            if ReadPieceNumberInfo.SetPieceNumber <= ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId then
            begin
                ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId := ReadPieceNumberInfo.SetPieceNumber;
                UpdateDbForProdEnd();    //生产结束，更新数据库

                //末盘打印发货单
                if CkLastBatchPrtDevl.Checked then
                begin
                    FrmDeliveryPreview.Show;
                end;

                //从派车单列表中删除已经生产了的派单
                ProdRow := DelProdedNoticeFromDspTab(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdNotice_ID) ;

                if (ProdMode = CtProdIsContinue ) then
                begin
                    if (ProdRow <= AdvStrGdProdNotice.RowCount - 2) and (Trim(AdvStrGdProdNotice.Cells[2, ProdRow]) <> '') then
                    begin
                         PresStartProd.Visible := True;

                         ProdNoticeInfoRdPt := 1;             //生产派车单信息读指针
                         ProdNoticeInfoWtPt := 1;             //生产派车单信息写指针

                         ProdStartRow := ProdRow;

                         ProdStart(ProdStartRow) ;
                    end;
                end;
            end;
        end;
    end;

    //修改料仓配料目标值
    if StoraLdTgtModiInfo.Ena then
    begin
        StoraLdTargetModifyRec();
    end;

    if ProdBatchsModiInfo.Ena then
    begin
        ProdBatchsModifyRec();
    end;

    //-------------------------------------------------------------------------
    TaskDspTmr := TaskDspTmr + StatusDspTmr.Interval;
    if TaskDspTmr >= 3000 then
    begin
        TaskDspTmr := 0;
        DspErpTask();
    end;
    
    StatusDspTmr.Enabled := True;
end;

procedure TFrmMain.DspErpTask();
var
    RowCount : integer;
begin
    QryErp.Close;
    QryErp.SQL.Clear;
    QryErp.SQL.Text := 'select * from ProdNoticeERP where state=0';
    QryErp.Open;
    while not QryErp.Eof do
    begin
        {写派车单到数据库}
        try
            FrmMain.ADOConnection.BeginTrans;
            ADOSubErp.Close;
            ADOSubErp.SQL.Clear;
            ADOSubErp.SQL.Text := 'insert into ProdNotice (ProdTaskCode,ProdRecCode'
                         + ',ProdTruckCode'
                         + ',Driver'
                         + ',ProdAmount'
                         + ',NoticeDt'
                         + ',Dispatcher'
                         + ',Inspector'
                         + ') values '
                         + '('
                         + '''' + QryErp.FieldByName('ProdTaskCode').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('ProdRecCode').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('ProdTruckCode').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('Driver').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('ProdAmount').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('NoticeDt').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('Dispatcher').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('Inspector').asstring + ''''
                         + ')';
            ADOSubErp.ExecSQL;

            RowCount := AdvStrGdProdNotice.RowCount;
            AdvStrGdProdNotice.RowHeights[RowCount -1] := 20;

            ADOSubErp.Close;
            ADOSubErp.SQL.Clear;
            ADOSubErp.SQL.Text := 'SELECT @@IDENTITY AS maxid from ProdNotice';
            ADOSubErp.Open;
            if not ADOSubErp.Eof then
            begin
              FrmMain.AdvStrGdProdNotice.cells[0, RowCount -1] := inttostr(ADOSubErp.FieldByName('maxid').AsInteger);
              FrmMain.AdvStrGdProdNotice.cells[2, RowCount -1] := inttostr(ADOSubErp.FieldByName('maxid').AsInteger);    //'流水号';
            end;
            //
            //FrmMain.AdvStrGdProdNotice.cells[3, RowCount -1] := QryErp.FieldByName('ProdTaskCode').asstring;    //任务单编号';
            //FrmMain.AdvStrGdProdNotice.cells[4, RowCount -1] := QryErp.FieldByName('ProdTruckCode').asstring;  //'生产配比';
           // FrmMain.AdvStrGdProdNotice.cells[5, RowCount -1] := Trim(sCmbBxTruck.Text);       //'运送车辆';
           // FrmMain.AdvStrGdProdNotice.cells[6, RowCount -1] := Trim(sEtProdAmount.Text);     //'方量';
            //FrmMain.AdvStrGdProdNotice.cells[7, RowCount -1] := Trim(sCmbBxClient.Text)
            //                                              + '-' + Trim(sCmbBxProjNm.Text)
            //                                              + '-' + Trim(sCmbBxCastPart.Text) ;    //'工程信息';    //客户名称  功能名称  浇筑部位
            //FrmMain.AdvStrGdProdNotice.cells[8, RowCount -1] := Trim(sCmbBxStrength.Text)
            //                                              + '-' + Trim(sCmbBxConcrSlump.Text)
            //                                              + '-' + Trim(sCmbBxConcrSeepage.Text)
            //                                              + '-' + Trim(sEtTecReq.Text);    //'技术要求';    //强度等级  坍落度  抗渗等级  技术要求

            //AdvStrGdProdNotice.cells[2, RowCount -1] := QryErp.FieldByName('FlowID').AsString;    //'流水号';

            AdvStrGdProdNotice.cells[3, RowCount -1] := QryErp.FieldByName('ProdTaskCode').AsString;    //任务单编号';
            AdvStrGdProdNotice.cells[4, RowCount -1] := QryErp.FieldByName('ProdRecCode').AsString;  //'生产配比';
            AdvStrGdProdNotice.cells[5, RowCount -1] := QryErp.FieldByName('ProdTruckCode').AsString;       //'运送车辆';
            AdvStrGdProdNotice.cells[6, RowCount -1] := QryErp.FieldByName('ProdAmount').AsString;     //'方量';
            //AdvStrGdProdNotice.cells[7, RowCount -1] := ADOQuery1.FieldByName('Customer').AsString
            //                                              + '/' + ADOQuery1.FieldByName('ProjNm').AsString
            //                                              + '/' + ADOQuery1.FieldByName('CastPart').AsString ;    //'工程信息';    //客户名称  工程名称  浇筑部位
            //AdvStrGdProdNotice.cells[8, RowCount -1] := ADOQuery1.FieldByName('ConcrStrength').AsString
            //                              + '/' + ADOQuery1.FieldByName('ConcrSlump').AsString
            //                              + '/' + ADOQuery1.FieldByName('ConcrSeepage').AsString
            //                              + '/' + ADOQuery1.FieldByName('TecReq').AsString;    //(强度等级  坍落度  抗渗等级  技术要求 )



            AdvStrGdProdNotice.RowCount := RowCount +1;
            AdvStrGdProdNotice.RowHeights[RowCount] := 0;

            ADOSubErp.Close;
            ADOSubErp.SQL.Clear;
            ADOSubErp.SQL.Text := 'delete from ProdNoticeERP where id=' +QryErp.FieldByName('id').AsString;
            ADOSubErp.ExecSQL;

            FrmMain.ADOConnection.CommitTrans;
        except
            FrmMain.ADOConnection.RollbackTrans;
        end;
        {------------------

        ADOQry
                         + '''' + Trim(sCmbBxTaskCode.Text) + ''''              //ProdTaskID
                         + ',' + '''' + Trim(sCmbBxRecipeCode.Text) + ''''      //ProdRecCode
                         + ',' + '''' + Trim(sCmbBxTruck.Text) + ''''           //ProdTruckCode
                         + ',' + '''' + Trim(sCmbBxDriver.Text) + ''''          //Driver
                         + ',' + (sEtProdAmount.Text)
                         + ',' + '''' + DateToStr(Date()) +' ' + TimeToStr(Time()) + ''''
                         + ',' + '''' + Trim(sCmbBxDispatcher.Text) + ''''      //Dispatcher
                         + ',' + '''' + Trim(sCmbBxInspector.Text) + ''''       //Inspector
                         + ')';
        ADOQry.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
        ExResult := True;
    except
        FrmMain.ADOConnection.RollbackTrans;
        ExResult := False;
    end;
    if ExResult then
    begin
        ADOQry.Close;
        ADOQry.SQL.Clear;
        ADOQry.SQL.Text := 'select @@identity as lastId from ProdNotice';
        ADOQry.Open;
        if not ADOQry.Eof then
        begin
            sEtFlowId.Text := ADOQry.FieldByName('lastId').AsString;
        end;
    end;//}

    {添加生产任务队列}
    {if ExResult then
    begin
        RowCount := FrmMain.AdvStrGdProdNotice.RowCount;
        FrmMain.AdvStrGdProdNotice.RowHeights[RowCount -1] := 20;

        FrmMain.AdvStrGdProdNotice.cells[0, RowCount -1] := Trim(sEtFlowId.Text);
        FrmMain.AdvStrGdProdNotice.cells[2, RowCount -1] := Trim(sEtFlowId.Text);    //'流水号';
        FrmMain.AdvStrGdProdNotice.cells[3, RowCount -1] := Trim(sCmbBxTaskCode.Text);    //任务单编号';
        FrmMain.AdvStrGdProdNotice.cells[4, RowCount -1] := Trim(sCmbBxRecipeCode.Text);  //'生产配比';
        FrmMain.AdvStrGdProdNotice.cells[5, RowCount -1] := Trim(sCmbBxTruck.Text);       //'运送车辆';
        FrmMain.AdvStrGdProdNotice.cells[6, RowCount -1] := Trim(sEtProdAmount.Text);     //'方量';
        FrmMain.AdvStrGdProdNotice.cells[7, RowCount -1] := Trim(sCmbBxClient.Text)
                                                          + '-' + Trim(sCmbBxProjNm.Text)
                                                          + '-' + Trim(sCmbBxCastPart.Text) ;    //'工程信息';    //客户名称  功能名称  浇筑部位
        FrmMain.AdvStrGdProdNotice.cells[8, RowCount -1] := Trim(sCmbBxStrength.Text)
                                                          + '-' + Trim(sCmbBxConcrSlump.Text)
                                                          + '-' + Trim(sCmbBxConcrSeepage.Text)
                                                          + '-' + Trim(sEtTecReq.Text);    //'技术要求';    //强度等级  坍落度  抗渗等级  技术要求

        FrmMain.AdvStrGdProdNotice.RowCount := RowCount +1;
        FrmMain.AdvStrGdProdNotice.RowHeights[RowCount] := 0;
    end;

    if ExResult then
    begin
        Self.Close ;
    end;}
    //    ----------------------
        QryErp.Next;
    end;
end;

//LiftBucketNum=1，左提升斗；LiftBucketNum = 2，右提升斗
procedure TFrmMain.DspLiftBucketState(LiftBucketNum : Integer);    //刷新提升斗状态
begin
    case LiftBucketNum of
        1 :    //左提升斗
        begin
            //刷新下降输出信号状态
            if AggrMidHopperStateInInstru and (1 shl 5) <> 0 then    //下降信号输出
            begin
                if ImgLiftBuktGoDnBtnDspSta[1] <> CntImgLiftBuktBtnDspStaIsValid then    //有效状态
                begin
                    ImgLiftBuktGoDnBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsValid;
                    ImgLiftBucketGoDn[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\GoDnBtnValid.png');
                end;
            end
            else
            begin
                if ImgLiftBuktGoDnBtnDspSta[1] <> CntImgLiftBuktBtnDspStaIsInvad then    //无效
                begin
                    ImgLiftBuktGoDnBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsInvad;
                    ImgLiftBucketGoDn[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\GoDnBtnInvalid.png');
                end;
            end;

            //刷新上升输出信号状体
            if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then    //上升信号输出
            begin
                if ImgLiftBuktGoUpBtnDspSta[1] <> CntImgLiftBuktBtnDspStaIsValid then    //有效状态
                begin
                    ImgLiftBuktGoUpBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsValid;
                    ImgLiftBucketGoUp[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\GoUpBtnValid.png');
                end;
            end
            else
            begin
                if ImgLiftBuktGoUpBtnDspSta[1] <> CntImgLiftBuktBtnDspStaIsInvad then    //无效状态
                begin
                    ImgLiftBuktGoUpBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsInvad;
                    ImgLiftBucketGoUp[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\GoUpBtnInvalid.png');
                end;
            end;

            //刷新上限位
            if AggrMidHopperStateInInstru and (1 shl 0) <> 0 then
            begin
                if ImgLiftBuktTopLmtDspSta[1] <> CntImgLiftBuktLmtDspStaIsValid then    //有效状态
                begin
                    ImgLiftBuktTopLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsValid;
                    ImgLiftBucketTopLmt[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\WeigDischValveLmtValid.png');
                end;
            end
            else
            begin
                if ImgLiftBuktTopLmtDspSta[1] <> CntImgLiftBuktLmtDspStaIsInvad then    //无效状态
                begin
                    ImgLiftBuktTopLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsInvad;
                    ImgLiftBucketTopLmt[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\WeigDischValveLmtInValid.png');
                end;
            end;

            //数显下限位
            if AggrMidHopperStateInInstru and (1 shl 1) <> 0 then    //左提升斗下限有效
            begin
                if ImgLiftBuktBtmLmtDspSta[1] <> CntImgLiftBuktLmtDspStaIsValid then
                begin
                    ImgLiftBuktBtmLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsValid ;
                    ImgLiftBucketBottomLmt[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\WeigDischValveLmtValid.png');
                end;
            end
            else
            begin
                if ImgLiftBuktBtmLmtDspSta[1] <> CntImgLiftBuktLmtDspStaIsInvad then
                begin
                    ImgLiftBuktBtmLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsInvad ;
                    ImgLiftBucketBottomLmt[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\WeigDischValveLmtInValid.png');
                end;
            end;

            //动画状态
            LeftLiftBucketFlash();    //左提升斗动画显示

            //预提升计时器
            LabLiftBucketPreRisTmr[1].Caption := IntToStr(AggrConveyTmrInInstrument);     //骨料提升斗预提升计时器

            //卸料计时器
            LabLiftBucketDschTmr[1].Caption := IntToStr(AggrMidBinDschTmrInInstru) ;     //骨料提升斗卸料计时器标签

            //生产盘次计数器
            LabLiftBucketLdCounter[1].Caption := IntToStr(AggrLoadCounterInInstru);     //骨料提升斗盘次计数器标签

        end;

        2 :    //右提升斗
        begin

        end;
    end;
end;

procedure TFrmMain.LeftLiftBucketFlash();    //左提升斗动画显示
var
    MovX : Integer;
    MovY : Integer;
begin
    if AggrMidHopperStateInInstru and (1 shl 1) <> 0 then    //左提升斗下限有效
    begin
        ImgLiftBucket[1].Left := LiftBucketAttr[1].XBottom;
        ImgLiftBucket[1].Top  := LiftBucketAttr[1].YBottom;
    end
    else if AggrMidHopperStateInInstru and (1 shl 0) <> 0 then    //上限有效
    begin
        ImgLiftBucket[1].Left := LiftBucketAttr[1].XTop;
        ImgLiftBucket[1].Top  := LiftBucketAttr[1].YTop;
    end
    else
    begin
        if AggrMidHopperStateInInstru and (1 shl 5) <> 0 then    //下降信号输出
        begin
            LiftBucketAttr[1].MovTmr := LiftBucketAttr[1].MovTmr + AppFlashTmrInval;
            if LiftBucketAttr[1].MovTmr >= 1000 then
            begin
                LiftBucketAttr[1].GodnTmr := LiftBucketAttr[1].GodnTmr + LiftBucketAttr[1].MovTmr;


                //MovX := LiftBucketAttr[1].GoUpTmr * LiftBucketAttr[1].XMoveMax  div LiftBucketAttr[1].GoDnLong ;
                //if MovX > LiftBucketAttr[1].XMoveMax then MovX := LiftBucketAttr[1].XMoveMax;
                //ImgLiftBucket[1].Left := LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax - MovX ;

                //MovY := LiftBucketAttr[1].GoUpTmr * LiftBucketAttr[1].YMoveMax  div LiftBucketAttr[1].GoDnLong ;
                //if MovY > LiftBucketAttr[1].YMoveMax then MovY := LiftBucketAttr[1].YMoveMax;
                //ImgLiftBucket[1].Top := LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax + MovY ;

                MovX := ImgLiftBucket[1].Left - LiftBucketAttr[1].MovTmr * LiftBucketAttr[1].XMoveMax  div LiftBucketAttr[1].GoDnLong;
                if MovX > LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax then
                    MovX := LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax
                else if MovX < LiftBucketAttr[1].XBottom then
                    MovX := LiftBucketAttr[1].XBottom;
                ImgLiftBucket[1].Left := MovX;

                MovY := ImgLiftBucket[1].Top + LiftBucketAttr[1].MovTmr * LiftBucketAttr[1].YMoveMax  div LiftBucketAttr[1].GoDnLong;
                if MovY < LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax then
                    MovY := LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax
                else if MovY > LiftBucketAttr[1].YBottom then
                    MovY := LiftBucketAttr[1].YBottom;
                ImgLiftBucket[1].Top := MovY;
                
                LiftBucketAttr[1].MovTmr := 0;
            end;
        end;

        if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then    //上升信号输出
        begin
            LiftBucketAttr[1].MovTmr := LiftBucketAttr[1].MovTmr + AppFlashTmrInval;
            if LiftBucketAttr[1].MovTmr >= 1000 then
            begin
                LiftBucketAttr[1].GoUpTmr := LiftBucketAttr[1].GoUpTmr + LiftBucketAttr[1].MovTmr;


                //MovX := LiftBucketAttr[1].GoUpTmr * LiftBucketAttr[1].XMoveMax  div LiftBucketAttr[1].GoUpLong ;
                //if MovX > LiftBucketAttr[1].XMoveMax then MovX := LiftBucketAttr[1].XMoveMax;
                //ImgLiftBucket[1].Left := LiftBucketAttr[1].XBottom + MovX ;

                //MovY := LiftBucketAttr[1].GoUpTmr * LiftBucketAttr[1].YMoveMax  div LiftBucketAttr[1].GoUpLong ;
                //if MovY > LiftBucketAttr[1].YMoveMax then MovY := LiftBucketAttr[1].YMoveMax;
                //ImgLiftBucket[1].Top := LiftBucketAttr[1].YBottom - MovY
                MovX := ImgLiftBucket[1].Left + LiftBucketAttr[1].MovTmr * LiftBucketAttr[1].XMoveMax  div LiftBucketAttr[1].GoUpLong;
                if MovX > LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax then MovX := LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax ;
                ImgLiftBucket[1].Left := MovX;

                MovY := ImgLiftBucket[1].Top - LiftBucketAttr[1].MovTmr * LiftBucketAttr[1].YMoveMax  div LiftBucketAttr[1].GoUpLong;
                if MovY < LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax then MovY := LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax ;
                ImgLiftBucket[1].Top := MovY;

                LiftBucketAttr[1].MovTmr := 0;
            end;
        end;
    end;
end;

procedure TFrmMain.StoraLdTargetModifyRec();
var
    i : integer;
    OperRow : Integer;
    StorLdState : Integer;
    WgrDecimal : Integer;
    StoraLdTargtWtPt : Integer;
begin
    if Instruction1ReceiveBuf[StoraLdTgtModiInfo.RevBufPt].Active then    //收到返回命令
    begin
        WgrDecimal := WeigherPara[StorageInfo[StoraLdTgtModiInfo.ModiStorId].InstrumentId][CntWeigherDecimalIndex].Value;

        for i:= 1 to ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount do
        begin
            OperRow := 1 + (i-1) * (ProdNoticeInfo[ProdNoticeInfoRdPt].LdStorageCounter +1)+ ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[StoraLdTgtModiInfo.ModiStorId];

            if trim(AdvStrGdProRd.AllCells[7, OperRow]) <> '' then
            begin
                try
                    StorLdState := StrToInt( trim(AdvStrGdProRd.AllCells[7, OperRow]) );
                except
                    StorLdState := 0;
                end;
            end
            else
            begin
                StorLdState := 0;
            end;

            if StorLdState < 10 then
            begin
                AdvStrGdProRd.AllCells[GrdLdInfoEdtCol, OperRow] := Format('%.' + inttostr(WgrDecimal) + 'f', [StoraLdTgtModiInfo.NewTarget]);
            end;
        end;

        StorageLoadTargetLab[StoraLdTgtModiInfo.ModiStorId].Caption := Format('%.' + inttostr(WgrDecimal) + 'f', [StoraLdTgtModiInfo.NewTarget]);

        StoraLdTargtWtPt := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStorageLdTargWtPt[StoraLdTgtModiInfo.ModiStorId];

        ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStorageLdTarget[StoraLdTgtModiInfo.ModiStorId][StoraLdTargtWtPt].LoadTarget := StoraLdTgtModiInfo.NewTarget;
        //[StoraLdTgtModiInfo.NewTarget][ProdStorageLdTargWtPt[StoraLdTgtModiInfo.NewTarget]].LoadTarget :=4;// 

        EtNewLdTarg.Visible := False;
        GrdLdInfoEditing    := False;
        StoraLdTgtModiInfo.Ena := False;

        Instruction1ReceiveBuf[StoraLdTgtModiInfo.RevBufPt].Active := False;
    end
    else
    begin
        StoraLdTgtModiInfo.Tmr := StoraLdTgtModiInfo.Tmr + AppFlashTmrInval;
        if StoraLdTgtModiInfo.Tmr > 1000 then
        begin
            StoraLdTgtModiInfo.Tmr := 1000;
            GrdLdInfoEditing    := False;
            StoraLdTgtModiInfo.Ena := False;
            Showmessage('下发配料目标值失败!');
            EtNewLdTarg.Visible := False;
        end;
    end;
end;

procedure TFrmMain.ProdBatchsModifyRec();                    //修改生产盘数接收程序
var
    i : Integer;
    TabRowCount : Integer;
    TabTotlaRow : Integer;
    RowSpan : Integer;
    RealRowOfLastRow : Integer;
begin
    if Instruction1ReceiveBuf[ProdBatchsModiInfo.RevBufPt].Active then    //收到返回命令
    begin
        ProdBatchsModiInfo.Ena := False;

        case ProdBatchsModiInfo.ModiTp of
            CtProdBatchsModiIsDec :
            begin
                TabRowCount := AdvStrGdProRd.RowCount ;
                TabTotlaRow := AdvStrGdProRd.TotalRowCount;
                RowSpan := ProdNoticeInfo[ProdNoticeInfoRdPt].LdStorageCounter + 1;

                RealRowOfLastRow := AdvStrGdProRd.RealRowIndex(TabRowCount-1);

                if (TabTotlaRow - RowSpan) = RealRowOfLastRow then    //最后一个节点没有展开
                begin
                    if AdvStrGdProRd.IsNode(TabRowCount-1) then
                    begin
                        AdvStrGdProRd.ExpandNode(RealRowOfLastRow);
                    end;
                end;

                TabRowCount := AdvStrGdProRd.RowCount;
                //AdvStrGdProRd.RemoveNode(RealRowOfLastRow);
                //AdvStrGdProRd.ClearRows(TabRowCount-RowSpan,RowSpan);
                AdvStrGdProRd.RemoveRows(TabRowCount-RowSpan,RowSpan);
                //AdvStrGdProRd.RowCount := TabRowCount - RowSpan;

                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount -1;
            end;

            CtProdBatchsModiIsInc :
            begin
                TabRowCount := AdvStrGdProRd.RowCount ;
                TabTotlaRow := AdvStrGdProRd.TotalRowCount;

                RowSpan := ProdNoticeInfo[ProdNoticeInfoRdPt].LdStorageCounter + 1;
                AdvStrGdProRd.RowCount := TabRowCount + RowSpan;
                for i:=TabRowCount to TabRowCount + RowSpan do
                begin
                    AdvStrGdProRd.Rows[i].Clear;
                end;

                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount + 1;

                AdvStrGdProRd.AllCells[1, TabTotlaRow] := '第' + inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount) + '盘';
                for i:=TabTotlaRow+1 to TabTotlaRow + RowSpan do
                begin
                    AdvStrGdProRd.Rows[i].Clear;
                    AdvStrGdProRd.AllCells[1, i] := AdvStrGdProRd.AllCells[1, i - RowSpan];    //原材料
                    AdvStrGdProRd.AllCells[2, i] := AdvStrGdProRd.AllCells[2, i - RowSpan];    //配方值
                    AdvStrGdProRd.AllCells[3, i] := AdvStrGdProRd.AllCells[3, i - RowSpan];    //设定值
                    AdvStrGdProRd.AllCells[4, i] := '0';                                       //完成值
                    AdvStrGdProRd.AllCells[5, i] := '0';                                       //误差
                    AdvStrGdProRd.AllCells[6, i] := AdvStrGdProRd.AllCells[6, i - RowSpan];    //仓号
                    AdvStrGdProRd.AllCells[7, i] := '0';                                       //状态
                    AdvStrGdProRd.AllCells[8, i] := AdvStrGdProRd.AllCells[8, i - RowSpan];    //盘号
                end;
                AdvStrGdProRd.AddNode(TabTotlaRow, RowSpan);
                AdvStrGdProRd.ContractNode(TabTotlaRow);
            end;
        end;

        Instruction1ReceiveBuf[ProdBatchsModiInfo.RevBufPt].Active := False;
        
        if InstrumentState and $0030 <> $0000 then
        begin
            BtnIncProdSetCount.Enabled := True;                      //添加一盘 按钮
            BtnIncProdSetCountState := BtnProdSetCountStIsEnbale;

            BtnDecProdSetCount.Enabled := True;                     //减少一盘 按钮
            BtnDecProdSetCountState := BtnProdSetCountStIsEnbale;
        end;
    end
    else
    begin
        ProdBatchsModiInfo.Tmr := ProdBatchsModiInfo.Tmr + AppFlashTmrInval;
        if ProdBatchsModiInfo.Tmr > 5000 then
        begin
            ProdBatchsModiInfo.Tmr := 2000;
            ProdBatchsModiInfo.Ena := False;
            Showmessage('修改生产任务盘数失败!');

            if InstrumentState and $0030 <> $0000 then
            begin
                BtnIncProdSetCount.Enabled := True;                      //添加一盘 按钮
                BtnIncProdSetCountState := BtnProdSetCountStIsEnbale;

                BtnDecProdSetCount.Enabled := True;                     //减少一盘 按钮
                BtnDecProdSetCountState := BtnProdSetCountStIsEnbale;
            end;
        end;
    end;
end;

procedure TFrmMain.WritePieceInfoIntoDb();
Var
    RdDt : TDateTime;
    PieceId : Integer;
    i : Integer;
    RecipeRdPt,
    TargetRdPt : Integer;
    WghrDecimal : Integer;
    LdFactRdPt  : Integer;
begin
    ADOQuery1.Close;
    //写单盘信息到Piece表中
    try
        ADOQuery1.SQL.Clear;
        ADOConnection.BeginTrans;

        ADOQuery1.SQL.Text := 'insert into Piece ('
                              + 'Produce'
                              + ', Serial'
                              + ', Blend'
                              + ', DatTim'
                              + ', BldTim'
                              + ', PieAmnt'
                              + ') values ('
                              + inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_IdInDb)
                              + ',' + inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId)
                              + ',' + '1'
                              + ',' + ':WtRdTd'
                              + ',' + ':BldTm'
                              + ',' + format('%.2f', [ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchAmount])
                              + ')';
        RdDt := Now();
        ADOQuery1.Parameters.ParamByName('WtRdTd').Value := RdDt;//FloatToStr(RdDt);
        ADOQuery1.Parameters.ParamByName('BldTm').Value := DateTimeToStr(RdDt - MixerPara[CntIndexOfMixingSetLngInArray].Value /24/60/60)
                                                         + '，'
                                                         + DateTimeToStr(RdDt)
                                                         +';';
        ADOQuery1.ExecSQL;
        ADOConnection.CommitTrans;
    except
        ADOConnection.RollbackTrans;
        Showmessage('单盘记录信息记录失败!');
    end;

    //写单盘记录值
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select @@identity as lastPieceId from Piece';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        PieceId := ADOQuery1.FieldByName('lastPieceId').AsInteger;

        try
            ADOConnection.BeginTrans;
            for i:=1 to CntStorageCount do
            begin
                if Not StorageInfo[i].Enable then Continue;

                if ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLoadEn[i] then
                begin
                    WghrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;

                    //配比读取指针
                    RecipeRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i];
                    if ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecipe[i][RecipeRdPt].EndBatchNumber > ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId then    //该仓配方值已发生变化
                    begin
                        RecipeRdPt := RecipeRdPt +1;
                        if RecipeRdPt > CntProdStoraLdRceQueueLen then RecipeRdPt := 1;
                        ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i] := RecipeRdPt;
                    end;

                    //--------配料信息变量表中增加了，LoadTarget  : array[1..CntLoadValueQueueLen] of Double; 下面程序------------
                    //配料目标值读取指针
                    //TargetRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargRdPt[i];
                    //if ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TargetRdPt].EndBatchNumber > ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId then     //配料目标值已经变化
                    //begin
                    //    TargetRdPt := TargetRdPt + 1;
                    //    if TargetRdPt > CntProdStorageTargetQueueLen then TargetRdPt := 1;
                    //    ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargRdPt[i] := TargetRdPt;
                    //end;
                    //------------------------------停用------------------------------------------------------------------------

                    //配料值队列读指针
                    LdFactRdPt := SiloLoadInfo[i].RdPt;

                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Text := 'insert into Dosage ('
                                        + 'Piece'        //盘号
                                        + ',StorID'      //仓号
                                        + ',Storage'     //料仓名称
                                        + ',MaterID'     //材料编号
                                        + ',Material'    //原料名称
                                        + ',RecAmnt'     //配比值
                                        + ',PlanAmnt'    //配料目标值
                                        + ',FactAmnt'    //实际配料值
                                        + ') values ('
                                        + inttostr(PieceId)    //盘号
                                        + ',' + inttostr(i)    //仓号
                                        + ',' + '''' + StorageInfo[i].Name + ''''        //料仓名称
                                        + ',' + inttostr(StorageInfo[i].MaterId)         //原料序号
                                        + ',' + '''' + StorageInfo[i].MaterName + ''''   //原料名称
                                        + ',' + format('%.' + inttostr(WghrDecimal) + 'f', [ ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecipe[i][RecipeRdPt].LoadRecipe ])        //配比值
                                        //--------配料信息变量表中增加了，LoadTarget  : array[1..CntLoadValueQueueLen] of Double; 下面程序--------------------------------------------------------
                                        //+ ',' + format('%.' + inttostr(WghrDecimal) + 'f', [ ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TargetRdPt].LoadTarget ])      //配料目标值
                                        //-----------------------------------------------改为-----------------------------------------------------------------------------------------------------
                                        + ',' + format('%.' + inttostr(WghrDecimal) + 'f', [ SiloLoadInfo[i].LoadTarget[LdFactRdPt] ])      //配料目标值
                                        //--------配料信息变量表中增加了，LoadTarget  : array[1..CntLoadValueQueueLen] of Double; 修改结束--------------------------------------------------------

                                        + ',' + format('%.' + inttostr(WghrDecimal) + 'f', [ SiloLoadInfo[i].LoadFact[LdFactRdPt] ])
                                        + ')';

                    //-------2017.07.12 11:48 为了增加库存消耗，下面代码-----------------------
                    //更新配料值队列读指针
                    //LdFactRdPt := LdFactRdPt + 1;
                    //if LdFactRdPt > CntLoadValueQueueLen then LdFactRdPt := 1;
                    //SiloLoadInfo[i].RdPt := LdFactRdPt ;

                    //ADOQuery1.ExecSQL;
                    //----------------------------改为------------------------------------------
                    ADOQuery1.ExecSQL;

                        //----------2017.07.12 11:51 为了增加库存消耗，下增加下面代码----------
                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Text := 'update Storage set Stock =Stock-' + format('%.' + inttostr(WghrDecimal) + 'f', [ SiloLoadInfo[i].LoadFact[LdFactRdPt] ]) + ' where ID =' + inttostr(i);
                    ADOquery1.ExecSQL;
                    
                        //------------------------------增加结束-------------------------------                      

                    LdFactRdPt := LdFactRdPt + 1;
                    if LdFactRdPt > CntLoadValueQueueLen then LdFactRdPt := 1;
                    SiloLoadInfo[i].RdPt := LdFactRdPt ;
                    //--------------------------修改结束----------------------------------------
                end;
            end;

            ADOConnection.CommitTrans;
        except
            ADOConnection.RollbackTrans;
        end;
    end
    else
    begin
        Showmessage('写单盘记录明细失败');
    end;

    ADOQuery1.Close;

    if ProdNoticeInfo[ProdNoticeInfoRdPt].ProdRecipe_Code <> '' then    //刷新生产任务单的累计方量
    begin
        Try
            ADOConnection.BeginTrans;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'update ProdTask set TolAmount=TolAmount + '
                                + FloatToStr(RoundTo(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchAmount, -3 ))
                                + ' where Code=' + '''' + ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_Code + '''';
            ADOQuery1.ExecSQL;
            ADOConnection.CommitTrans;
        except
            ADOConnection.RollbackTrans;
            Showmessage('更新生产任务单累计方量失败');
        end;
        ADOQuery1.Close;
    end;
end;

procedure TFrmMain.DspAggrMidHopperState();
begin
    {中间仓卸料阀}
    if AggregateMidBinInfo[1].Use then    //1#中间仓有使用
    begin
        if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then    //中间斗卸料门 输出 有效
        begin
            if AggrMidHopperDschValveImgState[1] <> CntMdHopDshValImgIsValid then    //1#中间斗卸料阀图片状态 非有效 状态
            begin
                DSpAggrMidHopperDschValveImgNewState(1, CntMdHopDshValImgIsValid);   //1#中间斗卸料阀图片状态 有效 状态
            end;
        end
        else                                                     //中间斗卸料门 输出 无效
        begin
            if AggrMidHopperDschValveImgState[1] <> CntMdHopDshValImgIsInvalie then    //1#中间斗卸料阀图片状态 非无效 状态
            begin
                DSpAggrMidHopperDschValveImgNewState(1, CntMdHopDshValImgIsInvalie);   //1#中间斗卸料阀图片状态 无效 状态
            end;
        end;

        //卸料振动器
        if AggregateMidBinInfo[1].VibraValid then //卸料振动器 使用 状态
        begin
            if AggrMidHopperStateInInstru and (1 shl 9) <> 0 then    //中间斗卸料振动器 输出 有效
            begin
                if AggrMidHopperDschVibraImgState[1] <> CntMdHopDshVibraImgIsValid then    //中间斗卸料 振动器图片 非有效状态
                begin
                    DspAggrMidBInDschVibraImgNewState(1, CntMdHopDshVibraImgIsValid);
                end;
            end
            else                                                     //中间斗卸料振动器 输出 无效
            begin
                if AggrMidHopperDschVibraImgState[1] <> CntMdHopDshVibraImgIsInvalie then    //中间斗卸料 振动器图片 非无效状态
                begin
                     DspAggrMidBInDschVibraImgNewState(1, CntMdHopDshVibraImgIsInvalie);
                end;
            end;
        end;

        //限位检查
        if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then    //骨料中间仓 卸料阀输出 有效
        begin
            //卸料门开状态下的 开门限位
            if AggregateMidBinInfo[1].OpenLmtValid then    //骨料中间仓关限 有效
            begin
                 if AggrMidHopperStateInInstru and (1 shl 0) <> 0 then    //开限有效
                 begin
                     if AggrMdHopperDschValOpLmtImgState[1] <> CtMdHopDschValLmtImgIsValid then  //中间斗卸料门 限位图片 非有效
                     begin
                         DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsOpen, CtMdHopDschValLmtImgIsValid); //更新中间斗卸料门 开限图片 为 有效状态
                     end
                 end
                 else                                                 //开限无效
                 begin
                     if AggrMdHopperDschValOpLmtImgState[1] <> CtMdHopDschValLmtImgIsValSpl then  //中间斗卸料门 限位图片 非有效闪烁
                     begin
                         DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsOpen, CtMdHopDschValLmtImgIsValSpl); //更新中间斗卸料门 开限图片 我有效闪烁状态
                     end;
                 end;
            end;

            //卸料门开状态下的 关门限位
            if AggregateMidBinInfo[1].CloseLmtValid then
            begin
                if AggrMidHopperStateInInstru and (1 shl 1) <> 0 then    //关限有效
                begin
                    if AggrMdHopperDschValClLmtImgState[1] <> CtMdHopDschValLmtImgIsValSpl then  //中间斗卸料门 限位图片 非有效闪烁
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsClose, CtMdHopDschValLmtImgIsValSpl);
                    end;
                end
                else
                begin
                    if AggrMdHopperDschValClLmtImgState[1] <> CtMdHopDschValLmtImgIsInvalid then //中间斗卸料门 限位图片 非无效
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsClose, CtMdHopDschValLmtImgIsInvalid);
                    end;
                end;
            end;
        end
        else                                                    //骨料中间仓 卸料阀输出 无效
        begin
            //卸料门关闭状态下的 开门限位
            if AggregateMidBinInfo[1].OpenLmtValid then    //骨料中间仓关限 有效
            begin
                if AggrMidHopperStateInInstru and (1 shl 0) <> 0 then    //开限有效
                begin
                    if AggrMdHopperDschValOpLmtImgState[1] <> CtMdHopDschValLmtImgIsInvSpl then  //中间斗卸料门 限位图片 非无效闪烁
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsOpen, CtMdHopDschValLmtImgIsInvSpl); //更新中间斗卸料门 开限图片 为 无效闪烁状态
                    end;
                end
                else
                begin
                    if AggrMdHopperDschValOpLmtImgState[1] <> CtMdHopDschValLmtImgIsInvalid then //中间斗卸料门 限位图片 非无效
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsOpen, CtMdHopDschValLmtImgIsInvalid); //更新中间斗卸料门 开限图片 为 无效状态
                    end;
                end;
            end;

            //卸料门关闭状态下的 关门限位
            if AggregateMidBinInfo[1].CloseLmtValid then
            begin
                if AggrMidHopperStateInInstru and (1 shl 1) <> 0 then    //关限有效
                begin
                    if AggrMdHopperDschValClLmtImgState[1] <> CtMdHopDschValLmtImgIsValid then  //中间斗卸料门 限位图片 非有效
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsClose, CtMdHopDschValLmtImgIsValid);
                    end;
                end
                else
                begin
                    if AggrMdHopperDschValClLmtImgState[1] <> CtMdHopDschValLmtImgIsInvSpl then  //中间斗卸料门 限位图片 非无效闪烁
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsClose, CtMdHopDschValLmtImgIsInvSpl);
                    end;
                end;
            end;
        end;

        //中间仓是否有料检查
        if AggrMidHopperStateInInstru and (1 shl 3) <> 0 then    //检查骨料中间仓，提升斗是否未卸料
        begin
            if not MidBinIsFull[1] then
            begin
                ImgMidBinFull[1].Visible := True;
                MidBinIsFull[1] := True;
            end;
        end
        else
        begin
            if MidBinIsFull[1] then
            begin
                ImgMidBinFull[1].Visible := False;
                MidBinIsFull[1] := False;
            end;
        end;

        //卸料计时器
        LabAggrMidBinDschTmr[1].Caption := Inttostr(AggrMidBinDschTmrInInstru);
        //生产计数器
        LabAggrMIdBinLdCounter[1].Caption := IntToStr(AggrLoadCounterInInstru);
    end;
end;

procedure TFrmMain.MixerFlashDsp();    //搅拌机动画显示
begin
    {搅拌机运行动画显示}
    if MixerStateInInstru and (1 shl 3) <> 0 then    //搅拌机运行
    begin
        if MixerStateInInstru and (1 shl 4) <> 0 then    //搅拌机有料
        begin
            if MixerFalshState[1] <> CtMxrFlashStIsFullRun then    //搅拌机动画 满运行
            begin
                DspMixerFlashNewState(1, CtMxrFlashStIsFullRun);
                ProdWtPieceInDbEn := True;
            end;
        end
        else    //空转
        begin
            if MixerFalshState[1] <> CtMxrFlashStIsEmptyRun  then    //搅拌机动画 空运行
            begin
                DspMixerFlashNewState(1, CtMxrFlashStIsEmptyRun);
            end;
        end;    
    end
    else    //搅拌机停止
    begin
        if MixerStateInInstru and (1 shl 4) <> 0 then    //搅拌机有料
        begin
            if MixerFalshState[1] <> CtMxrFlashStIsFullStop then;    //搅拌机动画 满停
            begin
                DspMixerFlashNewState(1, CtMxrFlashStIsFullStop);
                ProdWtPieceInDbEn := True;
            end;
        end
        else    //空
        begin
            if MixerFalshState[1] <> CtMxrFlashStIsEmptyStop then    //搅拌机动画 空停
            begin
                DspMixerFlashNewState(1, CtMxrFlashStIsEmptyStop);
            end;
        end;
    end;

    {搅拌机卸料门 开门按钮 状态}
    if MixerStateInInstru and (1 shl 5) <> 0 then    //搅拌机卸料门 开门信号 有效
    begin
        if BtnMxrDschValveOPState[1] <> CtBtnMxrDschValveOpStIsValid then    //搅拌机卸料门 开门按钮状态 为 非有效
        begin
            DSpBtnMixerDschValveOPenNewState(1, CtBtnMxrDschValveOpStIsValid );
        end;
    end
    else
    begin
        if BtnMxrDschValveOPState[1] <> CtBtnMxrDschValveOpStIsInvalid then    //搅拌机卸料门 开门按钮状态 为 非无效
        begin
            DSpBtnMixerDschValveOPenNewState(1, CtBtnMxrDschValveOpStIsInvalid);
        end;
    end;

    {搅拌机卸料门 关门按钮 状态}
    if MixerStateInInstru and (1 shl 6) <> 0 then    //搅拌机卸料门 开门信号 有效
    begin
        if BtnMxrDschValveClState[1] <> CtBtnMxrDschValveClStIsValid then    //搅拌机卸料门 关门按钮状态 为 非有效
        begin
            DspBtnMixerDschValveCloseNewState(1, CtBtnMxrDschValveClStIsValid);
        end;
    end
    else
    begin
        if BtnMxrDschValveClState[1] <> CtBtnMxrDschValveClStIsInvalid then    //搅拌机卸料门 关门按钮状态 为 非无效
        begin
            DspBtnMixerDschValveCloseNewState(1, CtBtnMxrDschValveClStIsInvalid);
        end;
    end;

    {搅拌机卸料门 状态}
    if MixerStateInInstru and (1 shl 0) <> 0 then     //搅拌机卸料门 开门限位 有效
    begin
        if MixerStateInInstru and $0006 = 0 then    //搅拌机卸料阀 半开门限位、关门限位 都无效——门开状态
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsOpen then    //搅拌机卸料门 状态  非开
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsOpen);
            end;
        end
        else    //至少有一个有效——卸料门限位故障
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsAlarm then;    //搅拌机卸料门 状态   非报警
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsAlarm);
            end;
        end;
    end
    else if MixerStateInInstru and (1 shl 1) <> 0 then    //搅拌机卸料门 关门限位 有效
    begin
        if MixerStateInInstru and $0005 = 0 then    //搅拌机 开门、半开门 限位无效 ——关门状态
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsClose then    //搅拌机卸料门 状态  非关
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsClose);
            end;
        end
        else    //至少有一个限位有效——报警状态
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsAlarm then;    //搅拌机卸料门 状态   非报警
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsAlarm);
            end;
        end;
    end
    else if MixerStateInInstru and (1shl 2) <> 0 then     //搅拌机卸料门 半开门限位 有效
    begin
        if MixerStateInInstru and $0003 = 0 then    //搅拌机卸料门 开限、关限 都无效——半开门
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsHalfOpen then    //搅拌机卸料门 状态  非半开
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsHalfOpen);
            end;
        end
        else    //至少有一个限位有效——故障状态
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsAlarm then;    //搅拌机卸料门 状态   非报警
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsAlarm);
            end;
        end;
    end
    else    //三个卸料门限位都无效
    begin
        if MixerDschValveImgState[1] <> CtMxrDschValStIsAlarm then;    //搅拌机卸料门 状态   非报警
        begin
            DspMixerDschValveImgNewState(1, CtMxrDschValStIsAlarm);
        end;
    end;

    //搅拌机计时器
    if ( MixerMixingTmrInInstu = 0) or ( (MixerStateInInstru and (1 shl 0)) <> 0 ) then    //搅拌计时器等于0 或 开限无效
        LabMixerDschTmr[1].Caption := IntToStr(MixerDschTmrInInstru)    //搅拌机卸料计时器
    else
        LabMixerDschTmr[1].Caption := IntToStr(MixerMixingTmrInInstu);     // 搅拌机搅拌计时器

    //搅拌机生产盘数计数器
    LabMixerProdCounter[1].Caption := IntToStr(MixerProdCounterInInstru);

end;

procedure TFrmMain.DspProdControlBtnState();    //生产控制按钮状态显示
begin
    if InstrumentState and (1 shl 6) <> 0 then     //初始状态标识有效
    begin
          //添加一盘 按钮
          if BtnIncProdSetCountState <> BtnProdSetCountStIsDisable then    //生产盘数按钮 非无效 状态
          begin
              BtnIncProdSetCount.Enabled := False;
              BtnIncProdSetCountState := BtnProdSetCountStIsDisable;
          end;
          //减少一盘 按钮
          if BtnDecProdSetCountState <> BtnProdSetCountStIsDisable then    //生产盘数按钮 非无效 状态
          begin
              BtnDecProdSetCount.Enabled := False;
              BtnDecProdSetCountState := BtnProdSetCountStIsDisable;
          end;
          //生产暂停按钮
          if BtnProdPauseEnableState <> CtBtnProdPauseEnStIsFalse then    //生产暂停按钮 Enable值 非False
          begin
              cxBtnProdPause.Enabled := False;
              BtnProdPauseEnableState := CtBtnProdPauseEnStIsFalse ;
          end;
          if BtnProdPauseCaptionState <> CtBtnProdPauseCpIsPause then    //生产暂停按钮 Caption 暂停生产 状态
          begin
              cxBtnProdPause.Caption := '暂停生产';
              BtnProdPauseCaptionState := CtBtnProdPauseCpIsPause  ;
          end;
          //启动生产按钮
          if BtnProdStartCaptionState <> CtBtnProdStatCpIsStart then    //启动生产按钮 Caption 为 非启动生产 状态
          begin
              BtnStartProd.Caption := '启动生产';
               BtnProdStartCaptionState := CtBtnProdStatCpIsStart;
          end;
    end
    else if InstrumentState and (1 shl 5) <> 0 then     //生产暂停状态 标识 有效
    begin
        //添加一盘 按钮
        if BtnIncProdSetCountState <> BtnProdSetCountStIsEnbale then    //生产盘数按钮 非有效 状态
        begin
            BtnIncProdSetCount.Enabled := True;
            BtnIncProdSetCountState := BtnProdSetCountStIsEnbale ;
        end;
        //减少一盘 按钮
        if BtnDecProdSetCountState <> BtnProdSetCountStIsEnbale then    //生产盘数按钮 非有效 状态
        begin
            BtnDecProdSetCount.Enabled := True;
            BtnDecProdSetCountState := BtnProdSetCountStIsEnbale;
        end;
        //生产暂停按钮
        if BtnProdPauseEnableState <> CtBtnProdPauseEnStIsTrue then    //生产暂停按钮 Enable 非True值
        begin
            cxBtnProdPause.Enabled := True;
            BtnProdPauseEnableState := CtBtnProdPauseEnStIsTrue ;
        end;
        if BtnProdPauseCaptionState <> CtBtnProdPauseCaIsRestart then    //生产暂停按钮 Caption 非恢复生产 状态
        begin
            cxBtnProdPause.Caption := '恢复生产';
            BtnProdPauseCaptionState := CtBtnProdPauseCaIsRestart;
        end;
        //启动生产按钮
        if BtnProdStartCaptionState <> CtBtnProdStatCpIsEnd then    //启动生产按钮 Caption 为 非结束生产 状态
        begin
            BtnStartProd.Caption := '停止生产';
            BtnProdStartCaptionState := CtBtnProdStatCpIsEnd ;
        end;
    end
    else if InstrumentState and (1 shl 4) <> 0 then     //生产进行中状态 标识 有效
    begin
        //添加一盘 按钮
        if BtnIncProdSetCountState <> BtnProdSetCountStIsEnbale then    //生产盘数按钮 非有效 状态
        begin
            BtnIncProdSetCount.Enabled := True;
            BtnIncProdSetCountState := BtnProdSetCountStIsEnbale ;
        end;
        //减少一盘 按钮
        if BtnDecProdSetCountState <> BtnProdSetCountStIsEnbale then    //生产盘数按钮 非有效 状态
        begin
            BtnDecProdSetCount.Enabled := True;
            BtnDecProdSetCountState := BtnProdSetCountStIsEnbale;
        end;
        //生产暂停按钮
        if BtnProdPauseEnableState <> CtBtnProdPauseEnStIsTrue then    //生产暂停按钮 Enable 非True值
        begin
            cxBtnProdPause.Enabled := True;
            BtnProdPauseEnableState := CtBtnProdPauseEnStIsTrue ;
        end;
        if BtnProdPauseCaptionState <> CtBtnProdPauseCpIsPause then    //生产暂停按钮 Caption 暂停生产 状态
        begin
            cxBtnProdPause.Caption := '暂停生产' ;
            BtnProdPauseCaptionState := CtBtnProdPauseCpIsPause  ;
        end;
        //启动生产按钮
        if BtnProdStartCaptionState <> CtBtnProdStatCpIsEnd then    //启动生产按钮 Caption 为 非结束生产 状态
        begin
            BtnStartProd.Caption := '停止生产';
            BtnProdStartCaptionState := CtBtnProdStatCpIsEnd ;
        end;
    end;

    //禁止骨卸 按钮
    if InstrumentState and (1 shl 8) <> 0 then    //禁止骨料卸料 标识有效
    begin
        if BtnAggrDisaDschState <> CntBtnCheckStateIsTrue then   //按钮状态 为 非勾选 状态
        begin
            cxBtnAggreDschDsa.Glyph := Nil;
            ImageList1.GetBitmap(1,cxBtnAggreDschDsa.Glyph) ;
            BtnAggrDisaDschState := CntBtnCheckStateIsTrue ;
        end
    end
    else    //非禁止骨卸 状态
    begin
        if BtnAggrDisaDschState <> CntBtnCheckStateIsFalse then   //按钮状态 为 非无勾选 状态
        begin
            cxBtnAggreDschDsa.Glyph := Nil;
            ImageList1.GetBitmap(0,cxBtnAggreDschDsa.Glyph) ;
            BtnAggrDisaDschState := CntBtnCheckStateIsFalse ;
        end;
    end;
    //禁止投料 按钮
    if InstrumentState and ( 1 shl 9 ) <> 0 then    //禁止投料 标识有效
    begin
        if BtnMixerDisaLoadInState <> CntBtnCheckStateIsTrue then  //禁止投料 按钮 为 非勾选 状态
        begin
            cxBtnMixerLoadDsa.Glyph := Nil;
            ImageList1.GetBitmap(1,cxBtnMixerLoadDsa.Glyph) ;
            BtnMixerDisaLoadInState := CntBtnCheckStateIsTrue;
        end;
    end
    else    //禁止投料 标识无效
    begin
        if BtnMixerDisaLoadInState <> CntBtnCheckStateIsFalse then    //禁止投料 按钮 为 非无勾选 状态
        begin
            cxBtnMixerLoadDsa.Glyph := Nil;
            ImageList1.GetBitmap(0,cxBtnMixerLoadDsa.Glyph) ;
            BtnMixerDisaLoadInState := CntBtnCheckStateIsFalse ;
        end;
    end;
    //禁止卸砼 按钮
    if InstrumentState and ( 1 shl 10 ) <> 0 then    //禁止卸砼 标识有效
    begin
        if BtnMixerDisaDschState <> CntBtnCheckStateIsTrue then    //禁止卸砼 按钮 为 非勾选 状态
        begin
            cxBtnMixerDschDsa.Glyph := Nil;
            ImageList1.GetBitmap(1, cxBtnMixerDschDsa.Glyph);
            BtnMixerDisaDschState := CntBtnCheckStateIsTrue;
        end;
    end
    else    //禁止卸砼 标识无效
    begin
        if BtnMixerDisaDschState <> CntBtnCheckStateIsFalse then     //禁止卸砼 按钮 为 非无勾选 状态
        begin
            cxBtnMixerDschDsa.Glyph := Nil;
            ImageList1.GetBitmap(0, cxBtnMixerDschDsa.Glyph);
            BtnMixerDisaDschState := CntBtnCheckStateIsFalse;
        end;
    end;
    //自动响铃 按钮
    if AutoRingState and $0001 <> 0 then    //自动响铃
    begin
        if BtnRingState <> CntBtnCheckStateIsTrue then    //自动响铃按钮 非勾选 状态
        begin
            cxBtnRing.Glyph := Nil;
            ImageList1.GetBitmap(1, cxBtnRing.Glyph);
            BtnRingState := CntBtnCheckStateIsTrue;
        end;
    end
    else    //非自动响铃
    begin
        if BtnRingState <> CntBtnCheckStateIsFalse then    //自动响铃按钮 非无勾选 状态
        begin
            cxBtnRing.Glyph := Nil;
            ImageList1.GetBitmap(0, cxBtnRing.Glyph);
            BtnRingState := CntBtnCheckStateIsFalse;
        end;
    end;

end;

procedure TFrmMain.TmrMscomStateDspTimer(Sender: TObject);
begin
   TmrMscomStateDsp.Enabled := False;
    
    {通讯状态显示}
    case MscommStateInFrmMain of

        CntMscommCmdIsInvalid :    //无效
        begin

        end;

        CntMscommCmdIsCalZero :    //通讯命令是校零
        begin
            if Instruction1ReceiveBuf[MscommReceiveBufPfInFrmMain].Active then
            begin
                if Instruction1ReceiveBuf[MscommReceiveBufPfInFrmMain].ReceiveCmd = $10 then
                begin
                    MscommStateInFrmMain := CntMscommCmdIsInvalid;
                    Showmessage('校零成功');
                end;
            end
            else
            begin
                MscommTmrInFrmMain := MscommTmrInFrmMain + StatusDspTmr.Interval;
                if MscommTmrInFrmMain > 3000 then
                begin
                    Showmessage('校零点失败');
                    MscommStateInFrmMain := CntMscommCmdIsInvalid;
                end
                else
                begin
                    TmrMscomStateDsp.Enabled := True;
                end;
            end;
        end;

        CntMscommCmdIsCalValue :    //称值校准
        begin
            if Instruction1ReceiveBuf[MscommReceiveBufPfInFrmMain].Active then
            begin
                if Instruction1ReceiveBuf[MscommReceiveBufPfInFrmMain].ReceiveCmd = $10 then
                begin
                    MscommStateInFrmMain := CntMscommCmdIsInvalid;
                    FrmWeigherCalValue.Close;
                    Showmessage('称值校准成功');
                end;
            end
            else
            begin
                MscommTmrInFrmMain := MscommTmrInFrmMain + StatusDspTmr.Interval;
                if MscommTmrInFrmMain > 3000 then
                begin
                    Showmessage('称值校准失败');
                    MscommStateInFrmMain := CntMscommCmdIsInvalid;
                end
                else
                begin
                    TmrMscomStateDsp.Enabled := True;
                end;
            end;
        end;
    end;
end;

procedure TFrmMain.NPerssonMangementClick(Sender: TObject);
begin
    if not FrmPersonnelMangementCrt then
    begin
        FrmPersonnelMangement := TFrmPersonnelMangement.Create(Nil);
        FrmPersonnelMangementCrt := True;
    end;
    FrmPersonnelMangement.ShowModal;
end;

procedure TFrmMain.m1Click(Sender: TObject);
begin
    if not FrmSetPassWordCrt then
    begin
        FrmSetPassWord := TFrmSetPassWord.Create(Nil);
        FrmSetPassWordCrt := True;
    end;
    FrmEditMode := FrmEdtMdIsSetPasdForPerson ;    //人员修改密码
    FrmSetPassWord.ShowModal ;
end;

procedure TFrmMain.NMidBinParaClick(Sender: TObject);
begin
    if not FrmAggrConceyorHopperAttrCrt then
    begin
        FrmAggrConceyorHopperAttr := TFrmAggrConceyorHopperAttr.Create(Nil);
        FrmAggrConceyorHopperAttrCrt := True;
    end;
    FrmAggrConceyorHopperAttr.ShowModal;
end;

procedure TFrmMain.s1Click(Sender: TObject);
begin
    if not FrmMixParaCrt then
    begin
        FrmMixPara := TFrmMixPara.Create(Nil);
        FrmMixParaCrt := True;
    end;
    FrmMixPara.ShowModal;
end;

procedure TFrmMain.MixerImgContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
Var
    Img : TImage;
begin
    Img := TImage(Sender);
    PmSltMixerId := Img.Tag;
end;

procedure TFrmMain.SystemTmrTimer(Sender: TObject);
begin
    if SystemRunDelayTmr > 0 then
    begin
        SystemRunDelayTmr := SystemRunDelayTmr - CntSystemTmrInterval ;
    end;

    SoftAuthorCheckIntervai := SoftAuthorCheckIntervai + CntSystemTmrInterval;
    if SoftAuthorCheckIntervai > 4000000 then SoftAuthorCheckIntervai := 4000000;
    if (InstrumentState and (1 shl 6) <> 0 ) and (SoftRunState <> CntSoftIniInstrumentState) then
    begin
        if SoftAuthorCheckIntervai >= 3600000 then
        begin
            DspSoftAuthorInfo();    //显示软件授权
            SoftAuthorCheckIntervai := 0;
        end;
    end;
end;

procedure TFrmMain.cxBtnMixerDischOPenClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if MixerStateInInstru and (1 shl 5) = 0 then    //搅拌机卸料门 开门信号 无效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0004 ); //关闭搅拌卸料门 关门信号
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0001 ); //打开搅拌卸料门 开门信号
    end
    else
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0003 ); //关闭搅拌卸料门 开门信号
    end;
end;

procedure TFrmMain.cxBtnMixerDischCloseClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if MixerStateInInstru and (1 shl 6) = 0 then    //搅拌机卸料门 关门信号 无效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0003);    //关闭搅拌机卸料门 开门信号
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0002);    //打开搅拌机卸料门 关门信号
    end
    else
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0004)    //关闭搅拌机卸料门 关门信号
    end;
end;

procedure TFrmMain.cxBtnAggreDschDsaClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if InstrumentState and ( 1 shl 8 ) = 0 then     //禁止骨卸 标识无效
    begin
         WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0005)    //禁止骨卸
    end
    else    //禁止骨卸 标识有效
    begin
         WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0006)    //允许骨卸
    end;
end;

procedure TFrmMain.cxBtnMixerLoadDsaClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if InstrumentState and ( 1 shl 9 ) = 0 then     //禁止投料 标识无效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0007)    //禁止投料
    end
    else    //禁止投料 标识有效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0008)    //允许投料
    end;
end;

procedure TFrmMain.cxBtnMixerDschDsaClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if InstrumentState and ( 1 shl 10 ) = 0 then     //禁止卸砼 标识无效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0009);    //禁止卸砼
    end
    else    //禁止卸砼 标识有效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $000A);    //允许卸砼
    end;
end;

procedure TFrmMain.cxBtnRingClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
    NewRingState : Integer;
begin
    if AutoRingState and $0001 = 0 then    //自动响铃 标识有效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0710, $0001);    //允许自动响铃
        NewRingState := 1;
    end
    else    //自动响铃 标识无效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0710, $0000);    //禁止自动响铃
        NewRingState := 0;
    end;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.SQL.Text := 'update Checker set Checked=' + '''' + inttostr(NewRingState) + '''' + ' where Equip=' + '''' + 'RingAuto' + '''';
        ADOquery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Showmessage('记忆失败');
    end;
end;

procedure TFrmMain.cxBtnProdPauseClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer ;
begin
    if InstrumentState and ( 1 shl 4 ) <> 0 then    //生产进行中 标识有效
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0003);    //暂停生产
    end
    else if InstrumentState and ( 1 shl 5 ) <> 0 then    //生产暂停站 标识有效
    begin
       WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $000B);    //恢复生产
    end;
end;

procedure TFrmMain.BtnStartProdClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer ;
    ProdSelRow : Integer;
    ExResult : Integer;
    i : Integer;

    AuthorRemainDays : Double;
    HaspKeyErrInfo   : String;
begin
    if InstrumentState and (1 shl 6) <> 0 then     //初始状态标识有效，启动生产
    begin
        if MixerStateInInstru and (1 shl 3) = 0 then //检测搅拌机启动与否
        begin
            Showmessage('请先启动搅拌机!');
            exit;
        end;

        if MixerStateInInstru and (1 shl 4) <> 0 then    //搅拌机有料
        begin
            Showmessage('搅拌机内有料，请手动卸空，再重新启动');
            exit;
        end;

        if AggrMidHopperStateInInstru and (1 shl 3) <> 0 then    //检查骨料中间仓，提升斗是否未卸料
        begin
            case AggregateConveyorMode of    //骨料输送方式
                CntAggregateConveyorBelt     :      //皮带
                begin
                    Showmessage('骨料中间仓未卸料，请卸空中间仓，重新启动生产');
                end;

                CntAggregateConveyorElevator :      //提升机
                begin
                    Showmessage('骨料提升斗未卸料，请卸空提升斗，重新启动生产');
                end;
            end;
            exit;
        end;

        if GetAuthorizedRemainingDays(EndRunDate, AuthorRemainDays, HaspKeyErrInfo) = 0 then
        begin
            if AuthorRemainDays <= 3 then
            begin
                if AuthorRemainDays > 0 then
                begin
                    Showmessage('软件授权剩余' + Format('%.1f' , [AuthorRemainDays]) + '天，请及时联系您的设备供应商，以免影响正常生产');
                end
                else
                begin
                    Showmessage('软件授权已到期，请联系您的设备供应商，获取新的授权');
                    exit;
                end;
            end;
        end
        else
        begin
            Showmessage('获取软件授权日期失败，启动失败! ' + HaspKeyErrInfo);
        end;

        ProdWtPieceInDbEn := False;
        
        PresStartProd.Visible := True;

        ProdNoticeInfoRdPt := 1;             //生产派车单信息读指针
        ProdNoticeInfoWtPt := 1;             //生产派车单信息写指针

        ProdStartRow := AdvStrGdProdNotice.Row;

        ProdStart(ProdStartRow) ;

        //------------------------------------------------------------------------------------------


//        AdvStrGdProdNotice.ClearCols(1,1);
//        AdvStrGdProdNotice.AddDataImage(1, ProdStartRow, 0, haLeft, vaTop);    //标识该派车单被选中

        {任务信息初始化}
//        IniProdNoticeInfo(ProdNoticeInfoWtPt);

        {称配料信息初始化}
//        IniWeigherLoadInfoForProdStart();

        {配料值信息初始化}
//        IniSiloLoadInfo();

        {显示任务信息}
//        DspNoticeInfo( ProdStartRow );

        {赋值任务信息}
//        ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_Code := Trim(AdvStrGdProdNotice.cells[3, ProdStartRow]) ;
//        ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID := StrToInt(Trim(AdvStrGdProdNotice.cells[2, ProdStartRow]));

        {获取配比，发送到对应的仪表}
//        ExResult := GetProdRecipeToSiloRecipe( ProdStartRow );

        {任务分盘}
//        if ExResult = 0 then
//        begin
//            ExResult := TaskBatchsProg( ProdStartRow );
//        end;

        {配料目标值}
//        if ExResult = 0 then
//        begin
//            ExResult := GetStorageLoadTargetForProdStart();    //启动生产时获取料仓的配料目标值
//        end;

        {分盘信息显示}
//        DspProdBatchInfoOnFrmMain(ProdNoticeInfoWtPt) ;

        {显示料仓的配料目标值}
//        if ExResult = 0 then
//        begin
//            ExResult := DspStorageLoadTargetInFrmMainForProdStart() ;    //在主界面上显示料仓配料目标值
//        end;

        {仪表配料目标值}
//        if ExResult = 0 then
//        begin
//            ExResult := GetWeigherLoadTargetForProdStart();    //获取称配料目标值
//        end;

//        if Exresult = 0 then
//        begin
//            PresStartProd.Position := 20;
//            ExResult := WriteWghrLoadTargetToInstruForProdStart();    //写称配料目标值到仪表
//        end;

//        if ExResult = 0 then
//        begin
//            StartProdSteps := CtStartProdStepIsWtLdTarget;    //启动生产步骤为写配料目标值
//            TmrStartProd.Enabled := True;    //启动定时器
//            StartProdCmdLng := 0;
//        end
//        else
//        begin
//            PresStartProd.Visible := False;
//        end;

        //------------------------------------------------------------------------
    end
    else    //结束生产
    begin
        if messagebox(getfocus, Pchar('生产进行中，确定要停止生产吗?'), '确认信息', MB_OKCANCEL ) = idOK then
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0002);    //结束生产
        end;
    end;
end;

procedure TFrmMain.ProdStart(ProdRow : Integer) ;     //生产启动
var
    ExResult : Integer;
begin
    AdvStrGdProdNotice.ClearCols(1,1);
    AdvStrGdProdNotice.AddDataImage(1, ProdRow, 0, haLeft, vaTop);    //标识该派车单被选中

    {任务信息初始化}
    IniProdNoticeInfo(ProdNoticeInfoWtPt);

    {称配料信息初始化}
    IniWeigherLoadInfoForProdStart();

    {配料值信息初始化}
    IniSiloLoadInfo();

    {显示任务信息}
    DspNoticeInfo( ProdRow );

    {赋值任务信息}
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_Code := Trim(AdvStrGdProdNotice.cells[3, ProdRow]) ;
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID := StrToInt(Trim(AdvStrGdProdNotice.cells[2, ProdRow]));

    {获取配比，发送到对应的仪表}
    ExResult := GetProdRecipeToSiloRecipe( ProdRow );

    {任务分盘}
    if ExResult = 0 then
    begin
        ExResult := TaskBatchsProg( ProdRow );
    end;

    {配料目标值}
    if ExResult = 0 then
    begin
        ExResult := GetStorageLoadTargetForProdStart();    //启动生产时获取料仓的配料目标值
    end;

    {分盘信息显示}
    DspProdBatchInfoOnFrmMain(ProdNoticeInfoWtPt) ;

    {显示料仓的配料目标值}
    if ExResult = 0 then
    begin
        ExResult := DspStorageLoadTargetInFrmMainForProdStart() ;    //在主界面上显示料仓配料目标值
    end;

    {仪表配料目标值}
    if ExResult = 0 then
    begin
        ExResult := GetWeigherLoadTargetForProdStart();    //获取称配料目标值
    end;

    if Exresult = 0 then
    begin
        PresStartProd.Position := 20;
        ExResult := WriteWghrLoadTargetToInstruForProdStart();    //写称配料目标值到仪表
    end;

    if ExResult = 0 then
    begin
        StartProdSteps := CtStartProdStepIsWtLdTarget;    //启动生产步骤为写配料目标值
        TmrStartProd.Enabled := True;    //启动定时器
        StartProdCmdLng := 0;
    end
    else
    begin
        PresStartProd.Visible := False;
    end;

end;

procedure TFrmMain.IniProdNoticeInfo(ProdNoticeInfoNumber : Integer);    //初始化生产派车单信息
var
    i, k : Integer;
begin
    ProdNoticeInfo[ProdNoticeInfoNumber].LdStorageCounter := 0;    //任务有配料目标值的料仓数量

    for i := 1 to CntStorageCount do
    begin
        ProdNoticeInfo[ProdNoticeInfoNumber].SiloLoadEn[i]        := False;
        ProdNoticeInfo[ProdNoticeInfoNumber].SiloLdNumInNotice[i] := 0;

        {料仓配料配方信息}
        for k:=1 to CntProdStoraLdRceQueueLen do
        begin
            ProdNoticeInfo[ProdNoticeInfoNumber].ProdStoraLdRecipe[i][k].EndBatchNumber := 0;      //料仓配方值变更起始盘号
            ProdNoticeInfo[ProdNoticeInfoNumber].ProdStoraLdRecipe[i][k].LoadRecipe       := 0;    //料仓配方新值
        end;
        ProdNoticeInfo[ProdNoticeInfoNumber].ProdStoraLdRecWtPt[i] := 1;    //料仓配比值缓冲区写指针
        ProdNoticeInfo[ProdNoticeInfoNumber].ProdStoraLdRecRdPt[i] := 1;    //料仓配比值缓冲区读指针

        {料仓配料目标值信息}
        for k:=1 to CntProdStoraLdRceQueueLen do
        begin
            ProdNoticeInfo[ProdNoticeInfoNumber].ProdStorageLdTarget[i][k].EndBatchNumber := 0;    //料仓配料目标值变更起始盘次
            ProdNoticeInfo[ProdNoticeInfoNumber].ProdStorageLdTarget[i][k].LoadTarget       := 0;    //料仓新的配料目标值
        end;
        ProdNoticeInfo[ProdNoticeInfoNumber].ProdStorageLdTargWtPt[i] := 1;  //生产料仓配料目标值队列写指针
        ProdNoticeInfo[ProdNoticeInfoNumber].ProdStorageLdTargRdPt[i] := 1;  //生产料仓配料目标值队列读指针

        {料仓原料含水率信息}
        for k:=1 to CntStorMatWatFulQueueLen do
        begin
            ProdNoticeInfo[ProdNoticeInfoNumber].StorageMaterialWatFul[i][k].BeginBatchNumber := 0;     //料仓原料含水率值变化起始盘次
            ProdNoticeInfo[ProdNoticeInfoNumber].StorageMaterialWatFul[i][k].WatFul           := 0.0;   //料仓原料含水率值新值
        end;
        ProdNoticeInfo[ProdNoticeInfoNumber].StorMatWatFulWtPt[k] := 1;    //料仓含水率值写指针
        ProdNoticeInfo[ProdNoticeInfoNumber].StorMatWatFulRdPt[k] := 1;    //料仓含水率值读指针

        ProdNoticeInfo[ProdNoticeInfoNumber].WtDbPieceId := 0;           //数据库已记录盘次
    end;
end;

procedure TFrmMain.IniWeigherLoadInfoForProdStart();    //生产启动时，仪表配料信息初始化
var
    i, k : Integer;
begin
    for i:=1 to WeigherCount do    //仪表编号
    begin
         WeigherLoadInfo[i].RecordBatchCount := 0;
         WeigherLoadInfo[i].WtLoadValuePt := 1;
         WeigherLoadInfo[i].RdLoadValuePt := 1;

         WeigherLoadInfo[i].LoadFactDsp := False;
         WeigherLoadInfo[i].RdFactLoadEna := False;
         WeigherLoadInfo[i].Rd2ndLoadEna  := False;    //读扣称配料值使能位
         WeigherLoadInfo[i].RdFactWaitPt  := 0;

         WeigherLoadInfo[i].LoadTarget[1] := 0;
         WeigherLoadInfo[i].LoadTarget[2] := 0;
         WeigherLoadInfo[i].LoadTarget[3] := 0;
         WeigherLoadInfo[i].LoadTarget[4] := 0;

         //for k:=1 to CntLoadValueQueueLen do    //队列编号
         //begin
             

         //    WeigherLoadInfo[i].LoadFact[k][1] := 0;
         //    WeigherLoadInfo[i].LoadFact[k][2] := 0;
         //    WeigherLoadInfo[i].LoadFact[k][3] := 0;
         //    WeigherLoadInfo[i].LoadFact[k][4] := 0;
         //end;
    end;
end;

procedure TFrmMain.IniSiloLoadInfo();                                           //初始化配料信息
var
    i, k : Integer;
begin
    for i:=1 to CntStorageCount do
    begin
        SiloLoadInfo[i].WtPt := 1;
        SiloLoadInfo[i].RdPt := 1;
        for k:=1 to 4 do
        begin
            SiloLoadInfo[i].LoadFact[k]    := 0.0;
            SiloLoadInfo[i].ErrorIsOver[k] := CntLdErrIsNone;    //无超差
        end;
    end;
end;

Function TFrmMain.GetProdRecipeToSiloRecipe(TaskGrdRow : Integer) : Integer;    //获取料仓配方值
//返回值0 获取成功
var
    RecipeIdInInfoDb : Integer;
    TestStr : String;
    i,k : Integer;
    QueueWtPt : Integer;
begin
    Result := 0;

    ProdNoticeInfo[ProdNoticeInfoWtPt].LdStorageCounter := 0;
    for i:=1 to CntStorageCount do
    begin
        //生产料仓配方
        ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLoadEn[i] := False;
        ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLdNumInNotice[i] := 0;
        for k:=1 to CntProdStoraLdRceQueueLen do
        begin
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][k].EndBatchNumber := 0;
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][k].LoadRecipe := 0.0;
        end;
    end;

    {初始化任务的料仓配料值}
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdRecipe_Code := Trim( AdvStrGdProdNotice.Cells[4, TaskGrdRow] );    //生产配比
    if ProdNoticeInfo[ProdNoticeInfoWtPt].ProdRecipe_Code = '' then
    begin
        Showmessage('配比信息为空');
        Result := 1;
    end
    else
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select ID from RecipeInfo where Code ='
                            + '''' + ProdNoticeInfo[ProdNoticeInfoWtPt].ProdRecipe_Code + '''';
        ADOQuery1.Open;
        if ADOQuery1.Eof then
        begin
            ADOQuery1.Close;
            Result := 2;
            Showmessage('无效的配比编号');
            exit;
        end
        else
        begin
            RecipeIdInInfoDb := ADOQuery1.FieldByName('ID').AsInteger;
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'select * from RecipeLst where RecipeInfoID=' + inttostr(RecipeIdInInfoDb);
            ADOQuery1.Open;

            while not ADOQuery1.Eof do
            begin
                for i:=1 to CntStorageCount do
                begin
                    if StorageInfo[i].MaterId = ADOQuery1.FieldByName('MaterId').AsInteger then    //匹配料仓
                    begin
                        break;
                    end;
                end;
                if i <= CntStorageCount then
                begin
                    QueueWtPt := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecWtPt[i];
                    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][QueueWtPt].EndBatchNumber := 1;
                    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][QueueWtPt].LoadRecipe := ADOQuery1.FieldByName('Amount').AsFloat;
                    if ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][QueueWtPt].LoadRecipe > 0.01 then
                    begin
                        ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLoadEn[i] := True;
                        ProdNoticeInfo[ProdNoticeInfoWtPt].LdStorageCounter := ProdNoticeInfo[ProdNoticeInfoWtPt].LdStorageCounter +1;
                        ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLdNumInNotice[i] := ProdNoticeInfo[ProdNoticeInfoWtPt].LdStorageCounter;
                    end;
                end
                else
                begin
                    Showmessage('没有找到与之对应的料仓：' );
                    Result := 3;
                    Break;
                end;
                ADOQuery1.Next;
            end;
        end;
    end;
end;

Function TFrmMain.TaskBatchsProg(TaskGrdRow : Integer) : Integer;    //任务分盘处理
//返回值=0；任务分盘成功
var
    TempProdAmount : Double;
    TempCount : Integer;
    TempBatchAmount : Double;
    TempProdAmountErr : Double;
begin

    Result := 0;

    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount      := 0;    //任务生产方量
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchsCount := 0;    //任务生产盘数
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount := 0;    //任务单盘方量
    
    if Trim(AdvStrGdProdNotice.Cells[6, TaskGrdRow]) <> '' then
    begin
        try
            TempProdAmount := StrToFloat(Trim(AdvStrGdProdNotice.Cells[6, TaskGrdRow]));
            TempProdAmount := roundTo(TempProdAmount, -3);
        except
            Result := 1;
            Exit;
        end;
    end
    else
    begin
        Result := 2;
        exit;
    end;

    if MixerInfo.MaxCap < 0.0001 then
    begin
        Result := 3;
        Showmessage('搅拌机最大容量有误！');
        Exit;
    end;

    TempCount := Trunc(TempProdAmount / MixerInfo.MaxCap);
    if TempCount <= 0 then TempCount := 1;

    TempBatchAmount   := RoundTo(TempProdAmount / TempCount, -3);
    if TempBatchAmount > MixerInfo.MaxCap then TempBatchAmount := MixerInfo.MaxCap;

    TempProdAmountErr := TempProdAmount - TempBatchAmount * TempCount;
    if (TempProdAmountErr >0) and (TempProdAmountErr > 0.01) then
    begin
        TempCount       := TempCount +1;
        TempBatchAmount := RoundTo(TempProdAmount / TempCount, -3);
    end;

    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount      := TempProdAmount;   //生产派车单的生产方量
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchsCount := TempCount;        //生产派车单的生产盘数
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount := TempBatchAmount;  //生产派车单单的单盘方量}

end;

Function TFrmMain.GetStorageLoadTargetForProdStart() : Integer;    //获取料仓的配料目标值
var
    i : Integer;

    TmpStorageMatWatFulWtPt ,
    TmpStorageMatWatFulRdPt : Integer;    //料仓原料含水率队列读取指针
    TmpMatWatFul : Double;                //含水率
    WaterInAggr ,
    WaterSumInAggr: Double;

    TempStorageTarget : Double;
    TmpStorageRecQueueRdPt : Integer;    //料仓配比队列读指针
    TmpStorageRecipe : Double;

    TmpStorLdTargetQueueWtPt : Integer;    //料仓配料目标值队列写指针
begin
    {for i:=1 to CntStorageCount do
    begin
        //StorageLoadTarget[i] := 0.0;
        ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdTarget[i] := 0.0;
    end;

    WaterSumInAggr := 0;
    }
    {计算骨料配料目标值}
    {for i:=1 to CntStorageCount do
    begin
        if ( StorageInfo[i].Enable ) and (StorageInfo[i].Model = CntAggregateStorage) then
        begin
            StorageLoadTarget[i] := StorageLoadRecipe[i] * ProdBatchAmount;
            WaterInAggr :=StorageInfo[i].Moisture * StorageLoadTarget[i] /100;
            WaterSumInAggr := WaterSumInAggr + WaterInAggr;
            StorageLoadTarget[i] := StorageLoadTarget[i] + WaterInAggr;
        end;
    end;
    }
    {计算骨料以外的其它料}
    {for i:=1 to CntStorageCount do
    begin
        if ( StorageInfo[i].Enable ) and (StorageInfo[i].Model <> CntAggregateStorage) then    //非骨料仓
        begin
            if (StorageInfo[i].Model = CntWaterStorage) then    //水仓
            begin
                StorageLoadTarget[i] := StorageLoadRecipe[i] * ProdBatchAmount;
                StorageLoadTarget[i] := StorageLoadTarget[i] - WaterSumInAggr;
                if StorageLoadTarget[i] < 0 then StorageLoadTarget[i] := 0;
            end
            else    //其它仓
            begin
                StorageLoadTarget[i] := StorageLoadRecipe[i] * ProdBatchAmount;
            end;
        end;
    end;}

    //----------------------------------------------------------------------------

    WaterSumInAggr := 0;

    {计算骨料配料目标值}
    for i:=1 to CntStorageCount do
    begin
        if ( StorageInfo[i].Enable ) and (StorageInfo[i].Model = CntAggregateStorage) then    //料仓有效，且是骨料仓
        begin
            TmpStorageRecQueueRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i];
            TmpStorageRecipe := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][TmpStorageRecQueueRdPt].LoadRecipe;    //料仓配比值
            TempStorageTarget := TmpStorageRecipe * ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount;    //计算骨料的干料用量

            TmpStorageMatWatFulWtPt := ProdNoticeInfo[ProdNoticeInfoWtPt].StorMatWatFulWtPt[i];
            ProdNoticeInfo[ProdNoticeInfoWtPt].StorageMaterialWatFul[i][TmpStorageMatWatFulWtPt].BeginBatchNumber := 1;
            ProdNoticeInfo[ProdNoticeInfoWtPt].StorageMaterialWatFul[i][TmpStorageMatWatFulWtPt].WatFul := StorageInfo[i].Moisture;

            TmpStorageMatWatFulRdPt := ProdNoticeInfo[ProdNoticeInfoWtPt].StorMatWatFulRdPt[i];    //料仓原料含水率队列读取指针
            TmpMatWatFul := ProdNoticeInfo[ProdNoticeInfoWtPt].StorageMaterialWatFul[i][TmpStorageMatWatFulRdPt].WatFul;    //原料含水率值
            WaterInAggr := TmpMatWatFul * TempStorageTarget / 100;
            WaterSumInAggr := WaterSumInAggr + WaterInAggr;

            TempStorageTarget := TempStorageTarget + WaterInAggr;

            TmpStorLdTargetQueueWtPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargWtPt[i];
            ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].EndBatchNumber := 1;
            ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].LoadTarget := TempStorageTarget;

        end;
    end;

    {计算骨料以外的其它料}
    for i:=1 to CntStorageCount do
    begin
        if ( StorageInfo[i].Enable ) and (StorageInfo[i].Model <> CntAggregateStorage) then    //非骨料仓
        begin
            if (StorageInfo[i].Model = CntWaterStorage) then    //水仓
            begin
                TmpStorageRecQueueRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i];
                TmpStorageRecipe := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][TmpStorageRecQueueRdPt].LoadRecipe;    //料仓配比值
                TempStorageTarget := TmpStorageRecipe * ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount;    //计算用量

                TempStorageTarget := TempStorageTarget - WaterSumInAggr;

                TmpStorLdTargetQueueWtPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargWtPt[i];
                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].EndBatchNumber := 1;
                if TempStorageTarget < 0 then
                    ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].LoadTarget := 0
                else
                    ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].LoadTarget := TempStorageTarget;
            end
            else    //其它仓
            begin
                TmpStorageRecQueueRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i];
                TmpStorageRecipe := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][TmpStorageRecQueueRdPt].LoadRecipe;    //料仓配比值
                TempStorageTarget := TmpStorageRecipe * ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount;    //计算用量

                TmpStorLdTargetQueueWtPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargWtPt[i];
                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].EndBatchNumber := 1;
                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].LoadTarget := TempStorageTarget;
            end;
        end;
    end;

    Result := 0;
end;

Function TFrmMain.DspProdBatchInfoOnFrmMain(ProdNoticeId : Integer) : Integer;  //主界面上显示生产配料信息
var
    TempBatchCounter : Integer;
    NodRow : Integer;
    i : Integer;
    GrdRow : Integer;
    WghrDecimal : Integer;
begin
    //AdvStrGdProRd.ClearRows();
    //if AdvStrGdProRd.RowCount > 2 then AdvStrGdProRd.RemoveRows(1, AdvStrGdProRd.RowCount -2);
    //AdvStrGdProRd.ClearRows(1,1);

    AdvStrGdProRd.ClearAll;
    IniAdvStrGdProRd();
    
    AdvStrGdProRd.RowCount := ProdNoticeInfo[ProdNoticeId].ProdBatchsCount * (ProdNoticeInfo[ProdNoticeId].LdStorageCounter +1) +1;
    //for i:= 1 to AdvStrGdProRd.RowCount - 1 do
    //begin
    //    AdvStrGdProRd.Rows[i].Clear;
    //end;

    GrdRow := 1;
    TempBatchCounter := 1;
    while TempBatchCounter <= ProdNoticeInfo[ProdNoticeId].ProdBatchsCount do
    begin
        NodRow := GrdRow;
        GrdRow := GrdRow +1;
       
        for i:= 1 to CntStorageCount do
        begin
            if not ProdNoticeInfo[ProdNoticeId].SiloLoadEn[i] then Continue;

            WghrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value ;

            AdvStrGdProRd.Rows[GrdRow].Clear;

            AdvStrGdProRd.AllCells[1, GrdRow] := StorageInfo[i].MaterName;    //材料名称
            AdvStrGdProRd.AllCells[2, GrdRow] := Format( '%.' + inttostr(WghrDecimal) + 'f',
                                                      [ProdNoticeInfo[ProdNoticeId].ProdStoraLdRecipe[i][1].LoadRecipe] );   //配比值
            AdvStrGdProRd.AllCells[3, GrdRow] := Format( '%.' + inttostr(WghrDecimal) + 'f',
                                                      [ProdNoticeInfo[ProdNoticeId].ProdStorageLdTarget[i][1].LoadTarget] );   //配料目标值
            //AdvStrGdProRd.AllCells[4, GrdRow] := Format( '%.' + inttostr(WghrDecimal) + 'f', [0.0] );
            AdvStrGdProRd.AllCells[4, GrdRow] := '0';
            AdvStrGdProRd.AllCells[5, GrdRow] := '0';
            AdvStrGdProRd.AllCells[6, GrdRow] := inttostr(i);
            AdvStrGdProRd.AllCells[7, GrdRow] := '0';
            AdvStrGdProRd.AllCells[8, GrdRow] := inttostr(TempBatchCounter);

            GrdRow := GrdRow + 1;
        end;

        AdvStrGdProRd.Rows[GrdRow].Clear;
        AdvStrGdProRd.AddNode(NodRow, GrdRow - NodRow);
        AdvStrGdProRd.AllCells[1, NodRow] := '第' + inttostr(TempBatchCounter) + '盘';

        TempBatchCounter := TempBatchCounter +1;
    end;

    AdvStrGdProRd.ContractAll;
end;

Function TFrmMain.DspStorageLoadTargetInFrmMainForProdStart() : Integer;        //在主界面上显示料仓配料目标值
var
    WgrDecimal : Integer;
    i : integer;
    TempLdTarget : double;
begin
    {Result := 0;

    for i:=1 to CntStorageCount do
    begin
        if StorageInfo[i].Enable then
        begin
            WgrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;
            StorageLoadTargetLab[i].Caption := format('%.' + inttostr(WgrDecimal) + 'f', [StorageLoadTarget[i]]) ;
        end;
    end;}

    Result := 0;

    for i:=1 to CntStorageCount do    //料仓编号
    begin
        if StorageInfo[i].Enable then
        begin
            WgrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;
            TempLdTarget := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStorageLdTarget[i][1].LoadTarget;
            StorageLoadTargetLab[i].Caption := format('%.' + inttostr(WgrDecimal) + 'f', [ TempLdTarget ]) ;
        end;
    end;
end;

function TFrmMain.GetWeigherLoadTargetForProdStart() : integer;    //获取称的配料目标值
var
    i, k : Integer;
    WghrIdOfStorage : Integer;
    LoadNoInWgr     : Integer;
    WgrDecimal      : Integer;
    TmpLoadValue    : Double;
begin
    {Result := 0;

    for i:=1 to WeigherCount do
    begin
        for k:=1 to 4 do
        begin
            WeigherLoadTarget[i][k] := 0;
        end;
    end;

    for i:= 1 to CntStorageCount do
    begin
        if StorageInfo[i].Enable then
        begin
            WeigherId   := StorageInfo[i].InstrumentId;
            LoadNoInWgr := StorageInfo[i].LoadNo;
            if (WeigherId < 1) or (WeigherId > WeigherCount) then
            begin
                Result := 1;
                Showmessage(inttostr(i) + '#料仓的称编号非法');
                break;
            end
            else if ( LoadNoInWgr < 1 ) or ( LoadNoInWgr > 4 ) then
            begin
                Result := 2;
                Showmessage( inttostr(i) + '#料仓的配料序号非法');
                Showmessage(inttostr(LoadNoInWgr));
                break;
            end
            else
            begin
                WgrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;
                WeigherLoadTarget[WeigherId][LoadNoInWgr] := Trunc(RoundTo(StorageLoadTarget[i] * power(10, WgrDecimal), -0));
            end;
        end;
    end;}

    Result := 0;

    for i:= 1 to CntStorageCount do    //料仓编号
    begin
        if StorageInfo[i].Enable then
        begin
            WghrIdOfStorage := StorageInfo[i].InstrumentId;
            LoadNoInWgr     := StorageInfo[i].LoadNo;
            if (WghrIdOfStorage < 1) or (WghrIdOfStorage > WeigherCount) then
            begin
                Result := 1;
                Showmessage(inttostr(i) + '#料仓的称编号非法');
                break;
            end
            else if ( LoadNoInWgr < 1 ) or ( LoadNoInWgr > 4 ) then
            begin
                Result := 2;
                Showmessage( inttostr(i) + '#料仓的配料序号非法');
                Showmessage(inttostr(LoadNoInWgr));
                break;
            end
            else
            begin
                WgrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;
                TmpLoadValue := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStorageLdTarget[i][1].LoadTarget;
                WeigherLoadInfo[WghrIdOfStorage].LoadTarget[LoadNoInWgr] := Trunc(RoundTo(TmpLoadValue * power(10, WgrDecimal), -0) );
            end;
        end;
    end;
end;

function TFrmMain.WriteWghrLoadTargetToInstruForProdStart() : INteger;    //写称配料目标值到仪表
var
    i,k : Integer;
    SendData : array[0..63] of Integer;
begin
    {for i:=1 to WeigherCount do
    begin
        for k:=1 to 4 do
        begin
            SendData[(i-1)*4 + (k-1)] := WeigherLoadTarget[i][k];
        end;
    end;

    if WtWordSToInstucment1MscommBuf( StartProdMscomWaitRevPt, $0800, SendData, 64 ) = 1 then    //写多个数到通讯缓冲区
        Result := 0
    else
        Result := 1;
    }

    for i:=1 to WeigherCount do    //i=配料称号
    begin
        for k:=1 to 4 do
        begin
            SendData[(i-1)*4 + (k-1)] := WeigherLoadInfo[i].LoadTarget[k];
        end;
    end;

    if WtWordSToInstucment1MscommBuf( StartProdMscomWaitRevPt, $0800, SendData, 64 ) = 1 then    //写多个数到通讯缓冲区
        Result := 0
    else
        Result := 1;
end;

procedure TFrmMain.cxButton2Click(Sender: TObject);
var
    SelRow : Integer;
    NoticeId : Integer;
begin
    if messagebox(getfocus, Pchar('确定要删除选中的派车单吗?'), '确认信息', MB_OKCANCEL ) = idOK then
    begin
        SelRow := AdvStrGdProdNotice.Row ;

        if Trim(AdvStrGdProdNotice.Cells[2, SelRow]) = '' then
        begin
            Showmessage('无效的派单');
        end
        else
        begin
            NoticeId := StrToInt(Trim(AdvStrGdProdNotice.Cells[2, SelRow]));

            try
                ADOConnection.BeginTrans;
                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Text := 'delete * from ProdNotice where ID=' + IntToStr(NoticeId);
                ADOquery1.ExecSQL;
                ADOConnection.CommitTrans;
                AdvStrGdProdNotice.Rows[SelRow].Clear;
                AdvStrGdProdNotice.RemoveRows(SelRow, 1);
            except
                ADOConnection.RollbackTrans;
                Showmessage('删除失败')
            end;
            //showmessage(Inttostr( NoticeId ) );


        end;
    end;
end;

procedure TFrmMain.TmrStartProdTimer(Sender: TObject);
var
    WtDbResult : Integer;
begin
    TmrStartProd.Enabled := False;

    if Instruction1ReceiveBuf[StartProdMscomWaitRevPt].Active then
    begin
        Instruction1ReceiveBuf[StartProdMscomWaitRevPt].Active := False;

        case StartProdSteps of
            CtStartProdStepIsWtLdTarget :    //启动生产步骤为写配料目标值
            begin
                PresStartProd.Position := 30;
                WtAWordToInstument1MscommBuf(StartProdMscomWaitRevPt,
                  $0840,
                  ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchsCount
                );     //写生产目标盘数
                StartProdSteps := CtStartProdStepIsWtProdBatchCount;
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := True;
            end;

            CtStartProdStepIsWtProdBatchCount :
            begin
                PresStartProd.Position := 40;
                WtAWordToInstument1MscommBuf( StartProdMscomWaitRevPt,
                  $0844,
                  //Trunc(RoundTo( *100, -0))
                  Trunc( RoundTo(ProdNoticeInfo[ProdNOticeInfoWtPt].ProdBatchAmount * 100 , -0) )
                );     //写单盘生产方量
                StartProdSteps := CtStartProdStepIsWtBatchAmount;    //写单盘方量到仪表
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := True;
            end;

            CtStartProdStepIsWtBatchAmount :
            begin
                PresStartProd.Position := 50;
                WtAWordToInstument1MscommBuf( StartProdMscomWaitRevPt,
                  $0845,
                  //Trunc(RoundTo(ProdAmount *100, -0) )
                  Trunc(RoundTo(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount *100, -0) )
                );     //写任务方量
                StartProdSteps := CtStartProdStepIsWtProdAmount;    //写任务方量到仪表
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := True;
            end;

            CtStartProdStepIsWtProdAmount :
            begin
               PresStartProd.Position := 60;
                WtStorageReplaceInfo();
                StartProdSteps := CtStartProdStepIsWtStorageReplace;    //写料仓替换信息
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := True;
            end;

            CtStartProdStepIsWtStorageReplace :
            begin
                PresStartProd.Position := 70;
                WtAWordToInstument1MscommBuf( StartProdMscomWaitRevPt, $0200, $0001 );     //写一个字到通讯缓冲区
                StartProdSteps := CtStartProdStepIsWtStartCmdI;    //写启动命令I
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := true;
            end;

            CtStartProdStepIsWtStartCmdI :
            begin
                PresStartProd.Position := 80;
                WtAWordToInstument1MscommBuf( StartProdMscomWaitRevPt, $0200, $0004 );     //写一个字到通讯缓冲区
                StartProdSteps := CtStartProdStepIsWtStartCmdII;    //写启动命令I
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := true;
            end;

            CtStartProdStepIsWtStartCmdII :
            begin
                PresStartProd.Position := 90;
                //写数据库
                WtDbResult := WtProduceTbForProdStart();
                case WtDbResult of
                    0:
                    begin
                        PresStartProd.Position := 100;
                        PresStartProd.Visible := False;
                        TmrStartProd.Enabled := False;
                    end;

                    else
                    begin
                        Showmessage('写生产表出错，将导致生产数据记录错误');
                    end;
                end;

                if CkFrstBatchPrtDevl.Checked then
                begin
                    //FrmDeliveryPreview.sEdtProdId.Text := Format('%.d', [ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_IdInDb]);
                    FrmDeliveryPreview.Show;
                end;
            end;
        end;

    end
    else
    begin
        StartProdCmdLng := TmrStartProd.Interval;
        if StartProdCmdLng >= 30000 then
        begin
            TmrStartProd.Enabled := False;
            Showmessage('启动命令超时!');
        end
        else
        begin
            TmrStartProd.Enabled :=  True;
        end;
    end; 
end;

procedure TFrmMain.WtStorageReplaceInfo();    //写料仓替换信息到仪表
var
    i : Integer;
    SendData : array[0..15] of Integer;
begin
    for i:=0 to 15 do
    begin
        SendData[i] := 0;
    end;
    WtWordSToInstucment1MscommBuf( StartProdMscomWaitRevPt, $07A0, SendData, 16);     //写多个数到通讯缓冲区
end;

function TFrmMain.WtProduceTbForProdStart() : Integer;
var
    TmpTaskCode : String;
begin
    TmpTaskCode := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_Code ;

    try
        ADOConnection.BeginTrans;

        ADOQuery1.Close ;
        ADOQuery1.SQL.Clear;

        if TmpTaskCode <> '' then
        begin
            ADOQuery1.SQL.Text := 'insert into Produce (Code'
                                + ',ContractNO'
                                + ',DatTim'
                                + ',Characters'
                                + ',Customer'
                                + ',ProjName'
                                + ',ProjType'
                                + ',ProjGrade'
                                + ',ProjAdr'
                                + ',Distance'
                                + ',ConsPos'
                                + ',Pour'
                                + ',Variety'
                                + ',BetLev'
                                + ',Filter'
                                + ',Freeze'
                                + ',Lands'    //坍落度
                                + ',Cement'   //水泥品种
                                + ',Stone'    //
                                + ',BnSize'
                                + ',AddLiq'
                                + ',Request'
                                + ',Recipe'
                                + ',MixLast'
                                + ',Operator'
                                + ',ProdTimB'    //生产开始时间
                                + ',ProdMete'    //生产方量
                                + ',TotVehs'     //累计车次
                                + ',TotMete'     //累计方量
                                + ',Vehicle'
                                + ',Driver'      //驾驶员

                                + ') select [Code]'
                                + ',[ContractNO]'
                                + ',' + FloatToStr(Now())    //生产开始时间
                                + ',[Characters]'
                                + ',Customer'
                                + ',ProjNm'
                                + ',ProjVariety'
                                + ',ProjGrade'
                                + ',ProjAddr'
                                + ',Distance'
                                + ',CastPart'
                                + ',PourMethod'
                                + ',ConcrVariety'
                                + ',ConcrStrength'
                                + ',ConcrSeepage'
                                + ',ConcrFrost'
                                + ',ConcrSlump'    //坍落度
                                + ',CementSpec'    //水泥品种
                                + ',StoneSpec'
                                + ',StoneSize'
                                + ',AddLiq'
                                + ',TecReq'
                                + ',RecipeCode'
                                + ',MixLast'
                                + ',' + '''' + LoginNm + ''''
                                + ',' + FloatToStr(Now())    //生产开始时间
                                + ',' + FloatToStr(Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 ))    //生产方量
                                + ',' + '[TolVehs] +1'    //累计车次
                                + ',' + '[TolAmount]' + '+' + floattostr( Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 ) )   //+ Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 )'
                                + ',( select ProdTruckCode from ProdNotice where ProdNotice.Id=' + inttostr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID) + ')'
                                + ',( select Driver from ProdNotice where ProdNotice.Id=' + inttostr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID) + ')'
                                + ' from ProdTask where ProdTask.Code=:ProdTaskCode ' ;
            ADOQuery1.Parameters.ParamByName('ProdTaskCode').Value := TmpTaskCode;
        end
        else
        begin
            ADOQuery1.SQL.Text := 'insert into Produce ('
                                + 'DatTim'      //生产时间
                                + ',Recipe'      //配比编号
                                + ',Operator'
                                + ',ProdTimB'
                                + ',ProdMete'    //生产方量
                                + ',TotVehs'     //累计车次
                                + ',TotMete'     //累计方量
                                + ',Vehicle'
                                + ',Driver'     //驾驶员
                                + ') select '
                                + FloatToStr(Now())    //生产开始时间
                                + ',ProdRecCode'
                                + ',' + '''' + LoginNm + ''''
                                + ',' + FloatToStr(Now())    //开始时间
                                + ',' + FloatToStr(Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 ))    //生产方量
                                + ',' + '1'
                                + ',' + FloatToStr(Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 ))    //生产方量
                                + ',ProdTruckCode'
                                + ',Driver'
                                + ' from ProdNotice where ID=' + inttostr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID);
        end;

        ADOQuery1.ExecSQL;
        ADOConnection.CommitTrans;

        ADOQuery1.Close;
        ADOQuery1.SQL.Text := 'select @@identity as lastId from Produce';
        ADOQuery1.Open;
        if not ADOQuery1.Eof then
        begin
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_IdInDb := ADOQuery1.FieldByName('lastId').AsInteger;
             Result := 0;
        end
        else
        begin
            Result := 2;
        end;
    except
        ADOConnection.RollbackTrans;
        ADOQuery1.Close;
        Result := 1;
    end;

    if TmpTaskCode <> '' then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        try
            ADOConnection.BeginTrans;
            ADOQuery1.SQL.Text := 'update ProdTask set TolVehs=TolVehs+1 where Code=' + '''' + TmpTaskCode + '''';
            ADOquery1.ExecSQL;
            ADOConnection.CommitTrans;
        except
            ADOConnection.RollbackTrans;
            Showmessage('更新生产任务单累积车次失败！');
            Result := 3;
        end;
        ADOQuery1.Close;
    end;
end;

function TFrmMain.UpdateDbForProdEnd() : Integer;                               //生产完成，更新数据库
var
    TotalVehs : Integer;
    TotalMete : Double;
begin
    //获取累计车次、累计方量
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select TolAmount from ProdTask where Code =' + '''' + ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_Code + '''';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        //TotalVehs := ADOQuery1.FieldByName('TolVehs').AsInteger ;
        TotalMete := RoundTo(ADOQuery1.FieldByName('TolAmount').AsFloat, -2); ;
    end
    else
    begin
        //TotalVehs := 1 ;
        TotalMete := RoundTo(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchAmount * ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId, -2) ;
    end;

    //更新Produce表
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    try
        ADOConnection.BeginTrans;
        ADOQuery1.SQL.Text := 'update Produce set ProdTimE=' + FloatToStr(Now())    //生产结束时间
                            + ', ProdMete=' + FloatToStr(RoundTo(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchAmount * ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId, -2))  //混凝土方量
                            + ', PieCnt=' + inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId) //盘数
                            //+ ', TotVehs=' + inttostr(TotalVehs)
                            + ', TotMete=' + FloatToStr(TotalMete)
                            + ' where ID=' + Inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_IdInDb);
        ADOQuery1.ExecSQL;
        ADOConnection.CommitTrans;
        Result := 0;
    except
        ADOconnection.RollbackTrans;
        Result := 1;
        Showmessage('生产派单完成信息更新失败!');
    end;

    //删除生产派车单
    Try
        ADOConnection.BeginTrans;
        ADOquery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'delete from ProdNotice where ID=' + IntToStr(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdNotice_ID);
        ADOQuery1.ExecSQL;
        ADOConnection.CommitTrans;
    except
        ADOConnection.RollbackTrans;
        Showmessage('从派车单表里删除记录失败!');
    end;


end;

Function TFrmMain.DelProdedNoticeFromDspTab( ProdNoticeId : Integer ) : Integer;    //从派单列表中删除已生产完成的派单
//返回删除派单的行数
var
    i : Integer;
    SearchOk : Boolean;
begin
    i := 1;
    SearchOk := False;
    while (i <= AdvStrGdProdNotice.RowCount - 2) do
    begin
        if Trim(AdvStrGdProdNotice.Cells[2, i]) = inttostr( ProdNoticeId ) then
        begin
            SearchOk := True;
            Break;
        end;
        i := i+1;
    end;

    if i > 0 then
    begin
        if SearchOk then
        begin
            AdvStrGdProdNotice.RemoveRows(i,1);
            Result := i;
        end
        else
        begin
            Result := 0;
            Showmessage('删除生产派单失败');
        end;
    end
    else
    begin
         Result := 0;
         Showmessage('删除生产派单失败');
    end;
end;

procedure TFrmMain.AdvStrGdProRdClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
    LdNum  : Integer;
    i      : Integer;
    EdtLft : Integer;
begin
    if ( ARow >1 ) and ( Trim(AdvStrGdProRd.Cells[7, ARow]) <> '' ) then
    begin
        try
            LdNum := StrToInt(Trim(AdvStrGdProRd.Cells[7, ARow]));
        except
            LdNum := -1;
        end;
    end
    else
    begin
        LdNum  := -1;
    end;

    if ( (Acol =2) or (Acol =3)) and ( (LdNum >=0) and (LdNum < 10) ) then
    begin
        EtNewLdTarg.Top := ( ARow - AdvStrGdProRd.TopRow +1) * AdvStrGdProRd.DefaultRowHeight;

        EdtLft := 0;
        for i:= AdvStrGdProRd.LeftCol to ACol - 1 do
        begin
            EdtLft := EdtLft + AdvStrGdProRd.ColWidths[i];
        end;

        EtNewLdTarg.Left := EdtLft;
        EtNewLdTarg.Width:= AdvStrGdProRd.ColWidths[ACol] -1;

        EtNewLdTarg.Text := AdvStrGdProRd.Cells[ACol, ARow];

        EtNewLdTarg.SelectAll;
        EtNewLdTarg.Visible := True;
        EtNewLdTarg.SetFocus;

        GrdLdInfoEdtRow  := Arow;
        GrdLdInfoEdtCol  := Acol;
        GrdLdInfoEditing := True;

    end;
end;

procedure TFrmMain.EtNewLdTargExit(Sender: TObject);
begin
    EtNewLdTarg.Visible := False;
end;

procedure TFrmMain.AdvStrGdProRdMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
    if EtNewLdTarg.Visible then EtNewLdTarg.Visible := False;
end;

procedure TFrmMain.AdvStrGdProRdMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
    if EtNewLdTarg.Visible then EtNewLdTarg.Visible := False;
end;

procedure TFrmMain.EtNewLdTargKeyPress(Sender: TObject; var Key: Char);
var
    BatchNum   : Integer;
    WgrDecimal : Integer;
    StoraNum   : Integer;
    TempTarget : double;
    i : Integer;
    OperRow    : Integer;
    StorLdState: Integer;
begin
     if not (Key in ['0'..'9', '.', #8, #13,#27 ]) then Key := #0;

     if Key = #27 then
     begin
         EtNewLdTarg.Visible := False;
         GrdLdInfoEditing    := False;
     end
     else if key = #13 then
     begin
         if Trim(AdvStrGdProRd.Cells[8, GrdLdInfoEdtRow]) <> '' then
         begin
             try
                 BatchNum := StrToInt( Trim(AdvStrGdProRd.Cells[8, GrdLdInfoEdtRow]) );
             except
                 BatchNum := 0;
             end;
         end
         else
         begin
             BatchNum := 0;
             Showmessage('生产盘信息出错!');
         end;

         if Trim( AdvStrGdProRd.Cells[6, GrdLdInfoEdtRow] ) <> '' then
         begin
             try
                 StoraNum := StrToInt( Trim( AdvStrGdProRd.Cells[6, GrdLdInfoEdtRow] ) );
             except
                 StoraNum := 0;
             end;
         end
         else
         begin
             StoraNum := 0;
             Showmessage('料仓信息出错');
         end;

         if ( BatchNum > 0 ) and ( StoraNum > 0 ) then
         begin
             WgrDecimal := WeigherPara[StorageInfo[StoraNum].InstrumentId][CntWeigherDecimalIndex].Value;

             if (GrdLdInfoEdtCol = 2) then
             begin

             end
             else
             begin
                 try
                     TempTarget := StrToFloat(EtNewLdTarg.Text);
                 except
                     TempTarget := -0.1;
                     Showmessage('新的目标值有误');
                 end;

                 if TempTarget >= 0 then
                 begin
                     TempTarget := RoundTo(TempTarget, -WgrDecimal);
                 end;

                 //下发命令
                 WtAWordToInstument1MscommBuf(StoraLdTgtModiInfo.RevBufPt,
                                              $0300 + (StorageInfo[StoraNum].InstrumentId -1) *4 + (StorageInfo[StoraNum].LoadNo -1),
                                              Trunc(RoundTo(TempTarget * Power(10, WgrDecimal), -0))
                                             );                //写一个字到通讯缓冲区
                 StoraLdTgtModiInfo.Tmr := 0;
                 StoraLdTgtModiInfo.Ena := True;
                 //记录
                 StoraLdTgtModiInfo.ModiStorId := StoraNum ;
                 StoraLdTgtModiInfo.NewTarget  := TempTarget;
             end;
         end;
     end;
end;

procedure TFrmMain.BtnIncProdSetCountClick(Sender: TObject);
var
    i      : Integer;
    IncEna : Boolean;
begin
    IncEna := True;

    for i:=1 to WeigherCount do
    begin
        if not WeigherInfo[i].Enable then Continue;

        if ( WeigherLoadCounterInInstu[i] > ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount )
          or
           ( ( WeigherLoadCounterInInstu[i] = ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount ) and  ( (WeigherStateInInstru[i] and (1 shl 6)) <> 0 ) )
          or
           (WeigherLoadInfo[i].RecordBatchCount >= ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount)
          then
        begin
            IncEna := false;
            Break;
        end;
    end;

    if IncEna then
    begin
        ProdBatchsModiInfo.Tmr    := 0;
        ProdBatchsModiInfo.ModiTp := CtProdBatchsModiIsInc;
        WtAWordToInstument1MscommBuf( ProdBatchsModiInfo.RevBufPt, $0841, ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount +1 );              //写一个字到通讯缓冲区
        ProdBatchsModiInfo.Ena := True;

        //添加一盘 按钮
        BtnIncProdSetCount.Enabled := False;
        BtnIncProdSetCountState := BtnProdSetCountStIsDisable;
        //减少一盘 按钮
        BtnDecProdSetCount.Enabled := False;
        BtnDecProdSetCountState := BtnProdSetCountStIsDisable;
    end
    else
    begin
        MessageBox(GetFocus, Pchar('任务末盘已有称完成配料，不能增加盘数'), '系统通知', MB_OK);
    end;
end;

procedure TFrmMain.BtnDecProdSetCountClick(Sender: TObject);
var
    i : integer;
    DecEna : Boolean;
begin
    DecEna := True;

    for i:=1 to WeigherCount do
    begin
        if not WeigherInfo[i].Enable then Continue;

        if ( WeigherLoadCounterInInstu[i] >= ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount ) then
        begin
            DecEna := False;
            Break;
        end;
    end;

    if DecEna then
    begin
        ProdBatchsModiInfo.Tmr    := 0;
        ProdBatchsModiInfo.ModiTp := CtProdBatchsModiIsDec;
        WtAWordToInstument1MscommBuf( ProdBatchsModiInfo.RevBufPt, $0841, ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount -1 );              //写一个字到通讯缓冲区
        ProdBatchsModiInfo.Ena := True;

        //添加一盘 按钮
        BtnIncProdSetCount.Enabled := False;
        BtnIncProdSetCountState := BtnProdSetCountStIsDisable;
        //减少一盘 按钮
        BtnDecProdSetCount.Enabled := False;
        BtnDecProdSetCountState := BtnProdSetCountStIsDisable;
    end
    else
    begin
        MessageBox(GetFocus, Pchar('任务末盘已开始生产，不能减盘'), '系统通知', MB_OK);
    end;
end;

procedure TFrmMain.BtnProdContinueClick(Sender: TObject);
begin
    if ProdMode = CtProdIsSingle then
    begin
        ProdMode := CtProdIsContinue ;
        BtnProdContinue.Glyph := Nil;
        ImageList1.GetBitmap(1,BtnProdContinue.Glyph) ;
    end
    else
    begin
        ProdMode := CtProdIsSingle ;
        BtnProdContinue.Glyph := Nil;
        ImageList1.GetBitmap(0,BtnProdContinue.Glyph) ;
    end;
end;

procedure TFrmMain.CkFrstBatchPrtDevlClick(Sender: TObject);
var
    Flags     : String;
    RdResult  : Boolean;
    SubStrPos : Integer;
begin
    if not CkFrstBatchPrtDevl.Focused then Exit;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select Flag from Equipment where ID=1';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        Flags := ADOQuery1.FieldByName('Flag').AsString;
    end
    else
    begin
        RdResult := False;
        Showmessage('获取打印设置失败!');
    end;

    if CkFrstBatchPrtDevl.Checked then
    begin
        CkLastBatchPrtDevl.Checked := False;
        SubStrPos := pos('lpt', Flags) ;
        if SubStrPos > 0 then
        begin
            delete(Flags, SubStrPos, 3);
        end;
        SubStrPos := pos('fpt', Flags) ;
        if SubStrPos <= 0 then
        begin
            Flags := Flags + 'fpt';
        end;
    end
    else
    begin
        SubStrPos := pos('fpt', Flags) ;
        if SubStrPos > 0 then
        begin
            delete(Flags, SubStrPos, 3);
        end;
    end;

    case WtFlagIntoEquipTb(Flags, 1) of            //写标识属性到Equipment表中
        0: begin

        end;
        1: begin
            Showmessage('更改打印方式 记录失败!')
        end;
    end;

    if CkFrstBatchPrtDevl.Checked then
        DeliveryPrtMode := CtDeliveryPrtMdIsFst
    else if CkLastBatchPrtDevl.Checked then
        DeliveryPrtMode := XtDeliveryPrtMdIsLat
    else
        DeliveryPrtMode := CtDeliveryPtrtMdIsNonAuto;
end;

procedure TFrmMain.CkLastBatchPrtDevlClick(Sender: TObject);
var
    Flags     : String;
    RdResult  : Integer;
    SubStrPos : Integer;
begin
    if not CkLastBatchPrtDevl.Focused then Exit;

    RdResult := RdFlagFromEquipTb(Flags, 1) ;

    if CkLastBatchPrtDevl.Checked then
    begin
        CkFrstBatchPrtDevl.Checked := False;

        if RdResult = 0 then
        begin
            SubStrPos := pos('fpt', Flags) ;
            if SubStrPos > 0 then
            begin
                delete(Flags, SubStrPos, 3);
            end;

            SubStrPos := pos('lpt', Flags) ;
            if SubStrPos <= 0 then
            begin
                Flags := Flags + 'lpt';
            end
        end;
    end
    else
    begin
        if RdResult = 0 then
        begin
            SubStrPos := pos('lpt', Flags) ;
            if SubStrPos <= 0 then
            begin
                Flags := Flags + 'lpt';
            end
        end;
    end;

    case WtFlagIntoEquipTb(Flags, 1) of            //写标识属性到Equipment表中
        0: begin

        end;
        1: begin
            Showmessage('更改打印方式 记录失败!')
        end;
    end;

    if CkFrstBatchPrtDevl.Checked then
        DeliveryPrtMode := CtDeliveryPrtMdIsFst
    else if CkLastBatchPrtDevl.Checked then
        DeliveryPrtMode := XtDeliveryPrtMdIsLat
    else
        DeliveryPrtMode := CtDeliveryPtrtMdIsNonAuto;
end;

procedure TFrmMain.cBtnManulPrtDelClick(Sender: TObject);
begin
    //FrmDeliveryPreview.sEdtProdId.Text := IntToStr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_IdInDb);
    FrmDeliveryPreview.Show;
end;

procedure TFrmMain.NCommunicateClick(Sender: TObject);
begin
    if not FrmCommunicationSetCrt then
    begin
        FrmCommunicationSet := TFrmCommunicationSet.Create(FrmMain);
        FrmCommunicationSetCrt := True;
    end;
    FrmCommunicationSet.Show;
end;

procedure TFrmMain.NSingleDefineClick(Sender: TObject);
begin
    if not FrmSignalDefineCrt then
    begin
        FrmSignalDefine    := TFrmSignalDefine.Create(FrmMain);
        FrmSignalDefineCrt := True;
    end;
    FrmSignalDefine.Show;
end;

procedure TFrmMain.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    releasecapture;
    Panel2.Perform(wm_syscommand,$f012,0);
end;

procedure TFrmMain.N18Click(Sender: TObject);
begin
    if not FrmSysUnlockCrt then
    begin
        FrmSysUnlock    := TFrmSysUnlock.Create(FrmMain);
        FrmSysUnlockCrt := True;
    end;
    FrmSysUnlock.Show;
end;

procedure TFrmMain.s3Click(Sender: TObject);
begin
    if not FrmLftHopperCrt then
    begin
        FrmLftHopper    := TFrmLftHopper.Create(Nil);
        FrmLftHopperCrt := True;
    end;
    FrmLftHopper.Show;
end;

procedure TFrmMain.N19Click(Sender: TObject);
begin
    if not FrmSysAboutCrt then
    begin
        FrmAbout := TFrmAbout.Create(Nil);
        FrmSysAboutCrt := True;
    end;
    FrmAbout.Show;
end;

procedure TFrmMain.NSysConfigClick(Sender: TObject);
begin
    if not FrmConfigCrt then
    begin
        FrmConfig    := TFrmConfig.Create(Nil);
        FrmConfigCrt := True;
    end;
    FrmConfig.show;
end;

procedure TFrmMain.NProdDataClick(Sender: TObject);
begin
   if not FileExists(ExtractFilePath(application.ExeName) +'.\ProReport.exe') then
    begin
        MessageBox(Handle, '数据报表模块被恶意删除！请联系系统厂家。',
          '系统错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
        Exit;
    end;
    ShellExecute(Handle,'open','ProReport.exe',nil,nil,SW_SHOWNORMAL);
end;

procedure TFrmMain.N20Click(Sender: TObject);
begin
    if not FrmMaterialStorageCrt then
    begin
        FrmMaterialStorage := TFrmMaterialStorage.Create(Self);
        FrmMaterialStorageCrt := True;
    end;
    FrmMaterialStorage.ShowModal;
end;

procedure TFrmMain.N21Click(Sender: TObject);
begin
    if not FrmModifyStocksCrt then
    begin
        FrmModifyStocks := TFrmModifyStocks.Create(Self);
        FrmModifyStocksCrt := True;
    end;
    FrmModifyStocks.ShowModal;
    
end;

procedure TFrmMain.N22Click(Sender: TObject);
begin
   if not FrmStocksCrt then
   begin
       FrmStocks    := TFrmStocks.Create(Self);
       FrmStocksCrt := True;
   end;
   FrmStocks.Show;
end;

procedure TFrmMain.N11Click(Sender: TObject);
begin
    Application.Terminate;
end;

end.
