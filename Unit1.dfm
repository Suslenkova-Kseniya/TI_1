object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 528
  ClientWidth = 1101
  Color = clMoneyGreen
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  object Key1: TLabel
    Left = 592
    Top = 7
    Width = 33
    Height = 24
    Caption = 'Key'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 904
    Top = 65
    Width = 75
    Height = 24
    Caption = 'decoded'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 512
    Top = 65
    Width = 75
    Height = 24
    Caption = 'encoded'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object input: TMemo
    Left = 8
    Top = 88
    Width = 345
    Height = 377
    CharCase = ecUpperCase
    Color = clCream
    Ctl3D = True
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'INPUT')
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object encode: TButton
    Left = 376
    Top = 471
    Width = 75
    Height = 25
    Caption = 'encode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = encodeClick
  end
  object Edit1: TEdit
    Left = 640
    Top = 8
    Width = 201
    Height = 27
    CharCase = ecUpperCase
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'EDIT1'
    OnClick = Edit1Click
  end
  object decode: TButton
    Left = 752
    Top = 471
    Width = 75
    Height = 25
    Caption = 'decode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = decodeClick
  end
  object method: TComboBox
    Left = 256
    Top = 8
    Width = 289
    Height = 32
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'method'
    Items.Strings = (
      #1057#1090#1086#1083#1073#1094#1086#1074#1099#1081' '#1084#1077#1090#1086#1076
      #1040#1083#1075#1086#1088#1080#1090#1084' '#1042#1080#1078#1077#1085#1077#1088#1072
      #1052#1077#1090#1086#1076' '#1076#1077#1094#1080#1084#1072#1094#1080#1081)
  end
  object Memo1: TMemo
    Left = 376
    Top = 88
    Width = 353
    Height = 377
    CharCase = ecUpperCase
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MEMO1')
    ParentFont = False
    TabOrder = 6
  end
  object Memo2: TMemo
    Left = 752
    Top = 88
    Width = 341
    Height = 377
    CharCase = ecUpperCase
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MEMO2')
    ParentFont = False
    TabOrder = 7
  end
  object Open: TButton
    Left = 72
    Top = 8
    Width = 105
    Height = 33
    Caption = 'Open'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = OpenClick
  end
  object OpenDialog1: TOpenDialog
  end
end
