program Project1;

uses
  Vcl.Forms,
  LPmain in 'LPmain.pas' {Form1},
  AuthorsTable in 'AuthorsTable.pas' {Form2},
  BooksTable in 'BooksTable.pas' {Form3},
  AuthBooksTable in 'AuthBooksTable.pas' {Form4},
  DBManager in 'DBManager.pas',
  BookWordSearch in 'BookWordSearch.pas' {Form5},
  AuthorsBooksSearch in 'AuthorsBooksSearch.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
