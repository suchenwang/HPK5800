unit UnitGlobeVar;

interface
var
    SoftRunState : Integer;    //软件运行状态
Const
     CntSoftIniInstrumentState = 0;    //初始化控制器状态
     CntSoftRuningState        = 1 ;   //运行状态
var
    IsMscommCrt : Boolean;             //通讯端口创建是否成功
var
    FrmLoginCrt : Boolean;

    SystemRunDelayTmr : Integer;    //系统运行延时

    SoftAuthorCheckIntervai : Longint;    //授权检测周期

Const
    CntSystemTmrInterval = 200;    //系统定时器

var
    LoginNm         : String;
    PersonnelPermit : String[100];
    UserCompany     : String[50];

    TaskDspTmr      : integer;

var
    AppPath          : String;    //软件路径
    AppFlashTmrInval : Integer;    //动画定时器设定值
//--------------------------------电铃------------------------------------------
var
    AutoRing : Boolean;
//------------------------------------------------------------------------------
var
    ProdMode : Integer;
Const
    CtProdIsSingle   = 0;    //单任务生产
    CtProdIsContinue = 1;    //连续生产

var
    DeliveryPrtMode : Integer;    //发货单打印方式
Const
    CtDeliveryPtrtMdIsNonAuto = 0;    //非自动打印
    CtDeliveryPrtMdIsFst      = 1;    //首盘打印
    XtDeliveryPrtMdIsLat      = 2;    //末盘打印
    
//Const
//    DigitalStateIsInvalid = 0;     //数字量状态 是 无效
//    DigitalStateIsClose   = 1;     //数字量状态 是 关
//    DigitalStateIsOpen    = 2;     //数字量状态 是 开
//    DigitalStateIsFlash   = 3;     //数字量状态 是 闪烁
//------------------------------------------------------------------------------
    
{仪表通讯}
var
    Instruction1MscommOpen : Boolean;

    Instruction1MscommState : Integer;
Const
    CntInstruction1MscommIdle        = 0;    //空闲
    CntInstruction1MscommWaitPly     = 1;    //等待回复
    CntInstruction1MscommReceiving   = 2;    //接收中
    CntInstruction1MscommReceiveIdle = 3;    //本次接收为空
    CntInstruction1MscommReceiveOk   = 4;    //接收完成

var
    Instru1MscommFails     : Integer;       //通讯失败次数
    Instru1MscommDspState  : Integer;       //通讯显示状态

Const
    Instru1MscomDspIsPortNo = 0;           //端口不存在
    Instru1MscomDspIsNomarl = 1;            //通讯显示状态为正常
    Instru1MscomDspIsFault  = 2;            //通讯显示状态为故障

Const
    CntCommunicateBufLen = 10;
Const
    CntInstruction1MscommBufLen = 250;
type
    InstructionSendRd = Record
      Active : Boolean;
      SendByteCounter : integer;
      SendByte : array[0..CntInstruction1MscommBufLen] of Byte;
    end;
var
    Instruction1SendBuf : array[0..CntCommunicateBufLen -1] of InstructionSendRd;    //仪表1发送缓冲区

type
    InstructionReceiveRd = Record
      Active : Boolean ;
      ReceiveByteCount : Integer ;
      ReceiveCmd : Byte;
      ReceiveByte : array[0..CntInstruction1MscommBufLen] of Byte ;
    end;
var
    Instruction1ReceiveBuf : array[0..CntCommunicateBufLen -1] of InstructionReceiveRd;    //仪表1接收缓冲区

var
    Instruction1SendBufWtPt ,    //发送缓冲区写指针
    Instruction1SendBufRdPt ,    //发送缓冲区读指针
    Instruction1ReceivePt        //接收缓冲区指针
      : Integer;
const
    CntInstruction1ReceiveByteLen = 300;
var
    Instruction1ReceiveByte : array[0..CntInstruction1ReceiveByteLen] of Byte;    //仪表1通讯接收寄存器
    Instruction1ReceiveBytePt : Integer;    //通讯接收内存指针

var
    Instruction1MscommLong : Integer;    //通讯命令耗时计时器

var
    Instruction1MscommCommandType : Integer;    //通讯命令类型
Const
    CntInstruction1MscommLoopCmd = 1;    //循环命令
    CntInstruction1MscommRandCmd = 2;    //随机命令

var
    LoopMscomCommandPt : Integer;        //循环通讯命令指针
Const
    CntLoopMscomCommandCount = 3;        //循环通讯命令数量
var
    LoopMscommCommand : array[0..CntLoopMscomCommandCount-1] of array[0..7] of Byte;

//---------------------------通讯结束-------------------------------------------

//-------------------------控制器称参数-----------------------------------------
{称参数}

var
    PMWeigherId : Integer;                //右键菜单编辑称号
Const
    WeigherCount = 16;

var
    WeigherValueI             : array[1..WeigherCount] of Integer;    //称值正数
    WeigherStateInInstru      : array[1..WeigherCount] of Integer;    //仪表中的称状态
    WeigherLoadCounterInInstu : array[1..WeigherCount] of Integer;    //仪表中的称的配料次数计数器
type
    WeigherInfoRd = Record
        Enable             : Boolean ;
        Name               : String[20] ;   //称名称
        Tpe                : Integer;       //称类型
        InstrumentId       : Integer;       //各个称对应的仪表号
        CloseLmt           : Boolean ;      //各称关门限位
        DischVibrator      : Boolean;       //卸料振动器
        LdDsIsPumpAndValve : Boolean;       //上料卸料泵阀
        LoadIsFine         : Boolean;       //快慢配料
        StorageNumber      : Integer ;     //料仓数量
        StorageId          : Array[1..4] of Integer;
    end;
//Const
//    CtWghrTpIsAggr    = 1;    //骨料称
//    CtWghrTpIsPowder  = 2;    //粉料称
//    CtWghrTpIsWater   = 3;    //水称
//    CtWghrTpIsAddtive = 4;    //液剂称
var
    WeigherInfo : array[1..WeigherCount] of WeigherInfoRd;

    AdditiveDischIntoWater : Boolean;    //外剂卸进水

type
    WeigherParaRd = Record
      Value : Integer ;
      Decimal : Integer ;
      Flags   : String ;                   //参数属性
    end;

const
    CntWeigherParaCount = 39;
var
    WeigherPara : array[1..WeigherCount] of array[1..CntWeigherParaCount] of WeigherParaRd ;


type
    WeigherParaInfoRd = Record
      CodeInDb               : String[20] ;               //参数在数据库中的代码
      ParaName               : String[20] ;               //参数名称
      AddrOffsetInInstrument : Integer ;        //参数在仪表中的地址Offset
      BufIndex               : Integer ;                  //参数在内存中数组下标位置
      ParaCode               : Integer;              //参数值类型
      Units                  : String[10] ;          //参数单位
    end;

Const    //称参数代号
    CntWeigParaIsCap         = $01;     // 称量程
    CntWeigParaIsDivision    = $02;     // 称分度值
    CntWeigParaIsTrack       = $03;     // 零点跟踪范围
    CntWeigParaIsDvSep       = $04;     // 卸料泵阀间隔时间（1位定点小数）
    CntWeigParaIsIDT         = $05;     // 延迟判断落差时间（带小数）
    CntWeigParaIsZeroBand    = $06;     // 零位范围
    CntWeigParaIsFilter      = $07;     // 数字滤波系数
    CntWeigParaIsDecimal     = $08;     // 称小数位数
    CntWeigParaIsTRG         = $09;     // 允差范围
    CntWeigParaIsTDC         = $0A;     // 延迟卸料控制时间（带小数）
    CntWeigParaIsDlyUld      = $0B;     // 延迟投料时间
    CntWeigParaIsSXXLZL      = $0C;     // 顺序卸料剩余重量
    CntWeigParaIsUDC         = $0D;     // 扣称 0：否   1：允许
    CntWeigParaIsRemain      = $0E;     // 扣料重量
    CntWeigParaIsPvSep       = $0F;     // 上料泵阀间隔时间（1位定点小数）
    //CntWeigParaIs         = $10
    //CntWeigParaIs          = $11
    CntWeigParaIsUFC         = $12;     // 落差修正方式 0：固定 1：自动
    //CntWeigParaIs          = $13
    CntWeigParaIsSrtDly      = $14;     // 延迟启动时间
    CntWeigParaIsNVL         = $15;     // 补称  0：否  1： 是
    //CntWeigParaIs          = $16;
    //CntWeigParaIs          = $17;
    //CntWeigParaIs          = $18;
    //CntWeigParaIs          = $19;
    CntWeigParaIsZFM         = $1A;   //19 主副门输出方式 1：   0：
    //CntWeigParaIs           = $1B
    CntWeigParaIsPLBJX       = $1C;   //1B 配料误差报警限
    //CntWeigParaIs           = $1D;
    //CntWeigParaIs           = $1E;
    //CntWeigParaIs           = $1F;
    //CntWeigParaIs           = $20;
    CntWeigParaIsPLBJ        = $21;   // 配料误差报警限
    CntWeigParaIsINS_QIV_MDL = $22;   // 振动模式
    CntWeigParaIsINS_QIV_DLY = $23;   // 延迟振动时间
    CntWeigParaIsINS_QIV_LST = $24;   // 振动时间
    CntWeigParaIsINS_QIV_STP = $25;   // 振动间隔时间
    //CntWeigParaIs            = $26;
    CntWeigParaIsINS_QIV_FLW = $27;   //振动边际流量

Const    //称参数在仪表中的地址Offset 负数表示该参数在下位机中不存储
    CntCapOffsetInInstru = $00;              //00 称量程
    CntDivisionOffsetInInstru = $01;         //01 称分度值
    CntTrackOffsetInInstru = $02;            //02 零点跟踪范围
    CntDvSepOffsetInInstru = $03;            //03 卸料泵阀间隔时间（1位定点小数）
    CntIDTOffsetInInstru = $04;              //04 延迟判断落差时间（带小数）
    CntZeroBandOffsetInInstru = $05;         //05 零位范围
    CndFilterOffsetInInstru = $06;           //06 数字滤波系数
    CntDecimalOffsetInInstru = $07;          //07 称小数位数
    CntTRGOffsetInInstru = $08;              //08 允差范围
    CntTDCOffsetInInstru = $09;              //09 延迟卸料控制时间（带小数）
    CntDlyUldOffsetInInstru = $0A;           //0A 延迟投料时间
    CntSXXLZLOffsetInInstru = $0B;           //0B 顺序卸料剩余重量
    CntUDCOffsetInInstru = $0C;              //0C 扣称 0：否   1：允许
    CntRemainOffsetInInstru = $0D;           //0D 扣料重量
    CntPvSepOffsetInInstru = $0E;            //0E 上料泵阀间隔时间（1位定点小数）
                                             //0F
                                             //10 ???
    CntUFCOffsetInInstru = $11;              //11 落差修正方式 0：固定 1：自动
                                             //12
    CntSrtDlyOffsetInInstru = $13;           //13 延迟启动时间
    CntNVLOffsetInInstru = $14;              //14 补称  0：否  1： 是
                                             //15
                                             //16
                                             //17
                                             //18
    CntZFMOffsetInInstru = $19;              //19 主副门输出方式 1：   0：
                                             //1A
    CntPLBJXOffsetInInstr = $1B;             //1B 配料误差报警限
                                             //1C
                                             //1D
                                             //1E
                                             //1F

    CntPLBJOffsetInInstru = -1;              //配料误差报警限

    CntINS_QIV_MDLOffsetInInstru = -1;       //振动模式
    CntINS_QIV_DLYOffsetInInstru = $640;     //A40 延迟振动时间
    CntINS_QIV_LSTOffsetInInstru = $641;     //A41 振动时间
    CntINS_QIV_STPOffsetInInstru = $642;     //A42 振动间隔时间
                                             //A43
    CntINS_QIV_FLOffsetInInstru = $644;      //A44振动边际流量

Const    //称参数在内存数组中的序号
    CntWeigherCapIndex = 1;          //00 称量程
    CntWeigherDivisionIndex = 2;     //01 称分度值
    CntWeigherTrackIndex = 3;        //02 零点跟踪范围
    CntWeigherDvSepIndex = 4;        //03 卸料泵阀间隔时间（1位定点小数）
    CntWeigherIDTIndex = 5;          //04 延迟判断落差时间（带小数）
    CntWeigherZeroBandIndex = 6;     //05 零位范围
    CndWeigherFilterIndex = 7;       //06 数字滤波系数
    CntWeigherDecimalIndex = 8;      //07 称小数位数
    CntWeigherTRGIndex = 9;          //08 允差范围
    CntWeigherTDCIndex = 10;          //09 延迟卸料控制时间（带小数）
    CntWeigherDlyUldIndex = 11;       //0A 延迟投料时间
    CntWeigherSXXLZLIndex = 12;       //0B 顺序卸料剩余重量
    CntWeigherUDCIndex = 13;          //0C 扣称 0：否   1：允许
    CntWeigherRemainIndex = 14;       //0D 扣料重量
    CntWeigherPvSepIndex = 15;        //0E 上料泵阀间隔时间（1位定点小数）
                                       //0F
                                       //10 ???
    CntWeigherUFCIndex = 18;          //11 落差修正方式 0：固定 1：自动
                                       //12
    CntWeigherSrtDlyIndex = 20;       //13 延迟启动时间
    CntWeigherNVLIndex = 21;          //14 补称  0：否  1： 是
                                       //15
                                       //16
                                       //17
                                       //18
    CntWeigherZFMIndex = 26;          //19 主副门输出方式 1：   0：
                                       //1A
    CntWeigherPLBJXIndex = 28;        //1B 配料误差报警限
                                       //1C
                                       //1D
                                       //1E
                                       //1F

    CntWeigherPLBJIndex = 33;         //配料误差报警限

    CntWeigherINS_QIV_MDLIndex = 34;  //振动模式
    CntWeigherINS_QIV_DLYIndex = 35 ; //A40 延迟振动时间
    CntWeigherINS_QIV_LSTIndex = 36 ; //A41 振动时间
    CntWeigherINS_QIV_STPIndex = 37 ; //A42 振动间隔时间
                                       //A43
    CntWeigherINS_QIV_FLWIndex = 39 ; //A44 振动边际流量

const
    CntWeigherParaInfo : array[1..CntWeigherParaCount] of WeigherParaInfoRd    //以在控制器中的通讯地址为序进行排列
      =(
          ( CodeInDb               : 'CAP';
            ParaName               : '最大量程';
            AddrOffsetInInstrument : CntCapOffsetInInstru;
            BufIndex               : CntWeigherCapIndex;
            ParaCode               : CntWeigParaIsCap;
            Units                  : 'kg') ,                       //00 称量程

          ( CodeInDb               : 'd';
            ParaName               : '分度值';
            AddrOffsetInInstrument : CntDivisionOffsetInInstru;
            BufIndex               : CntWeigherDivisionIndex;
            ParaCode               : CntWeigParaIsDivision;
            Units                  : ''),        //01 称分度值

          ( CodeInDb               : 'Track';
            ParaName               : '零点跟踪范围';
            AddrOffsetInInstrument : CntTrackOffsetInInstru;
            BufIndex               : CntWeigherTrackIndex;
            ParaCode               : CntWeigParaIsTrack;
            Units                  : 'd'),     //02 零点跟踪范围

          ( CodeInDb               : 'DvSep';
            ParaName               : '卸料泵阀间隔时间';
            AddrOffsetInInstrument : CntDvSepOffsetInInstru ;
            BufIndex               : CntWeigherDvSepIndex;
            ParaCode               : CntWeigParaIsDvSep;
            Units                  : 's'),     //03 卸料泵阀间隔时间（1位定点小数）

          ( CodeInDb               : 'IDT';
            ParaName               : '延迟判断落差时间';
            AddrOffsetInInstrument : CntIDTOffsetInInstru ;
            BufIndex               : CntWeigherIDTIndex;
            ParaCode               : CntWeigParaIsIDT;
            Units                  : 's'),     //04 延迟判断落差时间（带小数）

          ( CodeInDb               : 'ZeroBand';
            ParaName               : '零位范围';
            AddrOffsetInInstrument : CntZeroBandOffsetInInstru;
            BufIndex               : CntWeigherZeroBandIndex;
            ParaCode               : CntWeigParaIsZeroBand;
            Units                  : ''),     //05 零位范围

          ( CodeInDb               : 'Filter';
            ParaName               : '滤波系数';
            AddrOffsetInInstrument : CndFilterOffsetInInstru;
            BufIndex               : CndWeigherFilterIndex;
            ParaCode               : CntWeigParaIsFilter;
            Units                  : ''),     //06 数字滤波系数

          ( CodeInDb               : 'Decimal';
            ParaName               : '小数位数';
            AddrOffsetInInstrument : CntDecimalOffsetInInstru;
            BufIndex               : CntWeigherDecimalIndex;
            ParaCode               : CntWeigParaIsDecimal;
            Units                  : ''),     //07 称小数位数

          ( CodeInDb               : 'TRG';
            ParaName               : '允差范围';
            AddrOffsetInInstrument : CntTRGOffsetInInstru ;
            BufIndex               : CntWeigherTRGIndex ;
            ParaCode               : CntWeigParaIsTRG;
            Units                  : '%'),     //08 允差范围

          ( CodeInDb               : 'TDC';
            ParaName               : '延迟卸料控制时间';
            AddrOffsetInInstrument : CntTDCOffsetInInstru ;
            BufIndex               : CntWeigherTDCIndex ;
            ParaCode               : CntWeigParaIsTDC;
            Units                  : 's'),     //09 延迟卸料控制时间（带小数）

          ( CodeInDb               : 'DlyUld';
            ParaName               : '延迟投料时间';
            AddrOffsetInInstrument : CntDlyUldOffsetInInstru ;
            BufIndex               : CntWeigherDlyUldIndex ;
            ParaCode               : CntWeigParaIsDlyUld;
            Units                  : 's'),     //0A 延迟投料时间

          ( CodeInDb               : 'SXXLZL';
            ParaName               : '顺序卸料剩余重量';
            AddrOffsetInInstrument : CntSXXLZLOffsetInInstru ;
            BufIndex               : CntWeigherSXXLZLIndex ;
            ParaCode               : CntWeigParaIsSXXLZL;
            Units                  : 'kg'),     //0B 顺序卸料剩余重量

          ( CodeInDb               : 'UDC';
            ParaName               : '允许扣秤';
            AddrOffsetInInstrument : CntUDCOffsetInInstru ;
            BufIndex               : CntWeigherUDCIndex ;
            ParaCode               : CntWeigParaIsUDC;
            Units                  : ''),     //0C 扣称 0：否   1：允许

          ( CodeInDb               : '';
            ParaName               : '卸料时扣料重量';
            AddrOffsetInInstrument : CntRemainOffsetInInstru ;
            BufIndex               : CntWeigherRemainIndex ;
            ParaCode               : CntWeigParaIsRemain;
            Units                  : 'kg'),     //0D 扣料重量

          ( CodeInDb               : 'PvSep';
            ParaName               : '上料泵阀间隔时间';
            AddrOffsetInInstrument : CntPvSepOffsetInInstru ;
            BufIndex               : CntWeigherPvSepIndex ;
            ParaCode               : CntWeigParaIsPvSep;
            Units                  : 's'),     //0E 上料泵阀间隔时间（1位定点小数）

          ( CodeInDb               : '    ';
            ParaName               : '未定义0F';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //0F

          ( CodeInDb               : '    ';
            ParaName               : '未定义10';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //10 ???

          ( CodeInDb               : 'UFC';
            ParaName               : '落差修正方式';
            AddrOffsetInInstrument : CntUFCOffsetInInstru ;
            BufIndex               : CntWeigherUFCIndex ;
            ParaCode               : CntWeigParaIsUFC;
            Units                  : ''),     //11 落差修正方式 0：固定 1：自动
     
          ( CodeInDb               : '    ';
            ParaName               : '未定义12';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //12

          ( CodeInDb               : 'SrtDly';
            ParaName               : '迟启动时间';
            AddrOffsetInInstrument : CntSrtDlyOffsetInInstru ;
            BufIndex               : CntWeigherSrtDlyIndex ;
            ParaCode               : CntWeigParaIsSrtDly;
            Units                  : 's'),     //13 延迟启动时间

          ( CodeInDb               : 'NVL';
            ParaName               : '允许补秤';
            AddrOffsetInInstrument : CntNVLOffsetInInstru ;
            BufIndex               : CntWeigherNVLIndex ;
            ParaCode               : CntWeigParaIsNVL;
            Units                  : ''),     //14 补称  0：否  1： 是

          ( CodeInDb               : '    ';
            ParaName               : '未定义15';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //15

          ( CodeInDb               : '    ';
            ParaName               : '未定义16';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //16

          ( CodeInDb               : '    ';
            ParaName               : '未定义17';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //17

          ( CodeInDb               : '    ';
            ParaName               : '未定义18';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //18

          ( CodeInDb               : 'ZFM';
            ParaName               : '主副门输出方式';
            AddrOffsetInInstrument : CntZFMOffsetInInstru ;
            BufIndex               : CntWeigherZFMIndex ;
            ParaCode               : CntWeigParaIsZFM;
            Units                  : ''),     //19 主副门输出方式 1：   0

          ( CodeInDb               : '    ';
            ParaName               : '未定义1A';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1A

          ( CodeInDb               : 'PLBJX';
            ParaName               : '配料误差报警限';
            AddrOffsetInInstrument : CntPLBJXOffsetInInstr ;
            BufIndex               : CntWeigherPLBJXIndex ;
            ParaCode               : CntWeigParaIsPLBJX;
            Units                  : '%'),     //1B 配料误差报警限

          ( CodeInDb               : '    ';
            ParaName               : '未定义1C';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1C

          ( CodeInDb               : '    ';
            ParaName               : '未定义1D';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1D

          ( CodeInDb               : '    ';
            ParaName               : '未定义1E';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1E

          ( CodeInDb               : '    ';
            ParaName               : '未定义1F';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1F

          ( CodeInDb               : 'PLBJ';
            ParaName               : '配料误差报警';
            AddrOffsetInInstrument : CntPLBJOffsetInInstru ;
            BufIndex               : CntWeigherPLBJIndex ;
            ParaCode               : CntWeigParaIsPLBJ;
            Units                  : ''),     //配料误差报警限

          ( CodeInDb               : 'INS_QIV_MDL';
            ParaName               : '振动模式';
            AddrOffsetInInstrument : CntINS_QIV_MDLOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_MDLIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_MDL;
            Units                  : ''),     //振动模式

          ( CodeInDb               : 'INS_QIV_DLY';
            ParaName               : '延迟振动时间';
            AddrOffsetInInstrument : CntINS_QIV_DLYOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_DLYIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_DLY;
            Units                  : 's'),      //A40 延迟振动时间

          ( CodeInDb               : 'INS_QIV_LST';
            ParaName               : '振动时间';
            AddrOffsetInInstrument : CntINS_QIV_LSTOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_LSTIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_LST;
            Units                  : 's'),     //A41 振动时间

          ( CodeInDb               : 'INS_QIV_STP';
            ParaName               : '振动间隔时间';
            AddrOffsetInInstrument : CntINS_QIV_STPOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_STPIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_STP;
            Units                  : 's'),    //振动间隔时间

          ( CodeInDb               : '    ';
            ParaName               : '未定义A43';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),

          ( CodeInDb               : 'INS_QIV_FLW';
            ParaName               : '振动边际流量';
            AddrOffsetInInstrument : CntINS_QIV_FLOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_FLWIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_FLW;
            Units                  : 'kg/s')
        );
//----------------------控制器称参数结束----------------------------------------

//------------------------------料仓参数----------------------------------------
Const
    CntStorageCount = 16;    //最大支持16个料仓

//var
//    SiloLoadVaveState : array[1..CntStorageCount] of Integer;    //料仓计量阀     显示 状态
//    SiloFnLdVaveState : array[1..CntStorageCount] of Integer;    //料仓精计量阀   显示 状态
//    SiloLdVibraState  : array[1..CntStorageCount] of Integer;    //料仓计量振动器 显示 状态

type
    StorageInfoRd = record
        Enable : Boolean;
        Name : String[20] ;
        InstrumentId : Integer;
        LoadNo : Integer;
        Model : Integer;
        MaterId : Integer;
        MaterName : String[20];    //材料名称
        MaterSpec : String[20];    //型号规格
        DschMode : Integer;
        Vibrator : Boolean;
        StockDsp : Boolean;
        Moisture : Double;       //含水率
    end;
Const
    CntAggregateStorage = 0;    //骨料仓
    CntPowderStorage = 1;       //粉料仓
    //CntLiquidStorage = 2;       //液体仓
    CntWaterStorage = 2;        //水仓
    CntAddtiveStorage = 3;      //外剂仓
Const
    CntStorageSignalDsch = 0;   //料仓单门卸料
    CntStorageDoubleDsch = 1;   //料仓双门卸料
var
    StorageInfo : array[1..CntStorageCount] of StorageInfoRd;

type
    StorageParaRd = Record
       Value   : Integer ;
       Decimal : Integer ;
       Flags   : String[20];
    end;
Const
    CntStorageParaCount = 6;
var
    StoragePara : array[1..CntStorageCount] of array[1..CntStorageParaCount] of StorageParaRd;

Const    //参数代号
    CntStorParaIsVibraMode       = $01;       //振动模式
    CntStorParaIsVibraStartDelay = $02;       //振动延迟时间
    CntStorParaIsVibraRunLong    = $03;       //振动时间
    CntStorParaIsVibraOffLong    = $04;       //振动间隔时间
    CntStorParaIsVibraRunFlow    = $05;       //振动边际流量

Const    //内存数组下标号
    CntVibraModeIndexInBuf = 1;                //振动模式数组下标
    CntVibraStartDelayIndexInBuf = 2;          //振动延迟时间
    CntVibraRunLongIndexInBuf = 3;             //振动时间
    CntVibraOffLongIndexInBuf = 4;             //振动间隔时间
    CntVibraRunFlowIndexInBuf = 5;             //振动边际流量

Const    //控制器偏移地址
    CntVibraRunFlowOffsetInInstru = $02;       //振动边际流量
    CntVibraStartDelayOffsetInInstru = $00;    //振动延迟时间
    CntVibraRunLongOffsetInInstru = $01;       //振动时间
    CntVibraOffLongOffsetInInstru = $02;       //振动间隔时间
    CntVibraModeOffsetInInstru = -1;           //振动模式在控制器偏移地址
type
    StorageParaInfoRd = Record
      CodeInDb : String[20] ;               //参数在数据库中的代码
      ParaName : String[20] ;               //参数名称
      OffsetInInstrument : Integer ;        //参数在仪表中的地址Offset
      BufIndex : Integer ;                  //参数在内存中数组下标位置
      Units : String[10] ;                  //单位
      ParaCode : Integer;                   //参数代号
    end;
Const
    CntStorageParaInfo : array[1..CntStorageParaCount] of StorageParaInfoRd
      = (
          ( CodeInDb            : 'STR_QIV_MDL';
            ParaName            : '振动模式';
            OffsetInInstrument  : CntVibraModeOffsetInInstru ;
            BufIndex            : CntVibraModeIndexInBuf;
            Units               : '';
            ParaCode            : CntStorParaIsVibraMode),

          ( CodeInDb            : 'STR_QIV_DLY';
            ParaName            : '振动延迟时间';
            OffsetInInstrument  :  CntVibraStartDelayOffsetInInstru;
            BufIndex            : CntVibraStartDelayIndexInBuf;
            Units               : 's';
            ParaCode            : CntStorParaIsVibraStartDelay),

          ( CodeInDb            : 'STR_QIV_LST';
            ParaName            : '振动时间';
            OffsetInInstrument  : CntVibraRunLongOffsetInInstru;
            BufIndex            : CntVibraRunLongIndexInBuf;
            Units               : 's';
            ParaCode            : CntStorParaIsVibraRunLong),

          ( CodeInDb            : 'STR_QIV_STP';
            ParaName            : '振动间隔时间';
            OffsetInInstrument  : CntVibraOffLongOffsetInInstru;
            BufIndex            : CntVibraOffLongIndexInBuf;
            Units               : 's';
            ParaCode            : CntStorParaIsVibraOffLong) ,

          ( CodeInDb            : 'STR_QIV_FLW';
            ParaName            : '振动边际流量';
            OffsetInInstrument  : CntVibraRunFlowOffsetInInstru ;
            BufIndex            : CntVibraRunFlowIndexInBuf;
            Units               : 'kg/s';
            ParaCode            : CntVibraRunFlowIndexInBuf),    //振动边际流量

          ( CodeInDb            : '';
            ParaName            : '';
            OffsetInInstrument  : -1;
            BufIndex            : -1;
            ParaCode            : 0)
        );
//---------------------------料仓参数结束---------------------------------------

{骨料输送}
var
    AggregateConveyorMode : Integer;    //骨料输送方式
Const
    CntAggregateConveyorBelt     = 1;      //皮带
    CntAggregateConveyorElevator = 2;      //提升机
//---------------------------骨料输送-------------------------------------------
type
    AggConveyorEquipRd = Record
      Use         : Boolean;
      EquipType   : Integer;
      RunLmtCheck : Boolean;
      ContinueRun : Boolean;    //运行模式 =True,常转；=False,点动启动 
    end;
Const
    CntAggConveyEquipIsLtLevelBelt    = 1;    //左平皮带
    CntAggConveyEquipIsRtLevelBelt    = 2;    //右平皮带
    CntAggConveyEquipIsLtInclinedBelt = 3;    //左斜皮带
    CntAggConveyEquipIsRtInclinedBelt = 4;    //右斜皮带
    CntAggConveyEquipIsLtLiftBucket   = 5;    //左提升斗
    //CntAggConveyEquipIs//= 6;//右提升斗
    CntAggConveyEquipIsLtShtLevelBelt = 7;    //左右平皮带
    //CntAggConveyEquipIsRtShtLevelBelt = 6;    //右平皮带
//var
//    AggregateConveyorEquipUse : array[1..4] of Boolean;     //骨料输送设备是否使用
var
    AggregateConveyorEquipInfo : array[1..6] of AggConveyorEquipRd ;    //骨料输送设备信息
    AggrConvEquipFlashSta      : array[1..6] of Integer;                //骨料输送设备动画状态

Const
    CntBeltFlashStaIsError     = 0 ;    //皮带动画状态 错误
    CntBeltFlashStaIsEmptyStop = 1;     //皮带动画状态 空停止
    CntBeltFlashStaIsEmptyRun  = 2;     //皮带动画状态 空运转
    CntBeltFlashStaIsFullRun   = 3;     //皮带动画状态 带料运转

var
    AggrConvEquipFlashFrame : array[1..4] of Integer;    //骨料输送设备动画 帧标记
    AggrConvEquipFlashTmr   : array[1..4] of Integer;    //骨料输送设备动画 定时器

var
    AggrConvEquipBtnState : array[1..4] of Integer;    //骨料输送设备按钮状态
Const
    CtAggrConvEquipBtnIsNone    = 0;    //骨料输送设备按钮状态 为 不存在
    CtAggrConvEquipBtnIsInvalid = 1;    //骨料输送设备按钮状态 为 无效
    CtAggrConvEquipBtnIsValid   = 2;    //骨料输送设备按钮状态 为 有效
    
//-------------------------骨料输送结束-----------------------------------------

//--------------------------骨料提升斗------------------------------------------
var
    ImgLiftBuktBtmLmtDspSta : array[1..2] of Integer;    //提升斗下限位显示
    ImgLiftBuktTopLmtDspSta : array[1..2] of Integer;    //提升斗上限位显示
Const
    CntImgLiftBuktLmtDspStaIsNone  = 0;    //该限位不存在
    CntImgLiftBuktLmtDspStaIsValid = 1;    //有效状态
    CntImgLiftBuktLmtDspStaIsInvad = 2;    //无效状态

var   //下标号=1，代表左提升斗  下标号=2，代表右提升斗
    ImgLiftBuktGoUpBtnDspSta : array[1..2] of Integer;    //提升斗上升按钮
    ImgLiftBuktGoDnBtnDspSta : array[1..2] of Integer;    //提升斗下降按钮
Const
    CntImgLiftBuktBtnDspStaIsNone  = 0;    //该限位不存在
    CntImgLiftBuktBtnDspStaIsValid = 1;    //有效状态
    CntImgLiftBuktBtnDspStaIsInvad = 2;    //无效状态

//骨料提升斗属性
type
  LiftBucketAttrRd = Record
    Name     : String;     //提升斗名称
    XMoveMax : Integer;    //横向移动最大点数
    YMoveMax : Integer;    //纵向移动最大点数
    XBottom  : Integer;    //提升斗在底 横向位置
    YBottom  : Integer;    //提升斗在底 纵向位置
    XTop     : Integer;    //提升斗在顶 横向位置
    YTop     : Integer;    //提升斗在顶 纵向位置
    GoUpLong : Integer;    //提升斗上升最大时间
    GoDnLong : Integer;    //提升斗下降最大时间
    GoUpTmr  : Integer;    //上升计时器
    GodnTmr  : Integer;    //下降计时器
    MovTmr   : Integer;    //移动计时器
  end;
Var
    LiftBucketAttr : array[1..2] of LiftBucketAttrRd;    //下标=1，左提升斗；下标=2，右提升斗
//------------------------骨料提升斗结束----------------------------------------

//-------------------------骨料中间仓参数---------------------------------------
var
    PMAggrHopperId : Integer;            //骨料中间斗/提升斗右键菜单号
var
    AggrMidHopperDschValveImgState : array[1..2] of Integer;
Const
    CntMdHopDshValImgIsNone    = 1;    //中间斗卸料阀状态 为 不存在
    CntMdHopDshValImgIsInvalie = 2;    //中间斗卸料阀状态 为 无效
    CntMdHopDshValImgIsValid   = 3;    //中间斗卸料阀状态 无 有效

Var
    AggrMidHopperDschVibraImgState : array[1..2] of Integer;
Const
    CntMdHopDshVibraImgIsNone    = 1;    //中间斗卸料 振动器图片 不存在
    CntMdHopDshVibraImgIsInvalie = 2;    //中间斗卸料 振动器图片 无效状态
    CntMdHopDshVibraImgIsValid   = 3;    //中间斗卸料 振动器图片 有效状态
var
    AggrMdHopperDschValClLmtImgState,   //中间斗卸料门 关限 图片状态
    AggrMdHopperDschValOpLmtImgState    //中间斗卸料门 开限 图片状态
      : array[1..2] of Integer;
Const
    CtMdHopDschValLmtImgIsNone    = 0;  //中间斗卸料门 限位图片 不存在
    CtMdHopDschValLmtImgIsInvalid = 1;  //中间斗卸料门 限位图片 无效
    CtMdHopDschValLmtImgIsValid   = 2;  //中间斗卸料门 限位图片 有效
    CtMdHopDschValLmtImgIsInvSpl  = 3;  //中间斗卸料门 限位图片 无效闪烁
    CtMdHopDschValLmtImgIsValSpl  = 4;  //中间斗卸料门 限位图片 有效闪烁
Const
    CtMdHopDschValLmtIsClose = 1;       //中间斗卸料门 限位是 关限
    CtMdHopDschValLmtIsOpen  = 2;       //中间斗卸料门 限位是 开限
var
    MidBinIsFull : array[1..2] of Boolean;  //骨料中间仓是否满/有料

var
    ImgBellState : Integer;     //电铃图片
const
    ImgBeltStateIsUnRing = 0;     //电铃图片非响状态
    IMgBeltStateIsRing   = 1;     //电铃图片响状态

{鼠标进入控件标识}
var
    mouseEnterBellImg : Boolean;    //鼠标进入电铃图片

Type
    AggregateMidBinInfoRd = Record
        Use              : Boolean;
        Name             : String[20];
        LoadInstrumentId : Integer;
        OpenLmtValid     : Boolean;
        CloseLmtValid    : Boolean;
        VibraValid       : Boolean;
        IsWeigher        : Boolean;
        Falgs            : String[50];
    end;

var
    AggregateMidBinInfo : array[1..2] of AggregateMidBinInfoRd;

type
    AggregateConvParaRd = Record
      Name : String[20] ;
      Value : Integer ;
      ParaUnit : String[6];
      Decimal : Integer;
      Flags : String[20];
    end;
Const
    CntAggregateConvParaCount = 16;
var
    AggregateConvPara : array[1..2] of array[1..CntAggregateConvParaCount] of AggregateConvParaRd ;    //按控制器地址排列
Type
    AggregateConvParaInfoRd = Record
      CodeInDb           : String[20];
      OffsetInInstrument : Integer;
      BufIndex           : Integer;
      ParaCode           : Integer;
    end;
Const
    CntAggreConvParaFstAddr = $0741;    //骨料输送参数首地址
Const
    CntBufIndexOfAggreMidDschDelay = 1;        //$7041 中储仓延迟投料时间 内存数组下标
    CntBufIndexOfAggreMidSndDschDelay = 2;     //$7042 第二次延迟投料时间 内存数组下标
    CntBufIndexOfAggreMidDschTm = 3;           //$7043 中储仓投料时间 内存数组下标
    CntBufIndexOfAggreMidSndDschTm = 4;        //$7044 第二次开门时间 内存数组下标
    CntBufIndexOfAggreMidLoadContinue = 5;     //$7045 中储仓装料持续时间 内存数组下标
    CntBufIndexOfAggreBeltStopDelay = 6;       //$7046 平皮带延迟停止时间 内存数组下标
                                               //$7047
    CntBufIndexOfAggreMidDschPauseTm = 8;      //7048 两次开门间隔 内存数组下标
    CntBufIndexOfSAND_WT = 9;                  //7049 砂裹石重量值 内存数组下标
    CntBufIndexOfVibraDelay = 10;              //704A 延迟振动时间 内存数组下标
    CntBufIndexOfVibraRunTm = 11;              //704B 振动时间 内存数组下标
    CntBufIndexOfVibraSTP = 12;                //704C  振动间隔时间 内存数组下标
    CntBufIndexOfRunMaxTm = 13;                //704D 过卷保护时间 内存数组下标
                                               //704E  内存数组下标
                                               //704F  内存数组下标
    CntBufIndexOfAggreMode = 16;               //7050 骨料生产方式 内存数组下标
Const
    CntOffsetOfAggreMidDschDelay = $0000;        //$7041 中储仓延迟投料时间 控制器地址偏移
    CntOffsetOfAggreMidSndDschDelay = $0001;     //$7042 第二次延迟投料时间 控制器地址偏移
    CntOffsetOfAggreMidDschTm = $0002;           //$7043 中储仓投料时间 控制器地址偏移
    CntOffsetOfAggreMidSndDschTm = $0003;        //$7044 第二次开门时间 控制器地址偏移
    CntOffsetOfAggreMidLoadContinue = $0004 ;    //$7045 中储仓装料持续时间 控制器地址偏移
    CntOffsetOfAggreBeltStopDelay = $0005;       //$7046 平皮带延迟停止时间 控制器地址偏移
                                                 //$7047
    CntOffsetOfAggreMidDschPauseTm = $0007;      //7048 两次开门间隔 控制器地址偏移
    CntOffsetOfSAND_WT = $0008;                  //7049 砂裹石重量值 控制器地址偏移
    CntOffsetOfVibraDelay = $0009;               //704A 延迟振动时间 控制器地址偏移
    CntOffsetOfVibraRunTm = $000A;               //704B 振动时间 控制器地址偏移
    CntOffsetOfVibraSTP = $000B;                 //704C 振动间隔时间 控制器地址偏移
    CntOffsetOfRunMaxTm = $000C;                 //704D 过卷保护时间 控制器地址偏移
                                                 //704E 控制器地址偏移
                                                 //704F 控制器地址偏移
    CntOffsetOfAggreMode = $000F;                //7050 骨料生产方式 控制器地址偏移
const    //参数代码
    CntAggrConvParaIsMidBinDschDelay    = 1;     //$7041 骨料输送参数是 中储仓延迟投料时间
    CntAggrConvParaIsMidBinSndDschDelay = 2;     //$7042 骨料输送参数是 中处仓二次延迟投料时间
    CntAggrConvParaIsMidBinDschLong     = 3;     //$7043 骨料输送参数是 中储仓投料时长
    CntAggrConvParaIsMidBinSndDschLong  = 4;     //$7044 骨料输送参数是 中储仓二次投料时长
    CntAggrConvParaIsMidBinLoadContinue = 5;     //$7045 骨料输送参数是 中储仓装料持续时间(骨料输送/提升延迟时间)
    CntAggrConvParaIsLevelBeltStopDelay = 6;     //$7046 骨料输送参数是 平皮带延迟停止时间
                                                 //$7047
    CntAggrConvParaIsMidBinDschPauseTm  = 8;     //$7048 骨料输送参数是 两次开门间隔
    CntAggrConvParaIsSAND_WT            = 9;     //$7049 骨料输送参数是 砂裹石重量值
    CntAggrConvParaIsMidBinVibraDelay   = 10;    //$704A 骨料输送参数是 延迟振动时间
    CntAggrConvParaIsMidBinVibraRunTm   = 11;    //$704B 骨料输送参数是 振动时间
    CntAggrConvParaIsMidBinVibraSTP     = 12;    //$704C 骨料输送参数是 振动间隔时间
    CntAggrConvParaIsHopprRunMaxTm      = 13;    //$704D 骨料输送参数是 过卷保护时间
    //CntAggrConvParaIs                          //704E  骨料输送参数是
    //CntAggrConvParaIs                          //704F  骨料输送参数是
    CntAggrConvParaIsAggreMode          = 16;    //7050 骨料输送参数是 骨料生产方式

Const
    CntAggreConvParaInfo : array[1..CntAggregateConvParaCount] of AggregateConvParaInfoRd
      = (
          ( CodeInDb           : 'TDC_F';
            OffsetInInstrument : CntOffsetOfAggreMidDschDelay;
            BufIndex           : CntBufIndexOfAggreMidDschDelay;
            ParaCode           : CntAggrConvParaIsMidBinDschDelay ),    //$7041 中储仓延迟投料时间

          ( CodeInDb           : 'TDC_S';
            OffsetInInstrument : CntOffsetOfAggreMidSndDschDelay;
            BufIndex           : CntBufIndexOfAggreMidSndDschDelay;
            ParaCode           : CntAggrConvParaIsMidBinSndDschDelay ),    //$7042 第二次延迟投料时间

          ( CodeInDb           : 'PRE_ULD_FST';
            OffsetInInstrument : CntOffsetOfAggreMidDschTm;
            BufIndex           : CntBufIndexOfAggreMidDschTm;
            ParaCode           : CntAggrConvParaIsMidBinDschLong ),    //$7043 中储仓投料时间

          ( CodeInDb           : 'PRE_ULD_SND';
            OffsetInInstrument : CntOffsetOfAggreMidSndDschTm;
            BufIndex           : CntBufIndexOfAggreMidSndDschTm;
            ParaCode           : CntAggrConvParaIsMidBinSndDschLong ),    //$7044 第二次开门时间

          ( CodeInDb           : 'UP_TM';
            OffsetInInstrument : CntOffsetOfAggreMidLoadContinue;
            BufIndex           : CntBufIndexOfaggreMidLoadContinue;
            ParaCode           : CntAggrConvParaIsMidBinLoadContinue ),    //$7045 中储仓装料持续时间

          ( CodeInDb           : 'HSTAP_INTER';
            OffsetInInstrument : CntOffsetOfAggreBeltStopDelay;
            BufIndex           : CntBufIndexOfAggreBeltStopDelay;
            ParaCode           : CntAggrConvParaIsLevelBeltStopDelay ),    //$7046 平皮带延迟停止时间 内存数组下标

          ( CodeInDb           : '';
            OffsetInInstrument : 0;
            BufIndex           : -1;
            ParaCode           : 0),    //7047H

          ( CodeInDb           : 'INS_DRS';
            OffsetInInstrument : CntOffsetOfAggreMidDschPauseTm;
            BufIndex           : CntBufIndexOfAggreMidDschPauseTm;
            ParaCode           : CntAggrConvParaIsMidBinDschPauseTm ),    //7048 两次开门间隔

          ( CodeInDb           : 'SAND_WT';
            OffsetInInstrument : CntOffsetOfSAND_WT;
            BufIndex           : CntBufIndexOfSAND_WT;
            ParaCode           : CntAggrConvParaIsSAND_WT ),    //7049 砂裹石重量值

          ( CodeInDb           : 'PRE_QIV_DLY';
            OffsetInInstrument : CntOffsetOfVibraDelay;
            BufIndex           : CntBufIndexOfVibraDelay;
            ParaCode           : CntAggrConvParaIsMidBinVibraDelay ),    //704A 延迟振动时间

          ( CodeInDb           : 'PRE_QIV_TIM';
            OffsetInInstrument : CntOffsetOfVibraRunTm;
            BufIndex           : CntBufIndexOfVibraRunTm;
            ParaCode           : CntAggrConvParaIsMidBinVibraRunTm ),    // 704B 振动时间

          ( CodeInDb           : 'PRE_QIV_STP';
            OffsetInInstrument : CntOffsetOfVibraSTP;
            BufIndex           : CntBufIndexOfVibraSTP;
            ParaCode           : CntAggrConvParaIsMidBinVibraSTP ),    //704C 振动间隔时间

          ( CodeInDb           : 'TUP_DOWN_WRN';
            OffsetInInstrument : CntOffsetOfRunMaxTm;
            BufIndex           : CntBufIndexOfRunMaxTm;
            ParaCode           : CntAggrConvParaIsHopprRunMaxTm ),    //704D 过卷保护时间

          ( CodeInDb           : '';
            OffsetInInstrument : 0;
            BufIndex           : -1;
            ParaCode           : 0),    //704E

          ( CodeInDb           : '';
            OffsetInInstrument : 0;
            BufIndex           : -1;
            ParaCode           : 0),    //704F

          ( CodeInDb           : 'PRE_BON_MDL';
            OffsetInInstrument : CntOffsetOfAggreMode;
            BufIndex           : CntBufIndexOfAggreMode;
            ParaCode           : CntAggrConvParaIsAggreMode )     //7050H 骨料生产方式
        );
//-----------------------骨料中间仓参数结束-------------------------------------

//------------------------搅拌机参数--------------------------------------------
var
    MixerStateInInstru : Integer;     //控制仪表内搅拌机状态 (0020H)
    MixerFlash         : Integer;     //搅拌机动画
    MixerFlashTmr      : Integer;     //搅拌机动画计时器
var
    ConveryBeltStateInInstru   : Integer;    //控制仪表内斜皮带状态     (002DH)
    AggrMidHopperStateInInstru : Integer;    //控制仪表内骨料中间仓状态 (0021H)

var
    MixerFalshState : array[1..2] of Integer;    //搅拌机动画状态
Const
    CtMxrFlashStIsNone      = 0;    //搅拌机动画 无
    CtMxrFlashStIsEmptyStop = 1;    //搅拌机动画 空停
    CtMxrFlashStIsFullStop  = 2;    //搅拌机动画 满停
    CtMxrFlashStIsEmptyRun  = 3;    //搅拌机动画 空运行
    CtMxrFlashStIsFullRun   = 4;    //搅拌机动画 满运行
var
    BtnMxrDschValveOpState : array[1..2] of Integer;    //搅拌机卸料门 开门按钮状态
Const
    CtBtnMxrDschValveOpStIsNone    = 0;    //搅拌机卸料门 开门按钮状态 为 不存在
    CtBtnMxrDschValveOpStIsValid   = 1;    //搅拌机卸料门 开门按钮状态 为 有效
    CtBtnMxrDschValveOpStIsInvalid = 2;    //搅拌机卸料门 开门按钮状态 为 无效
var
    BtnMxrDschValveClState : array[1..2] of Integer;    //搅拌机卸料门 关门按钮状态
Const
    CtBtnMxrDschValveClStIsNone    = 0;    //搅拌机卸料门 关门按钮状态 为 不存在
    CtBtnMxrDschValveClStIsValid   = 1;    //搅拌机卸料门 关门按钮状态 为 有效
    CtBtnMxrDschValveClStIsInvalid = 2;    //搅拌机卸料门 关门按钮状态 为 无效
var
    MixerDschValveImgState : array[1..2] of Integer;    //搅拌机卸料门 状态
Const
    CtMxrDschValStIsNone     = 0;    //搅拌机卸料门 状态 不存在
    CtMxrDschValStIsOpen     = 1;    //搅拌机卸料门 状态  开
    CtMxrDschValStIsClose    = 2;    //搅拌机卸料门 状态  关
    CtMxrDschValStIsHalfOpen = 3;    //搅拌机卸料门 状态  半开
    CtMxrDschValStIsAlarm    = 4;    //搅拌机卸料门 状态   报警

var
    PmSltMixerId : Integer;    //右键选择的搅拌机号

type
    MixerInfoRd = Record
      FstDschEn                 : Boolean ;    //首盘卸料使能
      DschMode                  : Integer;     //卸料模式
      AggreDschEn               : Boolean;     //允许骨料卸料
      LoadIntoEn                : Boolean;     //搅拌机装料使能
      DschEn                    : Boolean;     //搅拌机卸料使能
      MaxCap                    : double;      //最大容量
      MixerDschLinkToPowderLoad : Boolean;     //粉料未配完，是否允许搅拌机卸料
      Flags                     : String[50];  //搅拌机属性
    end;

Const    //搅拌机卸料模式
    CntMixerDischOne = 1;    //单气缸卸料
    CntMixerDischTwo = 2;    //双信号控制——三位五通或液压

var
    MixerInfo :  MixerInfoRd;

Const
    CntMixerParaCount = 12;

type
    MixerParaInfoRd = Record
        CedeInDb            : String ;    //数据库中的代号
        IndexInParaArray    : Integer ;   //参数数组中序号
        AddressInInstrument : Integer;    //控制器中的参数地址
        ParaCode            : Integer;    //参数代号
    end;
Const    //参数在控制器中的通讯地址
    CntAddrOfMixingSetLngInInstru = $0702;    //0702参数 在控制器中的通讯地址 搅拌时间
    CntAddrOfSndMixingSetLngInInstru = $0703;   //0703参数 在控制器中的通讯地址 二次搅拌时间
    CntAddrOf3rdMixingSetLngInInstru = $0704;   //0704参数 在控制器中的通讯地址 三次搅拌时间
    CntAddrOf4thMixingSetLngInInstru = $0705;   //0705参数 控制器中的通讯地址 四次搅拌时间
    CntAddrOf5thMixingSetLngInInstru = $0706;   //0706参数 控制器中的通讯地址 五次搅拌时间
    CntAddrOfDschSetLngInInstru = $0707;        //0707参数 控制器中的通讯地址 全开门卸砼时间
    CntAddrOfInchDschCountInInstru = $0708;     //0708参数 控制器中的通讯地址 点动开门次数
    CntAddrOfInchOpenLngInInstru =$0709;        //0709参数 控制器中的通讯地址 点动开门时间
    CntAddrOfInchCloseLngInInstru =$070A;       //070A参数 控制器中的通讯地址 点动关门时间
    CntAddrOfHalfDschLngInInstru =$070B;        //070B参数 控制器中的通讯地址 半开门持续时间
    CntAddrOfHalfDschCkeckDelayInInstru =$070C; //070C参数 控制器中的通讯地址 延迟检查半开门时间
    CntAddrOfMixingTmrStartInInstru =$070D;     //070D参数 控制器中的通讯地址 搅拌计时起始时刻
Const    //参数在内存数组中的序号
    CntIndexOfMixingTmrStartInArray = 1;        //070D参数 内存数组中的序号 搅拌计时起始时刻
    CntIndexOfMixingSetLngInArray = 2;          //0702H内存数组中的序号 搅拌时间
    CntIndexOfSndMixingSetLngInArray = 3;       //0703参数 在内存数组中的序号 二次搅拌时间
    CntIndexOf3rdMixingSetLngInArray = 4;       //0704参数 内存数组中的序号 三次搅拌时间
    CntIndexOf4thMixingSetLngInArray = 5;       //0705参数 内存数组中的序号 四次搅拌时间
    CntIndexOf5thMixingSetLngInArray = 6;       //0706参数 内存数组中的序号 五次搅拌时间
    CntIndexOfDschSetLngInArray = 7;            //0707参数 内存数组中的序号 全开门卸砼时间
    CntIndexOfInchDschCountInArray = 8;         //0708参数 内存数组中的序号 点动开门次数
    CntIndexOfInchOpenLngInArray = 9;           //0709参数 内存数组中的序号 点动开门时间
    CntIndexOfInchCloseLngInArray =10;          //070A参数 内存数组中的序号 点动关门时间
    CntIndexOfHalfDschLngInArray = 11;          //070B参数 内存数组中的序号 半开门持续时间
    CntIndexOfHalfDschCkeckDelayInArray = 12;   //070C参数 内存数组中的序号  延迟检查半开门时间
    
Const
    CntMixerParaCodeIsMixingSetLng       = 1 ;          //0702H 搅拌时间
    CntMixerParaCodeIsSndMixingSetLng    = 2 ;          //0703参数 二次搅拌时间
    CntMixerParaCodeIs3rdMixingSetLng    = 3 ;          //0704参数 三次搅拌时间
    CntMixerParaCodeIs4thMixingSetLng    = 4 ;          //0705参数 四次搅拌时间
    CntMixerParaCodeIs5thMixingSetLng    = 5 ;          //0706参数 五次搅拌时间
    CntMixerParaCodeIsDschSetLng         = 6 ;          //0707参数 全开门卸砼时间
    CntMixerParaCodeIsInchDschCount      = 7 ;          //0708参数 点动开门次数
    CntMixerParaCodeIsInchOpenLng        = 8 ;          //0709参数 点动开门时间
    CntMixerParaCodeIsInchCloseLng       = 9 ;          //070A参数 点动关门时间
    CntMixerParaCodeIsHalfDschLng        = 10;          //070B参数 半开门持续时间
    CntMixerParaCodeIsHalfDschCkeckDelay = 11;          //070C参数 延迟检查半开门时间
    CntMixerParaCodeIsMixingTmrStart     = 12;          //070D参数 搅拌计时起始时刻

    //参数信息
Const
    CntMixerParaInfo : array[1..CntMixerParaCount] of MixerParaInfoRd    //以显示顺序排列
      = (
          ( CedeInDb            : 'BLD_BLD_MDL' ;
            IndexInParaArray    : CntIndexOfMixingTmrStartInArray  ;
            AddressInInstrument : CntAddrOfMixingTmrStartInInstru;
            ParaCode            : CntMixerParaCodeIsMixingTmrStart),  // 1：070DH 搅拌计时起始时刻

          ( CedeInDb            : 'BLD_FST' ;
            IndexInParaArray    : CntIndexOfMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOfMixingSetLngInInstru;
            ParaCode            : CntMixerParaCodeIsMixingSetLng),    // 2：0702H 搅拌时间

          ( CedeInDb            : 'BLD_SND' ;
            IndexInParaArray    : CntIndexOfSndMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOfSndMixingSetLngInInstru;
            ParaCode            : CntMixerParaCodeIsSndMixingSetLng),   // 3：0703H 二次搅拌时间

          ( CedeInDb            : 'BLD_THD' ;
            IndexInParaArray    : CntIndexOf3rdMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOf3rdMixingSetLngInInstru;
            ParaCode            : CntMixerParaCodeIs3rdMixingSetLng),  // 4：0704H 三次搅拌时间

          ( CedeInDb            : 'BLD_FOR' ;
            IndexInParaArray    : CntIndexOf4thMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOf4thMixingSetLngInInstru ;
            ParaCode            : CntMixerParaCodeIs4thMixingSetLng),  // 5：0705H 四次搅拌时间

          ( CedeInDb            : 'BLD_FIV' ;
            IndexInParaArray    : CntIndexOf5thMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOf5thMixingSetLngInInstru;
            ParaCode            : CntMixerParaCodeIs5thMixingSetLng),  // 6：0706H 五次搅拌时间

          ( CedeInDb            : 'BLD_ULD_LST' ;
            IndexInParaArray    : CntIndexOfDschSetLngInArray  ;
            AddressInInstrument : CntAddrOfDschSetLngInInstru ;
            ParaCode            : CntMixerParaCodeIsDschSetLng),      //7：0707H 全开门卸砼时间

          ( CedeInDb            : 'BLD_DOT_CNT' ;
            IndexInParaArray    : CntIndexOfInchDschCountInArray  ;
            AddressInInstrument : CntAddrOfInchDschCountInInstru;
            ParaCode            : CntMixerParaCodeIsInchDschCount),   // 8：0708H 点动开门次数

          ( CedeInDb            : 'BLD_DOT_ON' ;
            IndexInParaArray    : CntIndexOfInchOpenLngInArray  ;
            AddressInInstrument : CntAddrOfInchOpenLngInInstru;
            ParaCode            : CntMixerParaCodeIsInchOpenLng),    // 9：0709H 点动开门时间

          ( CedeInDb            : 'BLD_DOT_OFF' ;
            IndexInParaArray    : CntIndexOfInchCloseLngInArray  ;
            AddressInInstrument : CntAddrOfInchCloseLngInInstru ;
            ParaCode            : CntMixerParaCodeIsInchCloseLng),   // 10：070AH 点动关门时间

          ( CedeInDb            : 'BLD_HLF_LST' ;
            IndexInParaArray    : CntIndexOfHalfDschLngInArray  ;
            AddressInInstrument : CntAddrOfHalfDschLngInInstru;
            ParaCode            : CntMixerParaCodeIsHalfDschLng),   // 11：070BH 半开门持续时间

          ( CedeInDb            : 'BLD_CHK_HLF' ;
            IndexInParaArray    : CntIndexOfHalfDschCkeckDelayInArray  ;
            AddressInInstrument : CntAddrOfHalfDschCkeckDelayInInstru ;
            ParaCode            : CntMixerParaCodeIsHalfDschCkeckDelay)// 12：070CH 延迟检查半开门时间
        );

type
    MixerParaRd = Record
        Name    : String[30];
        Value   : Integer ;
        Decimal : Integer ;
        Unt     : String[6];
        Flags   : String[10];
    end;
var
    MixerPara : array[1..CntMixerParaCount] of MixerParaRd;

//------------------------搅拌机参数结束----------------------------------------

//------------------------骨料输送设备------------------------------------------
//var
//    ConveryBeltFlash           : Integer;    //斜皮带动画
//    ConveryBeltTmr             : Integer;    //斜皮带动画计时器



//------------------------窗体创建变量------------------------------------------
var
    FrmBasicSettingCrt           : Boolean ;    //基本设置窗体
    FrmRecipeCrt                 : Boolean;     //配方窗体
    FrmTaskCrt                   : Boolean;     //生产任务窗体
    FrmWeigAttrCrt               : Boolean;     //称属性窗体
    FrmWeigDschRemainCrt         : Boolean;     //称卸料扣料窗体
    FrmWeigherCalValueCrt        : Boolean;     //校称值窗体
    FrmPersonnelMangementCrt     : Boolean;     //人员管理窗体
    FrmSetPassWordCrt            : Boolean;     //设置密码窗体
    FrmStorageAttributeCrt       : Boolean;     //料仓属性窗体
    FrmAggrConceyorHopperAttrCrt : Boolean;     //骨料输送设备属性窗体
    FrmMixParaCrt                : Boolean;     //搅拌机参数
    FrmCommunicationSetCrt       : Boolean;     //通讯设置窗体
    FrmSignalDefineCrt           : Boolean;     //信号定义窗体
    FrmSysUnlockCrt              : Boolean;     //解锁窗体
    FrmLftHopperCrt              : Boolean;     //提升斗属性窗体
    FrmSysAboutCrt               : Boolean;     //关于系统窗体
    FrmConfigCrt                 : Boolean;     //设备设置窗体
    FrmMaterialStorageCrt        : Boolean;     //原料入库窗体
    FrmMaterialLstCrt            : Boolean;     //原料列表
    FrmModifyStocksCrt           : Boolean;     //库存调整窗体
    FrmStocksCrt                 : Boolean;     //库存显示窗体
var
    FrmMaLstUseMode : Integer;                  //原料列表窗体使用目的
Const
    CntFrmMaLstIsMaSelForHouse = 1;             //原料列表窗体使用目的 是 材料入库选择
    
//----------------------窗体创建变量结束----------------------------------------

var
    InstrumentState : Integer;                //0024H 下位机状态
    WgherLoadEnableInInstrument : Integer;    //下位机中 仪表配料使能状态
    AutoRingState   : Integer;                //0710H 自动响铃状态
    MixerProdCounterInInstru  : Integer;      //0040H 搅拌机生产盘数计数器
    MixerMixingTmrInInstu     : Integer;      //0041H 搅拌机搅拌计时器
    MixerDschTmrInInstru      : Integer;      //0042H 搅拌机卸料计时器
    AggrLoadCounterInInstru   : Integer;      //0043H 中间仓生产盘数计数器
    AggrConveyTmrInInstrument : Integer;      //0044H 下位机中的骨料输送计时器 ——骨料斜皮带输送持续时间 / 提升斗提升延迟时间
    AggrMidBinDschTmrInInstru : integer;      //0045H 下位机中骨料中间仓投料时间计时器
//----------------                                        ----------------------
//-------------------------------主界面-----------------------------------------

{称相关图片}
Const    //卸料阀图片状态
    CntWeigDischValveIsInvalid = 0;    //卸料阀无效状态
    CntWeigDischValveIsClose   = 1;    //卸料阀关闭状态
    CntWeigDischValveIsOPen    = 2;    //卸料阀打开状态
var
    WeigherDischValveImgState : Array[1..WeigherCount] of Integer;              //称卸料阀图片状态
    
var
    WeigherDischVibraImgState : Array[1..WeigherCount] of Integer;              //称卸料振动器图片状态

Const    //称卸料阀关门限位图片
    CntWghrDschValveClsLmtImgIsInvalid      = 1;    //称卸料阀关限图片 无效     状态
    CntWghrDschValveClsLmtImgIsValid        = 2;    //称卸料阀关限图片 有效     状态
    CntWghrDschValveClsLmtImgIsValidFlash   = 3;    //称卸料阀关限图片 有效闪烁 状态
    CntWghrDschValveClsLmtImgIsInvalidFlash = 4;    //称卸料阀关限图片 无效闪烁 状态
var
    WeigherDischValveCloseLmtImgState : Array[1..WeigherCount] of Integer;      //称卸料阀关闭限位图片状态


{料仓计量阀图片名称}
Const
    CntSiloLdValveImgIsLd   = 1;   //料仓计量阀图片名称 是 计量阀   图片
    CntSiloLdValveImgIsFnLd = 2;   //料仓计量阀图片名称 是 精计量阀 图片

    {计量阀图片类型常量}
Const
    CntAggregateLoadImg   = 1;    //骨料计量阀图片
    CntAggregateFineImg   = 2;    //骨料精计量阀图片
    CntPowderLoadImg      = 3;    //粉料仓计量阀图片
    CntPowderFineImg      = 4;    //粉料仓精计量阀图片
    CntLiqLoadImg         = 5;    //液仓计量阀图片
    CntLiqFineImg         = 6;    //液仓精计量阀图片
    CntAggregateCoLoadImg = 7;    //骨料粗计量阀图片
    CntPowderCoLoadImg    = 8;    //粉料粗计量螺旋图片
    CntLiqCoLoadImg       = 9;    //液体仓粗计量阀图片

{计量阀图片状态}
    CntLoadImgStateIsInvalid = 0;    //计量门图片 为 无效状态
    CntLoadImgStateIsClose   = 1;    //计量门关闭状态
    CntLoadImgStateIsOpen    = 2;    //计量门打开状态
var
    StorageLoadImgState     : array[1..CntStorageCount] of integer;             //料仓计量门图片状态
    StorageFineLoadImgState : array[1..CntStorageCount] of integer;             //料仓精计量门图片状态
    StorageVibratorImgState : array[1..CntStorageCount] of integer;             //料仓振动器图片状态
Const
    CntVibraImgStaIsInvalid = 0;    //振动器 图片 无效 状态
    CntVibraImgStaIsClose   = 1;    //振动器 图片 关   状态
    CntVibraImgStaIsOpen    = 2;    //振动器 图片 开   状态

//var
//    StorageLoadValueLabVisible : array[1..CntStorageCount] of Boolean;

var
    BtnIncProdSetCountState ,    //增加 生产盘数 按钮状态
    BtnDecProdSetCountState :    //减少 生产盘数 按钮状态
                              Integer;
Const
    BtnProdSetCountStIsEnbale  = 1;    //生产盘数按钮 有效
    BtnProdSetCountStIsDisable = 2;    //生产盘数按钮 无效

var
    BtnAggrDisaDschState ,    //禁止骨卸 按钮状态
    BtnMixerDisaLoadInState,  //禁止投料 按钮状态
    BtnMixerDisaDschState ,   //禁止卸砼 按钮状态
    BtnRingState              //自动响铃 按钮状态
      : Integer;
Const
    CntBtnCheckStateIsTrue  = 1;   //按钮状态 为 勾选
    CntBtnCheckStateIsFalse = 2;   //按钮状态 为 无勾选
var
    BtnProdPauseEnableState : Integer;    //生产暂停 Enable 状态
Const
    CtBtnProdPauseEnStIsTrue  = 1;    //生产暂停按钮 Enable True
    CtBtnProdPauseEnStIsFalse = 2;    //生产暂停按钮 Enable False
var
    BtnProdPauseCaptionState : Integer;    //生产暂停按钮 Caption 状态
Const
    CtBtnProdPauseCpIsPause   = 1;    //生产暂停按钮 Caption 暂停生产 状态
    CtBtnProdPauseCaIsRestart = 2;    //生产暂停按钮 Caption 恢复生产 状态
var
    BtnProdStartCaptionState : Integer;    //生产启动按钮 Caption 状态
Const
    CtBtnProdStatCpIsStart = 1;    //启动生产按钮 Caption 为 启动生产
    CtBtnProdStatCpIsEnd   = 2;    //启动生产按钮 Caption 为 结束生产
var
    LbWgrLdCounterVisibleState : array[1..WeigherCount] of Integer;    //称配料计数器标签的 Visible 属性
Const
    CtLbWgrLdCounterVisibleIsTrue  = 1;    //称配料计数器标签的 Visible 为 True
    CtLbWgrLdCounterVisibleIsFalse = 2;    //称配料计数器标签的 Visible 为 False
//-------------------------------主界面-----------------------------------------
//----------------                                        ----------------------

//--------------------------生产过程参数----------------------------------------
//----------------------------------------------
//var
//    ProdRecipeCode : String;
//    StorageLoadRecipe : array[1..CntStorageCount] of Double;    //料仓配方值
//    StorageLoadTarget : array[1..CntStorageCount] of Double;    //料仓配料目标值
//    ProdAmount      : Double ;    //生产方量
//    ProdBatchsCount : Integer;    //生产盘数
//    ProdBatchAmount : Double ;    //单盘方量
//    WeigherLoadTarget : array[1..WeigherCount] of array[1..4] of Integer;
//----------------------------------------------

//    ProdStartRow : Integer;    //生产启动行

//type
//    ProdNoticeInfoRd = Record     //生产派车单信息
//      TaskGrdRow        : Integer;       //任务表行号
//      ProdTask_Code     : String[30];    //生产订单编号
//      ProdRecipe_Code   : String[20];    //生产配比编号
//      ProdStoraLdRecipe : array[1..CntStorageCount] of Double;    //生产料仓配方值
//      ProdStoraLdTarget : array[1..CntStorageCount] of Double;    //生产料仓配料目标值
//      ProdAmount        : Double ;    //生产方量
//      ProdBatchsCount   : Integer;    //生产盘数
//      ProdBatchAmount   : Double ;    //单盘方量
//      InstruLoadRdPt    : Integer;     //仪表记录读指针
//      //WeigherLoadTarget : array[1..WeigherCount] of array[1..4] of Integer;
//    end;
//Const
//    CntProdNoticeInfoQueueLen = 3;    //派车单信息队列长度
//var
//    ProdNoticeInfo : array[1..CntProdNoticeInfoQueueLen] of ProdNoticeInfoRd;   //生产派车单信息
//var
//    ProdNoticeInfoWtPt ,             //生产派车单信息写指针
//    ProdNoticeInfoRdPt : Integer;    //生产派车单信息读指针

//type
//    InstruLoadRecordRd = Record
//      WeigherLoadTarget : array[1..WeigherCount] of array[1..4] of double;    //仪表配料目标值
//      WeigherLoadAmont  : array[1..WeigherCount] of array[1..4] of double;    //仪表配料值
//    end;
//var
//    InstruLoadRecord : array[1..CntProdNoticeInfoQueueLen] of InstruLoadRecordRd;    //仪表配料记录
//var
//    InstruLoadRdWtPt : array[1..WeigherCount] of Integer;    //仪表记录写指针
//------------------------------------------------------------------------------
var
    ProdStartRow : Integer;

var
    ProdNoticeInfoRdPt ,             //生产派车单信息读指针
    ProdNoticeInfoWtPt : Integer;    //生产派车单信息写指针

    ProdWtPieceInDbEn  : Boolean;    //允许写盘数据到数据库

type
    ProdStorateLdRecipeRd = Record
        EndBatchNumber   : Integer;
        LoadRecipe       : Double;
    end;
Const
    CntProdStoraLdRceQueueLen = 4;    //料仓配方队列长度

type
    ProdStoraLdTargetRd = Record
      EndBatchNumber : Integer;
      LoadTarget       : Double;
    end;
Const
    CntProdStorageTargetQueueLen = 4;    //料仓配料目标值队列长度

type
    StorageMateriaWatFulRd = Record    //料仓原料含水率
      BeginBatchNumber : Integer;
      WatFul           : Double;
    end;
Const
    CntStorMatWatFulQueueLen = 4;

type
    ProdNoticeInfoRd = Record     //生产派车单信息
      ProdNotice_ID      : Longint;       //生产派车单号
      ProdTask_Code      : String[30];    //生产订单编号
      ProdRecipe_Code    : String[20];    //生产配比编号
      ProdAmount         : Double ;       //生产方量
      ProdBatchsCount    : Integer;       //生产盘数
      ProdBatchAmount    : Double ;       //单盘方量
      ProdTask_IdInDb    : LongInt ;      //生产单 数据库中的ID号
      LdStorageCounter   : Integer;       //配料仓数量

      SiloLoadEn         : array[1..CntStorageCount] of Boolean;
      SiloLdNumInNotice  : array[1..CntStorageCount] of Integer;    //生产任务中，该料仓的配料排列序号

      ProdStoraLdRecipe  : array[1..CntStorageCount] of array[1..CntProdStoraLdRceQueueLen] of ProdStorateLdRecipeRd;    //生产料仓配方值
      ProdStoraLdRecWtPt : array[1..CntStorageCount] of Integer;    //料仓配料配比队列写指针
      ProdStoraLdRecRdPt : array[1..CntStorageCount] of Integer;    //料仓配料配比队列读指针

      ProdStorageLdTarget   : array[1..CntStorageCount] of array[1..CntProdStorageTargetQueueLen] of ProdStoraLdTargetRd;   //生产料仓配料目标值
      ProdStorageLdTargWtPt : array[1..CntStorageCount] of Integer;    //生产料仓配料目标值队列写指针
      ProdStorageLdTargRdPt : array[1..CntStorageCount] of Integer;    //生产料仓配料目标值队列读指针

      StorageMaterialWatFul : array[1..CntStorageCount] of array[1..CntStorMatWatFulQueueLen] of StorageMateriaWatFulRd;    //料仓原料含水率值
      StorMatWatFulWtPt     : array[1..CntStorageCount] of Integer;    //料仓含水率值写指针
      StorMatWatFulRdPt     : array[1..CntStorageCount] of Integer;    //料仓含水率值读指针

      WtDbPieceId           : Integer;     //数据已写盘号 
    end;

Const
    CntProdNoticeInfoLen = 4;
var
    ProdNoticeInfo : array[1..CntProdNoticeInfoLen] of ProdNoticeInfoRd;    //生产派车单信息

Const
    CntLoadValueQueueLen = 4;    //配料值（配料目标值和实际配料值）队列长度

type
    WghrLoadInfoRd = Record
        RecordBatchCount    : Integer;    //记录配料盘次

        LoadFactDsp   : Boolean;    //配料值显示
        RdFactLoadEna : Boolean;    //读实际配料值使能位
        Rd2ndLoadEna  : Boolean;    //读扣称配料值使能位
        RdFactWaitPt  : Integer;    //读配料值等待指针

        Rd2ndSiloId   : Integer;    //扣称料仓号 

        WtLoadValuePt : Integer;    //写配料值指针
        RdLoadValuePt : Integer;    //读配料值指针
        //LoadTarget    : array[1..CntLoadValueQueueLen] of array[1..4] of double;    //配料目标值
        LoadTarget    : array[1..4] of Integer;
        //LoadFact      : array[1..CntLoadValueQueueLen] of array[1..4] of Double;   //实际配料值
    end;

var
    WeigherLoadInfo : array[1..WeigherCount] of WghrLoadInfoRd;

//配料记录值
type
    SiloLdInfoRd = Record
      WtPt        : Integer;
      Wt2ndPt     : Integer;     //扣称记录写指针
      RdPt        : Integer;
      LoadFact    : array[1..CntLoadValueQueueLen] of Double;    //配料计量值
      LoadTarget  : array[1..CntLoadValueQueueLen] of Double;    //配料目标值
      ErrorIsOver : array[1..CntLoadValueQueueLen] of Integer;   //配料超差类型
    end;
const
    CntLdErrIsNegative = -1;    //负超差
    CntLdErrIsNone     = 0 ;    //无超差
    CntLdErrIsPositive = 1 ;    //正超差

var
    SiloLoadInfo : array[1..CntStorageCount] of SiloLdInfoRd ;

type
    ReadPieceNumberInfoRd = Record
      RdWaitEn       : Boolean;    //读取等待
      RdBufPt        : Integer;    //接收缓冲区指针
      SetPieceNumber : Integer;
    end;
var
    ReadPieceNumberInfo : ReadPieceNumberInfoRd;
//------------------------------------------------------------------------------

var
    GrdLdInfoEditing : Boolean;
    GrdLdInfoEdtRow  : Integer;
    GrdLdInfoEdtCol  : Integer;

type
    StoraLdTgtModiInfoRd = Record
        Ena        : Boolean;
        Tmr        : Integer;
        RevBufPt   : Integer;
        ModiStorId : Integer;
        NewTarget  : Double;
    end;
var
    StoraLdTgtModiInfo : StoraLdTgtModiInfoRd;

type
    ProdBatchsModiInfoRd = Record
        Ena : Boolean;
        ModiTp : Integer;    //>0为加，<0为减
        Tmr : Integer;
        RevBufPt : Integer;
    end;
Const
    CtProdBatchsModiIsInc = 1;
    CtProdBatchsModiIsDec = -1;
var
    ProdBatchsModiInfo : ProdBatchsModiInfoRd;
    
implementation

end.
