unit UnitGlobeSub;

interface
  procedure ModbusCRCCheck(Var InformationData : Array of Byte; DataLen : Integer);

  procedure GetWeigParaInfoSubForSunInMemory(MemoryIndex : Integer; var InfoIndex : Integer);    //根据称参数在内存数组下标值，获取该参数在常量数组中的下标

  procedure Instruction1SendBufPtInc();    //写缓冲区指针加1
  procedure Instruction1SendBufRdPtInc();            //通讯发送缓冲区读指针加1
  function Instruction1WtMscommReadSetToBuf(var ReceiveBufPt : integer) : Integer;    //通讯读取控制器设置

  function Instruction1ReadWeigherDischPreAct(WeigherId : Integer; var ReceiveBufPt : Integer) : Integer;      //通讯读取控制器称卸料落差值
  function Instruction1ReadWeigherLoadCellValue(WeigherId : Integer; var ReceiveBufPt : Integer) : Integer;    //通讯读取传感器信号
  //function Insttument1IniWeigherLmt()
{CRC 计算表格}
Const    //定义常熟
    CRC16HighByteTable : array[0..255] of byte
      = (
         $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
         $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41,
         $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0,
         $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40,
         $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1,
         $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41,
         $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1,
         $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41,
         $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
         $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40,
         $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1,
         $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40,
         $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
         $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40,
         $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0,
         $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40,
         $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
         $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41,
         $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0,
         $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41,
         $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0,
         $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40,
         $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1,
         $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41,
         $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
         $80, $41, $00, $C1, $81, $40
        );
    CRC16LowByteTable : array[0..255] of byte
      = (
        $00, $C0, $C1, $01, $C3, $03, $02, $C2, $C6, $06, 
        $07, $C7, $05, $C5, $C4, $04, $CC, $0C, $0D, $CD,
        $0F, $CF, $CE, $0E, $0A, $CA, $CB, $0B, $C9, $09,
        $08, $C8, $D8, $18, $19, $D9, $1B, $DB, $DA, $1A,
        $1E, $DE, $DF, $1F, $DD, $1D, $1C, $DC, $14, $D4,
        $D5, $15, $D7, $17, $16, $D6, $D2, $12, $13, $D3,
        $11, $D1, $D0, $10, $F0, $30, $31, $F1, $33, $F3,
        $F2, $32, $36, $F6, $F7, $37, $F5, $35, $34, $F4,
        $3C, $FC, $FD, $3D, $FF, $3F, $3E, $FE, $FA, $3A,
        $3B, $FB, $39, $F9, $F8, $38, $28, $E8, $E9, $29,
        $EB, $2B, $2A, $EA, $EE, $2E, $2F, $EF, $2D, $ED,
        $EC, $2C, $E4, $24, $25, $E5, $27, $E7, $E6, $26,
        $22, $E2, $E3, $23, $E1, $21, $20, $E0, $A0, $60,
        $61, $A1, $63, $A3, $A2, $62, $66, $A6, $A7, $67,
        $A5, $65, $64, $A4, $6C, $AC, $AD, $6D, $AF, $6F,
        $6E, $AE, $AA, $6A, $6B, $AB, $69, $A9, $A8, $68,
        $78, $B8, $B9, $79, $BB, $7B, $7A, $BA, $BE, $7E,
        $7F, $BF, $7D, $BD, $BC, $7C, $B4, $74, $75, $B5,
        $77, $B7, $B6, $76, $72, $B2, $B3, $73, $B1, $71,
        $70, $B0, $50, $90, $91, $51, $93, $53, $52, $92,
        $96, $56, $57, $97, $55, $95, $94, $54, $9C, $5C,
        $5D, $9D, $5F, $9F, $9E, $5E, $5A, $9A, $9B, $5B,
        $99, $59, $58, $98, $88, $48, $49, $89, $4B, $8B,
        $8A, $4A, $4E, $8E, $8F, $4F, $8D, $4D, $4C, $8C,
        $44, $84, $85, $45, $87, $47, $46, $86, $82, $42,
        $43, $83, $41, $81, $80, $40
        ) ;

implementation

uses UnitGlobeVar, ADODB, UnitMain, Forms, Windows ;

procedure ModbusCRCCheck(Var InformationData : Array of Byte; DataLen : Integer);
Var
    i : Integer;
    Index : Integer;
    CRCHighByte,
    CRCLowByte : Byte;
begin

    CRCHighByte := $FF;
    CRCLowByte := $FF;

    for i:=0 to DataLen-1  do
    begin
        Index := CRCHighByte Xor InformationData[i] ;
        CRCHighByte := CRCLowByte Xor CRC16HighByteTable[Index];
        CRCLowByte := CRC16LowByteTable[Index];
    end;
    if Length(InformationData) >= i +2 then
    begin
        InformationData[i] := CRCHighByte;
        InformationData[i+1] := CRCLowByte;
    end;
end;

//-------------根据称参数在内存数组下标值，获取该参数在常量数组中的下标---------
procedure GetWeigParaInfoSubForSunInMemory(MemoryIndex : Integer; var InfoIndex : Integer) ;
var
    i : Integer ;
begin
    for i:=1 to CntWeigherParaCount do
    begin
        if (CntWeigherParaInfo[i].BufIndex = MemoryIndex) then
        begin
            InfoIndex := i;
            break;
        end;
    end;
end;
//-----------根据称参数在内存地址，获取该参数在常量数组中的下标 结束------------

procedure Instruction1SendBufPtInc();    //写缓冲区指针加1
begin
    Instruction1SendBufWtPt := Instruction1SendBufWtPt +1;
    if Instruction1SendBufWtPt >= CntCommunicateBufLen then Instruction1SendBufWtPt := 0;
end;

procedure Instruction1SendBufRdPtInc();            //通讯发送缓冲区读指针加1
begin
    Instruction1SendBufRdPt := Instruction1SendBufRdPt +1;
    if Instruction1SendBufRdPt >= CntCommunicateBufLen then Instruction1SendBufRdPt := 0;
end;

function Instruction1WtMscommReadSetToBuf(var ReceiveBufPt : Integer) : Integer;    //通讯读取控制器设置
begin
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[0] := $0A ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[1] := $03 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[2] := $01 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[3] := $FF ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[4] := $00 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[5] := $01 ;
    ModbusCRCCheck(Instruction1SendBuf[Instruction1SendBufWtPt].SendByte, 6) ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByteCounter := 8;
    Instruction1SendBuf[Instruction1SendBufWtPt].Active := True;

    ReceiveBufPt := Instruction1SendBufWtPt;
    Instruction1ReceiveBuf[ReceiveBufPt].Active := False;

    Instruction1SendBufPtInc();    //写缓冲区指针加1
end;

function Instruction1ReadWeigherDischPreAct(WeigherId : Integer; var ReceiveBufPt : Integer) : Integer;    //通讯读取控制器称卸料落差值
begin
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[0] := $0A ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[1] := $03 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[2] :=  ($0790 + WeigherId -1) div $100;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[3] :=  ($0790 + WeigherId -1) mod $100;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[4] := $00 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[5] := $01 ;
    ModbusCRCCheck(Instruction1SendBuf[Instruction1SendBufWtPt].SendByte, 6) ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByteCounter := 8;
    Instruction1SendBuf[Instruction1SendBufWtPt].Active := True;

    ReceiveBufPt := Instruction1SendBufWtPt;
    Instruction1ReceiveBuf[ReceiveBufPt].Active := False;

    Instruction1SendBufPtInc();    //写缓冲区指针加1
end;

function Instruction1ReadWeigherLoadCellValue(WeigherId : Integer; var ReceiveBufPt : Integer) : Integer;    //通讯读取传感器信号
begin
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[0] := $0A ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[1] := $03 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[2] :=  ($0070 + WeigherId -1) div $100;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[3] :=  ($0070 + WeigherId -1) mod $100;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[4] := $00 ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByte[5] := $01 ;
    ModbusCRCCheck(Instruction1SendBuf[Instruction1SendBufWtPt].SendByte, 6) ;
    Instruction1SendBuf[Instruction1SendBufWtPt].SendByteCounter := 8;
    Instruction1SendBuf[Instruction1SendBufWtPt].Active := True;

    ReceiveBufPt := Instruction1SendBufWtPt;
    Instruction1ReceiveBuf[ReceiveBufPt].Active := False;

    Instruction1SendBufPtInc();    //写缓冲区指针加1
end;
//------------------------称初始化命令到通讯发送缓冲区结束---------------------


end.
