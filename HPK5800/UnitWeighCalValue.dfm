object FrmWeigherCalValue: TFrmWeigherCalValue
  Left = 757
  Top = 459
  BorderStyle = bsDialog
  Caption = #26657#31216#20540
  ClientHeight = 97
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 32
    Top = 23
    Width = 147
    Height = 14
    Caption = #35831#36755#20837#31216#19978#30749#30721#37325#37327#20540':'
  end
  object Label2: TLabel
    Left = 272
    Top = 23
    Width = 14
    Height = 14
    Caption = 'kg'
  end
  object sMaskEdit1: TsMaskEdit
    Left = 192
    Top = 19
    Width = 73
    Height = 22
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 0
    Text = '0'
    OnKeyPress = sMaskEdit1KeyPress
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
  end
  object sBitBtn1: TsBitBtn
    Left = 136
    Top = 64
    Width = 81
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = sBitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
      FF00FFEDF4EEA7CBAC5E9F662D81382F823A31853B2F823A33843D63A16BDDEA
      DFFF00FFFF00FFFF00FFFF00FFFF00FFB6D4BA45904E3A8E4542954E4798524B
      9B5547985242934D3D8D472F833A2B7E358EBA93FF00FFFF00FFFF00FFB2D2B6
      36894152A35D5AAB6655A6604DA05A4D9F58499B5447985143944E42924C3C8C
      46277C328AB890FF00FFF0F6F04D975758AB6463B56F5DAF6951A85D5AA96448
      9E544DA058499C5547995144954E42934C3C8D472D8037D8E8DAB6D6BB5BAE66
      71C27D68B97456AF6298CD9FE3F0E57EBD87479F534DA15A4B9E57489A544496
      4F42934E3587408CBA9276B47E76C88277C88363BA7089C892F7FBF8FFFFFFFF
      FFFF96C99D46A0524EA2594D9F57489A5345964F41924C3F8C4958AC6485D791
      79CB8486CB8FF0F9F2F5F9F67BB183F5FAF6FFFFFF95C99C47A0534EA35A4B9E
      57489A5346975032863D64B56F96E8A27CD188C8ECCDFBFCFB7AB1823B94476F
      AC78F6F9F6FEFEFE96CA9B49A2564FA25A4D9E574B9C55378A416BBD76A5F5B0
      8CDF988AD69589C0914EA25A6CBF7849A05570AD79F7FBF8FFFFFF93C89B4AA3
      564FA25A4FA05A388C4365B970ABFCB79CEEA886D89168BE756EC17A6CBE776B
      BD75489E5474AF7CF3F8F4FAFCFA91C89951A55D51A25B358A4069B272B2F7BE
      AFFEBB96E8A284D69076C9826FC27B6DBF776ABD76469D5179B281FCFDFCF8FC
      F972B77B50A25B42904CB0D5B589D095C6FFD2AAFBB694E69F82D48E77C98372
      C47E6EC17B6DC07848A05586BA8EACD8B264B370499B546DA874EBF4EC6FB679
      BDF5C9C5FFD1A9FAB495E8A186D7917CCF8876C98274C78070C27B5AAF6662B7
      6F60B26B358740DAE9DCFF00FFC3DFC76AB675BAF2C6C8FFD4AEFDBA9AEDA78C
      DF9884D58E7DCF8979C98477C9826ABB773A8E45A5CAAAFF00FFFF00FFFF00FF
      C1DEC563AF6F93D39EBCF9C8B1FEBDA2F3AD93E49F89DB957FCF8962B46E4395
      4EADD0B2FF00FFFF00FFFF00FFFF00FFFF00FFE0EFE28BC19260AD6B60B36B66
      BA7267B9725CAF6859A4638EC094E6F1E7FF00FFFF00FFFF00FF}
    Spacing = 10
  end
end
