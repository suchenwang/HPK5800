unit UnitIniInstrument;

interface
  procedure Instruction1Init();    //控制器初始化
    Function Instruction1MscommReadForIni(var Instrument1IniEnable : Boolean) : integer;    //读取控制器设置
    function InstrumentSetFstDschForIni(var Instrument1IniEnable : Boolean) : Integer ;    //搅拌机首盘卸料设置
    function InstrumentSetWeigherNoForIni(var Instrument1IniEnable : Boolean) : Integer;   //设置称仪表号
    function Instrument1SetWeigherCloseLmtForIni(var Instrument1IniEnable : Boolean) : Integer ;    //设置称关限
    Function InstrumentSetWorkStateForIni(var Instrument1IniEnable : Boolean) : Integer ;    //初始化控制器工作状态


  function IniInstrument1MixerPara(var Instrument1IniEnable : Boolean) : Integer;    //初始化搅拌机参数



  function IniInstrument1MixerDischMode( var Instrument1IniEnable : Boolean ) : Integer;    //初始化搅拌机卸料方式
  function IniInstrument1Address070E( var Instrument1IniEnable : Boolean ) : Integer;     //未定义
  function IniInstrument1Address071A( var Instrument1IniEnable : Boolean ) : Integer;     //未定义
  function IniInstrument1Address071B( var Instrument1IniEnable : Boolean ) : Integer;     //未定义
  function IniInstrument1AggregateConveyorMode( var Instrument1IniEnable : Boolean ) : Integer;    //骨料输送模式
  function IniAdditiveDischIntoWater( var Instrument1IniEnable : Boolean ) : Integer;    //初始化外剂卸料方式
  function IniInstrument1Address03D5( var Instrument1IniEnable : Boolean ) : Integer;    //未定义
  //---------------------一部分命令
  {}
  //----------------------------------

  function IniInstrument1WeigherPara( var Instrument1IniEnable : Boolean ) : Integer;    //初始化控制器仪表参数
    function IniWeigherStorageCount( var Instrument1IniEnable : Boolean;
      WeigherId : Integer; StorageCount : Integer ) : Integer;                             //各配料仪表的料仓数量
    function IniReadWeigherParaFromInstrument1(var Instrument1IniEnable : Boolean;
       var WaitReceiveBufPt : Integer ; IniWeigherId : Integer ) : Integer;                //读取仪表的参数设置
    function IniWtWeigherDschVibratorSetting(var Instrument1IniEnable : Boolean;
      IniWeigherId : Integer) : Integer;                                                   //设置称卸料振动器参数
    function IniWtWeigherOffset0012H(var Instrument1IniEnable : Boolean;
      IniWeigherId : Integer) : Integer;                                                   //设置称基本参数中偏移地址为0012H的参数
    procedure IniWtStorageVibraStart(WeigherId : Integer; LoadIndex : Integer);            //初始化写料仓边际振动流量
    procedure IniWtStorageVibraSet(var Instrument1IniEnable : Boolean;
      WeigherId : Integer; LoadIndex : Integer);              //初始化写料仓振动器设置

  function IniWtAggregateMidBin(var Instrument1IniEnable : boolean) : Integer;           //初始化骨料中间仓

  function IniRingToInstrument(var Instrument1IniEnable : Boolean) : Integer;     //初始化电铃

  function IniAddr0747ToInstrument(var Instrument1IniEnable : Boolean) : Integer;    //初始化地址0747H

  function IniWeighersDschDesignToInstrument(var Instrument1IniEnable : Boolean) : Integer;     //初始化称投料顺序

  function IniStorageRepToInstrument(var Instrument1IniEnable : Boolean) : Integer;    //设置换仓目标仓



  function IniWriteAwordToInstrument( Const Caption: WideString ;  Address : Integer;
    WordValue : Integer) : Integer;                                                      //初始化向下位机写入一个字
  function IniWtWordsToInstrument(Caption : Pchar; WtAddress : Integer;
    WordsValue : array of Integer; WordsNumber : Integer) : Integer;                     //初始化向下位机写入多个字字

  
implementation

uses UnitGlobeVar, UnitGlobeSub , UnitRWInstrument1MscommBuf, UnitSplash,
     Forms, Windows, ADODB,
     UnitMain ,
     UnitRWDb, 
     SysUtils,  math,
     Dialogs ;

//-------------------------初始化控制器-----------------------------------------
procedure Instruction1Init();    //控制器初始化
var
    Instruction1InitEnable : Boolean;
    i : integer;
    FunExcuteResult : Integer;
begin
    Instruction1InitEnable := True;

    {读取下位机配置 }
    FunExcuteResult := Instruction1MscommReadForIni(Instruction1InitEnable);
    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //更新进度条

    {设置首盘卸料禁止允许}
    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '设置首盘卸料...' ;
        InstrumentSetFstDschForIni( Instruction1InitEnable ) ;
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //更新进度条
    end;

    {设置称仪表号}
    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '设置称的仪表编号...' ;
        InstrumentSetWeigherNoForIni(Instruction1InitEnable) ;
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //更新进度条
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '设置各称限位...' ;
        Instrument1SetWeigherCloseLmtForIni(Instruction1InitEnable) ;
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //更新进度条
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '设置控制器状态...' ;
        InstrumentSetWorkStateForIni(Instruction1InitEnable);    //控制器进入初始状态
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //更新进度条
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '设置搅拌机参数...' ;
        IniInstrument1MixerPara(Instruction1InitEnable) ;
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 2;    //更新进度条
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '设置骨料输送方式...' ;
        IniInstrument1AggregateConveyorMode( Instruction1InitEnable ) ;    //骨料输送模式
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //更新进度条
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '设置外剂称是否卸进水称...' ;
        IniAdditiveDischIntoWater( Instruction1InitEnable ) ;    //外剂卸料方式
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //更新进度条
    end;

    if Instruction1InitEnable then    //写03D5
    begin
        FrmSplash.LbSplash.Caption := '设置外剂称是否卸进水称...' ;
        IniInstrument1Address03D5( Instruction1InitEnable ) ;    //
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //更新进度条
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '设置称参数参数...' ;
        IniInstrument1WeigherPara( Instruction1InitEnable ) ;    //控制器1仪表参数
    end;

    if Instruction1InitEnable then
    begin
        //初始化平皮带
        FrmSplash.LbIniInfo.Caption := '初始化平皮带';

    end;

    if Instruction1InitEnable then    //设置骨料中间仓
    begin
        if AggregateConveyorMode = CntAggregateConveyorBelt then
        begin
            FrmSplash.LbIniInfo.Caption := '设置骨料中间仓...' ;

            IniWtAggregateMidBin( Instruction1InitEnable );

            FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 2;
        end;
    end;

    if Instruction1InitEnable then    //设置电铃
    begin
        IniRingToInstrument( Instruction1InitEnable );
    end;

    if Instruction1InitEnable then    //设置称投料顺序
    begin
        IniWeighersDschDesignToInstrument( Instruction1InitEnable );
    end;

    if Instruction1InitEnable then    //0747H 未定义
    begin
        IniAddr0747ToInstrument( Instruction1InitEnable ) ;
    end;

    if Instruction1InitEnable then
    begin
        IniStorageRepToInstrument(Instruction1InitEnable);    //设置换仓目标仓
    end;

//    if Instruction1InitEnable then
//    begin
        //while (true) do
        //begin
        //    Application.ProcessMessages;
        //end;
//    end;
end;
//------------------------------------------------------------------------------

//--------------------------读取控制器设置--------------------------------------
Function Instruction1MscommReadForIni(var Instrument1IniEnable : Boolean) : integer;    //读取控制器设置
var
    InitResult : Boolean ;
    Instruction1ReceiveWaitPt : integer ;
begin
    InitResult := False;

    while (not InitResult) do
    begin
        Instruction1WtMscommReadSetToBuf(Instruction1ReceiveWaitPt);
        SystemRunDelayTmr := 2000;    //2秒等待

        while (not Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].Active) do
        begin
            Application.ProcessMessages;
            if SystemRunDelayTmr <= 0 then
            begin
                case messagebox(getfocus, Pchar('请检查是否正常连接控制器且控制器已通电,是否继续读取'), '询问信息', MB_YESNOCANCEL) of
                    IDCANCEL :    //取消被选
                    begin
                        InitResult := True ;    //不再读取控制器设置，进行下一条命令
                        Instrument1IniEnable := False;    //不再初始化控制器
                        Result := 1;
                        break;
                    end;
                    IDNO :    //否被选
                    begin
                        InitResult := True ;    //不再读取控制器设置，进行下一条命令
                        Result := 1;
                        break;
                    end;
                    IDYES :    //是被选，重新发送命令，继续等待
                    begin
                        break;
                    end;
                end;
            end;
        end;

        //检查接收到的数据
        if Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].Active then
        begin
            if ( Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].ReceiveCmd and $80 ) <> 0 then    //接收到应答错误命令
            begin
                case messagebox(getfocus, Pchar('读取控制器设置失败，是否继续初始化控制器'), '询问信息', MB_YESNOCANCEL ) of
                    IDCANCEL :    //取消被选,不再初始化控制器
                    begin
                        InitResult := True ;    //不再读取控制器设置，进行下一条命令
                        Instrument1IniEnable := False;    //不再初始化控制器
                        Result := 1 ;
                    end;
                    IDNO :    //否被选
                    begin
                        InitResult := True ;    //不再读取控制器设置
                        Result := 1;
                    end;
                    IDYES :    //是被选,重新读取
                    begin
                        ;
                    end;
                end;
            end
            else
            begin
                //if (Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].ReceiveByte[0] <> $2C) or (Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].ReceiveByte[1] <> $0C) then
                //begin
                //    if messagebox(getfocus, Pchar('读取控制器设置与记录不一致，点击确定忽略'), '提示信息', MB_OK ) = idOK then
                //    begin
                //        ;
                //    end;
                //end;
                InitResult := True ;    //读取控制器设置成功
                Result := 0;
            end;
        end;
    end;
end;
//------------------------------------------------------------------------------

//-----------------------------搅拌机首盘卸料设置-------------------------------
function InstrumentSetFstDschForIni(var Instrument1IniEnable : Boolean) : Integer ;
var
    WtCaption : WideString;
    WtData : Integer ;
    WtResult : Integer ;
begin
    WtCaption := ' 设置首盘卸料允许/禁止 ';

    if MixerInfo.FstDschEn then
        WtData := $0000
    else
        WtData := 0001;

    WtResult := IniWriteAwordToInstrument( WtCaption,  //初始化向下位机写入一个字
                  $0711,
                  WtData) ;
end;
//------------------------------------------------------------------------------

//-------------------------设置称仪表号-----------------------------------------
function InstrumentSetWeigherNoForIni(var Instrument1IniEnable : Boolean) : Integer ;
var
    MessageText : String;
    WordsValue : array[1..16] of Integer ;
    WtResult : Integer ;
    i : Integer ;
begin
    for i:=1 to 16 do
    begin
        WordsValue[i] := WeigherInfo[i].InstrumentId ;
    end;

    MessageText := ' 配料秤的仪表号 ' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $03F0,
                                        WordsValue,
                                        16) ;

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//------------------------------------------------------------------------------

//----------------------------设置称关限----------------------------------------
function Instrument1SetWeigherCloseLmtForIni(var Instrument1IniEnable : Boolean) : Integer ;
var
    WtCaption : WideString;
    WtData : Integer ;
    WtResult : Integer ;
    i : Integer ;
begin
    for i:= 1 to 15 do
    begin

        WtCaption := WeigherInfo[i].Name +   ' 关门限位设置 ';

        if WeigherInfo[i].CloseLmt then
            WtData := $0100
        else
            WtData := 0000;

        WtResult := IniWriteAwordToInstrument( WtCaption,  //初始化向下位机写入一个字
                  $03C0 + (i-1),
                  WtData) ;
        case WtResult of
            0,    //写成功
            2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
            3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
            begin

            end;
            1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
            begin
                Instrument1IniEnable := False;
                break;
            end;
        end;
    end;
end;
//------------------------------------------------------------------------------

//------------------------初始化控制器工作状态----------------------------------
Function InstrumentSetWorkStateForIni(var Instrument1IniEnable : Boolean) : Integer ;
var
    WtCaption : String ;
    WtResult : Integer ;
begin
    WtCaption := ' 初始化控制器状态 ';

    WtResult := IniWriteAwordToInstrument( WtCaption, $0200, $0000) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
function IniInstrument1MixerPara(var Instrument1IniEnable : Boolean) : Integer;    //初始化搅拌机参数
type
    IniMixerParaInfoRd = Record
        WtFstIndex : Integer ;        //参数数组标号
        WtDataCount : Integer ;       //参数个数
    end;
Const
    CntIniCmdCount = 3;
Const
    IniParaInfo : array[1..CntIniCmdCount] of IniMixerParaInfoRd = (
        ( WtFstIndex  : CntIndexOfMixingSetLngInArray;
          WtDataCount : 2) ,    //初始化搅拌机时间参数

        ( WtFstIndex  : CntIndexOfDschSetLngInArray;
          WtDataCount : 6) ,    //初始化搅拌机卸料参数

        ( WtFstIndex  : CntIndexOfMixingTmrStartInArray;
          WtDataCount : 1) //,    //初始化搅拌机计时方式参数值
      );
var
    IniWtPt : Integer ;
    MessageText : String;
    WordsValue : array[1..16] of Integer ;
    i : Integer ;
    WtDataCount : Integer ;
    WtFstIndex : Integer;
    WtResult : Integer ;
begin
    for IniWtPt := 1 to CntIniCmdCount do
    begin
        if Instrument1IniEnable then
        begin
            MessageText := ' 搅拌机搅拌时间 ' ;
            WtFstIndex := IniParaInfo[IniWtPt].WtFstIndex ;
            WtDataCount := IniParaInfo[IniWtPt].WtDataCount ;
            for i:= 1 to WtDataCount do
            begin
                WordsValue[i] := MixerPara[WtFstIndex + i -1].Value ;
            end;

            WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        CntMixerParaInfo[WtFstIndex].AddressInInstrument,
                                        WordsValue,
                                        WtDataCount) ;

            case WtResult of
                0,    //写成功
                2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
                3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
                begin

                end;
                1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
                begin
                    Instrument1IniEnable := False;
                end;
            end;
        end;
    end;

    //初始化搅拌机卸料方式
    if Instrument1IniEnable then
    begin
        IniInstrument1MixerDischMode( Instrument1IniEnable ) ;    //初始化搅拌机卸料方式
    end;

    //$070E
    if Instrument1IniEnable then
    begin
        IniInstrument1Address070E( Instrument1IniEnable );     //未定义
    end;
    //$071A
    if Instrument1IniEnable then
    begin
        IniInstrument1Address071A( Instrument1IniEnable );     //未定义
    end;
    //$071B
    if Instrument1IniEnable then
    begin
        IniInstrument1Address071B( Instrument1IniEnable );     //未定义
    end;

end;

function IniInstrument1MixerDischMode( var Instrument1IniEnable : Boolean ) : Integer;    //初始化搅拌机卸料方式
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' 初始化控制器状态 ';

    if MixerInfo.DschMode = CntMixerDischTwo then
    begin
        WtData := $0001 ;
    end
    else
    begin
        WtData := $0000 ;
    end;

    WtResult := IniWriteAwordToInstrument( WtCaption, $03D0, WtData) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end; 

end;

function IniInstrument1Address070E( var Instrument1IniEnable : Boolean ) : Integer;     //未定义
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' 初始化控制器状态 ';

    WtData := $0000 ;

    WtResult := IniWriteAwordToInstrument( WtCaption, $070E, WtData) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;

function IniInstrument1Address071A( var Instrument1IniEnable : Boolean ) : Integer;     //未定义
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' 初始化控制器状态 ';

    WtData := $0000 ;

    WtResult := IniWriteAwordToInstrument( WtCaption, $071A, WtData) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;

function IniInstrument1Address071B( var Instrument1IniEnable : Boolean ) : Integer;     //未定义
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' 初始化控制器状态 ';

    WtData := $0000 ;

    WtResult := IniWriteAwordToInstrument( WtCaption, $071B, WtData) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//-------------------------搅拌机参数初始化结束---------------------------------

//--------------------------骨料输送模式初始化----------------------------------
function IniInstrument1AggregateConveyorMode( var Instrument1IniEnable : Boolean ) : Integer;    //骨料输送模式
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' 初始化骨料输送方式 ';

    if AggregateConveyorMode = CntAggregateConveyorBelt then
        WtData := $0000
    else
        WtData := $0001;

    WtResult := IniWriteAwordToInstrument( WtCaption, $03D1, WtData) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//------------------------------------------------------------------------------

//------------------------初始化外剂卸料方式------------------------------------
function IniAdditiveDischIntoWater( var Instrument1IniEnable : Boolean ) : Integer;    //初始化外剂卸料方式
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' 初始化外加剂卸料方式 ';

    if AdditiveDischIntoWater then
        WtData := $0001
    else
        WtData := $0000;

    WtResult := IniWriteAwordToInstrument( WtCaption, $03D4, WtData) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//----------------------=初始化外剂卸料方式结束---------------------------------


//--------------------------------$03D5-----------------------------------------
function IniInstrument1Address03D5( var Instrument1IniEnable : Boolean ) : Integer;    //未定义
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' 初始化控制器 ';

    WtData := $0000;

    WtResult := IniWriteAwordToInstrument( WtCaption, $03D5, WtData) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//--------------------------------$03D5 End-------------------------------------

//---------------------一部分命令
  {}
//----------------------------------

//----------------------------初始化配料仪表参数--------------------------------
function IniInstrument1WeigherPara( var Instrument1IniEnable : Boolean ) : Integer;    //初始化控制器1仪表参数
var
    IniWeigherId : Integer ;
    WaitReceiveBufPt : Integer;
    i : Integer ;
    ParaValueInInstrument ,
    ParaValueInMemory : Integer ;
    ParaDecimalDigit : Integer ;
    MessageText : String;
    WriteInstrumentResult : Integer;
begin
    for IniWeigherId := 1 to 16 do
    begin
        FrmSplash.LbIniInfo.Caption := '设置 ' + WeigherInfo[IniWeigherId].Name;

        if not Instrument1IniEnable then break;

        IniWeigherStorageCount( Instrument1IniEnable , IniWeigherId, WeigherInfo[IniWeigherId].StorageNumber);    //设置配料仪表的料仓数量
        if not Instrument1IniEnable then break;

        if ( WeigherInfo[IniWeigherId].StorageNumber > 0 )  and ( WeigherInfo[IniWeigherId].StorageNumber <= 4 ) then    //称的配料仓数设置正确
        begin
            IniReadWeigherParaFromInstrument1( Instrument1IniEnable , WaitReceiveBufPt, IniWeigherId) ;    //读取仪表的参数设置

            if Instrument1IniEnable then
            begin
                for i:=1 to $0C do    //检查下位机参数值是否与上位机记录值相同
                begin
                    ParaValueInInstrument := Instruction1ReceiveBuf[WaitReceiveBufPt].ReceiveByte[ (i-1) *2 ] *256
                                             + Instruction1ReceiveBuf[WaitReceiveBufPt].ReceiveByte[ (i-1) *2 +1 ];    //下位机中读取到的参数值
                    ParaValueInMemory := WeigherPara[IniWeigherId][i].Value;
                    ParaDecimalDigit := WeigherPara[IniWeigherId][i].Decimal;

                    if ParaValueInInstrument <> ParaValueInMemory then
                    begin
                        MessageText := WeigherInfo[IniWeigherId].Name + ' 的 ' + CntWeigherParaInfo[i].ParaName + ' 上位机，下位机值不一致';
                        MessageText := MessageText + #10 ;
                        MessageText := MessageText + '上位机参数值：' + Format('%.' + IntToStr(ParaDecimalDigit) + 'f', [ParaValueInMemory / power(10,ParaDecimalDigit)] );
                        MessageText := MessageText + #10 ;
                        MessageText := MessageText + '下位机参数值：' + Format('%.' + IntToStr(ParaDecimalDigit) + 'f', [ParaValueInInstrument / power(10,ParaDecimalDigit)] );
                        MessageText := MessageText + #10 ;
                        MessageText := MessageText + '点击‘是’修改下位机参数值，' ;
                        MessageText := MessageText + '点击‘否’按钮，不修改下位机参数值, ' ;
                        case messagebox( getfocus, Pchar(MessageText), '警示信息', MB_YESNO ) of
                            IDNO :    //否被选
                            begin
                                //更新上位机内存中的参数值为下位机设定值
                                WeigherPara[IniWeigherId][i].Value := ParaValueInInstrument ;
                            end;
                            IDYES :    //是被选,重新读取
                            begin
                                MessageText := WeigherInfo[IniWeigherId].Name + '的' + CntWeigherParaInfo[i].ParaName ;
                                WriteInstrumentResult := IniWriteAwordToInstrument( MessageText,
                                                               $0400 + $20 * (IniWeigherId -1) + CntWeigherParaInfo[i].AddrOffsetInInstrument,    //参数地址
                                                               ParaValueInMemory
                                                             );
                                if WriteInstrumentResult = 0 then    //写成功
                                begin

                                end
                                else
                                begin
                                    WeigherPara[IniWeigherId][i].Value := ParaValueInInstrument ;
                                end;
                            end;
                        end;
                    end;
                end;
            end;

            if Instrument1IniEnable then
            begin    //写称振动参数
                IniWtWeigherDschVibratorSetting(Instrument1IniEnable, IniWeigherId);
            end;

            if Instrument1IniEnable then
            begin
                //写称状态参数
                IniWtWeigherOffset0012H(Instrument1IniEnable, IniWeigherId ) ;
            end;

            for i:=1 to WeigherInfo[IniWeigherId].StorageNumber do
            begin
                if Instrument1IniEnable then
                begin
                    IniWtStorageVibraStart(IniWeigherId, i);    //写仓振动边际流量(振动模式)
                end;

                if Instrument1IniEnable then
                begin
                    IniWtStorageVibraSet(Instrument1IniEnable, IniWeigherId, i);    //仓振动时间参数
                end;
            end;
        end;

        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 5;

    end;
end;

function IniWeigherStorageCount( var Instrument1IniEnable : Boolean;
  WeigherId : Integer; StorageCount : Integer ) : Integer;    //各配料仪表的料仓数量
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := WeigherInfo[WeigherId].Name +  ' 配置 ';

    WtData := StorageCount;

    WtResult := IniWriteAwordToInstrument( WtCaption, $0340 + WeigherId -1, WtData) ;    //初始化控制器为初始状态

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;

function IniReadWeigherParaFromInstrument1(var Instrument1IniEnable : Boolean;
  var WaitReceiveBufPt : Integer ; IniWeigherId : Integer ) : Integer;    //读取仪表的参数设置
var
    IniResult : Boolean ;
    MessageText : String ;
begin
    IniResult := False ;

    while (not IniResult) do
    begin
        ReadWordsFromInstrument1( WaitReceiveBufPt, $0400 + (IniWeigherId -1) * $20,  $20 );    //读称参数
        SystemRunDelayTmr := 2000;    //2秒等待
         while not (Instruction1ReceiveBuf[WaitReceiveBufPt].Active) do
        begin
            Application.ProcessMessages ;

            if SystemRunDelayTmr <= 0 then    //通讯超时
            begin
                case MessageBox(getfocus, Pchar('读取参数失败，请检查控制器是否接通电源且通讯线连接完好！'), '询问信息', MB_YESNOCANCEL) of
                    IDCANCEL :    //取消被选
                    begin
                        IniResult := True ;    //不再读取控制器设置，进行下一条命令
                        Instrument1IniEnable := False;    //不再初始化控制器
                        Result := 1;
                        break;
                    end;
                    IDNO :    //否被选
                    begin
                        IniResult := True ;    //不再读取控制器设置，进行下一条命令
                        Result := 1;
                        break;
                    end;
                    IDYES :    //是被选，重新发送命令，继续等待
                    begin
                        break;
                    end;
                end;
            end;

            if Instruction1ReceiveBuf[WaitReceiveBufPt].Active then
            begin
                if ( Instruction1ReceiveBuf[WaitReceiveBufPt].ReceiveCmd and $80 ) <> 0 then    //接收到应答错误命令
                begin
                    MessageText := '';
                    MessageText := MessageText + '           '+ WeigherInfo[IniWeigherId].Name + '设置失败!';
                    MessageText := MessageText + #10 + #10;
                    MessageText := MessageText + '        点击‘是’按钮重新设置，' ;
                    MessageText := MessageText + #10 + #10;
                    MessageText := MessageText + '        点击‘否’按钮，忽略设置, ' ;
                    MessageText := MessageText + #10 + #10;
                    MessageText := MessageText + '        点击‘取消’按钮终止初始化控制器';

                    case messagebox(getfocus, Pchar(MessageText), '警示信息', MB_YESNOCANCEL ) of
                        IDCANCEL :    //取消被选,不再初始化控制器
                        begin
                            IniResult := True ;    //不再读取控制器设置，进行下一条命令
                            Instrument1IniEnable := False;    //不再初始化控制器
                            Result := 1 ;
                        end;
                        IDNO :    //否被选
                        begin
                            IniResult := True ;    //不再读取控制器设置
                            Result := 1;
                        end;
                        IDYES :    //是被选,重新读取
                        begin
                            ;
                        end;
                    end;
                end
                else
                begin
                    IniResult := True ;    //读取控制器设置成功
                    Result := 0;
                end;
            end;
        end;
    end;
end;

//----------------------------初始化配料仪表参数--------------------------------
function IniWtWeigherDschVibratorSetting(var Instrument1IniEnable : Boolean; IniWeigherId : Integer) : Integer;
var
    i : integer;
    MessageText : String ;
    WordsValue : Array[1..5] of Integer;

    WtResult : Integer;
begin
    WordsValue[1] := WeigherPara[IniWeigherId][ CntWeigherINS_QIV_DLYIndex ].Value; //0A40H 延迟振动时间
    WordsValue[2] := WeigherPara[IniWeigherId][ CntWeigherINS_QIV_LSTIndex ].Value; //0A41H 振动时间
    WordsValue[3] := WeigherPara[IniWeigherId][ CntWeigherINS_QIV_STPIndex ].Value; //0A42H 振动间隔时间
    WordsValue[4] := $00;    //0A43H
    if (WeigherPara[IniWeigherId][CntWeigherINS_QIV_MDLIndex].Value = 0) then
        WordsValue[5] := 0
    else
        WordsValue[5] := WeigherPara[IniWeigherId][ CntWeigherINS_QIV_FLWIndex ].Value;//0A44H 振动边际流量

    MessageText := WeigherInfo[IniWeigherId].Name + ' 的 称卸料振动器设置' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $0A40 + (IniWeigherId -1) *6,
                                        WordsValue,
                                        5) ;
    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//--------------------------初始化配料仪表参数结束------------------------------

//---------------------------初始化写仓边际振动流量-----------------------------
procedure IniWtStorageVibraStart(WeigherId : Integer; LoadIndex : Integer);
var
    StorageId : Integer;

    WtResult : Integer;
    WtCaption : WideString ;

    WtData : Integer;
begin
    StorageId := WeigherInfo[WeigherId].StorageId[LoadIndex];

    WtCaption := StorageInfo[StorageId].Name + ' 参数';

    if StoragePara[StorageId][CntVibraModeIndexInBuf].Value = 0 then    //振动模式
        WtData := 0
    else
        WtData := StoragePara[StorageId][CntVibraRunFlowIndexInBuf].Value;

    WtResult := IniWriteAwordToInstrument( WtCaption,                           //初始化向下位机写入一个字
                  $0900 + (WeigherId -1) *$14 + (LoadIndex -1) *$05 + CntVibraRunFlowOffsetInInstru,
                  WtData) ;
end;
//-------------------------初始化写仓边际振动流量结束---------------------------

//-----------------------初始化写料仓振动器设置---------------------------------
procedure IniWtStorageVibraSet(var Instrument1IniEnable : Boolean;
  WeigherId : Integer; LoadIndex : Integer);
var
    StorageId : Integer;
    MessageText : String ;
    WordsValue : Array[0..3] of Integer;
    WtResult : Integer;
begin
    StorageId := WeigherInfo[WeigherId].StorageId[LoadIndex];

    WordsValue[0] := StoragePara[StorageId][CntVibraStartDelayIndexInBuf].Value; // 延迟振动时间
    WordsValue[1] := StoragePara[StorageId][CntVibraRunLongIndexInBuf].Value;    // 振动时间
    WordsValue[2] := StoragePara[StorageId][CntVibraOffLongIndexInBuf].Value;    // 振动间隔时间

    MessageText := StorageInfo[StorageId].Name + ' 的 振动器设置' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $0AA0 + (WeigherId -1) *$10 + (LoadIndex -1) *$04,
                                        WordsValue,
                                        3) ;

    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//---------------------初始化写料仓振动器设置结束-------------------------------

//-----------------------称基本参数区域中偏移地址0012H参数----------------------
function IniWtWeigherOffset0012H(var Instrument1IniEnable : Boolean;
    IniWeigherId : Integer) : Integer;                                          //设置称基本参数中偏移地址为0012H的参数
var
    WtResult : Integer;

    WtCaption : WideString;
begin
    WtCaption := WeigherInfo[IniWeigherId].Name + ' 基本参数';

    WtResult := IniWriteAwordToInstrument( WtCaption,                           //初始化向下位机写入一个字
                  $0400 + (IniWeigherId -1) *$20 + $0012,
                  $00) ;
end;
//---------------------称基本参数区域中偏移地址0012H参数结束--------------------

//----------------------------初始化骨料中间仓----------------------------------
function IniWtAggregateMidBin(var Instrument1IniEnable : boolean) : Integer;
Const
    CntWtCount = 3;
    CntWtDataCount : array[1..CntWtCount] of Integer = (1,6,6);
    CntWtFstAddr : Array[1..CntWtCount] of Integer = ($0750, $0741, $0748);
var
    WtPt : Integer;
    WtCounter : Integer ;
    WtDataBuf : array[1..10] of Integer;
    Addr : Integer;
    WtCaption : String ;
    WtResult : Integer ;
begin
    WtCaption := ' 骨料输送系统参数 ' ;
    for WtPt:=1 to CntWtCount do
    begin
        if Instrument1IniEnable then
        begin
            for WtCounter :=1 to CntWtDataCount[WtPt] do
            begin
                Addr := CntWtFstAddr[WtPt] + WtCounter -1;
                WtDataBuf[WtCounter] := AggregateConvPara[1][Addr -$0741 +1].Value ;
            end;
            IniWtWordsToInstrument( Pchar(WtCaption),
                                    CntWtFstAddr[WtPt],
                                    WtDataBuf,
                                    CntWtDataCount[WtPt]
                                  );
            case WtResult of
                0,    //写成功
                2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
                3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
                begin

                end;
                1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
                begin
                    Instrument1IniEnable := False;
                end;
            end;
        end;
    end;
end;
//--------------------------初始化骨料中间仓结束--------------------------------

//-----------------------------初始化电铃---------------------------------------
function IniRingToInstrument(var Instrument1IniEnable : Boolean) : Integer;
var
    WtResult : Integer;
    WtCaption : WideString;
    WtData : Integer;
begin
    FrmSplash.LbIniInfo.Caption := '设置电铃...' ;

    WtCaption := ' 电铃 ';

    if AutoRing then
    begin
        WtData := $0001;
    end
    else
    begin
        WtData := $0000;
    end;

    WtResult := IniWriteAwordToInstrument( WtCaption,                           //初始化向下位机写入一个字
                  $0710,
                  WtData) ;

    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;
end;
//---------------------------始化电铃结束---------------------------------------

//-------------------------初始化称投料顺序-------------------------------------
//该版本程序不支持用户自定义称二次投料设置
function IniWeighersDschDesignToInstrument(var Instrument1IniEnable : Boolean) : Integer;     //初始化称投料顺序
var
    MessageText : String ;
    WordsValue : Array[0..15] of Integer;
    WtResult : Integer;
    i : Integer;
begin
    for i:=0 to 15 do
    begin
        WordsValue[i] := $0000;    //称均为一次投料
    end;

    MessageText := '称投料顺序 ' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $0370,
                                        WordsValue,
                                        16) ;
    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//-----------------------初始化称投料顺序结束-----------------------------------

//-------------------------初始化地址0747H--------------------------------------
function IniAddr0747ToInstrument(var Instrument1IniEnable : Boolean) : Integer;    
var
    WtResult : Integer;
    WtCaption : WideString;
    WtData : Integer;
begin
    //FrmSplash.LbIniInfo.Caption := '设置电铃...' ;

    WtCaption := ' 0747H ';

    WtData := $0000;

    WtResult := IniWriteAwordToInstrument( WtCaption,                           //初始化向下位机写入一个字
                  $0747,
                  WtData) ;

    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;

end;
//-----------------------初始化地址0747H结束------------------------------------

//-------------------------设置换仓目标仓---------------------------------------
function IniStorageRepToInstrument(var Instrument1IniEnable : Boolean) : Integer;
var
    MessageText : String ;
    WordsValue : Array[0..15] of Integer;
    WtResult : Integer;
    i : Integer;
begin
    FrmSplash.LbIniInfo.Caption := '料仓换仓设置...' ;

    for i:=0 to 15 do
    begin
        WordsValue[i] := $0000;    //称均为一次投料
    end;

    MessageText := '设置料仓换仓 ' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $07A0,
                                        WordsValue,
                                        16) ;
    case WtResult of
        0,    //写成功
        2,    //下位机没有应答，点击“否”按钮，忽略本次写操作
        3:    //下位机应答写错误，点击“否”按钮，忽略本次写操作
        begin

        end;
        1:    //下位机没有应答，点击“取消”按钮（终止初始化控制器）
        begin
            Instrument1IniEnable := False;
        end;
    end;

    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 3;
end;
//-------------------------设置换仓目标仓---------------------------------------

//----------------------初始化写一个字到控制器----------------------------------
{*******************************************************************************
    返回值：
        0，写成功
        1，下位机没有应答，点击“取消”按钮（终止初始化控制器）
        2，下位机没有应答，点击“否”按钮，忽略本次写操作
        3，下位机应答写错误，点击“否”按钮，忽略本次写操作
*******************************************************************************}
function IniWriteAwordToInstrument( Const Caption: WideString; Address : Integer; WordValue : Integer) : Integer;    //初始化向下位机写入一个字
var
    WtEnable : Boolean ;
    WaitReceiveBufPt : Integer ;
    MessageStr : String ;
begin
    WtEnable := True ;

    while (WtEnable) do
    begin
        WtAWordToInstument1MscommBuf(WaitReceiveBufPt, Address, WordValue) ;              //写一个字到通讯缓冲区
        SystemRunDelayTmr := 2000;    //2秒等待

        while not (Instruction1ReceiveBuf[WaitReceiveBufPt].Active) do
        begin
            Application.ProcessMessages ;

            if SystemRunDelayTmr <= 0 then    //通讯超时
            begin
                MessageStr := '写' + Caption + '控制器未反应，请检查连接线且控制器已通电';
                MessageStr := MessageStr + #10;
                MessageStr := MessageStr + '点击“是”重新写参数，点击“否”不写参数到控制器，点击“取消”按钮，终止初始化控制器';

                case MessageBox(getfocus, Pchar(MessageStr), '询问信息', MB_YESNOCANCEL) of
                    IDCANCEL :    //取消被选,不再初始化控制器
                    begin
                        WtEnable := False ;
                        Result := 1 ;
                        break ;
                    end;
                    IDNO :    //否被选
                    begin
                        Result := 2;
                        WtEnable := False ;
                        break;
                    end;
                    IDYES :    //是被选，重新发送命令，继续等待
                    begin
                        ;
                    end;
                end;
            end;

            if Instruction1ReceiveBuf[WaitReceiveBufPt].Active then
            begin
                if ( Instruction1ReceiveBuf[WaitReceiveBufPt].ReceiveCmd and $80 ) <> 0 then    //接收到应答错误命令
                begin
                    MessageStr := '写 ' + Caption + ' 控制器失败';
                    MessageStr := MessageStr + #10;
                    MessageStr := MessageStr + '点击“是”重新写参数，点击“否”不写参数到控制器';

                    case messagebox(getfocus, Pchar(MessageStr), '警示信息', MB_YESNO ) of
                    IDNO :    //否被选
                        begin
                            WtEnable := False ;    //不再读取控制器设置
                            Result := 3;
                        end;
                        IDYES :    //是被选,重新写
                        begin
                            ;
                        end;
                    end;
                end
                else
                begin
                    WtEnable := False ;    //读取控制器设置成功
                    Result := 0;
                end;
            end;
        end;
    end;
end;
//----------------------初始化写一个字到控制器结束------------------------------







//----------------------------------------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//----------------------初始化写多个字到控制器----------------------------------
{*******************************************************************************
    返回值：
        0，写成功
        1，下位机没有应答，点击“取消”按钮（终止初始化控制器）
        2，下位机没有应答，点击“否”按钮，忽略本次写操作
        3，下位机应答写错误，点击“否”按钮，忽略本次写操作
*******************************************************************************}
function IniWtWordsToInstrument( Caption : Pchar; WtAddress : Integer;
  WordsValue : array of Integer; WordsNumber : Integer) : Integer;
var
    WtEnable : Boolean ;
    WaitMscommReceiveBufPt : Integer;
    MessageStr : String ;
begin
    WtEnable := True ;

    while ( WtEnable ) do
    begin
        WtWordSToInstucment1MscommBuf( WaitMscommReceiveBufPt, WtAddress, WordsValue, WordsNumber );    //写多个数到通讯缓冲区
        SystemRunDelayTmr := 2000;    //2秒等待

        while not (Instruction1ReceiveBuf[WaitMscommReceiveBufPt].Active) do
        begin
            Application.ProcessMessages ;

            if SystemRunDelayTmr <= 0 then    //通讯超时
            begin
                MessageStr := '写 ' + Caption + ' 控制器未反应，请检查连接线且控制器已通电';
                MessageStr := MessageStr + #10;
                MessageStr := MessageStr + '点击“是”重新写参数，点击“否”不写参数到控制器，点击“取消”按钮，终止初始化控制器';

                case MessageBox(getfocus, Pchar(MessageStr), '询问信息', MB_YESNOCANCEL) of
                    IDCANCEL :    //取消被选,不再初始化控制器
                    begin
                        WtEnable := False ;
                        Result := 1 ;
                        break ;
                    end;
                    IDNO :    //否被选
                    begin
                        WtEnable := False ;
                        Result := 2;
                        break ;
                    end;
                    IDYES :    //是被选，重新发送命令，继续等待
                    begin
                        ;
                    end;
                end;
            end;

            if Instruction1ReceiveBuf[WaitMscommReceiveBufPt].Active then
            begin
                if ( Instruction1ReceiveBuf[WaitMscommReceiveBufPt].ReceiveCmd and $80 ) <> 0 then    //接收到应答错误命令
                begin
                    MessageStr := '写 ' + Caption + ' 到控制器失败';
                    MessageStr := MessageStr + #10;
                    MessageStr := MessageStr + '点击“是”重新写参数，点击“否”不写参数到控制器';

                    case messagebox(getfocus, Pchar(MessageStr), '警示信息', MB_YESNO ) of
                        IDNO :    //否被选
                        begin
                            WtEnable := False ;
                            Result := 3;
                        end;
                        IDYES :    //是被选,重新写
                        begin
                            ;
                        end;
                    end;
                end
                else
                begin
                    WtEnable := False ;    
                    Result := 0;
                end;
            end;
        end;
    end;
end;
//-------------------初始化写多个字到控制器结束---------------------------------
end.
