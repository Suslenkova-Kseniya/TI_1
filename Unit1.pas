unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Open: TButton;
    input: TMemo;
    Key1: TLabel;
    encode: TButton;
    Edit1: TEdit;
    decode: TButton;
    method: TComboBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure OpenClick(Sender: TObject);
    procedure encodeClick(Sender: TObject);
    procedure encode1;
    procedure encode2;
    procedure encode3;
    procedure Edit1Click(Sender: TObject);
    procedure decodeClick(Sender: TObject);
    procedure decode1;
    procedure decode2;
    procedure decode3;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  alphabet: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  alphabetru: string = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
  textf: text;

implementation

{$R *.dfm}

procedure TForm1.Edit1Click(Sender: TObject);
begin
  Edit1.text := '';
end;

procedure TForm1.encodeClick(Sender: TObject);
begin
  case method.ItemIndex of
    0:
      encode1;
    1:
      encode2;
    2:
      encode3;
  end;
end;

procedure TForm1.encode1;
var
  i, j, k, highm, m: integer;
  KEng, ke, line, linef: string;
  mas: array [1 .. 50] of array [1 .. 50] of char;
begin
  KEng := Edit1.text;
  i := 1;
  ke := '';
  while (i <= length(KEng)) do // проверка правильности ключа
  begin
    if pos(KEng[i], alphabet) <> 0 then
    begin
      ke := ke + KEng[i];
    end;
    inc(i);
  end;
  KEng := ke;
  Edit1.text := ke;
  if KEng <> '' then
  begin
    line := input.Lines.text;
    { assignfile(textf, OpenDialog1.FileName);
      reset(textf);
      linef := '';
      while not eof(textf) do
      begin
      readln(textf, line);
      linef := linef + line;
      end;
      closefile(textf);
      line := linef;
      line := UpperCase(line); }
    i := 1;
    j := 1;
    for k := 1 to length(line) do
    begin
      if pos(line[k], alphabet) <> 0 then
      begin
        if (j = length(KEng) + 1) then
        begin
          inc(i);
          j := 1;
        end;
        mas[i][j] := line[k];
        inc(j);
      end;
    end;
    while j <= length(KEng) do
    begin
      mas[i][j] := #0;
      inc(j);
    end;
    highm := i;
    line := '';
    for i := 1 to 26 do
    begin
      for j := 1 to length(KEng) do
      begin
        if alphabet[i] = KEng[j] then
        begin
          for m := 1 to highm do
            if mas[m][j] <> #0 then
              line := line + mas[m][j];
        end;
      end;
    end;
    Memo1.Lines.text := line;
    assignfile(textf,
      'D:\Учеба\4sem\ТИ_2022\Задание №1_простейшие_шифры\files\stolbc.txt');
    rewrite(textf);
    writeln(textf, line);
    closefile(textf);
  end
  else
    Edit1.text := 'Неправильный ввод';;
end;

procedure TForm1.encode2;
var
  KRu, final, letter, ru, letf: string;
  symbol: char;
  i, j, k, pog, syc, n: integer;
begin
  KRu := Edit1.text;
  i := 1;
  ru := '';
  while (i <= length(KRu)) do // проверка правильности ключа
  begin
    if pos(KRu[i], alphabetru) <> 0 then
      ru := ru + KRu[i];
    inc(i);
  end;
  KRu := ru;
  Edit1.text := ru;
  if KRu <> '' then
  begin
    { assignfile(textf, OpenDialog2.FileName);
      reset(textf);
      letf := '';
      while not eof(textf) do
      begin
      readln(textf, letter);
      letf := letf + letter;
      end;
      closefile(textf);
      letter := letf; }
    k := 1;
    pog := 0;
    final := '';
    letter := input.Lines.text;
    for n := 1 to length(letter) do
    begin
      if pos(letter[n], alphabetru) <> 0 then
      begin
        i := pos(letter[n], alphabetru) - 1;
        j := pos(KRu[k], alphabetru) - 1 + pog;

        symbol := alphabetru[((i + j + 1) mod 33)];
        if symbol = #0 then
          symbol := 'Я';

        if k = length(KRu) then
        begin
          inc(pog);
          k := 0;
        end;
        inc(k);
        final := final + symbol;
      end
      else
        final := final + letter[n];
    end;
    Memo1.Lines.text := final;
    assignfile(textf,
      'D:\Учеба\4sem\ТИ_2022\Задание №1_простейшие_шифры\files\vision.txt');
    rewrite(textf);
    writeln(textf, final);
    closefile(textf);
  end
  else
    Edit1.text := 'Неправильный ввод';;

end;

procedure TForm1.encode3;
var
  i, j, k, l, b: integer;
  sentence, fin, eng, en, senf: string;
  inp: boolean;
begin
  eng := Edit1.text;
  i := 1;
  en := '';
  while (i <= length(eng)) do
  begin
    if pos(eng[i], '0123456789') <> 0 then // проверка правильности ключа
    begin
      en := en + eng[i];
    end;
    inc(i);
  end;
  eng := en;
  Edit1.text := en;
  if eng <> '' then
  begin
  sentence := input.Lines.text;
    k := strtoint(eng);
    b := 26;
    while k <> b do // проверка, что взаимнопростые
    begin
      if k > b then
        k := k - b
      else
        b := b - k;
    end;
    if k = 1 then
      inp := true
    else
    begin
      inp := false;
      Edit1.text := 'Неправильный ввод';
    end;

    if inp then
    begin
      k := strtoint(eng);
      fin := '';
      { assignfile(textf, OpenDialog3.FileName);
        reset(textf);
        senf := '';
        while not eof(textf) do
        begin
        readln(textf, sentence);
        senf := senf + sentence;
        end;
        closefile(textf); }
      sentence := input.Lines.text;
      for j := 1 to length(sentence) do
      begin
        if sentence[j] in ['A' .. 'Z'] then
        begin
          for l := 1 to length(alphabet) do
          begin
            if sentence[j] = alphabet[l] then
              i := l - 1;
          end;
          fin := fin + alphabet[((i * k) mod 26) + 1];
        end
        else
          fin := fin + sentence[j];
      end;
      Memo1.Lines.text := fin;
      assignfile(textf,
        'D:\Учеба\4sem\ТИ_2022\Задание №1_простейшие_шифры\files\decim.txt');
      rewrite(textf);
      writeln(textf, fin);
      closefile(textf);
    end;
  end
  else
    Edit1.text := 'Неправильный ввод';

end;

procedure TForm1.OpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    input.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;


procedure TForm1.decodeClick(Sender: TObject);
begin
  case method.ItemIndex of
    0:
      decode1;
    1:
      decode2;
    2:
      decode3;
  end;
end;

procedure TForm1.decode1;
var
  i, j, k, highm, m, sh: integer;
  KEng, line, ke: string;
  mas1: array [1 .. 50] of array [1 .. 50] of char;
  inp: boolean;
begin
  KEng := Edit1.text;
  i := 1;
  ke := '';
  while (i <= length(KEng)) do // проверка правильности ключа
  begin
    if pos(KEng[i], alphabet) <> 0 then
    begin
      ke := ke + KEng[i];
    end;
    inc(i);
  end;
  KEng := ke;
  Edit1.text := ke;
  if KEng <> '' then
  begin
    line := Memo1.Lines.Text;
    sh := length(line) mod length(KEng);
    k := 1;
    for i := 1 to 26 do
    begin
      for j := 1 to length(KEng) do
      begin
        if alphabet[i] = KEng[j] then
        begin
          if sh = 0 then
            highm := length(line) div length(KEng)
          else if (sh < j) then
          begin
            highm := length(line) div length(KEng);
            mas1[highm + 1][j] := #0;
          end
          else
            highm := length(line) div length(KEng) + 1;
          for m := 1 to highm do
          begin
            mas1[m][j] := line[k];
            inc(k);
          end;
        end;
      end;
    end;
    highm := length(line) div length(KEng) + 1;
    line := '';
    k := 1;
    if sh = 0 then
      highm := highm - 1;
    for i := 1 to highm do
    begin
      for j := 1 to length(KEng) do
      begin
        if mas1[i][j] <> #0 then
        begin
          line := line + mas1[i][j];
        end;
      end;
    end;
    memo2.Lines.Text := line;
    assignfile(textf, 'D:\Учеба\4sem\ТИ_2022\Задание №1_простейшие_шифры\files\stolbc_dec.txt');
    rewrite(textf);
    writeln(textf, line);
    closefile(textf);
  end
  else
    Edit1.text := 'Неправильный ввод';;
end;

procedure TForm1.decode2;
var
  KRu, final, letter, ru: string;
  symbol: char;
  i, j, k, pog, syc, n: integer;
begin
  KRu := Edit1.text;
  i := 1;
  ru := '';
  while (i <= length(KRu)) do // проверка правильности ключа
  begin
    if pos(KRu[i], alphabetru) <> 0 then
      ru := ru + KRu[i];
    inc(i);

  end;
  KRu := ru;
  Edit1.text := ru;
  if KRu <> '' then
  begin
    k := 1;
    pog := 0;
    final := '';
    letter := memo1.Lines.Text;
    for n := 1 to length(letter) do
    begin
      if pos(letter[n], alphabetru) <> 0 then
      begin
        i := pos(letter[n], alphabetru) - 1;
        j := pos(KRu[k], alphabetru) - 1 + pog;
        symbol := alphabetru[((i + 33 - j + 1) mod 33)];
        if symbol = #0 then
          symbol := 'Я';
        if k = length(KRu) then
        begin
          inc(pog);
          k := 0;
        end;
        inc(k);
        final := final + symbol;
      end
      else
        final := final + letter[n];
    end;
    memo2.Lines.Text := final;
    assignfile(textf, 'D:\Учеба\4sem\ТИ_2022\Задание №1_простейшие_шифры\files\vision_dec.txt');
    rewrite(textf);
    writeln(textf, final);
    closefile(textf);
  end
  else
    Edit1.text := 'Неправильный ввод';;

end;

procedure TForm1.decode3;
var
  i, j, k, l, b: integer;
  sentence, fin, eng, en: string;
  inp: boolean;
begin
sentence := input.Lines.text;
  eng := Edit1.text;
  i := 1;
  en := '';
  while (i <= length(eng)) do
  begin
    if pos(eng[i], '0123456789') <> 0 then // проверка правильности ключа
    begin
      en := en + eng[i];
    end;
    inc(i);
  end;
  eng := en;
  Edit1.text := en;
  if eng <> '' then
  begin
    k := strtoint(eng);
    b := 26;
    while k <> b do // проверка, что взаимнопростые
    begin
      if k > b then
        k := k - b
      else
        b := b - k;
    end;
    if k = 1 then
      inp := true
    else
    begin
      inp := false;
      Edit1.text := 'Неправильный ввод';
    end;
    if inp then
    begin
      k := strtoint(eng);
      fin := '';
      sentence := memo1.Lines.Text;
      for j := 1 to length(sentence) do
      begin
        if sentence[j] in ['A' .. 'Z'] then
        begin
          for l := 1 to length(alphabet) do
          begin
            if sentence[j] = alphabet[l] then
              i := l - 1; // number of symbol
          end;
          k := strtoint(eng);
          b := 0;
          while (b <= 25) do
          begin
            if (k * b) mod 26 = 1 then
            begin
              k := b;
              b := 26;
            end;
            inc(b);
          end;
          fin := fin + alphabet[((i * k) mod 26) + 1];
        end
        else
          fin := fin + sentence[j];
      end;
    end;
    memo2.Lines.Text := fin;
    assignfile(textf, 'D:\Учеба\4sem\ТИ_2022\Задание №1_простейшие_шифры\files\decim_dec.txt');
    rewrite(textf);
    writeln(textf, fin);
    closefile(textf);
  end
  else
    Edit1.text := 'Неправильный ввод';
end;

end.
