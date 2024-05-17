unit LPmain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses AuthBooksTable, AuthorsTable, BooksTable, DBManager, BookWordSearch;

procedure TForm1.N6Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Form5.Show;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  Form4.Show;
end;

end.
