unit UnitInicontrolPanel;

interface
  procedure IniControlPanelInfo();      //��ʼ������Ϣ
    procedure IniWeigherBasicInfo();    //��ʼ���ƻ�����Ϣ
    procedure IniWeigherPara();    //��ʼ���Ʋ���
    procedure IniStorage();             //��ʼ���ϲ�
      procedure IniStorageBasic();        //��ʼ���ϲֻ�����Ϣ
      procedure IniStoragePara();         //��ʼ���ϲֲ���

  procedure IniAggregateConveyingSysForControlPanel();    //��������ϵͳ
    procedure IniAggregateConveyingForControlPanel();    //����Ƥ�����ͷ�ʽ�������ĳ�ʼ��
      procedure IniAggregateLevelBelt();                     //ƽƤ����ʼ��
      procedure IniAggregateMidHopper();     //��ʼ�������м䶷
      procedure IniAggregateLiftBucket( BucketNum : Integer );    //��ʼ������������

  procedure IniAggregateElevatorForControlPanel();         //�������������ͷ�ʽ�������ĳ�ʼ��

    procedure IniStorageMaterialInfo();                      //�ϲֲ�����Ϣ
  procedure IniRingForControlPanel();                                      //����
  
  procedure IniMixerForControlPanel();                       //��ʼ�������
    procedure IniMixerBasicForControlPanel();    //��ʼ�������������Ϣ
      //procedure IniLoadMixerImgsForControlPanel(X,Y : Integer; Left,Top : Integer);
    //procedure IniMixDschDoorForControlPanel();    //��ʼ�������ж����
    //procedure IniCheckBoxInfo(CheckCode : String; CheckBoxName: String; Check : Boolean);    //��ʼ��CheckBox�ؼ���Ϣ
  procedure IniMixerParaForControlPanel();                //��ʼ�����������

implementation

uses ADODB, Windows, UnitMain, UnitGlobeVar, UnitRWDb,
      SysUtils, Forms, Dialogs, math
    ;

procedure IniControlPanelInfo();
begin
    IniAggregateConveyingSysForControlPanel();    //��������ϵͳ

    IniWeigherBasicInfo();    //��ʼ���ƻ�����Ϣ
    IniWeigherPara();         //��ʼ�����Ʋ���

    IniStorage();                                 //�ϲֳ�ʼ��

//    ReadAggreConvParaFromDbToBuf() ;              //�����ݿ��ж�ȡ�������Ͳ���
    IniRingForControlPanel();                     //����

    IniMixerForControlPanel();                    //�����ͼƬ

    //��ʼ������ģʽ
    ProdMode := CtProdIsSingle ;    //����������
    FrmMain.BtnProdContinue.Glyph := Nil;
    FrmMain.ImageList1.GetBitmap(0, FrmMain.BtnProdContinue.Glyph) ;

    FrmMain.sStatusBar1.Panels[0].Text := '����λ��ͨѶ:  '

    //ReadMaterialFromDbToStorage();       //Ϊ�ϲָ�ֵ����
end;

procedure IniWeigherBasicInfo();    //��ʼ���ƻ�����Ϣ
Var
    Qry : TADOquery;
    WeigherID ,
    InstrumentID : Integer ;
    FlagStr : String ;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Instrument where ID >= 1 and ID <= 16 order by ID';
    Qry.Open;
    if Qry.Eof then
    begin
        if (Application.messagebox(pchar('���Ǳ������ö�ȡʧ�ܣ�ϵͳ��ʼ��ʧ��'), '��ʼ��ʧ��', MB_OK) = idOK) then
        begin
            Application.Terminate ;
            exit;
        end;
    end
    else
    begin
        while not Qry.Eof do
        begin
            WeigherID := Qry.FieldByName('Address').AsInteger;
            if ( weigherID < 1 ) or ( WeigherID > 16 ) then
            begin
                if ( Application.MessageBox(pchar('��Ч�ĳƵ�ַ��ϵͳ��ʼ��ʧ�ܣ�'), '��ʼ��ʧ��', MB_OK) = idOK ) then
                begin
                    Application.Terminate ;
                    exit;
                end;
            end;

            InstrumentID := Qry.FieldByName('InstrumentID').AsInteger ;
            if ( InstrumentID < 0 ) or ( InstrumentID > 16 ) then
            begin
                if ( Application.MessageBox(pchar('��Ч���Ǳ��ţ�ϵͳ��ʼ��ʧ�ܣ�'), '��ʼ��ʧ��', MB_OK) = idOK ) then
                begin
                    Application.Terminate;
                    exit;
                end;
            end;

            WeigherInfo[WeigherID].InstrumentId := InstrumentID ;
            WeigherInfo[WeigherID].Name := Qry.FieldByName('Name').AsString ;

            FlagStr := Qry.FieldByName('Attribute').AsString ;
            //����Ƿ��������λ
            if pos('c', FlagStr) > 0 then    
                WeigherInfo[WeigherID].CloseLmt := True
            else
                WeigherInfo[WeigherID].CloseLmt := False ;
            //����Ƿ��ж������
            if pos('v', FlagStr) > 0 then
                WeigherInfo[WeigherID].DischVibrator := True
            else
                WeigherInfo[WeigherID].DischVibrator := False;
            //�����Ƿ����ϡ�ж�ϱ÷�����
            if pos('d', FlagStr) > 0 then
                WeigherInfo[WeigherID].LdDsIsPumpAndValve := True
            else
                WeigherInfo[WeigherID].LdDsIsPumpAndValve :=  False;
            //�����Ƿ������ſ���
            if pos('f' , FlagStr) > 0 then
                WeigherInfo[WeigherID].LoadIsFine := True
            else
                WeigherInfo[WeigherID].LoadIsFine := False;
                
            if InstrumentID > 0 then
            begin
                {���س�ͼƬ}
                FrmMain.IniLoadWeigherImg(WeigherId,
                                   Qry.FieldByName('XPosition').AsInteger,
                                   Qry.FieldByName('YPosition').AsInteger,
                                   Qry.FieldByName('XSize').AsInteger,
                                   Qry.FieldByName('YSize').AsInteger
                                  );
                WeigherInfo[WeigherId].Enable := True;

                {��ж�Ϸ�ͼƬ}
                FrmMain.LoadWeigherDischValveImg(WeigherId,
                                   Qry.FieldByName('DischValveImgX').AsInteger,
                                   Qry.FieldByName('DischValveImgY').AsInteger,
                                  ) ;
                WeigherDischValveImgState[WeigherID] := CntWeigDischValveIsClose;          //��ж�Ϸ�ͼƬ״̬ Ϊ �ر� ״̬

                {��ж������ͼƬ}
                if WeigherInfo[WeigherID].DischVibrator = True then
                begin
                    FrmMain.LoadWeigherDischVibratorImg(WeigherId,
                                   Qry.FieldByName('DischVibraImgX').AsInteger,
                                   Qry.FieldByName('DischVibraImgY').AsInteger,
                                  ) ;
                    WeigherDischVibraImgState[WeigherID] := CntVibraImgStaIsClose ;        //��ж������ͼƬ״̬ Ϊ �ر� ״̬
                end
                else
                begin
                    WeigherDischVibraImgState[WeigherID] := CntVibraImgStaIsInvalid;       //��ж������ͼƬ״̬ Ϊ ��Ч ״̬
                end;

                {��ж�Ϸ��ر���λͼƬ}
                if WeigherInfo[WeigherID].CloseLmt = True then
                begin
                    FrmMain.LoadWeigherDischValveCloseLmtImg(WeigherId,
                                   Qry.FieldByName('DischValveClosLmtImgX').AsInteger,
                                   Qry.FieldByName('DischValveClosLmtImgY').AsInteger,
                                  ) ;
                end;
                WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsInvalid ;
                
                {��ֵ��ǩ}
               FrmMain.LoadWeigherValueLabel(WeigherId ,
                                   Qry.FieldByName('ValueLabX').AsInteger,
                                   Qry.FieldByName('ValueLabY').AsInteger,
                                   Qry.FieldByName('ValueLabW').AsInteger,
                                   Qry.FieldByName('ValueLabH').AsInteger,
                                  );

               {�����ϼ�������ǩ}
               FrmMain.LoadWeigherLoadCounerLab(WeigherId,
                                   Qry.FieldByName('DischValveImgX').AsInteger -30,
                                   Qry.FieldByName('DischValveImgY').AsInteger -10,);    //�����ϼ����� ��ǩ
               LbWgrLdCounterVisibleState[WeigherId] := CtLbWgrLdCounterVisibleIsFalse ;    //�����ϼ�������ǩ�� Visible Ϊ False
            end;

            Qry.Next ;
        end;
    end;

end;

procedure IniWeigherPara();    //��ʼ���Ʋ���
var
    i, k : Integer ;
begin
    {�Ǳ�����}
    for i:= 1 to 16 do
    begin
        for k := 1 to CntWeigherParaCount do    //��ʼ���Ǳ�����
        begin
            WeigherPara[i][k].Value := 0;
        end;
        ReadWeigherParaFromDb(i);              //�����ݿ��ж�ȡ�Ǳ�����,����
    end;
end;

procedure IniStorage();
begin
    IniStorageBasic();    //�ϲֻ�����Ϣ
    IniStoragePara();     //�ϲֲ���
    IniStorageMaterialInfo();    //�ϲֲ�����Ϣ
end;

procedure IniStorageBasic();
var
    Qry : TADOQuery;
    i : Integer;
    StorageId : Integer ;
    InstrumentId,
    LoadIndex : Integer;
    PictureSourseDir,
    LeftLoadImgDir,
    RightLoadImgDir : WideString ;
    LeftLoadImgType,
    RightLoadImgType : Integer;
    FlagStr : String;
begin
    for i:=1 to CntStorageCount do
    begin
        StorageInfo[i].Enable := False ;
    end;

    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Storage where Useful = 1';
    Qry.Open;
    while not Qry.Eof do
    begin
        StorageId := Qry.FieldByName('ID').AsInteger ;

        StorageInfo[StorageId].Enable  := True;
        StorageInfo[StorageId].Name    := Qry.FieldByName('Name').AsString;
        StorageInfo[StorageId].Model   := Qry.FieldByName('Model').AsInteger;
        StorageInfo[StorageId].MaterId := Qry.FieldByName('Mater').AsInteger;

        InstrumentId := Qry.FieldByName('Instrument').AsInteger;
        LoadIndex := Qry.FieldByName('LoadNo').AsInteger;
        
        StorageInfo[StorageId].InstrumentId := InstrumentId ;
        StorageInfo[StorageId].LoadNo := LoadIndex;
        WeigherInfo[InstrumentId].StorageId[LoadIndex] := StorageId;

        FlagStr := Qry.FieldByName('Flag').AsString;

        if pos('a', FlagStr) > 0 then
            StorageInfo[StorageId].DschMode := CntStorageDoubleDsch    //˫������
        else
            StorageInfo[StorageId].DschMode := CntStorageSignalDsch;
        if pos('b', FlagStr) > 0 then
            StorageInfo[StorageId].Vibrator := True                    //������
        else
            StorageInfo[StorageId].Vibrator := False;
        if pos('c', FlagStr) > 0 then
            StorageInfo[StorageId].StockDsp := True                    //��ʾ���
        else
            StorageInfo[StorageId].StockDsp := False;

        case StorageInfo[StorageId].Model of
            CntAggregateStorage :    //���ϲ�
            begin
                if StorageInfo[StorageId].DschMode = CntStorageDoubleDsch then    //˫������
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageDschD.png' ;

                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageLdClo.bmp' ;
                    LeftLoadImgType  := CntAggregateCoLoadImg ;    //���ϴּ���������ͼƬ
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;    //�ϲּ�����ͼƬ״̬ Ϊ ��

                    RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageLdClo.bmp' ;
                    RightLoadImgType := CntAggregateFineImg ;    //���Ͼ�������ͼƬ
                    StorageFineLoadImgState[StorageId] :=  CntLoadImgStateIsClose ;    //�ϲ־�������ͼƬ״̬ Ϊ ��
                end
                else
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageDschD.png';
                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageLdClo.bmp' ;
                    LeftLoadImgType  := CntAggregateLoadImg ;    //���ϼ�����ͼƬ
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;    //�ϲּ���ͼƬ״̬ Ϊ ��

                    //RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageLdClo.bmp' ;
                    //RightLoadImgType := CntAggregateFineImg ;    //���Ͼ�������ͼƬ
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsInvalid ;    //�ϲּ���ͼƬ Ϊ ��Ч
                end;

                StorageInfo[StorageId].Moisture := RoundTo(Qry.FieldByName('Moisture').AsFloat, -2);

            end;

            CntPowderStorage :       //���ϲ�
            begin
                if StorageInfo[StorageId].DschMode = CntStorageDoubleDsch then
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowderStorageD.png';

                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowStorLdClose.bmp' ;
                    LeftLoadImgType  := CntPowderCoLoadImg ;    //���ϲִּ�����ͼƬ
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;    //�ϲּ���ͼƬ Ϊ ��

                    RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowStorLdClose.bmp' ;
                    RightLoadImgType := CntPowderFineImg ;    //���ϲ־�������ͼƬ
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsClose ;    //�ϲ־�����ͼƬ Ϊ ��
                end
                else
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PoderStorageS.png';
                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowStorLdClose.bmp' ;
                    LeftLoadImgType  := CntPowderLoadImg ;    //���ϲּ�����ͼƬ
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;     //�ϲּ���ͼƬ Ϊ ��

                    //RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowStorLdClose.bmp' ;
                    //RightLoadImgType := CntPowderFineImg ;    //���ϲ־�������ͼƬ
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsInvalid ;    //�ϲ־�����ͼƬ Ϊ ��Ч
                end;
            end;

            //CntLiquidStorage :       //Һ���
            CntWaterStorage   ,      //ˮ��
            CntAddtiveStorage :      //�����
            begin
                if StorageInfo[StorageId].DschMode = CntStorageDoubleDsch then
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiquidStorageD.png';

                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiqStorLdClose.bmp' ;
                    LeftLoadImgType  := CntLiqCoLoadImg ;        //Һ��ּ�����ͼƬ Ϊ �ּ�����
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;     //������ͼƬ Ϊ ��

                    RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiqStorLdClose.bmp' ;
                    RightLoadImgType := CntLiqFineImg ;       //Һ��־�������ͼƬ
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsClose ;     //��������ͼƬ Ϊ ��
                end
                else
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiquidStorageS.png';

                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiqStorLdClose.bmp' ;
                    LeftLoadImgType  := CntLiqLoadImg ;        //Һ��ּ�����ͼƬ Ϊ ������
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;     //������ͼƬ Ϊ ��

                    //RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiqStorLdClose.bmp' ;
                    //RightLoadImgType := CntLiqFineImg ;       //Һ��־�������ͼƬ
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsInvalid ;    //��������ͼƬ Ϊ ��
                end;
            end;
        end;

        {�����ϲ�ͼƬ}
        FrmMain.LoadStorageImgFromFile(
          StorageId,
          PictureSourseDir,
          Qry.FieldByName('XPosition').AsInteger,
          Qry.FieldByName('YPosition').AsInteger,
          Qry.FieldByName('ZSize').AsInteger,
          Qry.FieldByName('YSize').AsInteger
          )  ;

        {�����ϲ����Ϸ�ͼƬ}
        FrmMain.LoadStorageDischImg(
          StorageId,    //�ϲ����
          LeftLoadImgType,    //�����ź�����
          LeftLoadImgDir,
          Qry.FieldByName('LtLdX').AsInteger,
          Qry.FieldByName('LtLdY').AsInteger,
          0,
          0
          )  ;
        //SiloLoadVaveState[StorageId] := DigitalStateIsClose;    //�ϲּ�����״̬

        if StorageInfo[StorageId].DschMode = CntStorageDoubleDsch then    //��������ͼƬ
        begin
            FrmMain.LoadStorageDischImg(
              StorageId,    //�ϲ����
              RightLoadImgType,    //�����ź�����
              RightLoadImgDir,
              Qry.FieldByName('RtLdX').AsInteger,
              Qry.FieldByName('RtLdY').AsInteger,
              0,
              0
              )  ;
              //SiloFnLdVaveState[StorageId] := DigitalStateIsClose;    //�ϲ־�������״̬
        end;

        if StorageInfo[StorageId].Vibrator then    //�ϲּ�������
        begin
            FrmMain.LoadStorageVibrator(
              StorageId,    //�ϲ����
              ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\StorVibratorClose.png' ,
              Qry.FieldByName('LdVibraX').AsInteger,
              Qry.FieldByName('LdVibraY').AsInteger,
              0,
              0
              );
            StorageVibratorImgState[StorageId] := CntVibraImgStaIsClose ;
        end
        else
        begin
            StorageVibratorImgState[StorageId] := CntVibraImgStaIsInvalid ;
        end;
       
        if StorageInfo[StorageId].Model = CntAggregateStorage then    //���ϲ�
        begin
            FrmMain.StorageMaterialMoistureLab(StorageId, 0, 0);    //ԭ�Ϻ�ˮ��
        end;

        FrmMain.LoadStorageLoadTargerLab(StorageId);   //�����ϲ�����Ŀ��ֵ��ǩ

        Qry.Next;
    end;

    Qry.Free;
end;

procedure IniStoragePara();
var
    Qry : TADOQuery;
    ParaCode : String;
    i : Integer;
    StorageId : Integer;
    PrarArrayIndex : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;
    
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from StorageParam';
    Qry.Open;
    while not Qry.Eof do
    begin
        ParaCode := Qry.FieldByName('Code').AsString;
        for i:=1 to CntStorageParaCount do
        begin
            if ParaCode = CntStorageParaInfo[i].CodeInDb then break;
        end;
        if i > CntStorageParaCount then
        begin
            Showmessage(Qry.FieldByName('Name').AsString + ' ������ʼ������');
            Continue;
        end;
        StorageId := Qry.FieldByName('StorageId').AsInteger;
        if (StorageId <1 ) or (StorageId > CntStorageCount ) then
        begin
            Showmessage('�����ϲֺ�' + inttostr(StorageId));
            Continue;
        end;
        PrarArrayIndex :=CntStorageParaInfo[i].BufIndex ;
        StoragePara[StorageId][PrarArrayIndex].Value   := Qry.FieldByName('Value').AsInteger;
        StoragePara[StorageId][PrarArrayIndex].Decimal := Qry.FieldByName('Decimal').AsInteger ;
        StoragePara[StorageId][PrarArrayIndex].Flags   := Qry.FieldByName('Flags').AsString;
        Qry.Next;
    end;
    Qry.Free;
end;

procedure IniStorageMaterialInfo();    //�ϲֲ�����Ϣ
var
    i : Integer;
begin
    for i:=1 to CntStorageCount do
    begin
        if StorageInfo[i].Enable then
        begin
            LoadMaterialInfoFromDbToStorage(i);
            FrmMain.LoadStorageMaterilInfoLb(i);
        end;
    end;
end;

procedure IniAggregateConveyingSysForControlPanel();    //��������ϵͳ
begin
    IniAggregateConveyingForControlPanel();    //���������豸��ʼ��

    ReadAggreConvParaFromDbToBuf();            //�������Ͳ���
    
    //�м��
    //if AggregateConveyorMode = CntAggregateConveyorBelt then    //бƤ������
    //begin
    //    IniAggregateBeltConveyingForControlPanel();    //����Ƥ�����ͷ�ʽ
    //end
    //else
    //begin
    //    IniAggregateElevatorForControlPanel();         //�������������ͷ�ʽ�������ĳ�ʼ��
    //end;
end;

procedure IniAggregateConveyingForControlPanel();
begin
    IniAggregateLevelBelt();    //��ʼ��ƽƤ��

    if AggregateConveyorMode = CntAggregateConveyorBelt then    //бƤ������
    begin
        IniAggregateMidHopper();     //��ʼ�������м䶷
    end
    else
    begin
        if AggregateConveyorEquipInfo[5].Use then    //��������������Ч
        begin
            IniAggregateLiftBucket(1);    // BuketNum = 1����������
        end;
        if AggregateConveyorEquipInfo[6].Use then    //��������������Ч
        begin
            IniAggregateLiftBucket(2);    // BuketNum = 2����������
        end;
    end;

end;


procedure IniAggregateLevelBelt();    //ƽƤ����ʼ��
var
    Qry : TADOQuery ;
    SourseImgDir : String ;
    //Xposition,
    //YPosition,
    //Height,
    //Width  : Integer;
    SourcePath : String;
    EquipFlags : String;
    EquipId    : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from AggreConveyorEquip where ID >=1 and ID <= 6 and Ena=1';
    Qry.Open;
    while not Qry.Eof do
    begin
        EquipId := Qry.FieldByName('ID').AsInteger ;

        EquipFlags := Qry.FieldByName('Flags').AsString ;

        //������ƽƤ��
        if pos('1', EquipFlags) > 0 then
        begin
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\HorStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsLtLevelBelt;     //��ƽƤ��
            FrmMain.LoadAggregateConveyorEquip(    //������ƽƤ��
                EquipId,
                SourcePath,
                Qry.FieldByName('XPosition').AsInteger,
                Qry.FieldByName('YPosition').AsInteger,
                Qry.FieldByName('XSize'    ).AsInteger,
                Qry.FieldByName('YSize'    ).AsInteger
            );

            if pos('d', EquipFlags) <> 0 then    //��ƽƤ���㶯����
            begin
                FrmMain.LoadAggrDschBeltRunBtn(    //װ�ع���������ͣ��ť
                    EquipId,
                    ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\RunInvalid.png' ,
                    Qry.FieldByName('BtnPosition').AsInteger div 1920,
                    Qry.FieldByName('BtnPosition').AsInteger mod 1920,
                    Qry.FieldByName('BtnPosition').AsInteger div 1920,
                    Qry.FieldByName('BtnPosition').AsInteger mod 1920,
                  );
                AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsInValid;    //���������豸��ť״̬ Ϊ ��Ч
            end
            else
            begin
                AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsNone ;    //���������豸��ť״̬ Ϊ ������
            end;
            AggregateConveyorEquipInfo[EquipId].Use := True;
            AggregateConveyorEquipInfo[EquipId].RunLmtCheck := False;          //����λ��飬���Ƕ������
            AggrConvEquipFlashSta[EquipId] := CntBeltFlashStaIsEmptyStop ;     //Ƥ������״̬ ��ֹͣ
        end

        //������ƽƤ��
        else if pos('2', EquipFlags) > 0 then
        begin
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\InverHorStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsRtLevelBelt ;    //��ƽƤ��

        end

        //������бƤ��
        else if pos('3', EquipFlags) > 0 then
        begin
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\VerStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsLtInclinedBelt;  //��бƤ��

            FrmMain.LoadAggregateConveyorEquip(    //������ƽƤ��
                EquipId,
                SourcePath,
                Qry.FieldByName('XPosition').AsInteger,
                Qry.FieldByName('YPosition').AsInteger,
                Qry.FieldByName('XSize'    ).AsInteger,
                Qry.FieldByName('YSize'    ).AsInteger
            );

            AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsNone ;    //���������豸��ť״̬ Ϊ ������

            AggregateConveyorEquipInfo[EquipId].Use := True;
            AggregateConveyorEquipInfo[EquipId].RunLmtCheck := True;          //������λ���
            AggrConvEquipFlashSta[EquipId] := CntBeltFlashStaIsEmptyStop ;     //Ƥ������״̬ ��ֹͣ

            //������бƤ�����͹��ϣ�����ʱ���ʱ����ǩ����֤���й��Ͻ��м䶷
            FrmMain.LoadAggrConvHolpTmrLab(
                1,
                Qry.FieldByName('XPosition').AsInteger + 60,
                Qry.FieldByName('YPosition').AsInteger + 10
            );    //����бƤ�����͹��ϳ���ʱ��,��бƤ����ʱ��ǩ����Ӧ1��
        end

        //������бƤ��
        else if pos('4', EquipFlags) > 0 then
        begin
            
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\InverVerStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsRtInclinedBelt;  //��бƤ��
        end

        //������������
        else if pos('5', EquipFlags) > 0 then
        begin
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\LftBukt0.png';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsLtLiftBucket ;

            FrmMain.LoadAggregateConveyorEquip
              (    //������������
                EquipId,
                SourcePath,
                Qry.FieldByName('XPosition').AsInteger,
                Qry.FieldByName('YPosition').AsInteger,
                Qry.FieldByName('XSize'    ).AsInteger,
                Qry.FieldByName('YSize'    ).AsInteger
              );

            //��������������λ
            FrmMain.LoadLiftBucketLmtImg
              (
                1 ,    //�������������1
                ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\WeigDischValveLmtInValid.png',
                Qry.FieldByName('BtmLmtP').AsInteger div 1920 ,
                Qry.FieldByName('BtmLmtP').AsInteger mod 1920 ,
                0 ,
                0 ,
                1
              );
            ImgLiftBuktBtmLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsInvad;    //��������������λ = ��Ч״̬

            //��������������λ
            FrmMain.LoadLiftBucketLmtImg
              (
                1 ,    //�������������1
                ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\WeigDischValveLmtInValid.png',
                Qry.FieldByName('TopLmtP').AsInteger div 1920 ,
                Qry.FieldByName('TopLmtP').AsInteger mod 1920 ,
                0 ,
                0 ,
                2   //2 ����λ
              );
            ImgLiftBuktTopLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsInvad;    //��������������λ = ��Ч״̬

            //����������������ť
            FrmMain.LoadLiftBucketBtnImg
              (
                1 ,    //1������������
                ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\GoUpBtnInvalid.png',  //����������������ť
                Qry.FieldByName('BtnPosition').AsInteger div 1920 ,
                Qry.FieldByName('BtnPosition').AsInteger mod 1920 ,
                0,
                0 ,
                1     //1����������ť
              );
              ImgLiftBuktGoUpBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsInvad;    //�� ������������ť ״̬ = ��Ч״̬

            //�����������½���ť
            FrmMain.LoadLiftBucketBtnImg
              (
                1 ,    //1������������
                ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\GoDnBtnInvalid.png',  //����������������ť
                Qry.FieldByName('Btn2Po').AsInteger div 1920 ,
                Qry.FieldByName('Btn2Po').AsInteger mod 1920 ,
                0,
                0 ,
                2     //2����������ť
              );
            ImgLiftBuktGoDnBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsInvad;    //�� �������½���ť ״̬ = ��Ч״̬

            AggregateConveyorEquipInfo[EquipId].Use := True;                  //��������ʹ��

        end

        //������������;
        else if pos('6', EquipFlags) > 0 then
        begin
            
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\InverStrap0.bmp';
            //AggregateConveyorEquipInfo[EquipId].EquipType :=
        end

        //����ж��ƽƤ��
        else if pos('7', EquipFlags) > 0 then
        begin
            
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\ShortHorStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsLtShtLevelBelt;    //����ƽƤ��
        end

        else
        begin
            Showmessage('��Ч�������豸');
        end;

//        if pos('d', EquipFlags) >0 then    //�㶯����
//            AggregateConveyorEquipInfo[EquipId].ContinueRun := False
//        else
//            AggregateConveyorEquipInfo[EquipId].ContinueRun := True;
//
//        FrmMain.LoadAggregateConveyorEquip(
//            EquipId,
//            SourcePath,
//            Qry.FieldByName('XPosition').AsInteger,
//            Qry.FieldByName('YPosition').AsInteger,
//            Qry.FieldByName('XSize'    ).AsInteger,
//            Qry.FieldByName('YSize'    ).AsInteger
//          );

//        if not AggregateConveyorEquipInfo[EquipId].ContinueRun then
//        begin
//            FrmMain.LoadAggrDschBrltRunBtn(    //װ�ع���������ͣ��ť
//                EquipId,
//                BtnState,
//                Qry.FieldByName('BtnPosition').AsInteger div 1920,
//                Qry.FieldByName('BtnPosition').AsInteger mod 1920,
//                Qry.FieldByName('BtnPosition').AsInteger div 1920,
//                Qry.FieldByName('BtnPosition').AsInteger mod 1920,
//              );
//            AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsInValid;    //���������豸��ť״̬ Ϊ ��Ч
//        end
//        else
//        begin
//            AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsNone ;    //���������豸��ť״̬ Ϊ ������
//        end;

//        AggregateConveyorEquipInfo[EquipId].Use := True;
//        AggregateConveyorEquipInfo[EquipId].RunLmtCheck := False;    //����λ��飬���Ƕ������
//        AggrConvEquipFlashSta[EquipId] := CntBeltFlashStaIsEmptyStop ;     //Ƥ������״̬ ��ֹͣ

        Qry.Next ;
    end;
end;

procedure IniAggregateMidHopper();    //��ʼ�������м䶷
var
    Qry : TADOQuery ;
    SourseImgDir : String;
    MidBinId : Integer;
begin

    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from AggregateMid where ID =1';
    Qry.Open;
    if Qry.Eof then
    begin
        Showmessage('��Ч�����м����Ϣ');
    end
    else
    begin
        AggregateMidBinInfo[1].Use := True;
        AggregateMidBinInfo[1].Name := Qry.FieldByName('EquipName').AsString ;
        AggregateMidBinInfo[1].LoadInstrumentId := Qry.FieldByName('InstrumentId').AsInteger;
        AggregateMidBinInfo[1].Falgs := Qry.FieldByName('Flags').AsString;

        SourseImgDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\MidBin\AggreMidBin.png';
        MidBinId := Qry.FieldByName('EquipId').AsInteger;
        FrmMain.LoadAggregateBinImgFromFile(MidBinId,
          SourseImgDir ,
          Qry.FieldByName('Left').AsInteger,
          Qry.FieldByName('Top').AsInteger,
          Qry.FieldByName('Width').AsInteger,
          Qry.FieldByName('Height').AsInteger
        );

        FrmMain.LoadAggrMidStorDschValveImg(MidBinId,              //װ�ع����м��ж�Ϸ�
          ExtractFilePath(Application.ExeName) + 'Images\Equips\MidBin\DschValveClose.png',
          Qry.FieldByName('DschValveX').AsInteger,
          Qry.FieldByName('DschValveY').AsInteger
        );
        AggrMidHopperDschValveImgState[1] := CntMdHopDshValImgIsInvalie ;    //�м䶷ж�Ϸ�״̬ Ϊ ��Ч

        if pos('o', AggregateMidBinInfo[MidBinId].Falgs) > 0 then
        begin
            AggregateMidBinInfo[MidBinId].OpenLmtValid := True;
            FrmMain.LoadAggrMidStorOpenLmtImg(MidBinId,                         //װ���м�ֿ�����λ
              ExtractFilePath(Application.ExeName) + 'Images\Equips\MidBin\MidBinDschValveLmtInValid.png',
              Qry.FieldByName('OpenLmtX').AsInteger,
              Qry.FieldByName('OpenLmtY').AsInteger
            );
        end;

        if pos('c', AggregateMidBinInfo[MidBinId].Falgs) > 0 then
        begin
            AggregateMidBinInfo[MidBinId].CloseLmtValid := True;
            FrmMain.LoadAggrMidStorCloseLmtImg(MidBinId,                        //װ���м�ֹ�����λ
              ExtractFilePath(Application.ExeName) + 'Images\Equips\MidBin\MidBinDschValveLmtInValid.png',
              Qry.FieldByName('CloseLmtX').AsInteger,
              Qry.FieldByName('CloseLmtY').AsInteger
            );
        end;

        if pos('v', AggregateMidBinInfo[MidBinId].Falgs) > 0 then
        begin
            AggregateMidBinInfo[MidBinId].VibraValid := True;
            FrmMain.LoadAggrMidStorVibraImg(MidBinId,                           //װ���м������
              ExtractFilePath(Application.ExeName) + 'Images\Equips\MidBin\MidBinVibratorInvalid.png',
              Qry.FieldByName('VibraX').AsInteger,
              Qry.FieldByName('VibraY').AsInteger
            );
            AggrMidHopperDschVibraImgState[1] := CntMdHopDshVibraImgIsInvalie;    //�м䶷ж�� ����ͼƬ ��Ч״̬
        end
        else
        begin
            AggregateMidBinInfo[MidBinId].VibraValid := False;
            AggrMidHopperDschVibraImgState[1] := CntMdHopDshVibraImgIsNone    ;    //�м䶷ж�� ����ͼƬ ������
        end;

        if pos('w',  AggregateMidBinInfo[MidBinId].Falgs) > 0 then
        begin
            AggregateMidBinInfo[MidBinId].IsWeigher := True;
        end
        else
        begin
            AggregateMidBinInfo[MidBinId].IsWeigher := False;
        end;

        FrmMain.LoadAggrMidBinDschTmrLab(
            MidBinId,
            Qry.FieldByName('Left').AsInteger + (Qry.FieldByName('Width').AsInteger div 2) + 20,
            Qry.FieldByName('Top').AsInteger + Qry.FieldByName('Height').AsInteger + 5
        );    //�����м��ж�ϼ�ʱ����ǩ

        //�м������������������ǩ
        FrmMain.LoadMidBinLoadCounterLab(
            MidBinId,
            Qry.FieldByName('Left').AsInteger + 10,
            Qry.FieldByName('Top').AsInteger + Qry.FieldByName('Height').AsInteger + 5
        );    //�����м��װ���̴�

        //�����м�����ϱ�ʶͼƬ
        FrmMain.LoadAggregateBinFullImgFromFile(MidBinId ,
         ExtractFilePath(Application.ExeName) + 'Images\Equips\Instruments\Full.png',
         0,
         0,
         0,
         0 );
    end;

    Qry.Free;
end;

//BucketNum=1������������BucketNum=2����������
procedure IniAggregateLiftBucket( BucketNum : Integer );
var
    Qry : TADOQuery ;
    //SourseImgDir : String;
    //MidBinId : Integer;
begin

    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from LiftBucketInfo where Id=' + IntToStr(BucketNum);
    Qry.Open;
    if Not Qry.Eof then
    begin
        LiftBucketAttr[BucketNum].Name     := Qry.FieldByName('EquipNm').AsString;
        LiftBucketAttr[BucketNum].XMoveMax := Qry.FieldByName('MoveMx').AsInteger div 1920;
        LiftBucketAttr[BucketNum].YMoveMax := Qry.FieldByName('MoveMx').AsInteger mod 1920;
        LiftBucketAttr[BucketNum].XBottom  := Qry.FieldByName('BottomPos').AsInteger div 1920;
        LiftBucketAttr[BucketNum].YBottom  := Qry.FieldByName('BottomPos').AsInteger mod 1920;
        LiftBucketAttr[BucketNum].XTop     := Qry.FieldByName('TopPos').AsInteger div 1920;
        LiftBucketAttr[BucketNum].YTop     := Qry.FieldByName('TopPos').AsInteger mod 1920;
        LiftBucketAttr[BucketNum].GoUpLong := Qry.FieldByName('GoUnLong').AsInteger * 1000;
        LiftBucketAttr[BucketNum].GoDnLong := Qry.FieldByName('GoDnLong').AsInteger * 1000;
        LiftBucketAttr[BucketNum].GoUpTmr  := 0;
        LiftBucketAttr[BucketNum].GodnTmr  := 0;
    end;

    //������������
    FrmMain.LoadAggrLiftBucketImg
      (
          1,    //��������
          AppPath + 'Images\Equips\Straps\BucketEpty.png',    //����������ͼƬ
          LiftBucketAttr[BucketNum].XBottom,
          LiftBucketAttr[BucketNum].YBottom
      );

    //����������Ԥ������ǩ
    FrmMain.CreatLiftBucketPreRiseLab
      (
          1,
          Qry.FieldByName('PreRiseLabPos').AsInteger div 1920,
          Qry.FieldByName('PreRiseLabPos').AsInteger mod 1920,
          0,
          0
      );

    //����������Ԥ������ʱ��
    FrmMain.CreatLiftBucketPreRiseTmrLab
      (
          1,
          Qry.FieldByName('PreRiseTmrPos').AsInteger div 1920,
          Qry.FieldByName('PreRiseTmrPos').AsInteger mod 1920,
          0,
          0
      );

    //����������ж�ϱ�ǩ
    FrmMain.CreatLiftBucketDschLab
      (
          1,
          Qry.FieldByName('DschLabPos').AsInteger div 1920,
          Qry.FieldByName('DschLabPos').AsInteger mod 1920,
          0,
          0
      );

    //����������ж�ϼ�ʱ��
    FrmMain.CreatLiftBucketDschTmrLab
      (
          1,
          Qry.FieldByName('DschTmrPos').AsInteger div 1920,
          Qry.FieldByName('DschTmrPos').AsInteger mod 1920,
          0,
          0
      );

    //��������������������ǩ
    FrmMain.CreatLiftBucketProCountNmLab
      (
          1,
          Qry.FieldByName('ProCountLabPos').AsInteger div 1920,
          Qry.FieldByName('ProCountLabPos').AsInteger mod 1920,
          0,
          0
      );

    //��������������������
    FrmMain.CreatLiftBucketProCounterLab
      (
          1,
          Qry.FieldByName('ProCounterPos').AsInteger div 1920,
          Qry.FieldByName('ProCounterPos').AsInteger mod 1920,
          0,
          0
      );
end;

procedure IniAggregateElevatorForControlPanel();         //�������������ͷ�ʽ�������ĳ�ʼ��
begin

end;

procedure IniRingForControlPanel();                                      //����
var
    Qry : TADOQuery;
    CheckId : Integer ;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close ;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Checker where Equip =' + '''' + 'RingAuto' + '''';
    Qry.Open;
    if not Qry.Eof then
    begin
        if Qry.FieldByName('Checked').AsString = '1' then
        begin
            AutoRing := True;
            FrmMain.cxBtnRing.Glyph := Nil;
            FrmMain.ImageList1.GetBitmap(1, FrmMain.cxBtnRing.Glyph);
        end
        else
        begin
            AutoRing := False;
            FrmMain.cxBtnRing.Glyph := Nil;
            FrmMain.ImageList1.GetBitmap(0, FrmMain.cxBtnRing.Glyph);
        end;
    end;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Component where ComponentsNm=' + '''' + 'Bell' + '''';
    Qry.Open;
    if not Qry.Eof then
    begin
        //��ػ��洴������ͼƬ
        FrmMain.CreatBellImg( Qry.FieldByName('Left').AsInteger ,
                              Qry.FieldByName('Top' ).AsInteger ,
                              0,
                              0
                            );
    end;

    Qry.Free;
end;

//��ʼ������� ��������
procedure IniMixerForControlPanel();
begin

    IniMixerBasicForControlPanel();    //��ʼ�������������Ϣ

    IniMixerParaForControlPanel();                //��ʼ�����������

//    IniMixerBasicForControlPanel();     //��ʼ�������������Ϣ


//    IniMixDschDoorForControlPanel();    //��ʼ�������ж����

//    FrmMain.UpdataBitBtnGlyph('cxBtnAggreDschDsa', Not MixerInfo.AggreDschEn);        //��ֹ��ж
//    FrmMain.UpdataBitBtnGlyph('cxBtnMixerLoadDsa', Not MixerInfo.LoadIntoEn);      //��ֹͶ��
//    FrmMain.UpdataBitBtnGlyph('cxBtnMixerDschDsa', Not MixerInfo.DschEn);               //��ֹж��
end;

procedure IniMixerBasicForControlPanel();    //��ʼ�������������Ϣ
Var
    Qry : TADOQuery;
    MixerId : Integer;
begin
        Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close ;
    Qry.SQL.Clear ;
    Qry.SQL.Text := 'select * from Mixer' ;
    Qry.Open;
    if Qry.Eof then
    begin
        Showmessage('��Ч�Ľ������Ϣ');
    end
    else
    begin
        MixerInfo.MaxCap := RoundTo(Qry.FieldByName('Cap').AsFloat, -3);
        MixerInfo.Flags := Qry.FieldByName('Attribute').AsString;
        if pos('a', MixerInfo.Flags) > 0 then               //���̽�ж��
            MixerInfo.FstDschEn := False
        else
            MixerInfo.FstDschEn := True;

        if pos('b', MixerInfo.Flags) > 0 then
        begin
           MixerInfo.DschMode := CntMixerDischTwo;    //Һѹж�Ϸ�ʽ
           FrmMain.cxBtnMixerDischClose.Visible := True;
        end
        else if pos('c', MixerInfo.Flags) > 0 then
        begin
            MixerInfo.DschMode := CntMixerDischOne;
            FrmMain.cxBtnMixerDischClose.Visible := False;
        end
        else
            Showmessage('��Ч�Ľ����ж�Ϸ�ʽ��Ϣ');

        if pos('d', MixerInfo.Flags) > 0 then                //��ֹ��ж
            MixerInfo.AggreDschEn := False
        else
            MixerInfo.AggreDschEn := True;

        if pos('e', MixerInfo.Flags) > 0 then                //��ֹͶ��
            MixerInfo.LoadIntoEn := False
        else
            MixerInfo.LoadIntoEn := True ;

        if pos('f', MixerInfo.Flags) > 0 then                //��ֹж��
            MixerInfo.DschEn := False
        else
            MixerInfo.DschEn := True;

        if pos('g', MixerInfo.Flags) > 0 then                //����δ���꣬��ֹ�����ж��
            MixerInfo.MixerDschLinkToPowderLoad := True
        else
            MixerInfo.MixerDschLinkToPowderLoad := False;

        MixerId := Qry.FieldByName('MixerNo').AsInteger;
        //���������ͼƬ
        frmMain.CreateMixerImg(MixerId,
          ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender1.png',
          Qry.FieldByName('XPosition').AsInteger,
          Qry.FieldByName('YPosition').AsInteger,
          0,
          0);
        MixerFalshState[1] := CtMxrFlashStIsEmptyStop;    //���������״̬ Ϊ ��ͣ 

        //���������ж����ͼƬ
        frmMain.CreateMixerDschDoor(MixerId,
          ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Close.png',
          Qry.FieldByName('DschDoorX').AsInteger,
          Qry.FieldByName('DschDoorY').AsInteger,
          0,
          0);
        MixerDschValveImgState[MixerId] := CtMxrDschValStIsClose ;    //�����ж����ͼƬ ״̬ Ϊ ��

        //�����ж�ϼ�ʱ����ǩ
        FrmMain.LoadMixerDschTmrLab(
            MixerId,
            Qry.FieldByName('DschDoorX').AsInteger + 80,
            Qry.FieldByName('DschDoorY').AsInteger
        );       //���ؽ����ж�ϼ�ʱ����ǩ

        //�����������������ǩ
        FrmMain.LoadMixerProdCounterLab(
            MixerId,
            Qry.FieldByName('DschDoorX').AsInteger - 60,
            Qry.FieldByName('DschDoorY').AsInteger
        );   //���ؽ����������������ǩ

        //�����Ű�ť
        FrmMain.cxBtnMixerDischOPen.Left := Qry.FieldByName('DoorOpenBtnX').AsInteger;
        FrmMain.cxBtnMixerDischOPen.Top := Qry.FieldByName('DoorOpenBtnY').AsInteger;
        BtnMxrDschValveOpState[1] := CtBtnMxrDschValveOpStIsInvalid;            //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
        FrmMain.cxBtnMixerDischClose.Left := Qry.FieldByName('DoorCloseBtnX').AsInteger;
        FrmMain.cxBtnMixerDischClose.Top := Qry.FieldByName('DoorCloseBtnY').AsInteger;

        //�Ӽ�������ť ״̬
        BtnIncProdSetCountState := BtnProdSetCountStIsDisable ;   //���� �������� ��ť״̬ Ϊ ��Ч
        BtnDecProdSetCountState := BtnProdSetCountStIsDisable ;   //���� �������� ��ť״̬ λ ��Ч
        //��ֹ��ťϵ��
        BtnAggrDisaDschState    := CntBtnCheckStateIsFalse;    //��ֹ��ж ��ť״̬ �޹�ѡ
        BtnMixerDisaLoadInState := CntBtnCheckStateIsFalse;    //��ֹͶ�� ��ť״̬ �޹�ѡ
        BtnMixerDisaDschState   := CntBtnCheckStateIsFalse;    //��ֹж�� ��ť״̬ �޹�ѡ
        //�Զ����� ��ť
        BtnRingState := CntBtnCheckStateIsFalse;    //�Զ����� ��ť״̬ �޹�ѡ
        //������ͣ��ť
        BtnProdPauseEnableState := CtBtnProdPauseEnStIsFalse ;    //������ͣ��ť Enableֵ False
        BtnProdPauseCaptionState := CtBtnProdPauseCpIsPause  ;    //������ͣ��ť Caption ��ͣ���� ״̬
        //����������ť
        BtnProdStartCaptionState := CtBtnProdStatCpIsStart ;    //����������ť Caption Ϊ ��������
    end;
end;                                                                                    

//procedure IniLoadMixerImgsForControlPanel(X,Y : Integer; Left,Top : Integer);
//begin
    {frmMain.CreateMixerImg( 1,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender1.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 2,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender2.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 3,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender3.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 4,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender4.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 5,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender5.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 6,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender6.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    }
//end;
//------------------------------------------------------------------------------                       

//------------------------------------------------------------------------------
//procedure IniMixDschDoorForControlPanel();    //��ʼ�������ж����
//var
//    Qry : TADOQuery ;
//begin
    {Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Mixer where MixerNo =1 and Equip =' + '''' + 'DschDoor' + '''';
    Qry.Open;
    if Qry.Eof then
    begin
        Showmessage('��Ч�Ľ����ж������Ϣ');
    end
    else
    begin
        FrmMain.CreateMixerDschDoor(
          ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders',    //���������ж����ͼƬ
          Qry.FieldByName('XPosition').AsInteger,
          Qry.FieldByName('YPosition').AsInteger,
          Qry.FieldByName('XSize').AsInteger,
          Qry.FieldByName('YSize').AsInteger);
    end;

    Qry.Free ;
    }
//end;

//------------------------��ʼ��CheckBox��Ϣ------------------------------------
//procedure IniCheckBoxInfo(CheckCode : String; CheckBoxName : String; Check : Boolean);
//var
//    Qry : TADOQuery ;
//begin
//    Qry := TADOQuery.Create(Nil);
//    Qry.Connection := FrmMain.ADOConnection ;

//    Qry.Close;
//    Qry.SQL.Clear;
//    Qry.SQL.Text := 'select * from Checker where Equip =' + '''' + CheckCode + '''';
//    Qry.Open;
//    if Qry.Eof then
//    begin
//        Showmessage('��Ч��CheckBox��Ϣ��' + CheckBoxName);
//    end
//    else
//    begin
//        FrmMain.IniCheckerForControlPanel(
//          CheckBoxName,
//          Qry.FieldByName('Left').AsInteger,
//          Qry.FieldByName('Top').AsInteger,
//          0,
//          0,
//          Check);
//    end;
//end;
//------------------------------------------------------------------------------

//-----------------------��ʼ�����������---------------------------------------
procedure IniMixerParaForControlPanel();                //��ʼ�����������
var
    i : Integer ;
begin
    for i:= 1 to CntMixerParaCount do
    begin
        MixerPara[i].Value := 0;
    end;
    RdAllMixerParaFromDb();
end;
//------------------------------------------------------------------------------
end.