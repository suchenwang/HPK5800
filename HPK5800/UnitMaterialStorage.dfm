object FrmMaterialStorage: TFrmMaterialStorage
  Left = 835
  Top = 343
  BorderStyle = bsDialog
  Caption = #21407#26448#26009#20837#24211#21333
  ClientHeight = 288
  ClientWidth = 476
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
    Width = 457
    Height = 233
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 16
      Top = 28
      Width = 56
      Height = 14
      Caption = #20837#24211#21333#21495
    end
    object Bevel1: TBevel
      Left = 16
      Top = 48
      Width = 425
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
      Caption = #26448#26009#32534#21495
    end
    object RzLabel3: TRzLabel
      Left = 16
      Top = 93
      Width = 56
      Height = 14
      Caption = #26448#26009#21517#31216
    end
    object RzLabel4: TRzLabel
      Left = 240
      Top = 92
      Width = 56
      Height = 14
      Caption = #22411#21495#35268#26684
    end
    object Bevel2: TBevel
      Left = 16
      Top = 120
      Width = 425
      Height = 9
      ParentShowHint = False
      Shape = bsTopLine
      ShowHint = True
    end
    object RzLabel5: TRzLabel
      Left = 16
      Top = 133
      Width = 56
      Height = 14
      Caption = #26009#20179#21517#31216
    end
    object RzLabel6: TRzLabel
      Left = 16
      Top = 165
      Width = 56
      Height = 14
      Caption = #20837#24211#25968#37327
    end
    object RzLabel7: TRzLabel
      Left = 240
      Top = 165
      Width = 56
      Height = 14
      Caption = #21333'    '#20301
    end
    object Bevel4: TBevel
      Left = 16
      Top = 184
      Width = 409
      Height = 9
      ParentShowHint = False
      Shape = bsTopLine
      ShowHint = True
    end
    object RzLabel8: TRzLabel
      Left = 16
      Top = 197
      Width = 56
      Height = 14
      Caption = #32463' '#21150' '#20154
    end
    object RzLabel9: TRzLabel
      Left = 240
      Top = 197
      Width = 56
      Height = 14
      Caption = #26085#26399#26102#38388
    end
    object REtStorageNoteId: TRzEdit
      Left = 80
      Top = 24
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 0
    end
    object REtStuffId: TRzEdit
      Left = 80
      Top = 57
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 1
    end
    object REtStuffNm: TRzEdit
      Left = 80
      Top = 89
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 2
    end
    object REtStuffType: TRzEdit
      Left = 304
      Top = 89
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 3
    end
    object RCmbSiloName: TRzComboBox
      Left = 80
      Top = 128
      Width = 137
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 4
    end
    object REdtStorageNum: TRzEdit
      Left = 80
      Top = 161
      Width = 137
      Height = 22
      TabOrder = 5
      OnKeyPress = REdtStorageNumKeyPress
    end
    object RCmbUnit: TRzComboBox
      Left = 304
      Top = 160
      Width = 137
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 6
      Items.Strings = (
        #21315#20811
        #21544)
      Values.Strings = (
        #21315#20811
        #21544)
    end
    object RzEdit7: TRzEdit
      Left = 304
      Top = 193
      Width = 137
      Height = 22
      Text = '2014-10-09 15:58'
      Enabled = False
      TabOrder = 7
    end
    object REdtMan: TRzEdit
      Left = 80
      Top = 193
      Width = 137
      Height = 22
      Enabled = False
      TabOrder = 8
    end
    object cxBtnMaSelForWarehousing: TcxButton
      Left = 224
      Top = 57
      Width = 65
      Height = 22
      Caption = #36873#25321#21407#26009
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = cxBtnMaSelForWarehousingClick
      PopupAlignment = paCenter
    end
  end
  object cBtnManulPrtDel: TcxButton
    Left = 200
    Top = 250
    Width = 81
    Height = 28
    Caption = #21150#29702#20837#24211
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = cBtnManulPrtDelClick
    Margin = 8
    PaintStyle = bpsCaption
    PopupAlignment = paCenter
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 231
    Top = 65535
  end
end
