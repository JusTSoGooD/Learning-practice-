unit BookWordSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    BooksTable: TStringGrid;
    KeyWord: TEdit;
    Label1: TLabel;
    SearchBooks: TButton;
    procedure Search(param: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses AuthBooksTable, AuthorsTable, BooksTable, DBManager, LPmain, StrUtils;

procedure TForm5.Search(param: string);
var
  BookInfSubstrings: TArray<string>;
  BookData: wArray;
  i, j: integer;
begin
   for i := 0 to Pred(BooksTable.ColCount) do
    for j := 0 to Pred(BooksTable.RowCount) do
      BooksTable.Cells[i, j] := '';
  BookData := DbManager.GetInfoFromDB('b');
  i := 1;
  j := 1;
  while BookData[i] <> '' do
  begin
      BookInfSubstrings := SplitString(BookData[i], ';');;
      if Pos(param, BookData[i]) > 0 then
      begin

        with BooksTable do
          begin
              BooksTable.Cells[0, j] := BookInfSubstrings[0];
              BooksTable.Cells[1, j] := BookInfSubstrings[1];
              BooksTable.Cells[2, j] := BookInfSubstrings[2];
              RowCount := RowCount +1;
              Inc(j);
          end;
      end;
      Inc(i);
  end;

   with BooksTable do
  begin
    FixedCols := 1;
    Cells[0, 0] := 'Название';
    Cells[1, 0] := 'Язык';
    Cells[2, 0] := 'Год издания';
    Cells[3, 0] := 'Автор';
    ColWidths [0] := 100;
    ColWidths [1] := 200;
    ColWidths [2] := 150;
    ColWidths [2] := 100;
  end;
end;


{$R *.dfm}

end.
