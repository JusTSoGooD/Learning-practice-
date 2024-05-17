unit BooksTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    BooksTable: TStringGrid;
    BookName: TEdit;
    Language: TEdit;
    DateOfPubl: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    AddBook: TButton;
    Update: TButton;
    DeleteElement: TButton;
    procedure AddBookClick(Sender: TObject);
    procedure Refresh(param: string);
    procedure FormCreate(Sender: TObject);
    procedure UpdateClick(Sender: TObject);
    procedure DeleteElementClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses AuthBooksTable, AuthorsTable, DBManager, LPmain, StrUtils;

procedure TForm3.DeleteElementClick(Sender: TObject);
var
  SelectedRow: integer;
  Confirm: Integer;
begin
  SelectedRow := BooksTable.Row;
  Confirm := MessageDlg('Подтвердите удаление (' + BooksTable.Cells[0, SelectedRow] + ')',
  mtConfirmation, mbYesNo, 0);
  if Confirm = mrYes then
  begin
     DeleteInfoFromDB('b', BooksTable.Cells[0, SelectedRow]);
     ShowMessage('Элемент удален');
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Refresh('');
end;


procedure TForm3.Refresh(param: string);
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
      if param = '' then
      begin
      with BooksTable do
        begin
          BooksTable.Cells[0, i] := BookInfSubstrings[0];
          BooksTable.Cells[1, i] := BookInfSubstrings[1];
          BooksTable.Cells[2, i] := BookInfSubstrings[2];
          RowCount := RowCount +1;
        end;
      end
      else if Pos(param, BookData[i]) > 0 then
      begin
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
      end;
      Inc(i);
  end;

   with BooksTable do
  begin
    FixedCols := 1;
    Cells[0, 0] := 'Название';
    Cells[1, 0] := 'Язык';
    Cells[2, 0] := 'Год издания';
    ColWidths [0] := 100;
    ColWidths [1] := 200;
    ColWidths [2] := 150;
  end;
end;


procedure TForm3.UpdateClick(Sender: TObject);
begin
  Refresh('');
end;

procedure TForm3.AddBookClick(Sender: TObject);
var bName, blang: string;
begin
  if (BookName.Text <> '') and (Language.Text <> '') and (DateOfPubl.Text <> '') then
  begin
    bName := BookName.Text;
    blang :=  Language.Text;
    WriteBookToFile(bName, blang	, DateOfPubl.Text);
    ShowMessage('Успешно добавлена книга');
  end
  else
  begin
    ShowMessage('Проверьте правильность введенных данных');
  end;

end;

end.
