unit AuthorsBooksSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    BooksTable: TStringGrid;
    Label1: TLabel;
    AuthSurname: TEdit;
    SearchBooks: TButton;
    procedure Search(param: string);
    procedure SearchBooksClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses AuthBooksTable, AuthorsTable, BooksTable, BookWordSearch, DBManager, StrUtils,
  LPmain;

procedure TForm6.Search(param: string);
var
  BookInfSubstrings: TArray<string>;
  BookFilteredData: wArray;
  author: string;
  i, j: integer;
begin
   for i := 0 to Pred(BooksTable.ColCount) do
    for j := 0 to Pred(BooksTable.RowCount) do
      BooksTable.Cells[i, j] := '';

  i := 1;
  j := 1;

  BookFilteredData:= GetAuthorBooksFromDb(param);
  while BookFilteredData[i] <> '' do
  begin
      BookInfSubstrings := SplitString(BookFilteredData[i], ';');
      with BooksTable do
        begin
              BooksTable.Cells[0, j] := BookInfSubstrings[0];
              BooksTable.Cells[1, j] := BookInfSubstrings[1];
              BooksTable.Cells[2, j] := BookInfSubstrings[2];
              RowCount := RowCount +1;
              Inc(j);
        end;
      Inc(i);
  end;

   with BooksTable do
  begin
    Cells[0, 0] := '��������';
    Cells[1, 0] := '����';
    Cells[2, 0] := '��� �������';
    ColWidths [0] := 200;
    ColWidths [1] := 100;
    ColWidths [2] := 100;
  end;
end;


procedure TForm6.SearchBooksClick(Sender: TObject);
begin
  Search(AuthSurname.Text);
end;

end.
