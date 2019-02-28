object FrmMixPara: TFrmMixPara
  Left = 608
  Top = 293
  BorderStyle = bsDialog
  Caption = #25605#25292#26426' '#23646#24615
  ClientHeight = 485
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 434
    Height = 433
    ActivePage = sTabSheet2
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = #22522#26412#20449#24687
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object GBxMixerBasicInfo: TsGroupBox
        Left = 16
        Top = 8
        Width = 393
        Height = 137
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        Checked = False
        object Label1: TLabel
          Left = 24
          Top = 36
          Width = 70
          Height = 14
          Caption = #25605#25292#26426#32534#21495
        end
        object Label2: TLabel
          Left = 24
          Top = 68
          Width = 70
          Height = 14
          Caption = #25605#25292#26426#22411#21495
        end
        object Label3: TLabel
          Left = 24
          Top = 100
          Width = 70
          Height = 14
          Caption = #25605#25292#26426#23481#37327
        end
        object Label4: TLabel
          Left = 336
          Top = 100
          Width = 7
          Height = 14
          Caption = 'm'
        end
        object Label5: TLabel
          Left = 343
          Top = 98
          Width = 5
          Height = 10
          Caption = '3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object sEtEquipName: TsEdit
          Left = 112
          Top = 32
          Width = 217
          Height = 22
          BiDiMode = bdLeftToRight
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '1'
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
        object sEdit1: TsEdit
          Left = 112
          Top = 64
          Width = 217
          Height = 22
          BiDiMode = bdLeftToRight
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
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
        object EtMixCap: TsEdit
          Left = 112
          Top = 96
          Width = 217
          Height = 22
          BiDiMode = bdLeftToRight
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 2
          OnChange = EtMixCapChange
          OnKeyPress = EtMixCapKeyPress
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
      end
      object GbxMixerDschSetting: TsGroupBox
        Left = 16
        Top = 152
        Width = 393
        Height = 57
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        Checked = False
        object sCkBFstDschDisable: TsCheckBox
          Left = 32
          Top = 29
          Width = 132
          Height = 20
          Caption = #21551#29992#39318#30424#31105#27490#21368#30780
          TabOrder = 0
          OnClick = sCkBFstDschDisableClick
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCkBMixerDschLinkToPowderLd: TsCheckBox
          Left = 216
          Top = 29
          Width = 146
          Height = 20
          Caption = #31881#26009#26410#37197#23436#31105#27490#21368#30780
          TabOrder = 1
          OnClick = sCkBMixerDschLinkToPowderLdClick
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object GbxRemark: TsGroupBox
        Left = 16
        Top = 224
        Width = 393
        Height = 153
        Caption = #22791#27880
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        Checked = False
        object sMemo1: TsMemo
          Left = 24
          Top = 32
          Width = 345
          Height = 113
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentFont = False
          TabOrder = 0
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = #21442#25968#35774#32622
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object AdvStrGdMixerPara: TAdvStringGrid
        Left = 0
        Top = 8
        Width = 425
        Height = 345
        Cursor = crDefault
        ColCount = 6
        DefaultColWidth = 20
        DefaultRowHeight = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetAlignment = AdvStrGdMixerParaGetAlignment
        OnCanEditCell = AdvStrGdMixerParaCanEditCell
        OnCellsChanged = AdvStrGdMixerParaCellsChanged
        OnGetEditorType = AdvStrGdMixerParaGetEditorType
        ActiveCellFont.Charset = ANSI_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -14
        ActiveCellFont.Name = #23435#20307
        ActiveCellFont.Style = [fsBold]
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedColWidth = 20
        FixedRowHeight = 20
        FixedFont.Charset = ANSI_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -14
        FixedFont.Name = #23435#20307
        FixedFont.Style = []
        FloatFormat = '%.1f'
        MouseActions.DirectEdit = True
        Navigation.AlwaysEdit = True
        Navigation.AdvanceOnEnter = True
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowDesignHelper = False
        VAlignment = vtaCenter
        Version = '5.8.7.0'
        ColWidths = (
          20
          89
          162
          83
          50
          22)
      end
      object Memo2: TMemo
        Left = 0
        Top = 357
        Width = 425
        Height = 45
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
    end
  end
  object BrnReadDb: TsBitBtn
    Left = 8
    Top = 440
    Width = 81
    Height = 41
    Caption = #35835#21462#13#10#19979#20301#26426#21442#25968
    TabOrder = 1
    Visible = False
  end
  object BtnRestore: TsBitBtn
    Left = 96
    Top = 440
    Width = 81
    Height = 41
    Caption = #24674#22797#13#10#20986#21378#35774#32622
    TabOrder = 2
    Visible = False
  end
  object sBitBtn4: TsBitBtn
    Left = 344
    Top = 440
    Width = 81
    Height = 41
    Caption = #21462#28040
    TabOrder = 3
    OnClick = sBitBtn4Click
  end
  object sBtBtnOK: TsBitBtn
    Left = 248
    Top = 440
    Width = 81
    Height = 41
    Caption = #30830#23450#20462#25913
    TabOrder = 4
    OnClick = sBtBtnOKClick
  end
  object sProgressBar1: TsProgressBar
    Left = 36
    Top = 179
    Width = 364
    Height = 17
    TabOrder = 5
    Visible = False
    SkinData.SkinSection = 'GAUGE'
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 200
    Top = 448
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 232
    Top = 16
  end
end
