object FrmRecipe: TFrmRecipe
  Left = 180
  Top = 245
  BorderStyle = bsDialog
  Caption = #37197#27604#31649#29702
  ClientHeight = 649
  ClientWidth = 1050
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 1050
    Height = 649
    ActivePage = sTabRecipeLst
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabRecipeLst: TsTabSheet
      Caption = #37197#27604#21015#34920
      OnShow = sTabRecipeLstShow
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object AdvStringGrid1: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 1041
        Height = 617
        Cursor = crDefault
        ColCount = 12
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnDblClick = AdvStringGrid1DblClick
        OnGetAlignment = AdvStringGrid1GetAlignment
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
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
        FixedRowHeight = 22
        FixedFont.Charset = ANSI_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -14
        FixedFont.Name = #23435#20307
        FixedFont.Style = []
        FloatFormat = '%.2f'
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
        Version = '5.8.7.0'
      end
    end
    object sTabRecipeDetails: TsTabSheet
      BorderWidth = 1
      Caption = #37197#27604#26126#32454
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnExit = sTabRecipeDetailsExit
      OnShow = sTabRecipeDetailsShow
      ButtonSkin = 'BAR'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sLabel2: TsLabel
        Left = 120
        Top = 26
        Width = 56
        Height = 14
        Caption = #37197#27604#32534#21495
      end
      object sLabel3: TsLabel
        Left = 120
        Top = 56
        Width = 56
        Height = 14
        Caption = #37197#27604#31867#21035
        Color = clLime
        ParentColor = False
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
      end
      object sLabel4: TsLabel
        Left = 56
        Top = 86
        Width = 126
        Height = 14
        Caption = #35774#35745#27604#20363#65288'C:W:S:G)'
      end
      object sLabel5: TsLabel
        Left = 120
        Top = 573
        Width = 56
        Height = 14
        Caption = #37197#27604#29366#24577
      end
      object sLabel6: TsLabel
        Left = 120
        Top = 504
        Width = 56
        Height = 14
        Caption = #25216#26415#35201#27714
      end
      object sLabel7: TsLabel
        Left = 392
        Top = 56
        Width = 56
        Height = 14
        Caption = #24378#24230#31561#32423
      end
      object sLabel8: TsLabel
        Left = 672
        Top = 56
        Width = 42
        Height = 14
        Caption = #22349#33853#24230
      end
      object sLabel9: TsLabel
        Left = 658
        Top = 26
        Width = 56
        Height = 14
        Caption = #21046#23450#26085#26399
      end
      object sLabel10: TsLabel
        Left = 406
        Top = 573
        Width = 42
        Height = 14
        Caption = #23454#39564#21592
      end
      object sLabel11: TsLabel
        Left = 672
        Top = 573
        Width = 42
        Height = 14
        Caption = #23457#26680#21592
      end
      object Label1: TLabel
        Left = 338
        Top = 24
        Width = 11
        Height = 19
        Caption = '*'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object sLabel12: TsLabel
        Left = 406
        Top = 26
        Width = 42
        Height = 14
        Caption = #37197#27604'ID'
        Color = clLime
        ParentColor = False
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
      end
      object AdvStrGrdRecipeDetails: TAdvStringGrid
        Left = 184
        Top = 112
        Width = 689
        Height = 385
        Cursor = crDefault
        ColCount = 6
        RowCount = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetCellColor = AdvStrGrdRecipeDetailsGetCellColor
        OnGetAlignment = AdvStrGrdRecipeDetailsGetAlignment
        OnCanEditCell = AdvStrGrdRecipeDetailsCanEditCell
        OnCellValidate = AdvStrGrdRecipeDetailsCellValidate
        OnCellsChanged = AdvStrGrdRecipeDetailsCellsChanged
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
        FixedFooters = 1
        FixedRowHeight = 22
        FixedFont.Charset = ANSI_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -14
        FixedFont.Name = #23435#20307
        FixedFont.Style = []
        FloatFormat = '%.2f'
        FloatingFooter.CalculateHiddenRows = False
        FloatingFooter.Color = clLime
        FloatingFooter.Visible = True
        MouseActions.DirectEdit = True
        Navigation.AlwaysEdit = True
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
        ShowSelection = False
        ShowDesignHelper = False
        Version = '5.8.7.0'
        RowHeights = (
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22
          22)
      end
      object sCmbBoxRecipeState: TsComboBox
        Left = 184
        Top = 569
        Width = 153
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        VerticalAlignment = taAlignTop
        Style = csDropDownList
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ItemHeight = 16
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = #27491#24120#20351#29992
        OnChange = sCmbBoxRecipeStateChange
        Items.Strings = (
          #27491#24120#20351#29992
          #24050#32463#20572#29992)
      end
      object sMemoTechReq: TsMemo
        Left = 184
        Top = 504
        Width = 689
        Height = 57
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 2
        OnChange = sMemoTechReqChange
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
      object sCmbBoxRecipeCode: TsComboBox
        Left = 184
        Top = 22
        Width = 153
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clRed
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        VerticalAlignment = taAlignTop
        Style = csSimple
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ItemHeight = 14
        ItemIndex = -1
        ParentFont = False
        TabOrder = 3
        OnChange = sCmbBoxRecipeCodeChange
      end
      object sCmbBoxRecipeVariety: TsComboBox
        Left = 184
        Top = 52
        Width = 153
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        VerticalAlignment = taAlignTop
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ItemHeight = 16
        ItemIndex = -1
        ParentFont = False
        TabOrder = 4
        OnChange = sCmbBoxRecipeVarietyChange
      end
      object sEdtMatrialRation: TsEdit
        Left = 184
        Top = 82
        Width = 425
        Height = 22
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        TabOrder = 5
        OnChange = sEdtMatrialRationChange
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
      object sCmbBoxRecipeStrength: TsComboBox
        Left = 456
        Top = 52
        Width = 153
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        VerticalAlignment = taAlignTop
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ItemHeight = 16
        ItemIndex = -1
        ParentFont = False
        TabOrder = 6
        OnChange = sCmbBoxRecipeStrengthChange
      end
      object sCmbBoxSlump: TsComboBox
        Left = 720
        Top = 52
        Width = 130
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        VerticalAlignment = taAlignTop
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ItemHeight = 16
        ItemIndex = -1
        ParentFont = False
        TabOrder = 7
        OnChange = sCmbBoxSlumpChange
      end
      object sDateEdit1: TsDateEdit
        Left = 720
        Top = 24
        Width = 153
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!9999/99/99;1; '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        MaxLength = 10
        ParentFont = False
        TabOrder = 8
        Text = '    -  -  '
        OnChange = sDateEdit1Change
        CheckOnExit = True
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
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object sCmbBoxRecipeTstr: TsComboBox
        Left = 456
        Top = 569
        Width = 153
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        VerticalAlignment = taAlignTop
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ItemHeight = 16
        ItemIndex = -1
        ParentFont = False
        TabOrder = 9
        OnChange = sCmbBoxRecipeTstrChange
      end
      object sCmbBoxRecipeAssessor: TsComboBox
        Left = 720
        Top = 569
        Width = 153
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        VerticalAlignment = taAlignTop
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ItemHeight = 16
        ItemIndex = -1
        ParentFont = False
        TabOrder = 10
        OnChange = sCmbBoxRecipeAssessorChange
      end
      object sBitBtn1: TsBitBtn
        Left = 849
        Top = 52
        Width = 24
        Height = 22
        Caption = #177
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnClick = sBitBtn1Click
        Spacing = 5
        Alignment = taRightJustify
      end
      object sEdtRecipeId: TsEdit
        Left = 456
        Top = 22
        Width = 153
        Height = 22
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        TabOrder = 12
        OnChange = sEdtMatrialRationChange
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
  object sPanel1: TsPanel
    Left = 155
    Top = -1
    Width = 894
    Height = 23
    Ctl3D = False
    FullRepaint = False
    ParentCtl3D = False
    TabOrder = 1
    SkinData.SkinSection = 'TRACKBAR'
    object sLabel1: TsLabel
      Left = 592
      Top = 2
      Width = 10
      Height = 20
      Caption = '='
      ParentFont = False
      Visible = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
    end
    object sBitBtnAddRecipe: TsBitBtn
      Left = 8
      Top = 1
      Width = 57
      Height = 22
      Caption = '&'#22686#21152
      TabOrder = 0
      OnClick = sBitBtnAddRecipeClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2778852778852778852778850D
        5F68277885FFFFFF6F879D25436D3C52716F879DFFFFFFFFFFFFFFFFFFFFFFFF
        D5AB91CB8D7BCB8D7BCB8D7BAF7B6BAF7B6BD5AB9125436D355B85425A926A8E
        BB2A31508A8CA1FFFFFFFFFFFFCB8D7BFFCEBFFFCEBFFBF1ECF8E6DEFBE1D4FB
        F1EC3C52714D6F985E7FB372A7D325436D4D6F983C5271FFFFFFFFFFFFCB8D7B
        FFCEBFFFCEBFFBF1ECF8E8E0FAF5F26F879D4D6F986594D573B4E3134C8B2565
        9E5E7FB33C5271FFFFFFFFFFFFCB8D7BE4C1ABFBE1D4FBF1ECF8E8E0FAF5F269
        799072A7D396B7F625659E2D75C36A8EBB4D6F986F879DFFFFFFFFFFFFAF7B6B
        FFCEBFFBE1D4FBF1ECF8E8E0FDF9F78699ADA3CAD74D6F985E7FB36594D55E7F
        B325436DFFFFFFFFFFFFFFFFFFAF7B6BFFCEBFFBE1D4FBF1ECF9EAE4FFCEBFFB
        F1EC425A9284BBD172A7D36A8EBB487280FFFFFFFFFFFFFFFFFFFFFFFFAF7B6B
        E4C1ABFBE1D4FBF1ECF8E8E0FBE1D4FFCEBFF8E6DE6F879D6979908699ADFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFAF7B6BFFCEBFFBE1D4FBF1ECF8E8E0FFCEBFFF
        CEBFE4C1ABEFDBD7C3D5D9FFFFFF15779CFFFFFFFFFFFFFFFFFFFFFFFFAF7B6B
        E4C1ABFFA28CEEC3B2FFA38FC1866BA56C52E4B48AAF7B6BC3D5D915779C86D5
        F615779CFFFFFFFFFFFFFFFFFFAF7B6B9E6348FFB3A1F8E7DFF3DACEF8CFBCFF
        B3A19C5344EFDBD71D84A81D84A89CE1F81D84A81D84A8FFFFFFFFFFFFCB8D7B
        FFB3A1FFCEBFFBF1ECF8E8E0FBE1D4FFCEBFF5DCD41D84A8CBF3FCCBF3FCCBF3
        FCCBF3FCCBF3FC1D84A8FFFFFFCB8D7BFFCEBFFFCEBFFBF1ECF8E8E0FFCEBFFF
        CEBFFFCEBFD5AB912693B62693B6EBFDFD2693B62693B6FFFFFFFFFFFFFFFFFF
        D5AB91CB8D7BCB8D7BCB8D7BCB8D7BAF7B6BD5AB91FFFFFFFFFFFF2693B6F1FE
        FD2693B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF2693B6FFFFFFFFFFFFFFFFFF}
      Spacing = 5
    end
    object sBitBtnDelRecipe: TsBitBtn
      Left = 72
      Top = 1
      Width = 57
      Height = 22
      Caption = #21024#38500
      TabOrder = 1
      OnClick = sBitBtnDelRecipeClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFEFEFFF2F2FABFBBE48D88CD7871C37972C48A85CCB9B5E1EDECF8FEFE
        FFFF00FFFF00FFFF00FFFF00FFFF00FFF7F7FCC2BFE56C65C05048B4524DB955
        4FBA534EB9514BB54D46B16B65BFC3C0E6FBFBFDFF00FFFF00FFFF00FFF7F7FC
        A9A5DA4F49B6534EBE5853C25A57C35955C25854C15753BF504BB94E49B5534C
        B3BAB6E2FCFCFEFF00FFFF00FFBDB9E3524CBA6461CB7C78D36863CB554FC55D
        58C85853C6534EC27774CC6B66C5514CB65B53B7D1CEECFF00FFE9E8F6655DBF
        5E57CA8783D9F1F1FBC1BFEC605CCC504BC84F4AC88581D7F0F1FBC5C4E9534F
        BB4E48B4837CCAFAF9FDA39ED85E57C66A65D87670D2C9C7E7FFFFFFBEBCEB61
        5CCE928EDDF4F5FDEFEEF7A09CDA5752C0544EB95B54B8D6D4ED7069C5716BDB
        7672E3625DD3615AC5B7B5DFF4F3FBD7D5F2F4F4FCE2E0F2807CCC5049C05954
        C35852BC574FB7B5B1DE675FC68682F18382F07775E45A53D0615BC6DADAF0FF
        FFFFFBFBFC7E79CD4943C05B56CA5B56C55953BE5952B8B1ADDD6C67C89D9FFC
        9A9EFD8283EF7371E1B1ADE8F9F9FCFDFCFEFFFFFEC2C0EB645ECF5550C95C57
        C65953C05952B8B3AFDE7872C9ABB2F7AFBAFF999DF2CBCAF7FEFEFFDCDBF27B
        76C8C5C2E8FFFFFFCECDF16E6AD15854C55953C05850B8C7C4E79E9AD9A7ADEE
        C8D9FD9597DFD7D3EBE0DFF1726DCB504AC45E58C3C4C1E7FFFFFFA4A0D95550
        C15852C06A64BEF4F3FAD8D6EF8786DED1DFFFC0CBF38786D17773CE7777E077
        74E4605CD36560C6908AD06661C45C57C5544DB9B3AFDFFF00FFFF00FFAFADE3
        9D9FEDD7E6FFC4D3F8A7ADF59D9FFA8683F07773E46863D65A55C9625ECD5953
        C08680CAFEFEFFFF00FFFF00FFF9F9FD9C99DE9B9CEBC9D5FECBD6FFB1B5FF97
        94FB7F7AEC736EE06964D55D56C2837DCAF4F3FAFF00FFFF00FFFF00FFFF00FF
        FDFDFEB7B5E58D8BE0A1A3EF9FA1F1918FEF7C78E26761CD645CC0A7A3DAFCFC
        FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF9F9FDD2D1EEA19DDE8A87D988
        84D7807AD1928CD2C7C4E7FAFAFDFF00FFFF00FFFF00FFFF00FF}
      Spacing = 5
    end
    object sBitBtnPrtRecipeDetails: TsBitBtn
      Left = 136
      Top = 1
      Width = 89
      Height = 22
      Caption = #25171#21360#35814#21333
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        CA040000424DCA040000000000001A0000000C0000001400140001001800FFFF
        FFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFF8F8F8DFDFDF
        D2D2D2CACACAC4C4C4BFBFBFBDBDBDB8B8B8B7B7B7B7B7B7B7B7B7B7B7B7B8B8
        B8BCBCBCBDBDBDC0C0C0C9C9C9D1D1D1DFDFDFF7F7F7FDFDFDF2F2F2CCCCCBCA
        CAC9B4B4B4777675787776787776777676777676777676777676787776787776
        7473728A8989C8C8C7C8C8C7E6E6E5FDFDFDFFFFFFECECECCBCBCAD0D0CFC0C0
        BE838281807F7E80807F81807F81807F81807F81807F80807F80807F7D7C7B9C
        9B9AD0D0CFD2CED1DDDCDCFFFFFFFFFFFFEEEEEECBCBCACCCCCBD1CFCCD5D0CA
        D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D5D1CDCDCD
        CC9BBC98D5D9D4FFFFFFFFFFFFF4F4F4CCCCCCD3D2CFBEC6CF90B0D08EB0D08F
        B0D08FB0D08FB0D08FB0D08FB0D08FB0D08FB0D08EAFD0A6BBCFD3D1CFB3C7B1
        DADCD9FFFFFFFFFFFFF3F3F3D3D1CFCECFD13082C9006EC70271C80271C80271
        C80271C80271C80271C80271C80271C80070C70570C89BB5CEDFD8D6E0E0E0FF
        FFFFFFFFFFF4F4F4D8D6D4C0C9D3157DCF0D7ED2107FD2107FD2107FD2107FD2
        107FD2107FD2107FD2107FD2107FD20177D171A1CDE2DCD6E2E2E1FFFFFFFFFF
        FFF1F1F1DDDBD8C5CDD71E87D81389DD168ADD168ADD168ADD168ADD168ADD16
        8ADD168ADD168ADD168ADD0881DB78A6D2E5DFD9E4E4E4FFFFFFFFFFFFF1F1F1
        E0DEDCC7CFD9228EE00D83DE0B7CD80C7DD90C7DD90C7DD90C7DD90C7DD90C7D
        D90C7CD90C7EDA0A86E27AA9D6E8E2DCE5E5E5FFFFFFFFFFFFF4F4F4E5E3E1CF
        D8E0238DE24F85C294A7C28DA4C28DA4C28DA4C28DA4C28DA4C28DA4C290A6C2
        7D99BF147DD882B4DEECE6E0EAEAEAFFFFFFFFFFFFFDFDFDF2F0F0E6EAEE88B9
        E9B0BFD0DFD7CFD9D5D0D9D5D0D9D5D0D9D5D0D9D5D0D9D5D0DAD5D0D5D0CC83
        B3E1C1D9EFF6F4F1FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E4E4
        D0CFCDCCC9C5CCCAC6CCCAC6CCCAC6CCCAC6CCCAC5CECCC9D8D7D6F4F6F8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7D8D7D7D5
        D4D2D5D4D3D5D4D3D5D4D3D5D4D3D5D4D2D7D6D5DCDCDCF9F9F9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBECECD7D5D3CAC7C1CBC8
        C3CBC8C3CBC8C3CBC8C3CBC7C2D0CECAE2E2E2FAFAFAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEE1E0E0DCDAD8DCDBD9DCDBD9
        DCDBD9DCDBD9DCDAD8DEDDDCE6E6E6FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1DFDDDBD0CEC8D2CFCAD2CFCAD2CFCAD2
        CFCAD1CEC8D7D5D1EAEAEAFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF2F2F2EDEEEEEFF0F0EFF0F0EFF0F0EFF0F0EFF0F0EFF0
        F0EFEFEFEDEDEDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFCFCFCF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Spacing = 5
    end
    object sCmbBoxSearchType: TsComboBox
      Left = 472
      Top = 1
      Width = 113
      Height = 22
      Alignment = taLeftJustify
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      VerticalAlignment = taAlignTop
      Style = csDropDownList
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 16
      ItemIndex = -1
      ParentFont = False
      TabOrder = 3
      OnChange = sCmbBoxSearchTypeChange
      Items.Strings = (
        #25152#26377#37197#27604
        #27491#24120#37197#27604
        #20572#29992#37197#27604
        '-----------'
        #37197#27604#31867#21035
        #37197#27604#32534#21495
        #22349#33853#24230
        #24378#24230#31561#32423
        #23454#39564#21592
        #23457#26680#21592)
    end
    object sEdtSearchDetails: TsEdit
      Left = 608
      Top = 2
      Width = 129
      Height = 20
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentFont = False
      TabOrder = 4
      Text = 'sEdtSearchDetails'
      Visible = False
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
    object sBitBtnPrtRecipeLst: TsBitBtn
      Left = 800
      Top = 1
      Width = 89
      Height = 22
      Caption = #25171#21360#21015#34920
      TabOrder = 5
      Visible = False
      Glyph.Data = {
        CA040000424DCA040000000000001A0000000C0000001400140001001800FFFF
        FFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFF8F8F8DFDFDF
        D2D2D2CACACAC4C4C4BFBFBFBDBDBDB8B8B8B7B7B7B7B7B7B7B7B7B7B7B7B8B8
        B8BCBCBCBDBDBDC0C0C0C9C9C9D1D1D1DFDFDFF7F7F7FDFDFDF2F2F2CCCCCBCA
        CAC9B4B4B4777675787776787776777676777676777676777676787776787776
        7473728A8989C8C8C7C8C8C7E6E6E5FDFDFDFFFFFFECECECCBCBCAD0D0CFC0C0
        BE838281807F7E80807F81807F81807F81807F81807F80807F80807F7D7C7B9C
        9B9AD0D0CFD2CED1DDDCDCFFFFFFFFFFFFEEEEEECBCBCACCCCCBD1CFCCD5D0CA
        D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D4CFC9D5D1CDCDCD
        CC9BBC98D5D9D4FFFFFFFFFFFFF4F4F4CCCCCCD3D2CFBEC6CF90B0D08EB0D08F
        B0D08FB0D08FB0D08FB0D08FB0D08FB0D08FB0D08EAFD0A6BBCFD3D1CFB3C7B1
        DADCD9FFFFFFFFFFFFF3F3F3D3D1CFCECFD13082C9006EC70271C80271C80271
        C80271C80271C80271C80271C80271C80070C70570C89BB5CEDFD8D6E0E0E0FF
        FFFFFFFFFFF4F4F4D8D6D4C0C9D3157DCF0D7ED2107FD2107FD2107FD2107FD2
        107FD2107FD2107FD2107FD2107FD20177D171A1CDE2DCD6E2E2E1FFFFFFFFFF
        FFF1F1F1DDDBD8C5CDD71E87D81389DD168ADD168ADD168ADD168ADD168ADD16
        8ADD168ADD168ADD168ADD0881DB78A6D2E5DFD9E4E4E4FFFFFFFFFFFFF1F1F1
        E0DEDCC7CFD9228EE00D83DE0B7CD80C7DD90C7DD90C7DD90C7DD90C7DD90C7D
        D90C7CD90C7EDA0A86E27AA9D6E8E2DCE5E5E5FFFFFFFFFFFFF4F4F4E5E3E1CF
        D8E0238DE24F85C294A7C28DA4C28DA4C28DA4C28DA4C28DA4C28DA4C290A6C2
        7D99BF147DD882B4DEECE6E0EAEAEAFFFFFFFFFFFFFDFDFDF2F0F0E6EAEE88B9
        E9B0BFD0DFD7CFD9D5D0D9D5D0D9D5D0D9D5D0D9D5D0D9D5D0DAD5D0D5D0CC83
        B3E1C1D9EFF6F4F1FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E4E4
        D0CFCDCCC9C5CCCAC6CCCAC6CCCAC6CCCAC6CCCAC5CECCC9D8D7D6F4F6F8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7D8D7D7D5
        D4D2D5D4D3D5D4D3D5D4D3D5D4D3D5D4D2D7D6D5DCDCDCF9F9F9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBECECD7D5D3CAC7C1CBC8
        C3CBC8C3CBC8C3CBC8C3CBC7C2D0CECAE2E2E2FAFAFAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEE1E0E0DCDAD8DCDBD9DCDBD9
        DCDBD9DCDBD9DCDAD8DEDDDCE6E6E6FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1DFDDDBD0CEC8D2CFCAD2CFCAD2CFCAD2
        CFCAD1CEC8D7D5D1EAEAEAFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF2F2F2EDEEEEEFF0F0EFF0F0EFF0F0EFF0F0EFF0F0EFF0
        F0EFEFEFEDEDEDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFCFCFCF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Spacing = 5
    end
    object sBitBtnSearch: TsBitBtn
      Left = 738
      Top = 1
      Width = 57
      Height = 22
      Caption = #26597#25214
      TabOrder = 6
      Visible = False
      Glyph.Data = {
        1A030000424D1A030000000000001A0000000C0000001000100001001800FDFD
        FDF2F2F2E8E8E8DDDDDDD4D4D4D3D3D3D6D6D6D7D7D7D8D8D8D2D2D2C9C9C9C3
        C2C2C2C0BFBABFC1BFCBD7F3F4F7FBFBFBEEEEEEE3E3E3D9D9D9D4D4D4D9D9D9
        DEDEDEE1E1E1E3E3E3DFDFDFD8D8D8D9D8D7B6BEC56E93B9739FC9DFEAF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA
        F1F67DA9D16295CB97B6D3F3F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDAE3EB699BC85792C8B0C9DEF0F6F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5E3EB5E92C34B
        85BFA7C3DCECF4F4FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFD80A5CA2C6CB491AFCFE5EFF2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFAFBFBFAFBFBFFFFFFFEFEFEE5E2DFB6C4D283A8CCE3
        EFF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E5E6DAD9D6E7E2DBE9E4DD
        E7E6E5E2E3E5D3D1D3EDEBE8FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE4E2E1D3CDBEF6EACAFDEFCEFDEFCFFAEDD7DDDAD2E4E4E5FDFDFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4F6E0D9CFFFF1CEFFF3CDFDF2CDFDF1CD
        FFF1CDFDEED5E6E4E2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E9
        EAF0E5D1FFF2D4FFF0D3FDF1CEFDF1CDFDF1CDFFF2CDEAE2DAF5F6F7FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFECEAE9F7ECDFFFF3DFFDF0D4FEF0D4FDF1CD
        FDF1CDFFF3CDE5DFCEF1F2F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECEE
        EDF2EBDDFFF4E4FFF2DCFFEFD8FFF1D6FFF4D8FFF3CEE1DDCDF6F9FBFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F6F5E5E1D9FDF2E0FFF6EAFFF3DEFEF2D9
        FFF7D6E9E0C1DBD9D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE9E9EAE7E1D8F7EDE0FCF3E3FBEED5E8DDC3D2D0C9F7F7F8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF0F0E3E1DEE3DFD9DDDDD7
        E1E2DFFAFAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Spacing = 5
    end
    object sBitBtnSaveRecipe: TsBitBtn
      Left = 320
      Top = 1
      Width = 57
      Height = 22
      Caption = '&'#20445#23384
      Enabled = False
      TabOrder = 7
      OnClick = sBitBtnSaveRecipeClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      Spacing = 5
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 419
    Top = 65535
  end
end
