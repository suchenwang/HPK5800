//读写仪表1通讯缓冲区
unit UnitRWInstrument1MscommBuf;

interface
  procedure IniInstrumentMscomLoopComand();  //初始化通讯循环命令

  function Instrument1WtMscommBufForState(Var MscommReceiveBufPf : Integer; InstrumentState : Integer) : Integer;    //写仪表状态命令到通讯缓冲区
  function WtWordSToInstucment1MscommBuf(Var MscommReceiveBufPf : Integer;
    FstAddr : Integer; DataValue : array of Integer; DataCount : Integer) : Integer;    //写多个数到通讯缓冲区
  function WtAWordToInstument1MscommBuf(Var MscommReceiveBufPf : Integer;               //写一个字到通讯缓冲区
    WtAddr : Integer; ParaValue : Integer) : Integer ;

  Function ReadWordsFromInstrument1(Var MscommReceiveBufPf : Integer ; ReadAddr : Integer ; WordCount : Integer ) : Integer;    //从仪表读取参数

implementation

uses UnitGlobeVar, UnitGlobeSub ;

procedure IniInstrumentMscomLoopComand();  //初始化通讯循环命令
var
    LoopCommand : array[0..7] of Byte;
    i : Integer;
begin
    LoopMscomCommandPt := 0;

    LoopCommand[0] := $0A;     LoopCommand[1] := $03;
    LoopCommand[2] := $00;     LoopCommand[3] := $00;
    LoopCommand[4] := $00;     LoopCommand[5] := $30;
    ModbusCRCCheck(LoopCommand, 6) ;
    for i:=0 to 7 do
    begin
        LoopMscommCommand[0][i] := LoopCommand[i] ;
    end;

    LoopCommand[0] := $0A;     LoopCommand[1] := $03;
    LoopCommand[2] := $00;     LoopCommand[3] := $30;
    LoopCommand[4] := $00;     LoopCommand[5] := $30;
    ModbusCRCCheck(LoopCommand, 6) ;
    for i:=0 to 7 do
    begin
        LoopMscommCommand[1][i] := LoopCommand[i] ;
    end;

    LoopCommand[0] := $0A;     LoopCommand[1] := $03;
    LoopCommand[2] := $07;     LoopCommand[3] := $0F;
    LoopCommand[4] := $00;     LoopCommand[5] := $0C;
    ModbusCRCCheck(LoopCommand, 6) ;
    for i:=0 to 7 do
    begin
        LoopMscommCommand[2][i] := LoopCommand[i] ;
    end;
end;

function Instrument1WtMscommBufForState(var MscommReceiveBufPf : Integer; InstrumentState : Integer) : Integer;    //写仪表状态命令到通讯缓冲区
begin
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[0] := $0A ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[1] := $06 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[2] := $02 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[3] := $00 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[4] := InstrumentState div $100;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[5] := InstrumentState mod $100;
    ModbusCRCCheck(Instruction1SendBuf[Instruction1SendBufWtPt].SendByte, 6) ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByteCounter := 8;
    Instruction1SendBuf[Instruction1SendBufWtPt].Active := True;

    MscommReceiveBufPf := Instruction1SendBufWtPt;
    Instruction1ReceiveBuf[MscommReceiveBufPf].Active := False;

    Instruction1SendBufPtInc();    //写缓冲区指针加1
end;

function WtWordSToInstucment1MscommBuf(Var MscommReceiveBufPf : Integer;
    FstAddr : Integer; DataValue : array of Integer; DataCount : Integer) : Integer;    //写多个数到通讯缓冲区
var
    i : Integer ;
    SendByteCount : Integer ;
begin
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[0] := $0A ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[1] := $10 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[2] := FstAddr div $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[3] := FstAddr mod $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[4] := DataCount div $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[5] := DataCount mod $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[6] := (DataCount *2) mod $100 ;
    for i:=0 to DataCount -1 do
    begin
        Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[7 +2*i] := DataValue[i] div $100;
        Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[7 +2*i + 1] := DataValue[i] mod $100;
    end;

    SendByteCount := 7 + DataCount *2 ;
    ModbusCRCCheck(Instruction1SendBuf[Instruction1SendBufWtPt].SendByte, SendByteCount) ;
    SendByteCount := SendByteCount +2;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByteCounter := SendByteCount;

    Instruction1SendBuf[Instruction1SendBufWtPt].Active := True;
    MscommReceiveBufPf := Instruction1SendBufWtPt;
    Instruction1ReceiveBuf[MscommReceiveBufPf].Active := False;

    Instruction1SendBufPtInc();    //写缓冲区指针加1

    Result := 1;
end;

function WtAWordToInstument1MscommBuf(Var MscommReceiveBufPf : Integer;               //写一个字到通讯缓冲区
  WtAddr : Integer; ParaValue : Integer) : Integer ;
begin
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[0] := $0A ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[1] := $06 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[2] := WtAddr div $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[3] := WtAddr mod $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[4] := ParaValue div $100;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[5] := ParaValue mod $100;

    ModbusCRCCheck(Instruction1SendBuf[Instruction1SendBufWtPt].SendByte, 6) ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByteCounter := 8;

    Instruction1SendBuf[Instruction1SendBufWtPt].Active := True;
    MscommReceiveBufPf := Instruction1SendBufWtPt;
    Instruction1ReceiveBuf[MscommReceiveBufPf].Active := False;

    Instruction1SendBufPtInc();    //写缓冲区指针加1

    Result := 1;
end;

Function ReadWordsFromInstrument1(Var MscommReceiveBufPf : Integer ; ReadAddr : Integer ; WordCount : Integer ) : Integer;
begin
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[0] := $0A ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[1] := $03 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[2] := ReadAddr div $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[3] := ReadAddr mod $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[4] := WordCount div $100 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[5] := WordCount mod $100 ;

    ModbusCRCCheck(Instruction1SendBuf[Instruction1SendBufWtPt].SendByte, 6) ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByteCounter := 8;

    Instruction1SendBuf[Instruction1SendBufWtPt].Active := True;
    MscommReceiveBufPf := Instruction1SendBufWtPt;
    Instruction1ReceiveBuf[MscommReceiveBufPf].Active := False;

    Instruction1SendBufPtInc();    //写缓冲区指针加1

    Result := 1;
end;

end.
