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
function FindBooksByKey(keyWord: string):wArray;
function  GetAuthorCodeByBook(bookName: string):string;
function GetAuthorBooksFromDb(authorSurname: string):warray;

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


function FindBooksByKey(keyWord: string):wArray;
var
  StreamReader: TStreamReader;
  Line, FilePath, BooksInfo: string;
  info: wArray;
  i: integer;
begin
  StreamReader := TStreamReader.Create(BooksPath, TEncoding.UTF8);
  i:=1;
  keyWord := AnsiLowerCase(keyWord);
  while not StreamReader.EndOfStream do
  begin
    Line := StreamReader.ReadLine;
    if Pos(keyWord, AnsiLowerCase(Line)) > 0  then
    begin
      info[i] := Line;
      Inc(i);
    end;
  end;

  result:=info;
end;

function  GetAuthorCodeByBook(bookName: string):string;
var
  StreamReader: TStreamReader;
  Line: string;
  AuthBookInf: TArray<string>;
begin
  StreamReader := TStreamReader.Create(AuthBooksPath, TEncoding.UTF8);
  while not StreamReader.EndOfStream do
  begin
    Line := StreamReader.ReadLine;
    AuthBookInf := SplitString(Line, ';');
    if Pos(AnsiLowerCase(bookName), AnsiLowerCase(Line)) > 0  then
    begin
      AuthBookInf := SplitString(Line, ';');
      result := AuthBookInf[0];
      break;
    end;
  end;
end;

function GetAuthorBooksFromDb(authorSurname: string):warray;
var
  AuthorsBooksInf, authBooks, surname: warray;
  authBooksSubstrings: TArray<string>;
  i, j: integer;
begin
  AuthorsBooksInf := GetInfoFromDB('c');
  i:=1;
  j:=1;
  while AuthorsBooksInf[i] <> '' do
  begin
    authBooksSubstrings := SplitString(AuthorsBooksInf[i], ';');
    if AnsiLowerCase(FindAuthorsSurname(authBooksSubstrings[0])) = AnsiLowerCase(authorSurname) then
    begin
      authBooks[j] := FindBooksByKey(authBooksSubstrings[1])[1];
      Inc(j);
    end;

    Inc(i);

  end;

  result:= authBooks;
end;

end.