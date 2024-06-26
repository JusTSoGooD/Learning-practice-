unit AuthBooksTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    AuthBooksTable: TStringGrid;
    AuthId: TEdit;
    BookName: TEdit;
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
  Form4: TForm4;

implementation

{$R *.dfm}

uses AuthorsTable, BooksTable, DBManager, LPmain, StrUtils;

procedure TForm4.DeleteElementClick(Sender: TObject);
var
  SelectedRow: integer;
  Confirm: Integer;
begin
  SelectedRow := AuthBooksTable.Row;
  Confirm := MessageDlg('����������� �������� (' + AuthBooksTable.Cells[0, SelectedRow] + '  ' +
  AuthBooksTable.Cells[1, SelectedRow] + ')',
  mtConfirmation, mbYesNo, 0);
  ShowMessage(AuthBooksTable.Cells[0, SelectedRow]);
  if Confirm = mrYes then
  begin
     DeleteInfoFromDB('�', AuthBooksTable.Cells[0, SelectedRow]);
     ShowMessage('������� ������');
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Refresh('');
end;

procedure TForm4.Refresh(param: string);
var
  AuthBookInfSubstrings: TArray<string>;
  AuthBookData: wArray;
  i, j: integer;
begin
   for i := 0 to Pred(AuthBooksTable.ColCount) do
    for j := 0 to Pred(AuthBooksTable.RowCount) do
      AuthBooksTable.Cells[i, j] := '';
  AuthBookData := DbManager.GetInfoFromDB('c');
  i := 1;
  j := 1;
  while AuthBookData[i] <> '' do
  begin
      AuthBookInfSubstrings := SplitString(AuthBookData[i], ';');;
      if param = '' then
      begin
      with AuthBooksTable do
        begin
          AuthBooksTable.Cells[0, i] := AuthBookInfSubstrings[0];
          AuthBooksTable.Cells[1, i] := AuthBookInfSubstrings[1];
          RowCount := RowCount +1;
        end;
      end
      else if Pos(param, AuthBookData[i]) > 0 then
      begin
        begin
          with AuthBooksTable do
          begin
            AuthBooksTable.Cells[0, j] := AuthBookInfSubstrings[0];
            AuthBooksTable.Cells[1, j] := AuthBookInfSubstrings[1];
            RowCount := RowCount +1;
            Inc(j);
          end;
        end;
      end;
      Inc(i);
  end;

   with AuthBooksTable do
  begin
    FixedCols := 1;
    Cells[0, 0] := '��� ������';
    Cells[1, 0] := '�������� �����';
    ColWidths [0] := 100;
    ColWidths [1] := 200;
  end;
end;


procedure TForm4.UpdateClick(Sender: TObject);
begin
  Refresh('');
end;

procedure TForm4.AddAuthorClick(Sender: TObject);
var bName: string;
begin
  if (AuthId.Text <> '') and (BookName.Text <> '') then
  begin
    bName :=  BookName.Text;
    WriteAuthBookToFile(StrToInt(AuthId.Text), bName);
    ShowMessage('������� �������� ����� � ��� ������');
  end
  else
  begin
    ShowMessage('��������� ������������ ��������� ������');
  end;
end;

end.
