object FrmWeigherAttribute: TFrmWeigherAttribute
  Left = 672
  Top = 237
  BorderStyle = bsDialog
  Caption = 'FrmWeigherAttribute'
  ClientHeight = 579
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 434
    Height = 521
    ActivePage = sTabSheet2
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = #22522#26412#20449#24687
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Label1: TLabel
        Left = 224
        Top = 28
        Width = 42
        Height = 14
        Caption = #31216#21517#31216
      end
      object Label6: TLabel
        Left = 40
        Top = 28
        Width = 42
        Height = 14
        Caption = #31216#24207#21495
      end
      object sEtWeigherName: TsEdit
        Left = 272
        Top = 24
        Width = 105
        Height = 22
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = 'sEtWeigherName'
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
      object GpDischPreact: TsGroupBox
        Left = 40
        Top = 64
        Width = 337
        Height = 49
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        Checked = False
        object Label2: TLabel
          Left = 8
          Top = 23
          Width = 70
          Height = 14
          Caption = #31216#21368#26009#33853#24046
        end
        object Label4: TLabel
          Left = 232
          Top = 23
          Width = 14
          Height = 14
          Caption = 'kg'
        end
        object sEtDschPre: TsEdit
          Left = 88
          Top = 19
          Width = 137
          Height = 22
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentFont = False
          TabOrder = 0
          Text = #35835#21462#38169#35823
          OnKeyPress = sEtDschPreKeyPress
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
      object sGroupBox2: TsGroupBox
        Left = 40
        Top = 128
        Width = 337
        Height = 49
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        Checked = False
        object Label3: TLabel
          Left = 8
          Top = 23
          Width = 70
          Height = 14
          Caption = #31216#20449#21495#30005#21387
        end
        object Label5: TLabel
          Left = 232
          Top = 23
          Width = 14
          Height = 14
          Caption = 'mv'
        end
        object sEtLoadCell: TsEdit
          Left = 88
          Top = 19
          Width = 137
          Height = 22
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = #35835#21462#38169#35823
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
      object sEtWeigherId: TsEdit
        Left = 88
        Top = 24
        Width = 105
        Height = 22
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
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
    object sTabSheet2: TsTabSheet
      Caption = #21442#25968#35774#32622
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object AdvStrGdWeigAttri: TAdvStringGrid
        Left = 0
        Top = 8
        Width = 425
        Height = 433
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
        OnGetAlignment = AdvStrGdWeigAttriGetAlignment
        OnCanEditCell = AdvStrGdWeigAttriCanEditCell
        OnCellsChanged = AdvStrGdWeigAttriCellsChanged
        OnGetEditorType = AdvStrGdWeigAttriGetEditorType
        OnComboChange = AdvStrGdWeigAttriComboChange
        OnComboObjectChange = AdvStrGdWeigAttriComboObjectChange
        ActiveCellFont.Charset = ANSI_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -12
        ActiveCellFont.Name = #23435#20307
        ActiveCellFont.Style = []
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
        FixedFont.Height = -12
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
      object Memo1: TMemo
        Left = 0
        Top = 445
        Width = 425
        Height = 45
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
    end
  end
  object BtnReadDb: TsBitBtn
    Left = 8
    Top = 528
    Width = 81
    Height = 41
    Caption = #35835#21462#13#10#19979#20301#26426#21442#25968
    TabOrder = 1
    Visible = False
  end
  object BtnRestore: TsBitBtn
    Left = 96
    Top = 528
    Width = 81
    Height = 41
    Caption = #24674#22797#13#10#20986#21378#35774#32622
    TabOrder = 2
    Visible = False
  end
  object sBtBtnOK: TsBitBtn
    Left = 248
    Top = 528
    Width = 81
    Height = 41
    Caption = #30830#23450#20462#25913
    TabOrder = 3
    OnClick = sBtBtnOKClick
  end
  object sBitBtn4: TsBitBtn
    Left = 344
    Top = 528
    Width = 81
    Height = 41
    Caption = #21462#28040
    TabOrder = 4
    OnClick = sBitBtn4Click
  end
  object sPanel1: TsPanel
    Left = 32
    Top = 328
    Width = 369
    Height = 21
    TabOrder = 5
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object sProgressBar1: TsProgressBar
      Left = 4
      Top = 3
      Width = 364
      Height = 17
      TabOrder = 0
      SkinData.SkinSection = 'GAUGE'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 188
    Top = 537
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 224
    Top = 536
  end
end
