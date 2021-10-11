unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ComboBox1: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

uses pfffunit;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
   form2.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   form2.Caption:='Alimentation';
  
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
   Combobox1.SetFocus;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
   Reponsede2:=1;form2.Close;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
   Reponsede2:=2;form2.Close;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
  Reponsede2:=3;form2.Close;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
   Reponsede2:=4;form2.Close;
end;

procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key=13 then begin Reponsede2:=1;form2.Close; end;
end;

end.
