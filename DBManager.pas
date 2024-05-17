unit DBManager;

interface
uses SysUtils, System.Classes;
type wArray = array[1..1000] of string;
procedure WriteBookToFile(BookName: string; BookLang: string; BookPubDate: string);
procedure WriteAuthToFile(AuthId: integer; AuthSurname: string; AuthCountry: string);
procedure WriteAuthBookToFile(AuthId: integer; BookName: string);
procedure DeleteInfoFromDB(p: char; Id: string);
function GetInfoFromDB(p: char):wArray;
function FindAuthorsSurname(id: string):string;

implementation

uses AuthBooksTable, AuthorsTable, BooksTable, LPmain, IOUtils, StrUtils;

const BooksPath = 'books.txt';
const AuthPath = 'auth.txt';
const AuthBooksPath = 'authbooks.txt';

procedure WriteBookToFile(BookName: string; BookLang: string; BookPubDate: string);
var
  StreamWriter: TStreamWriter;
begin
   StreamWriter := TStreamWriter.Create(BooksPath, True, TEncoding.UTF8);
   StreamWriter.WriteLine(BookName + ';' + BookLang + ';' + BookPubDate);
   StreamWriter.Free;
end;

procedure WriteAuthToFile(AuthId: integer; AuthSurname: string; AuthCountry: string);
var
  StreamWriter: TStreamWriter;
begin
   StreamWriter := TStreamWriter.Create(AuthPath, True, TEncoding.UTF8);
   StreamWriter.WriteLine(IntToStr(AuthId) + ';' + AuthSurname + ';' + AuthCountry);
   StreamWriter.Free;
end;



procedure WriteAuthBookToFile(AuthId: integer; BookName: string);
var
  StreamWriter: TStreamWriter;
begin
   StreamWriter := TStreamWriter.Create(AuthBooksPath, True, TEncoding.UTF8);
   StreamWriter.WriteLine(IntToStr(AuthId) + ';' + BookName);
   StreamWriter.Free;
end;

function GetInfoFromDB(p: char):wArray;
var
  i: integer;
  info: wArray;
  Line: string;
  StreamReader: TStreamReader;
  FilePath: string;
begin
  case p of
    'a': FilePath := AuthPath;
    'b': FilePath := BooksPath;
    'c': FilePath := AuthBooksPath;
    else Writeln('');
  end;

  StreamReader := TStreamReader.Create(FilePath, TEncoding.UTF8);
  i:= 1;
  while not StreamReader.EndOfStream do
  begin
    info[i] := StreamReader.ReadLine;
    Inc(i);
  end;

  StreamReader.Free;
  result := info;
end;

procedure DeleteInfoFromDB(p: char; Id: string);
var
  Line: string;
  StreamReader: TStreamReader;
  FilePath: string;
  StreamWriter: TStreamWriter;
begin
  case p of
    'a': FilePath := AuthPath;
    'b': FilePath := BooksPath;
    'c': FilePath := AuthBooksPath;
    else Writeln('');
  end;

  StreamReader := TStreamReader.Create(FilePath, TEncoding.UTF8);
  StreamWriter := TStreamWriter.Create('temp.txt', True, TEncoding.UTF8);
  while not StreamReader.EndOfStream do
  begin
    Line := StreamReader.ReadLine;
    if (Pos(Id, Line)) <= 0 then
      StreamWriter.WriteLine(Line);
  end;

  StreamReader.Free;
  StreamWriter.Free;
  TFile.Delete(FilePath);
  TFile.Move('temp.txt', FilePath);
end;

function FindAuthorsSurname(id: string):string;
var
  StreamReader: TStreamReader;
  AuthInfSubstrings: TArray<string>;
  Line: string;
begin
  StreamReader := TStreamReader.Create(AuthPath, TEncoding.UTF8);
  while not StreamReader.EndOfStream do
  begin
    Line := StreamReader.ReadLine;
    if Pos(id, Line) > 0  then
    begin
      AuthInfSubstrings := SplitString(Line, ';');
      result := AuthInfSubstrings[1];
    end;

  end;

end;

end.