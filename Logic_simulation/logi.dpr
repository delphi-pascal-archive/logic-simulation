program logi;

uses
  Forms,
  pfffunit in 'pfffunit.pas' {Form1},
  pfffgen in 'pfffgen.pas',
  Unit1 in 'Unit1.pas' {AboutBox},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Logi';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
