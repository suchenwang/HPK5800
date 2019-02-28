object FrmSysUnlock: TFrmSysUnlock
  Left = 832
  Top = 468
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = #31995#32479#25480#26435
  ClientHeight = 217
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 321
    Height = 217
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sGroupBox1: TsGroupBox
      Left = 8
      Top = 8
      Width = 305
      Height = 81
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      Checked = False
      object sLabel1: TsLabel
        Left = 16
        Top = 16
        Width = 42
        Height = 14
        Caption = #24207#21495#65306
      end
      object sLbSerialNumber: TsLabel
        Left = 80
        Top = 16
        Width = 105
        Height = 14
        Caption = 'sLbSerialNumber'
      end
      object sLabel3: TsLabel
        Left = 16
        Top = 48
        Width = 56
        Height = 14
        Caption = #30003#35831#30721#65306
      end
      object sLbRequstCode: TsLabel
        Left = 80
        Top = 48
        Width = 91
        Height = 14
        Caption = 'sLbRequstCode'
      end
    end
    object sGroupBox2: TsGroupBox
      Left = 8
      Top = 96
      Width = 305
      Height = 113
      Caption = #25480#26435#30721
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      Checked = False
      object sLabel5: TsLabel
        Left = 77
        Top = 36
        Width = 7
        Height = 14
        Caption = '-'
      end
      object sLabel6: TsLabel
        Left = 149
        Top = 36
        Width = 7
        Height = 14
        Caption = '-'
      end
      object sLabel7: TsLabel
        Left = 221
        Top = 36
        Width = 7
        Height = 14
        Caption = '-'
      end
      object EtDecode1: TsEdit
        Left = 16
        Top = 32
        Width = 57
        Height = 22
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        OnChange = EtDecode1Change
        OnKeyPress = EtDecode1KeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object EtDecode2: TsEdit
        Left = 88
        Top = 32
        Width = 57
        Height = 22
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        OnChange = EtDecode2Change
        OnKeyPress = EtDecode2KeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object EtDecode3: TsEdit
        Left = 160
        Top = 32
        Width = 57
        Height = 22
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        OnChange = EtDecode3Change
        OnKeyPress = EtDecode3KeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object EtDecode4: TsEdit
        Left = 232
        Top = 32
        Width = 57
        Height = 22
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
        OnChange = EtDecode4Change
        OnKeyPress = EtDecode4KeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBtUnlock: TsButton
        Left = 120
        Top = 72
        Width = 75
        Height = 25
        Caption = #30830' '#23450
        TabOrder = 4
        OnClick = sBtUnlockClick
      end
    end
  end
end
