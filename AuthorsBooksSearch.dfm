object Form6: TForm6
  Left = 0
  Top = 0
  Caption = #1055#1086#1080#1089#1082' '#1082#1085#1080#1075' '#1087#1086' '#1072#1074#1090#1086#1088#1091
  ClientHeight = 322
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 136
    Top = 203
    Width = 91
    Height = 15
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1072#1074#1090#1086#1088#1072
  end
  object BooksTable: TStringGrid
    Left = 32
    Top = 8
    Width = 521
    Height = 153
    ColCount = 3
    FixedCols = 0
    TabOrder = 0
  end
  object AuthSurname: TEdit
    Left = 120
    Top = 224
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object SearchBooks: TButton
    Left = 273
    Top = 211
    Width = 92
    Height = 50
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 2
    OnClick = SearchBooksClick
  end
end
