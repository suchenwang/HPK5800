object FrmModifyStocks: TFrmModifyStocks
  Left = 396
  Top = 471
  BorderStyle = bsDialog
  Caption = #24211#23384#35843#25972
  ClientHeight = 275
  ClientWidth = 484
  Color = 15784883
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 465
    Height = 225
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 16
      Top = 28
      Width = 56
      Height = 14
      Caption = #35843#25972#21333#21495
    end
    object Bevel1: TBevel
      Left = 1
      Top = 48
      Width = 464
      Height = 9
      ParentShowHint = False
      Shape = bsTopLine
      ShowHint = True
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 60
      Width = 56
      Height = 14
      Caption = #26009#20179#21517#31216
    end
    object RzLabel3: TRzLabel
      Left = 16
      Top = 84
      Width = 56
      Height = 14
      Caption = #26448#26009#21517#31216
    end
    object RzLabel4: TRzLabel
      Left = 248
      Top = 84
      Width = 56
      Height = 14
      Caption = #22411#21495#35268#26684
    end
    object Bevel2: TBevel
      Left = 1
      Top = 104
      Width = 463
      Height = 9
      ParentShowHint = False
      Shape = bsTopLine
      ShowHint = True
    end
    object RzLabel5: TRzLabel
      Left = 16
      Top = 116
      Width = 56
      Height = 14
      Caption = #24403#21069#24211#23384
    end
    object RzLabel11: TRzLabel
      Left = 248
      Top = 116
      Width = 56
      Height = 14
      Caption = #21333'    '#20301
    end
    object RzLabel6: TRzLabel
      Left = 16
      Top = 140
      Width = 56
      Height = 14
      Caption = #35843#25972#31867#21035
    end
    object RzLabel7: TRzLabel
      Left = 16
      Top = 164
      Width = 56
      Height = 14
      Caption = #35843#25972#25968#37327
    end
    object RzLabel8: TRzLabel
      Left = 248
      Top = 164
      Width = 56
      Height = 14
      Caption = #21333'    '#20301
    end
    object Bevel3: TBevel
      Left = 1
      Top = 184
      Width = 462
      Height = 9
      ParentShowHint = False
      Shape = bsTopLine
      ShowHint = True
    end
    object RzLabel9: TRzLabel
      Left = 16
      Top = 196
      Width = 56
      Height = 14
      Caption = #35843' '#25972' '#20154
    end
    object RzLabel10: TRzLabel
      Left = 248
      Top = 196
      Width = 56
      Height = 14
      Caption = #21150#29702#26085#26399
    end
    object Label1: TLabel
      Left = 224
      Top = 140
      Width = 11
      Height = 19
      Caption = '*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object REtModifyStocksId: TRzEdit
      Left = 80
      Top = 24
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 0
    end
    object RCmbSiloName: TRzComboBox
      Left = 80
      Top = 56
      Width = 137
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 1
      OnChange = RCmbSiloNameChange
    end
    object REdtStuffNm: TRzEdit
      Left = 80
      Top = 80
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 2
    end
    object REdtStuffSpec: TRzEdit
      Left = 312
      Top = 80
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 3
    end
    object REdtStocks: TRzEdit
      Left = 80
      Top = 112
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 4
    end
    object RzCmbModifyType: TRzComboBox
      Left = 80
      Top = 136
      Width = 137
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 5
      Items.Strings = (
        #30408
        #20111)
    end
    object REdtModifyAmount: TRzEdit
      Left = 80
      Top = 160
      Width = 137
      Height = 22
      TabOrder = 6
      OnKeyPress = REdtModifyAmountKeyPress
    end
    object RCmbUnit: TRzComboBox
      Left = 312
      Top = 160
      Width = 137
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 7
      Items.Strings = (
        #21315#20811
        #21544)
    end
    object REdtMan: TRzEdit
      Left = 80
      Top = 192
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 8
    end
    object REtModifyDt: TRzEdit
      Left = 312
      Top = 192
      Width = 137
      Height = 22
      Text = '2014-10-10 15:17:00'
      Enabled = False
      TabOrder = 9
    end
    object RCbStocksUnit: TRzComboBox
      Left = 312
      Top = 112
      Width = 137
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 10
      OnChange = RCbStocksUnitChange
      Items.Strings = (
        #21315#20811
        #21544)
    end
  end
  object cBtnModifyStocks: TcxButton
    Left = 200
    Top = 242
    Width = 77
    Height = 24
    Caption = #30830#35748#35843#25972
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = cBtnModifyStocksClick
    Margin = 8
    PaintStyle = bpsCaption
    PopupAlignment = paCenter
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 272
    Top = 8
  end
end
