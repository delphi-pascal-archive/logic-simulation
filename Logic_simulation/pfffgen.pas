unit pfffgen;
interface
Uses Windows,graphics,SysUtils,Classes,dialogs;
type  Str4=String[4];
      Str8=String[8];
      Str12=String[12];
      Str20=String[20];
      Str80=String[80];

var Getmaxx,Getmaxy,epais,fin,couleurput:Smallint;
    Feuille:Tcanvas;
    nomdefichier:string;

type     str2=string[2];


Var sauve:boolean;
    var lecode:array[1..2] of array[0..13] of single;


Const deuxpi:Single=2*PI;
      PI_Single:Single=PI;

Procedure SetLinestyle(S:TpenStyle;Epaisseur:Smallint);
Procedure SetLinemode(m:Tpenmode);
procedure son;
function strg(a:single):string;
function strint(a:Smallint):string;
Procedure Putpixel(x,y:Smallint;col:TColor);
Procedure MoveTo(x,y:Smallint);
Procedure ClearDevice;
Procedure line(X1,Y1,X2,Y2:Smallint);
Procedure lineTo(X,Y:Smallint);
procedure Rectangle(X1, Y1, X2, Y2: Smallint);
Procedure linerel(XX,YY:Smallint);
Procedure Moverel(XX,YY:Smallint);
Function Getx:Smallint;
Function Gety:Smallint;
Procedure Ot(s:String);

Procedure SetColor(Coul:TColor);
function strg5(a:Single):string;
Function Max(a,b:Smallint):Smallint;
Function Min(a,b:Smallint):Smallint;
procedure PetitMenu(couleur:tcolor;s:String);
function ed(entete,demande:string;var ouiounon:boolean):string;
Procedure pause;
implementation
uses pfffunit;

Procedure SetLinestyle(S:TpenStyle;Epaisseur:Smallint);
Begin
  With Feuille.Pen do
  begin
    Style:=S;
    Width:=Epaisseur;
  end;
End;

Procedure SetLinemode(m:Tpenmode);
Begin
  With Feuille.Pen do
  begin
     mode:=m;
  end;
End;

procedure son;
Var  i:Byte;
Begin
  For i:=1 TO 20 DO Beep;
End;

function strg(a:single):string;
var s:string;
begin
  str(a:3:2,s);
  If a=0 then s:='0';
  If pos('.',s)<>0 then while s[length(s)]='0' do delete(s,length(s),1);
  if s[length(s)]='.' then delete(s,length(s),1);
  strg:=s;
end;

function strint(a:Smallint):string;
var s:string;
begin
  str(a,s);strint:=s;
end;

Procedure Putpixel(x,y:Smallint;Col:TColor);
Begin
 With Feuille do
      Begin
        pixels[x,y]:=col;
      End;
End;
Procedure MoveTo(x,y:Smallint);
Begin
 With Feuille do
      Begin
        MoveTo(x,y);
      End;
End;

{Procedure ClearDevice;
Var Arect:TRect;
    pour:smallint;
begin
 With Feuille do
   Begin
     setcolor(clwhite);
     for pour := 0 to getmaxy do line(0,pour,getmaxx,pour);
   End
end;}
Procedure ClearDevice;   
Var pour:smallint;
begin
   With Feuille do
   Begin
     setcolor(clwhite);
     for pour := 0 to form1.Image1.height do
     begin
        moveTo(0,pour);
        LineTo(form1.Image1.Width,pour);
     end;
  end;   
end;

Procedure line(X1,Y1,X2,Y2:Smallint);
Begin
  With Feuille do
  begin
    MoveTo(X1,Y1);LineTo(X2,Y2);
  end;
end;

Procedure lineTo(X,Y:Smallint);
Begin
  With Feuille do LineTo(X,Y);
end;

procedure Rectangle(X1, Y1, X2, Y2: Smallint);
begin
  With Feuille do
  begin
    line(x1,y1,x2,y1);
    line(x1,y1,x1,y2);
    line(x2,y2,x2,y1);
    line(x2,y2,x1,y2);
  end;
end;

Procedure linerel(XX,YY:Smallint);
Begin
  With Feuille do LineTo(PenPos.X+XX,PenPos.Y+YY);
End;

Procedure Moverel(XX,YY:Smallint);
Begin
  With Feuille do
  begin
    MoveTo(PenPos.X+XX,PenPos.Y+YY);
  end;
End;

Function Getx:Smallint;
begin
  With feuille do Getx:=PenPos.X;
End;

Function Gety:Smallint;
begin
  With feuille do Gety:=PenPos.Y;
End;

Procedure Ot(s:String);
Begin
  With Feuille do TextOut(Penpos.x,Penpos.y,s);
End;

Procedure SetColor(Coul:TColor);
Begin
  Feuille.Pen.Color:=Coul;
  Feuille.font.color:=Coul;
End;

function strg5(a:Single):string;
var s:string;
begin
  str(a:7:7,s);
  If a=0 then s:='0';
  If pos('.',s)<>0 then while s[length(s)]='0' do delete(s,length(s),1);
  if s[length(s)]='.' then delete(s,length(s),1);
  Strg5:=s;
end;


Function Max(a,b:Smallint):Smallint;
begin
  If a>b then Max:=a else Max:=b;
end;
Function Min(a,b:Smallint):Smallint;
begin
  If a<b then Min:=a else Min:=b;
end;
procedure PetitMenu(couleur:tcolor;s:String);
begin
  form1.panel1.font.color:=couleur;
  form1.panel1.caption:=s;
end;
function ed(entete,demande:string;var ouiounon:boolean):string;
begin
   ouiounon:=Inputquery('Pfff',entete,demande);ed:=demande;
end;
Procedure pause;
begin
  Sleep(1000);
end;

end.
