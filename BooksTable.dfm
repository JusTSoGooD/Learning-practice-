object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1085#1080#1075
  ClientHeight = 382
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 307
    Width = 87
    Height = 15
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
  end
  object Label2: TLabel
    Left = 184
    Top = 307
    Width = 74
    Height = 15
    Caption = #1071#1079#1099#1082' '#1080#1079#1076#1072#1085#1080#1103
  end
  object Label3: TLabel
    Left = 343
    Top = 307
    Width = 66
    Height = 15
    Caption = #1043#1086#1076' '#1080#1079#1076#1072#1085#1080#1103
  end
  object BooksTable: TStringGrid
    Left = 32
    Top = 8
    Width = 457
    Height = 153
    ColCount = 3
    TabOrder = 0
  end
  object BookName: TEdit
    Left = 8
    Top = 328
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object Language: TEdit
    Left = 160
    Top = 328
    Width = 121
    Height = 23
    ImeName = 'Language'
    TabOrder = 2
  end
  object DateOfPubl: TEdit
    Left = 312
    Top = 328
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object AddBook: TButton
    Left = 448
    Top = 315
    Width = 92
    Height = 50
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1085#1080#1075#1091
    TabOrder = 4
    OnClick = AddBookClick
  end
  object Update: TButton
    Left = 288
    Top = 177
    Width = 108
    Height = 54
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 5
    OnClick = UpdateClick
  end
  object DeleteElement: TButton
    Left = 33
    Top = 183
    Width = 225
    Height = 42
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
    TabOrder = 6
    OnClick = DeleteElementClick
  end
end
