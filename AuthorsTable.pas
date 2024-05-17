unit AuthorsTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    AuthorsTable: TStringGrid;
    AuthSurname: TEdit;
    AuthCitizenship: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    AddAuthor: TButton;
    Update: TButton;
    DeleteElement: TButton;
    procedure AddAuthorClick(Sender: TObject);
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
  Form2: TForm2;

implementation

{$R *.dfm}

uses AuthBooksTable, BooksTable, DBManager, LPmain, StrUtils;

procedure TForm2.DeleteElementClick(Sender: TObject);
var
  SelectedRow: integer;
  Confirm: Integer;
begin
  SelectedRow := AuthorsTable.Row;
  Confirm := MessageDlg('Подтвердите удаление (' + AuthorsTable.Cells[1, SelectedRow] + ')',
  mtConfirmation, mbYesNo, 0);
  if Confirm = mrYes then
  begin
     DeleteInfoFromDB('a', AuthorsTable.Cells[0, SelectedRow]);
     ShowMessage('Элемент удален');
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Refresh('');
end;

procedure TForm2.Refresh(param: string);
var
  AuthInfSubstrings: TArray<string>;
  AuthData: wArray;
  i, j: integer;
begin
   for i := 0 to Pred(AuthorsTable.ColCount) do
    for j := 0 to Pred(AuthorsTable.RowCount) do
      AuthorsTable.Cells[i, j] := '';
  AuthData := DbManager.GetInfoFromDB('a');
  i := 1;
  j := 1;
  while AuthData[i] <> '' do
  begin
      AuthInfSubstrings := SplitString(AuthData[i], ';');;
      if param = '' then
      begin
      with AuthorsTable do
        begin
          AuthorsTable.Cells[0, i] := AuthInfSubstrings[0];
          AuthorsTable.Cells[1, i] := AuthInfSubstrings[1];
          AuthorsTable.Cells[2, i] := AuthInfSubstrings[2];
          RowCount := RowCount +1;
        end;
      end
      else if Pos(param, AuthData[i]) > 0 then
      begin
        begin
          with AuthorsTable do
          begin
            AuthorsTable.Cells[0, j] := AuthInfSubstrings[0];
            AuthorsTable.Cells[1, j] := AuthInfSubstrings[1];
            AuthorsTable.Cells[2, j] := AuthInfSubstrings[2];
            RowCount := RowCount +1;
            Inc(j);
          end;
        end;
      end;
      Inc(i);
  end;

   with AuthorsTable do
  begin
    FixedCols := 1;
    Cells[0, 0] := 'Код автора';
    Cells[1, 0] := 'Фамилия';
    Cells[2, 0] := 'Гражданство';
    ColWidths [0] := 100;
    ColWidths [1] := 200;
    ColWidths [2] := 150;
  end;


end;


procedure TForm2.UpdateClick(Sender: TObject);
begin
   Refresh('');
end;

procedure TForm2.AddAuthorClick(Sender: TObject);
var asurn, acit: string;
    Id: integer;
begin
  if (AuthSurname.Text <> '') and (AuthCitizenship.Text <> '') then
  begin
    randomize;
    Id := random(10000);
    asurn := AuthSurname.Text;
    acit :=  AuthCitizenship.Text;
    WriteAuthToFile(Id, asurn	, acit);
    ShowMessage('Успешно добавлен автор');
  end
  else
  begin
    ShowMessage('Проверьте правильность введенных данных');
  end;
end;

end.
