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
    procedure SearchBooksClick(Sender: TObject);
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
  BookFilteredData: wArray;
  author: string;
  i, j: integer;
begin
   for i := 0 to Pred(BooksTable.ColCount) do
    for j := 0 to Pred(BooksTable.RowCount) do
      BooksTable.Cells[i, j] := '';
  BookFilteredData := DbManager.FindBooksByKey(param);
  i := 1;
  j := 1;
  while BookFilteredData[i] <> '' do
  begin
      BookInfSubstrings := SplitString(BookFilteredData[i], ';');
      author:= FindAuthorsSurname(GetAuthorCodeByBook(BookInfSubstrings[0]));
      with BooksTable do
        begin
              BooksTable.Cells[0, j] := BookInfSubstrings[0];
              BooksTable.Cells[1, j] := BookInfSubstrings[1];
              BooksTable.Cells[2, j] := BookInfSubstrings[2];
              BooksTable.Cells[3, j] := author;
              RowCount := RowCount +1;
              Inc(j);
        end;
      Inc(i);
  end;

   with BooksTable do
  begin
    Cells[0, 0] := 'Название';
    Cells[1, 0] := 'Язык';
    Cells[2, 0] := 'Год издания';
    Cells[3, 0] := 'Автор';
    ColWidths [0] := 200;
    ColWidths [1] := 100;
    ColWidths [2] := 100;
    ColWidths [3] := 150;
  end;
end;


{$R *.dfm}

procedure TForm5.SearchBooksClick(Sender: TObject);
begin
  Search(KeyWord.Text);
end;

end.
