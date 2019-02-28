//软件授权书
unit UnitSoftAuthorization;


interface

uses
  //Controls, hasp_unit, SysUtils ,
  //Windows, Messages,  Variants, Classes, Graphics,  Forms,
  //Dialogs,
  //ExtCtrls

  // ;
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, ComCtrls, sPageControl,
  ExtCtrls, StdCtrls, Buttons, sBitBtn, Mask, sMaskEdit, sCustomComboEdit,
  sToolEdit, sComboBox, sEdit, DB, ADODB, sGroupBox, sRadioButton, sMemo,
  sCheckBox, DateUtils, hasp_unit, UnitMain, StrUtils, IniFiles;
  //}

  procedure GetSoftAuthorizationIOnfo( var Reslt : Integer; var SoftAutorizationInfo : String );
  Function GetHspKeyId(Var UseHaspKeyNumber : String) : Integer;    //获取软件锁序列号
  Function GetSoftAuthorizationFromHaspKey(HaspKeyId : String; Var EndRunDt : TDate) : Integer;
  Function GetAuthorizedRemainingDays(Var RunEndDay : TDate; var RemainDays : Double;
    var HaspKeyErrInfo : String) : Integer;                         //获取系统授权剩余天数

  Function HaspKeyUnlock( NewDecodeStr : String; var UnlockInfo : String;
    RequiddCode : String  ) : Integer;                              //软件解锁
  Function WriteAuthorInfoToHaspKey( UnloclCodeNumber : Integer; AuthorInfo : String) : Integer;    //授权信息写入软件锁

  procedure CRCReuslt(SourceStr : String; StrLen : Integer
    ; var CRCHighByte : Byte; var CRCLowByte : byte);

{-----------------------HASP Key-----------------------------------------------}
Const
  vendor_code : AnsiString =
    'awy4NIj0IVxs04GCOnRrb7UuSk6BxQIXRZRWAp5mdjH4CSGNYWYqYlzCPSTttmxJga/UkrLZ44MQH4iM' +
    'LL+I6ermRIAqh2oKfVSz+Z+Okv+fbEdyrv/fPHMrfycD4aO725llznWp22QBSJKRXmlGo1v6y4Yf396n' +
    '4TakiQNLygYDJdpZlUGDzyJkEExcQQmq6BX8JDMjmJDwaAYdrPb6S4NWhWsWnja2ApojrVbAK4HMJU3h' +
    'h+9M7L3/kvMSlr04Ehl8aeng3XLbsxTookdUT2DoaYXEEo7iL9OxXez7cOTqb9mG/TF880mNnrqQMTfj' +
    'Aktvmb3Sp0UZX9liJRd04OAHhFUIbDwl+X73NbFrJNtMD9pcz018lkHmawtVY4eH+onGzEQag1lSeoz4' +
    'wmx63uZjJAEZIAMY/9FQsv7UHlarpxjjinyuyPXwer9fzpOkSPK5Ox7WL6Hq2apgy+wGQUSzpUz6hwip' +
    'meGWmF+I+LGuMvmrMwtt4hjuGouK8+kVGoYbu2mlRZ8ZJedlQcF2kmbeadv0V7Fr/C92Q93vaZQU/NA8' +
    'IORnBUjiJxbdFx61I35rTUUWiuZMnRrXXXmsP93h5FKOGMUl6BbazcjIZCfjiWlfBYkaGOUIAfRpnJlr' +
    'ZsiEUREi8w77WRdIPGKuF6OIZkVzCyWgIDRatxqhZUTD8pQuaTIaA47ucoc5R62bwEXJuDQdDYkGWRNt' +
    'olnihUMUlvzbzRlA5wG/JQRKmxwnZVGpec90A74kCtXlLst8SBYg/wHVAaIBu1bqdp4bJAr6NPUK/sQO' +
    'RWhOy2XrAs0OSHqBTEY9xswypPphK0hObb89KMRB3rUwXWUQCQT6pvAesNG+IYqWIWaMoOk+UoHFmXJ2' +
    'aicQTCuobUWf8wMgpRUQkPf1m7TijQ3LvsotK9O5KGrEbz8OoM4NJai8KCU=';

const
  CntSoftKeyInfoLen = 100;

Const
  HaspKeyAuthorErrIsInvalidKey        = 10002;    //无效的软件锁
  HaspKeyAuthorErrIsInValidUnlockCode = 10003;     //无效的解锁代码
  HaspKeyAuthorErrIsInValidAuthor     = 10004;     //无效的授权信息
  HaspKeyAuthorErrIsInValidDtFormat   = 10005;     //无效的日期时间格式
{----------------------HASP Key End--------------------------------------------}

{----------------------TSC2014 Unlock Code Information-------------------------}
Const
    YearLocationInTsc2014v10 : array[0..9] of array[0..3] of Integer =     ////日期在TSC2014V10解码软件中的位置 年4位
      (
         (1 , 8 , 14, 18)
        ,(24 , 17, 13, 7)
        ,(8 , 1 , 14, 18)
        ,(12, 7 , 1 , 4 )
        ,(18, 14, 10, 1 )
        ,(13, 7 , 17, 21)
        ,(8 , 9 , 15, 16)
        ,(18, 17, 16, 4 )
        ,(3 , 7 , 5 , 4 )
        ,(20, 16, 14, 6)
      );
      
    MonthLocationInTsc2014v10 : array[0..9] of array[0..1] of Integer =     ////日期在TSC2014V10解码软件中的位置 月2位
      (
         (2 , 9 )
        ,(12, 6 )
        ,(9 , 2 )
        ,(2 , 5 )
        ,(8 , 3 )
        ,(11, 6 )
        ,(6 , 4 )
        ,(6 , 9 )
        ,(2 , 8 )
        ,(18, 19)
      );

    DayLocationInTsc2014v10 : array[0..9] of array[0..1] of Integer =     ////日期在TSC2014V10解码软件中的位置 日2位
      (
         //1
         (3 , 10 )
         //2
        ,(11 , 5 )
        //3
        ,(10 , 3)
        //4
        ,(3 , 6)
        //5
        ,(9 , 4)
        //6
        ,(12, 5)
        //7
        ,(5 , 7)
        //8
        ,(7 , 8)
        //9
        ,(1 , 6)
        //10
        ,(15, 17)
      );

    CRCLocationInTsc2014V10 : array[0..9] of array[0..4] of integer =    //校验在TSC2014V10解码软件中的位置 5位
      (
         //1
         (4 , 11, 15, 19, 22)
         //2
        ,(22, 20, 16, 10, 4 )
        //3
        ,(22, 19, 15, 11, 4 )
        //4
        ,(8 , 13, 16, 19, 22)
        //5
        ,(23, 21, 17, 13, 7 )
        //6
        ,(4 , 10, 16, 20, 22)
        //7
        ,(13, 10, 11, 3 , 2 )
        //8
        ,(13, 12, 11, 10, 1 )
        //9
        ,(10, 22, 23, 17, 9 )
        //10
        ,(21, 24, 23, 22, 3 )
      );

    SequenceLocationInTsc2014V10 : array[0..9] of array[0..5] of integer =  //软件序号在TSC2014V10解码软件中德位置 6位
      (
         //1
         (5 , 12, 16, 20, 23, 24)
         //2
        ,(23, 21, 19, 15, 9 , 3 )
        //3
        ,(24, 23, 20, 16, 12, 5 )
        //4
        ,(9 , 14, 17, 20, 23, 24)
        //5
        ,(24, 22, 20, 16, 12, 6 )
        //6
        ,(3, 9 , 15, 19, 23 , 24)
        //7
        ,(14, 17, 19, 23, 21, 1)
        //8
        ,(22, 21, 15, 23, 24, 2 )
        //9
        ,(24, 21, 20, 19, 18, 11)
        //10
        ,(2 , 13, 12, 11, 10, 9)
      );

    ApplicationCodeLocationInTsc2014V10 : array[0..9] of array[0..3] of integer =   //申请码在TSC2014解码软件中的位置 占4个字符位
      (
         //1
         (6 , 13, 17, 21)
         //2
        ,(18, 14, 8 , 2 )
        //3
        ,(21, 17, 13, 6)
        //4
        ,(10, 15, 18, 21)
        //5
        ,(19, 15, 11, 5 )
        //6
        ,(2 , 8 , 14, 18)
        //7
        ,(20, 22, 12, 18)
        //8
        ,(20, 19, 14, 3)
        //9
        ,(16, 15, 14, 12)
        //10
        ,(4 , 1 , 7 , 8 )
      );

    UnlockCodeLocationInTsc2014V10 : array[0..9] of integer =     //解锁代号在TSC2014软件解码中的位置 占1个字符位
      (
        //1
        7
        //2
        ,1
        //3
        ,7
        //4
        ,11
        //5
        ,2
        //6
        ,1
        //7
        ,24
        //8
        ,5
        //9
        ,13
        //10
        ,5
      );    //}
{----------------------TSC2014 Unlock Code Information End---------------------}

{CRC 计算表}
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
        );
        
Const    //解锁错误代码
  CntUnlockErrIsLong       = 20001;    //长度错误
  CntUnlockErrIsUnique     = 20002;    //解码不唯一
  CntUnlockErrIsCRC        = 20003;    //CRC错误
  CntUnlockErrIsInvalid    = 20004;    //解码无效
  CntUnlockErrIsHaspKey    = 20005;    //锁号不一致
  CntUnlockErrIsDate       = 20006;    //无效的日期
  CntUnlockErrIsRequidCode = 20007;    //无效的申请码
  CntUnlockErrIsWtHasp     = 20008;    //写Hasp锁失败

var
    EndRunDate : TDate;
var
    HASPHandle : hasp_handle_t;
    HaspKeyId  : String;

implementation

procedure GetSoftAuthorizationIOnfo( var Reslt : Integer; var SoftAutorizationInfo : String);
Var
    Status : hasp_status_t;
    ExSult : Integer;
begin
    status := hasp_login(HASP_DEFAULT_FID, @vendor_code[1], HASPHandle);
    case Status of
        HASP_STATUS_OK :
        begin
            Reslt := 0;
            SoftAutorizationInfo := 'Success';

            //读取软件锁号
            ExSult := GetHspKeyId( HaspKeyId ) ;
            if ExSult <> 0 then
            begin
                Reslt := 10000;
                SoftAutorizationInfo := 'Hasp Read Key Id Error ' + IntToStr( Reslt );
                exit;
            end;

            //获取软件授权
            ExSult := GetSoftAuthorizationFromHaspKey(HaspKeyId, EndRunDate ) ;
            if ExSult <> 0 then
            begin
                Reslt := ExSult;
                SoftAutorizationInfo := 'Hasp Read Key Author ' + IntToStr( Reslt );
                exit;
            end;
        end;
        else
        begin
            Reslt := status;
            SoftAutorizationInfo := 'Hasp Login Error ' + IntToStr( Reslt );
        end;
    end;
end;

Function GetHspKeyId(Var UseHaspKeyNumber : String) : Integer;    //获取软件锁序列号
var
    Status : hasp_status_t;
    info : Pchar;
    infoStr : String;
    beginIndex : Integer;
    
    i : Integer;
begin
    {获取软件锁Id}
    Status := hasp_get_sessioninfo(HASPHandle, HASP_KEYINFO, info);
    case status of
        HASP_STATUS_OK:
        begin
            Result := 0;
            infoStr := info;
            beginIndex := pos('<haspid>', infoStr);
            delete(infostr, 1, beginIndex + length('<haspid>') -1);
            beginindex := pos( '</haspid>', infostr) ;
            delete(infostr, beginindex, length(infostr));
            for i:=1 to length(infostr) do
            begin
                if not (infostr[i] in ['0'..'9']) then
                begin
                    Result := 10001;
                    break;
                end;
            end;
            hasp_free(info);
            UseHaspKeyNumber := infostr; 
        end;
        else
        begin
            Result := status;
        end;
    end;
end;

Function GetSoftAuthorizationFromHaspKey(HaspKeyId : String; Var EndRunDt : TDate) : Integer;
var
    Status : hasp_status_t;
    SoftKeyInfo : array[0..CntSoftKeyInfoLen-1] of Byte;
    SoftKeyInfoStr : string;
    UnlockCodeNumber : Integer;
    UnlockCode : String;
    HaspIdCompared,
    KeyIdInUnlockCode : String;
    StrLen : Integer;
    EndYearInUnlockCode : String[4];
    EndMonthInUnlockCode : String[2];
    EndDayInUnlockCode : String[2];
    i : Integer;
begin
    //获取授权
    Status := hasp_read(HaspHandle, HASP_FILEID_RW, 0, CntSoftKeyInfoLen, SoftKeyInfo);
    if Status = HASP_STATUS_OK then
    begin
        Result := 0;
        {软件锁信息}
        SoftKeyInfoStr := '';
        for i:= 0 to 19 do
        begin
            SoftKeyInfoStr := SoftKeyInfoStr + Chr(SoftKeyInfo[2+i]);
        end;
        SoftKeyInfoStr := Trim(SoftKeyInfoStr);

        if Pos('TSC2000',SoftKeyInfoStr) < 1  then
        begin
            Result := HaspKeyAuthorErrIsInvalidKey;    //无效的授权锁
            exit;
        end;

        {获取授权信息}
        {解码代号}
        UnlockCodeNumber := SoftKeyInfo[25];
        if ( UnlockCodeNumber < 0 ) or ( UnlockCodeNumber > 9) then
        begin
            Result := HaspKeyAuthorErrIsInValidUnlockCode;    //无效的解码号
            exit;
        end;
        {解码}
        UnlockCode := '';
        for i:=0 to 23 do
        begin
            UnlockCode := UnlockCode + chr(SoftKeyInfo[30 + i]);
        end;    //}

       {从解码中获取软件锁号}
       KeyIdInUnlockCode := chr($39 - byte(UnlockCode[SequenceLocationInTsc2014V10[UnlockCodeNumber][0]]) + $30)
                          + chr($39 - byte(UnlockCode[SequenceLocationInTsc2014V10[UnlockCodeNumber][1]]) + $30)
                          + chr($39 - byte(UnlockCode[SequenceLocationInTsc2014V10[UnlockCodeNumber][2]]) + $30)
                          + chr($39 - byte(UnlockCode[SequenceLocationInTsc2014V10[UnlockCodeNumber][3]]) + $30)
                          + chr($39 - byte(UnlockCode[SequenceLocationInTsc2014V10[UnlockCodeNumber][4]]) + $30)
                          + chr($39 - byte(UnlockCode[SequenceLocationInTsc2014V10[UnlockCodeNumber][5]]) + $30) ;    //}

       StrLen := length( HaspKeyId );
       if StrLen > 6 then
       begin
           HaspIdCompared := rightstr(HaspKeyId, 6) ;
       end
       else
       begin
           for i := StrLen +1 to 6 do
           begin
               HaspIdCompared := '0' + HaspKeyId;
           end;
       end;

       if HaspIdCompared <> KeyIdInUnlockCode then
       begin
           Result := HaspKeyAuthorErrIsInValidAuthor ;     //无效的授权信息
           exit;
       end;

       {从解码中获取软件授权日期}
       EndYearInUnlockCode  := chr( $39 - byte( UnlockCode[YearLocationInTsc2014v10[UnlockCodeNumber][0]]) + $30 )
                             + chr( $39 - byte( UnlockCode[YearLocationInTsc2014v10[UnlockCodeNumber][1]]) + $30 )
                             + chr( $39 - byte( UnlockCode[YearLocationInTsc2014v10[UnlockCodeNumber][2]]) + $30 )
                             + chr( $39 - byte( UnlockCode[YearLocationInTsc2014v10[UnlockCodeNumber][3]]) + $30 );
       EndMonthInUnlockCode := chr( $39 - byte( UnlockCode[MonthLocationInTsc2014v10[UnlockCodeNumber][0]]) + $30 )
                             + chr( $39 - byte( UnlockCode[MonthLocationInTsc2014v10[UnlockCodeNumber][1]]) + $30 );
       EndDayInUnlockCode   := chr( $39 - byte( UnlockCode[DayLocationInTsc2014v10[UnlockCodeNumber][0]]) + $30 )
                             + chr( $39 - byte( UnlockCode[DayLocationInTsc2014v10[UnlockCodeNumber][1]]) + $30 );
       try
           EndRunDate := strToDate(EndYearInUnlockCode + '-' + EndMonthInUnlockCode + '-' + EndDayInUnlockCode) ;
       except
           Result := HaspKeyAuthorErrIsInValidDtFormat ;     //无效的日期时间格式
           exit;
       end;
    end
    else
    begin
        Result := Status;
    end;
end;

Function GetAuthorizedRemainingDays(Var RunEndDay : TDate; var RemainDays : Double;
  var HaspKeyErrInfo : String) : Integer;
var
    Status          : hasp_status_t;
    HaspCurrentTime : hasp_time_t;
    CurrentDateTime : TDateTime;
begin
    {从软件锁中获取当前日期}
    Status := hasp_get_rtc(HaspHandle, HaspCurrentTime);
    case Status of
        HASP_STATUS_OK :
        begin
            CurrentDateTime := StrToDateTime('1970-1-1 0:0:0');
            CurrentDateTime := CurrentDateTime + HaspCurrentTime/(24*60*60);

            RemainDays := RunEndDay - CurrentDateTime;

            Result := 0;
        end;
        else
        begin
            Result := Status;
            HaspKeyErrInfo := 'Read Date Err ' + Inttostr(Status);
        end;
    end;
end;

Function HaspKeyUnlock( NewDecodeStr : String; var UnlockInfo : String;
  RequiddCode : String ) : Integer;
var
    TestEndRunYearStr : string[4];
    TestEndRunMonthStr : string[2];
    TestEndRunDayStr : String[2];
    TestSoftSequence : String[6];
    TestApplicationCode : String[4];
    TestUnlockCodeNumber : Integer;

    SoftSequence : string[6];
    ApplicationCode : string[4] ;
    EndRunYearStr : String[4] ;
    EndRunMonthStr : String[2];
    EndRunDayStr : string[2];

    EndRunEndDayInUnlockCode : TDate;
    HaspIdCompared : String;

    UnlockCodeNumber : Integer;
    CRCResultStr : string[5];
    i : integer;

    UnlockStr : String;
    CRCHighByte,
    CRCLowByte : byte;
    NewCRCStr : String[5];
    CheckResult : Integer;

    ApplicationCodeCompared : String;

    StrLen : Integer;

    ExResult : Integer;
begin
    if Length(NewDecodeStr) <> 24 then
    begin
        Result := CntUnlockErrIsLong;
        UnlockInfo := 'Long Err ' + IntToStr(Result);
        exit;
    end;

    UnlockCodeNumber := -1;
    CheckResult      := 0;
    for i:=0 to 9 do
    begin
        if NewDecodeStr[UnlockCodeLocationInTsc2014V10[9-i]] <> char(i + $30) then continue;

        CheckResult :=1;

        TestUnlockCodeNumber := 9 -i;

        TestEndRunYearStr   := chr($39 - Byte(NewDecodeStr[YearLocationInTsc2014v10[TestUnlockCodeNumber][0]]) + $30)
                             + chr($39 - Byte(NewDecodeStr[YearLocationInTsc2014v10[TestUnlockCodeNumber][1]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[YearLocationInTsc2014v10[TestUnlockCodeNumber][2]]) + $30)
                             + Chr($39 - byte(NewDeCodeStr[YearLocationInTsc2014v10[TestUnlockCodeNumber][3]]) + $30);

        TestEndRunMonthStr := chr($39 - Byte(NewDeCodeStr[MonthLocationInTsc2014v10[TestUnlockCodeNumber][0]]) + $30)
                            + chr($39 - byte(NewDeCodeStr[MonthLocationInTsc2014v10[TestUnlockCodeNumber][1]]) + $30);

        TestEndRunDayStr := chr($39 - Byte(NewDeCodeStr[DayLocationInTsc2014v10[TestUnlockCodeNumber][0]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[DayLocationInTsc2014v10[TestUnlockCodeNumber][1]]) + $30);

        TestSoftSequence    := chr($39 - byte(NewDeCodeStr[SequenceLocationInTsc2014V10[TestUnlockCodeNumber][0]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[SequenceLocationInTsc2014V10[TestUnlockCodeNumber][1]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[SequenceLocationInTsc2014V10[TestUnlockCodeNumber][2]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[SequenceLocationInTsc2014V10[TestUnlockCodeNumber][3]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[SequenceLocationInTsc2014V10[TestUnlockCodeNumber][4]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[SequenceLocationInTsc2014V10[TestUnlockCodeNumber][5]]) + $30) ;

        TestApplicationCode := chr($39 - byte(NewDeCodeStr[ApplicationCodeLocationInTsc2014V10[TestUnlockCodeNumber][0]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[ApplicationCodeLocationInTsc2014V10[TestUnlockCodeNumber][1]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[ApplicationCodeLocationInTsc2014V10[TestUnlockCodeNumber][2]]) + $30)
                             + chr($39 - byte(NewDeCodeStr[ApplicationCodeLocationInTsc2014V10[TestUnlockCodeNumber][3]]) + $30) ;

        CRCResultStr := chr($39 - byte(NewDeCodeStr[CRCLocationInTsc2014V10[TestUnlockCodeNumber][0]]) + $30)
                      + chr($39 - byte(NewDeCodeStr[CRCLocationInTsc2014V10[TestUnlockCodeNumber][1]]) + $30)
                      + chr($39 - byte(NewDeCodeStr[CRCLocationInTsc2014V10[TestUnlockCodeNumber][2]]) + $30)
                      + chr($39 - byte(NewDeCodeStr[CRCLocationInTsc2014V10[TestUnlockCodeNumber][3]]) + $30)
                      + chr($39 - byte(NewDeCodeStr[CRCLocationInTsc2014V10[TestUnlockCodeNumber][4]]) + $30);

        //队列号 + 月 + 序号 + 年 + 申请码 + 日
        UnlockStr := inttostr(TestUnlockCodeNumber)
                   + TestEndRunMonthStr
                   + TestSoftSequence
                   + TestEndRunYearStr
                   + TestApplicationCode
                   + TestEndRunDayStr;
        CRCReuslt(UnlockStr, 19, CRCHighByte , CRCLowByte );
        NewCRCStr := format('%d5' , [(CRCLowByte * 256 + CRCHighByte)]);
        if (NewCRCStr = CRCResultStr) then
        begin
            if (UnlockCodeNumber < 0) then
            begin
                UnlockCodeNumber := TestUnlockCodeNumber;
                SoftSequence := TestSoftSequence;
                ApplicationCode := TestApplicationCode ;
                EndRunYearStr := TestEndRunYearStr ;
                EndRunMonthStr := TestEndRunMonthStr;
                EndRunDayStr := TestEndRunDayStr;
            end
            else
            begin
                //Showmessage('解码信息不唯一！');
                //Result := CntUnlockErrIsUnique;
                //UnlockInfo := 'Code Unique ' + IntToStr(Result);
                //exit;
                CheckResult := CntUnlockErrIsUnique;
                break;
            end;
        end;
    end;

    if CheckResult < 1 then
    begin
        Result := CntUnlockErrIsInvalid;    //无有效的解码号
        UnlockInfo := 'Code Invalid ' + IntToStr(Result);
        exit;
    end
    else if CheckResult = CntUnlockErrIsUnique then
    begin
        Result := CntUnlockErrIsUnique;
        UnlockInfo := 'Code Unique ' + IntToStr(Result);
        exit;
    end
    else if UnlockCodeNumber < 0 then
    begin
        //Showmessage('校验错误') ;
        Result := CntUnlockErrIsCRC;     //CRC校验失败
        UnlockInfo := 'CRC ' + IntToStr(Result);
        exit;
    end;

    {获取验证用锁号}
    StrLen := length(HaspKeyId);
    if StrLen > 6 then
    begin
        HaspIdCompared := rightstr(HaspKeyId, 6) ;
    end
    else
    begin
        HaspIdCompared := HaspKeyId ;
        for i := StrLen +1 to 6 do
        begin
            HaspIdCompared := '0' + HaspIdCompared;
        end;
    end;

    if SoftSequence <> HaspIdCompared then
    begin
        Result := CntUnlockErrIsHaspKey;     //CRC校验失败
        UnlockInfo := 'Serial Number ' + IntToStr(Result);
        exit;
    end;

    try
        EndRunEndDayInUnlockCode := StrToDate(EndRunYearStr + '-' + EndRunMonthStr + '-' + EndRunDayStr) ;
    except
        Result := CntUnlockErrIsDate;
        UnlockInfo := 'Invalid Date ' + IntToStr(Result);
        exit;
    end;

    {检查申请号}
    if RequiddCode <> ApplicationCode then
    begin
        Result := CntUnlockErrIsRequidCode;
        UnlockInfo := 'Requid Code ' + IntToStr(Result);
        exit;
    end;

    {向软件锁写入授权信息}
    ExResult := WriteAuthorInfoToHaspKey( UnlockCodeNumber, NewDecodeStr);
    if ExResult <> 0 then
    begin
        Result     := ExResult;
        UnlockInfo := 'Write Hasp ' + IntToStr(Result);
    end
    else
    begin
        EndRunDate := EndRunEndDayInUnlockCode;
        Result := 0;
    end;
end;

Function WriteAuthorInfoToHaspKey( UnloclCodeNumber : Integer; AuthorInfo : String) : Integer;    //授权信息写入软件锁
var
    Status    : Hasp_status_t;
    WriteData : array[0..30] of byte;

    i : Integer;
begin
    {写解码代号}
    WriteData[0] := UnloclCodeNumber;
    status := hasp_write(HaspHandle, HASP_FILEID_RW, 25, 1, writedata);
    if status <> HASP_STATUS_OK then
    begin
        //Showmessage('写锁失败!');
        Result := status;
        exit;
    end;

    for i :=0 to 23 do
    begin
        writedata[i] := byte(AuthorInfo[i+1]);
    end;
    status := hasp_write(HaspHandle, HASP_FILEID_RW, 30, 24, writedata);
    if status <> HASP_STATUS_OK then
    begin
                //Showmessage('写锁失败!');
        Result := status;
        exit;
    end;

    Result := 0;
end;

procedure CRCReuslt(SourceStr : String; StrLen : Integer
  ; var CRCHighByte : Byte; var CRCLowByte : byte);
var
    i : Integer;
    Index : Integer;
begin

    CRCHighByte := $FF;
    CRCLowByte := $FF;

    for i:=0 to StrLen-1  do
    begin
        Index := CRCHighByte Xor byte(SourceStr[i]) ;
        CRCHighByte := CRCLowByte Xor CRC16HighByteTable[Index];
        CRCLowByte := CRC16LowByteTable[Index];
    end;

end;

end.
