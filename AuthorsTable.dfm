object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1080#1089#1072#1090#1077#1083#1077#1081
  ClientHeight = 442
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 72
    Top = 376
    Width = 104
    Height = 15
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1087#1080#1089#1072#1090#1077#1083#1103
  end
  object Label2: TLabel
    Left = 243
    Top = 376
    Width = 71
    Height = 15
    Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
  end
  object AuthorsTable: TStringGrid
    Left = 48
    Top = 8
    Width = 553
    Height = 249
    ColCount = 3
    TabOrder = 0
  end
  object AuthSurname: TEdit
    Left = 72
    Top = 397
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object AuthCitizenship: TEdit
    Left = 216
    Top = 397
    Width = 121
    Height = 23
    ImeName = 'Language'
    TabOrder = 2
  end
  object AddAuthor: TButton
    Left = 355
    Top = 384
    Width = 105
    Height = 50
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1074#1090#1086#1088#1072
    TabOrder = 3
    OnClick = AddAuthorClick
  end
  object Update: TButton
    Left = 352
    Top = 271
    Width = 108
    Height = 54
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 4
    OnClick = UpdateClick
  end
  object DeleteElement: TButton
    Left = 89
    Top = 277
    Width = 225
    Height = 42
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
    TabOrder = 5
    OnClick = DeleteElementClick
  end
end
