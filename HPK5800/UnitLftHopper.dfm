object FrmLftHopper: TFrmLftHopper
  Left = 867
  Top = 151
  BorderStyle = bsDialog
  Caption = #25552#21319#26007#23646#24615#35774#32622
  ClientHeight = 487
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object sBitBtn1: TsBitBtn
    Left = 8
    Top = 440
    Width = 81
    Height = 41
    Caption = #35835#21462#13#10#19979#20301#26426#21442#25968
    TabOrder = 0
  end
  object sBitBtn2: TsBitBtn
    Left = 96
    Top = 440
    Width = 81
    Height = 41
    Caption = #24674#22797#13#10#20986#21378#35774#32622
    TabOrder = 1
  end
  object sBtBtnOK: TsBitBtn
    Left = 248
    Top = 440
    Width = 81
    Height = 41
    Caption = #30830#23450#20462#25913
    TabOrder = 2
  end
  object sBitBtn4: TsBitBtn
    Left = 344
    Top = 440
    Width = 81
    Height = 41
    Caption = #21462#28040
    TabOrder = 3
  end
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 434
    Height = 433
    ActivePage = sTabSheet1
    TabOrder = 4
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
      object Label1: TLabel
        Left = 64
        Top = 28
        Width = 56
        Height = 14
        Caption = #35774#22791#21517#31216
      end
      object sEtEquipName: TsEdit
        Left = 128
        Top = 24
        Width = 137
        Height = 22
        BiDiMode = bdLeftToRight
        Color = clWhite
        Enabled = False
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
        Text = 'sEtEquipName'
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
      object sGroupBox2: TsGroupBox
        Left = 40
        Top = 72
        Width = 337
        Height = 49
        TabOrder = 1
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
    end
    object sTabSheet2: TsTabSheet
      Caption = #21442#25968#35774#32622
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object AdvStrGdAggrBinAttri: TAdvStringGrid
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
  object sProgressBar1: TsProgressBar
    Left = 36
    Top = 251
    Width = 364
    Height = 17
    TabOrder = 5
    Visible = False
    SkinData.SkinSection = 'GAUGE'
  end
  object Timer1: TTimer
    Interval = 200
    Left = 200
    Top = 448
  end
end
