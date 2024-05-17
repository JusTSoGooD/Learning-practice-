object Form5: TForm5
  Left = 0
  Top = 0
  Caption = #1055#1086#1080#1089#1082' '#1082#1085#1080#1075#1080' '#1087#1086' '#1082#1083#1102#1095#1077#1074#1086#1084#1091' '#1089#1083#1086#1074#1091
  ClientHeight = 303
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 152
    Top = 203
    Width = 92
    Height = 15
    Caption = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
  end
  object BooksTable: TStringGrid
    Left = 24
    Top = 24
    Width = 561
    Height = 153
    ColCount = 4
    TabOrder = 0
  end
  object KeyWord: TEdit
    Left = 136
    Top = 224
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object SearchBooks: TButton
    Left = 305
    Top = 211
    Width = 92
    Height = 50
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 2
    OnClick = SearchBooksClick
  end
end
