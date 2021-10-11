unit pfffunit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Clipbrd, Menus, StdCtrls, pfffgen, Buttons, printers, ExtDlgs,
  ShellAPI, Spin;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Composant1: TMenuItem;
    Texte1: TMenuItem;
    Commande1: TMenuItem;
    Anime1: TMenuItem;
    Nouveau1: TMenuItem;
    Ouvrir1: TMenuItem;
    Enregregistersous1: TMenuItem;
    Quitter1: TMenuItem;
    Pressepapier1: TMenuItem;
    Sauverlimage1: TMenuItem;
    Imprimer1: TMenuItem;
    Efface1: TMenuItem;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    Apropos1: TMenuItem;
    Noiretblanc1: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    Couleur1: TMenuItem;
    Image1: TImage;
    MsPaintBmp1: TMenuItem;
    ColorDialog1: TColorDialog;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    Label3: TLabel;
    SpinEdit3: TSpinEdit;
    Label4: TLabel;
    SpinEdit4: TSpinEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    SauverlimageEMF1: TMenuItem;
    SavePictureDialog2: TSavePictureDialog;
    Retour1: TMenuItem;
    Loupe1: TMenuItem;
    Loupe2: TMenuItem;
    Gauche1: TMenuItem;
    Droite1: TMenuItem;
    Dessus1: TMenuItem;
    Dessous1: TMenuItem;
    Memo1: TMemo;
    SauverlimageSVG1: TMenuItem;
    SaveDialog2: TSaveDialog;
    Dplacer1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure Composant1Click(Sender: TObject);
    procedure Texte1Click(Sender: TObject);
    procedure Efface(Sender: TObject);
    procedure Commande1Click(Sender: TObject);
    procedure Anime1Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure Ouvrir1Click(Sender: TObject);
    procedure Enregregistersous1Click(Sender: TObject);
    procedure Nouveau1Click(Sender: TObject);
    procedure Pressepapier1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Quitter1Click(Sender: TObject);
    procedure Imprimer1Click(Sender: TObject);
    procedure Apropos1Click(Sender: TObject);
    procedure Noiretblanc1Click(Sender: TObject);
    procedure Sauverlimage1Click(Sender: TObject);
    procedure Couleur1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure MsPaintBmp1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure SauverlimageEMF1Click(Sender: TObject);
    procedure Retour1Click(Sender: TObject);
    procedure Loupe1Click(Sender: TObject);
    procedure Loupe2Click(Sender: TObject);
    procedure Gauche1Click(Sender: TObject);
    procedure Droite1Click(Sender: TObject);
    procedure Dessus1Click(Sender: TObject);
    procedure Dessous1Click(Sender: TObject);
    procedure SauverlimageSVG1Click(Sender: TObject);
    procedure Dplacer1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  {Bitmap:TBitmap;}
  NomdeFichier:String;
  Gauche,Droite,modeprendre,zone,changespin:Boolean;
  x_s,y_s:smallint;
  reponsede2:byte;
  
  Var valeurducode:array[0..29] of array [0..4] of byte=
  ((0,0,1,1,1),(0,1,0,1,1),(0,1,1,0,1),(0,1,1,1,0),(1,0,0,1,1),(1,0,1,0,1),(1,0,1,1,0),(1,1,0,0,1),(1,1,0,1,0),
   (1,1,1,0,0),(0,0,0,1,1),(0,0,1,0,0),(0,0,1,0,1),(0,0,1,1,0),(0,0,1,1,1),(0,1,0,0,0),(0,1,0,0,1),(0,1,0,1,0),
   (0,1,0,1,1),(0,1,1,0,0),(0,0,1,1,0),(1,0,0,0,1),(0,1,0,0,1),(1,1,0,0,0),(0,0,1,0,1),(1,0,1,0,0),(0,1,1,0,0),
   (0,0,0,1,1),(1,0,0,1,0),(0,1,0,1,0));

var table: array[1..128*8] of byte=   {extait de la rom bios : générateur de caractères}
(0,0,0,0,0,0,0,0,126,129,165,129,189,153,129,126,126,255,219,255,195,231,255,126,108,254,254,254,124,56,16,0,
16,56,124,254,124,56,16,0,56,124,56,254,254,124,56,124,16,16,56,124,254,124,56,124,0,0,24,60,60,24,0,0,
255,255,231,195,195,231,255,255,0,60,102,66,66,102,60,0,255,195,153,189,189,153,195,255,15,7,15,125,204,204,204,120,
60,102,102,102,60,24,126,24,63,51,63,48,48,112,240,224,127,99,127,99,99,103,230,192,153,90,60,231,231,60,90,153,
128,224,248,254,248,224,128,0,2,14,62,254,62,14,2,0,24,60,126,24,24,126,60,24,102,102,102,102,102,0,102,0,
127,219,219,123,27,27,27,0,62,99,56,108,108,56,204,120,0,0,0,0,126,126,126,0,24,60,126,24,126,60,24,255,
24,60,126,24,24,24,24,0,24,24,24,24,126,60,24,0,0,24,12,254,12,24,0,0,0,48,96,254,96,48,0,0,0,0,192,192,192,254,0,0,
0,36,102,255,102,36,0,0,0,24,60,126,255,255,0,0,0,255,255,126,60,24,0,0,0,0,0,0,0,0,0,0,48,120,120,120,48,0,48,0,
108,108,108,0,0,0,0,0,108,108,254,108,254,108,108,0,48,124,192,120,12,248,48,0,0,198,204,24,48,102,198,0,
56,108,56,118,220,204,118,0,96,96,192,0,0,0,0,0,24,48,96,96,96,48,24,0,96,48,24,24,24,48,96,0,0,102,60,255,60,102,0,0,
0,48,48,252,48,48,0,0,0,0,0,0,0,48,48,96,0,0,0,252,0,0,0,0,0,0,0,0,0,48,48,0,6,12,24,48,96,192,128,0,
124,198,206,222,246,230,124,0,48,112,48,48,48,48,252,0,120,204,12,56,96,204,252,0,120,204,12,56,12,204,120,0,
28,60,108,204,254,12,30,0,252,192,248,12,12,204,120,0,56,96,192,248,204,204,120,0,252,204,12,24,48,48,48,0,
120,204,204,120,204,204,120,0,120,204,204,124,12,24,112,0,0,48,48,0,0,48,48,0,0,48,48,0,0,48,48,96,
24,48,96,192,96,48,24,0,0,0,252,0,0,252,0,0,96,48,24,12,24,48,96,0,120,204,12,24,48,0,48,0,124,198,222,222,222,192,120,0,
48,120,204,204,252,204,204,0,252,102,102,124,102,102,252,0,60,102,192,192,192,102,60,0,248,108,102,102,102,108,248,0,
126,96,96,120,96,96,126,0,126,96,96,120,96,96,96,0,60,102,192,192,206,102,62,0,204,204,204,252,204,204,204,0,
120,48,48,48,48,48,120,0,30,12,12,12,204,204,120,0,230,102,108,120,108,102,230,0,96,96,96,96,96,96,126,0,
198,238,254,254,214,198,198,0,198,230,246,222,206,198,198,0,56,108,198,198,198,108,56,0,252,102,102,124,96,96,240,0,
120,204,204,204,220,120,28,0,252,102,102,124,108,102,230,0,120,204,224,112,28,204,120,0,252,48,48,48,48,48,48,0,
204,204,204,204,204,204,252,0,204,204,204,204,204,120,48,0,198,198,198,214,254,238,198,0,198,198,108,56,56,108,198,0,
204,204,204,120,48,48,120,0,254,6,12,24,48,96,254,0,120,96,96,96,96,96,120,0,192,96,48,24,12,6,2,0,
120,24,24,24,24,24,120,0,16,56,108,198,0,0,0,0,0,0,0,0,0,0,0,255,48,48,24,0,0,0,0,0,0,0,120,12,124,204,118,0,
224,96,96,124,102,102,220,0,0,0,120,204,192,204,120,0,28,12,12,124,204,204,118,0,0,0,120,204,252,192,120,0,
56,108,96,240,96,96,240,0,0,0,118,204,204,124,12,248,224,96,108,118,102,102,230,0,48,0,112,48,48,48,120,0,
12,0,12,12,12,204,204,120,224,96,102,108,120,108,230,0,112,48,48,48,48,48,120,0,0,0,204,254,254,214,198,0,
0,0,248,204,204,204,204,0,0,0,120,204,204,204,120,0,0,0,220,102,102,124,96,240,0,0,118,204,204,124,12,30,
0,0,220,118,102,96,240,0,0,0,124,192,120,12,248,0,16,48,124,48,48,52,24,0,0,0,204,204,204,204,118,0,
0,0,204,204,204,120,48,0,0,0,198,214,254,254,108,0,0,0,198,108,56,108,198,0,0,0,204,204,204,124,12,248,
0,0,252,152,48,100,252,0,28,48,48,224,48,48,28,0,24,24,24,0,24,24,24,0,
224,48,48,28,48,48,224,0,118,220,0,0,0,0,0,0,0,16,56,108,198,198,254,0);

facteur,vieux_facteur:single;
SVG:boolean;
implementation

uses   Unit1,JPEG, Unit2, Unit3;

{$R *.DFM}

var
    actionencours:boolean;
    fichiermodifie:boolean;
    Dialogvaleur:integer;
    Metafile:Tmetafile;

Type Str3=String[3];
     Str16=String[16];
     Type_    = (Une_Alim,Rien,Un_Cap,Un_Canal,Tout,Un_Carrefour,Action,Deux_Canaux,temps,
                 Un_Texte,Une_Cellule,ouste,Un_huit,Une_Lampe,Un_ASCII,toutsaufcanal);
     Type_Cap = (Et,Ou,Inhibition,Nand,Nor,Xou,Non);
     T_Bout   = Record
                  Quoi:Type_;
                  Lequel:Smallint;
                  Branche:Smallint;
               End;
     T_Capteur      = Record
                        X,Y     : single;
                        Etat_Ext: Array [1..3] Of Byte;
                        ExtX    : Array [1..3] Of single;
                        ExtY    : Array [1..3] Of single;
                        Modele  : Type_Cap;
                        Etat    : Byte;
                        Position: Byte;
                        Ident:Str3;
                      End;
     T_Parcours     = Array [1..11] Of single;
     T_Canal = Record
                        X,Y     : single;
                        NbPoint:Smallint;
                        ParcoursX, ParcoursY: T_Parcours;
                        Etat:Byte;
                        Ident:Str3;
                        Bout:Array[1..2] Of T_Bout;
                      End;

     T_Alim  = Record
                        X,Y:single;
                        Etat:Byte;
                        Ident:Str3;
                        Barre:Boolean;
                      End;
     T_Carrefour= Record
                          X,Y:single;
                          Etat:Byte;
                          Ident:Str3;
                         End;
     T_Lampe= Record
                X,Y,angle,largeur,hauteur:single;
                Etat:Byte;
                Ident:Str3;
                lacouleur:tcolor;
              End;
     T_Texte           =Record
                          X,Y:single;
                          lataille:smallint;
                          Le_Texte:Str16;
                        End;
     T_Huit            = Record
                          X,Y:single;
                          Valeur:byte;
                          Etat_Ext: Array [1..4] Of Byte;
                          ExtX    : Array [1..4] Of single;
                          ExtY    : Array [1..4] Of single;
                          Ident:Str3;
                         End;
     T_ASCII           = Record
                          X,Y:single;
                          Valeur:byte;
                          Etat_Ext: Array [0..8] Of Byte;
                          ExtX    : Array [0..8] Of single;
                          ExtY    : Array [0..8] Of single;
                          Ident:Str3;
                         End;

Type Pointe=Array[1..2] Of single;

Const Max_Canal      = 250;
      Max_Capteur    = 100;
      Max_Alim       = 80;
      Max_Carrefour  = 150;
      Max_Lampe             = 151;
      Max_Texte             = 40;
      Max_Huit              = 10;
      Max_ASCII             = 10;
      ARayon                =  4;
      CLargeur              =  18;
      SLargeur              =  36;
      Alargeur:Smallint         =  30;
      Ahauteur:Smallint         =   6;
      Un=1;
      zero=0;
      Bof=2;

Var Canal              : Array [1..Max_Canal] Of T_Canal;
    Alim               : Array [1..Max_Alim] Of T_Alim;
    Capteur            : Array [1..Max_Capteur] Of T_Capteur;
    Carrefour          : Array [1..Max_Carrefour] Of T_Carrefour;
    Lampe                     : Array [1..Max_Lampe] Of T_Lampe;
    Texte                     : Array [1..Max_Texte] Of T_Texte;
    Huit                      : Array [1..Max_Huit] Of T_Huit;
    ASCII                     : Array [1..Max_ASCII] Of T_ASCII;
    Nb_Capteur,Nb_Alim,Nb_Canal,Nb_Carrefour,
    Nb_Texte,Nb_Huit,Nb_Lampe,Nb_ASCII,Vieux_Nb_Capteur,Vieux_Nb_Alim,Vieux_Nb_Carrefour,Vieux_Nb_Lampe,Vieux_Nb_Canal:Smallint;
    Vieux_nb_texte,Vieux_Nb_Huit,Vieux_NB_ASCII,Nb_Point:Smallint;
    Les_points: Array [1..300] Of pointe;
    Cestledebut:boolean;

Procedure change_Taille;
begin
  If facteur>2.6 then  feuille.font.height:=64 else If facteur>2.2 then  feuille.font.height:=48 else
  If facteur>1.9 then  feuille.font.height:=36 else If facteur>1.5 then  feuille.font.height:=24 else
  If facteur>=1 then  feuille.font.height:=16;
end;

procedure ligne(x1,y1,X2,Y2:single);
begin
  If not SVG then With feuille do
  Begin
    MoveTo(round(X1*facteur),round(Y1*facteur));
    LineTo(round(X2*facteur),round(Y2*facteur));
  end else form1.memo1.lines.Add('   <line x1= "'+Strg(X1*facteur)+'" y1= "'+strg(y1*facteur)+'" x2 ="'
                                                 +Strg(x2*facteur)+'" y2= "'+Strg(y2*facteur)+'"  stroke="black"    />');

end;

Function Change_svg(s:string):String;
var resultat:string;
    position:byte;
    car:char;
begin
  resultat:='';
  position:=1;
  While position<=length(s) do
  begin
    car:=char(s[position]);
    case car of
      '&':resultat:=resultat +'&amp;';
      '<':resultat:=resultat +'&lt;';
      '>':resultat:=resultat +'&gt;';
      '''':resultat:=resultat +'&apos;';
      '"':resultat:=resultat +'&quot;';
       else resultat:=resultat+car;
     end;
    inc(position);
  end;
  Change_svg:=resultat;
end;

Procedure Otxy(x,y:Smallint;s:String);
Begin
  if svg then s:=Change_svg(s);
  change_taille;
  If not SVG then With Feuille do TextOut(round(x*facteur),round(y*facteur),s) else
    form1.memo1.lines.Add('   <text x= "'+  Strg(X)+  '" y= "'+strg(y+abs(form1.Image1.Canvas.Font.height))+
    '" style="font-size:'+Strint(abs(form1.Image1.Canvas.Font.height))+'">'+s+'</text>');
End;

Procedure Otxy_barre(x,y:Smallint;s:String);
Begin
  Otxy(x,y,s);
  ligne(x,y,x+round(feuille.TextExtent(s).cx/facteur),y);
End;

Procedure NPave(X,Y:single;co:Tcolor);
Begin
  if not svg then
  begin
    setcolor(co);
    feuille.Brush.style:=bssolid;
    feuille.brush.color:=co;
    feuille.polygon([point(round((X-2)*facteur),round((Y+2)*facteur)),point(round((X+2)*facteur),round((Y+2)*facteur)),
                     point(round((X+2)*facteur),round((Y-2)*facteur)),point(round((X-2)*facteur),round((Y-2)*facteur))]);
    feuille.Brush.style:=bsclear;
    setcolor(clblack);
  end else form1.memo1.lines.Add('   <rect x= "'+Strg(X-2)+'" y= "'+strg(y-2)+'" width= "'+Strg(4*facteur)+
  '" height = "'+Strg(4*facteur)+'" rx="0" ry="0" fill="black" stroke="black" stroke-width="1"   />');
end;
 Procedure NPavepetit(X,Y:single;co:Tcolor);
Begin
  if not svg then
  begin
    setcolor(co);
    feuille.Brush.style:=bssolid;
    feuille.brush.color:=co;
    feuille.polygon([point(round((X-1)*facteur),round((Y+1)*facteur)),point(round((X+1)*facteur),round((Y+1)*facteur)),
                     point(round((X+1)*facteur),round((Y-1)*facteur)),point(round((X-1)*facteur),round((Y-1)*facteur))]);
    feuille.Brush.style:=bsclear;
    setcolor(clblack);
  end else form1.memo1.lines.Add('   <rect x= "'+Strg(X-1)+'" y= "'+strg(y-1)+'" width= "'+Strg(3*facteur)+
  '" height = "'+Strg(3*facteur)+'" rx="0" ry="0" fill="black" stroke="black" stroke-width="1"   />');
end;

procedure pointille(x1,y1,x2,y2:Single);
begin
   SetLinestyle(psdashDot,fin);
   ligne(x1,y1,x2,y2);
   SetLinestyle(psSolid,fin);
End;

function noiroublanc(oui:boolean):string;
begin
  If oui then noiroublanc:='black' else noiroublanc:='none';
end;

Procedure Affiche_rectangle(x,y,largeur,hauteur:Smallint;angle:single;Allume,blanc:Boolean;co,co2:tcolor);
Var  polygone:array[1..4] of tpoint;
Begin
    polygone[1].x:=round(x*facteur);
    polygone[1].y:=round(y*facteur);
    polygone[2].x:=round((x-round(hauteur*sin(angle)))*facteur);
    polygone[2].y:=round((y+round(hauteur*cos(angle)))*facteur);
    polygone[3].x:=round((x+round(largeur*cos(angle)-hauteur*sin(angle)))*facteur);
    polygone[3].y:=round((y+round(largeur*sin(angle)+hauteur*cos(angle)))*facteur);
    polygone[4].x:=round((x+round(largeur*cos(angle)))*facteur);
    polygone[4].y:=round((y+round(largeur*sin(angle)))*facteur);
    feuille.Brush.style:=bssolid;
    If allume then
    begin
      case blanc of
       false:begin
               feuille.brush.color:=co;
               setcolor(co2);
             end;
       true:begin
              feuille.brush.color:=clblack;
              setcolor(co2);
            end;
      end;
    end else
    begin
       feuille.brush.color:=clwhite;
       setcolor(co2);
    end;
    If svg then  form1.memo1.lines.Add('   <polygon points="'+Strg(polygone[1].x)+','+strg(polygone[1].y)+','+Strg(polygone[2].x)+','+Strg(polygone[2].y)+','
                                                              +Strg(polygone[3].x)+','+Strg(polygone[3].y)+','+Strg(polygone[4].x)+','+Strg(polygone[4].y)+
                                                              '" fill="'+noiroublanc(allume)+'" stroke="black" stroke-width="1"   />')
           else feuille.polygon(Slice(polygone,4));
    feuille.Brush.style:=bsclear;
    Setcolor(clblack);
End;

Procedure Croix(X,Y:Single;Coule:Tcolor);
Begin
  Affiche_rectangle(round(x-2),round(y-2),3,4,0,false,true,coule,coule);
End;

Procedure Rect(Xe,Ye,Xf,Yf:Single);
Begin
 Affiche_rectangle(round(xe),round(ye),round(xf-xe),round(yf-ye),0,false,false,clblack,clblack);
End;

Procedure Arc_De_Cercle(X,Y,AngleDebut,AngleFin,Rayon:single);
var pour:Smallint;
    increment,X1,X2,Y1,Y2:single;
Begin
   With feuille do
   Begin
     angledebut:=angledebut*pi/180;
     anglefin:=anglefin*pi/180;
     increment:=(anglefin-angledebut)/20;
     X1:=x+rayon*cos(angledebut);
     Y1:=y-rayon*sin(angledebut);
     for pour:=1 to 20 do
     Begin
       X2:=x+rayon*cos(angledebut+pour*increment);
       Y2:=y-rayon*sin(angledebut+pour*increment);
       Ligne(X1,Y1,X2,Y2);
       X1:=X2;Y1:=Y2;
     end;
   end;
End;

Procedure Pave(X,Y:single);
Begin
  Ligne(X-2,Y,X+2,Y);
  Ligne(X-2,Y+1,X+2,Y+1);
  Ligne(X-2,Y+2,X+2,Y+2);
  Ligne(X-2,Y-1,X+2,Y-1);
  Ligne(X-2,Y-2,X+2,Y-2);
End;

Procedure Affiche_barre(x,y:Smallint;horiz,Allume,blanc:Boolean);
Var  polygone:array[1..6] of tpoint;
     cote:Smallint;
Begin
  cote:=AHauteur div 2;
  If horiz then
  Begin
    polygone[1].x:=round(x*facteur);
    polygone[1].y:=round(y*facteur);
    polygone[2].x:=round((x+cote)*facteur);
    polygone[2].y:=round((y+cote)*facteur);
    polygone[3].x:=round((x+Alargeur-cote)*facteur);
    polygone[3].y:=round((y+cote)*facteur);
    polygone[4].x:=round((x+Alargeur)*facteur);
    polygone[4].y:=round(y*facteur);
    polygone[5].x:=round((x+Alargeur-Cote)*facteur);
    polygone[5].y:=round((y-Cote)*facteur);
    polygone[6].x:=round((x+cote)*facteur);
    polygone[6].y:=round((y-cote)*facteur);
  End Else
  Begin
    polygone[1].x:=round(x*facteur);
    polygone[1].y:=round(y*facteur);
    polygone[2].x:=round((x-cote)*facteur);
    polygone[2].y:=round((y+cote)*facteur);
    polygone[3].x:=round((x-cote)*facteur);
    polygone[3].y:=round((y+Alargeur-cote)*facteur);
    polygone[4].x:=round(x*facteur);
    polygone[4].y:=round((y+Alargeur)*facteur);
    polygone[5].x:=round((x+cote)*facteur);
    polygone[5].y:=round((y+Alargeur-Cote)*facteur);
    polygone[6].x:=round((x+cote)*facteur);
    polygone[6].y:=round((y+cote)*facteur);
  End;
 If allume then
  begin
    if not blanc then
    begin
      feuille.Brush.style:=bsSolid;
      feuille.brush.color:=cllime;
      setcolor(clblack);
    end else
    begin
      feuille.Brush.style:=bsSolid;
      feuille.brush.color:=clblack;
      setcolor(clblack);
    end;
  end else
  begin
     feuille.Brush.style:=bsSolid;
     feuille.brush.color:=clwhite;
     setcolor(clblack);
  end;
   If svg then  form1.memo1.lines.Add('   <polygon points="'+Strg(polygone[1].x)+','+strg(polygone[1].y)+','+Strg(polygone[2].x)+','+Strg(polygone[2].y)+','
                                                              +Strg(polygone[3].x)+','+Strg(polygone[3].y)+','+Strg(polygone[4].x)+','+Strg(polygone[4].y)+','
                                                              +Strg(polygone[5].x)+','+Strg(polygone[5].y)+','+Strg(polygone[6].x)+','+Strg(polygone[6].y)+
                                                              '" fill="'+noiroublanc(allume)+'" stroke="black" stroke-width="1"   />')
          else feuille.polygon(Slice(polygone,6));
   feuille.Brush.style:=bsclear;
   Setcolor(clblack);
End;

Procedure Affiche_8(x,y:Smallint;Quoi:byte;blanc:boolean);
Var cote:Smallint;
Begin
  cote:=AHauteur div 2;
  Affiche_Barre(x+cote,y-2*Alargeur-cote,true,not (quoi in [1,4,11,13]),blanc);
  Affiche_Barre(x+cote+Alargeur,y-2*Alargeur-cote,false,not (quoi in [5,6,11,12,14,15]),blanc);
  Affiche_Barre(x+cote+Alargeur,y-Alargeur-cote,false,not (quoi in [2,12,14,15]),blanc);
  Affiche_Barre(x+cote,y-cote,true,not (quoi in [1,4,7,10,15]),blanc);
  Affiche_Barre(x+cote,y-Alargeur-cote,false,not (quoi in [1,3,4,5,7,9]),blanc);
  Affiche_Barre(x+cote,y-2*Alargeur-cote,false,not (quoi in [1,2,3,7,13]),blanc);
  Affiche_Barre(x+cote,y-Alargeur-cote,true,not (quoi in [0,1,7,12]),blanc);
End;

Procedure Cree_Huit(Xc,Yc:single);
Begin
  If Nb_Huit>=Max_Huit then exit;
  Inc(Nb_Huit);
  With Huit[Nb_Huit] Do
  Begin
    X:=Xc;Y:=Yc;
    ExtX[1]:=X;
    ExtY[1]:=Y+Ahauteur;
    ExtX[2]:=X+(Alargeur+Ahauteur) div 3;
    ExtY[2]:=ExtY[1];
    ExtX[3]:=X+2*(Alargeur+Ahauteur) div 3;
    ExtY[3]:=ExtY[1];
    ExtX[4]:=X+Alargeur+Ahauteur;
    ExtY[4]:=ExtY[1];
    Valeur:=0;
   End;
End;

Procedure Cree_ASCII(Xc,Yc:single);
const ah = 7;
Begin
  If Nb_ASCII>=Max_ASCII then exit;
  Inc(Nb_ASCII);
  With ASCII[Nb_ASCII] Do
  Begin
    X:=Xc;Y:=Yc;
    ExtX[0]:=X+7*ah;ExtY[0]:=Y+Ah;
    ExtX[1]:=X+6*ah;ExtY[1]:=Y+Ah;
    ExtX[2]:=X+5*ah;ExtY[2]:=Y+Ah;
    ExtX[3]:=X+4*ah;ExtY[3]:=Y+Ah;
    ExtX[4]:=X+3*ah;ExtY[4]:=Y+Ah;
    ExtX[5]:=X+2*ah;ExtY[5]:=Y+Ah;
    ExtX[6]:=X+1*ah;ExtY[6]:=Y+Ah;
    ExtX[7]:=X-1*ah;
    ExtY[7]:=Y+Ah;
    ExtX[8]:=X-2*ah;
    ExtY[8]:=Y+Ah;
    Valeur:=0;
  End;
End;

Procedure Affiche_ASCII(Numero:Smallint;Blanc:Boolean);
Var Coul:tcolor;
     pour,pour2,Somme,ca:Smallint;
     co,li:integer;
     s:string;

Begin
If svg then form1.memo1.lines.Add('<g>');
  If Not Blanc Then SetColor(clred) Else SetColor(clblack);
  With ASCII[Numero] Do
  Begin
    if blanc then coul:=clblack else
    begin
      if etat_ext[7]=un then
      begin
        if etat_ext[8]=un then coul:=clred else coul:=clYellow;
      end else
      begin
        if etat_ext[8]=un then coul:=clblue else coul:=clgreen;
      end;
    end;
    Somme:=0;
    For pour :=0 to 6 do
    Begin
      If etat_ext[pour]=un then
      begin
        ca:=1;for pour2 :=0 to pour-1 do ca:=ca*2;
        somme := somme + ca;
      end;
    End;
     otxy(round(x-30),round(y+10),strint(somme));
  if (somme>00) and (somme<128) then For li:=1 to 8 do
  begin
     s:='';
     for co :=1 to 8 do If (table[((somme)*8+li)] and  ($100 shr co)) <>0 then
     Affiche_rectangle(round(x+co*9-27),round(-85+y+li*9),9,9,0,true,blanc,coul,coul)   else
     Affiche_rectangle(round(x+co*9-27),round(-85+y+li*9),9,9,0,false,blanc,clwhite,clsilver)
  end;
    feuille.font.height:=8;setcolor(clblack);
    If Not Blanc Then Coul:=clred Else Coul:=clblack;
    For Pour:=0 To 8 Do if Etat_Ext[pour] =1 then npavepetit(ExtX[Pour],ExtY[Pour],coul) else npavepetit(ExtX[Pour],ExtY[Pour],clblack);
  End;
  SetColor(clblack);
  If svg then form1.memo1.lines.Add('</g>');
End;

Procedure Affiche_Huit(Numero:Smallint;Couleur:tcolor;Blanc:Boolean);
Var Coul:tcolor;
    pour:Byte;
Begin
If svg then form1.memo1.lines.Add('<g>');
  If Not Blanc Then SetColor(clred) Else SetColor(clblack);
  With Huit[Numero] Do
  Begin
    Affiche_8(round(x),round(y),valeur,blanc);
    if blanc then coul:=clblack else coul:=clred;
    For Pour:=1 To 4 Do if Etat_Ext[pour] =1 then Npavepetit(ExtX[Pour],ExtY[Pour],coul) else Npavepetit(ExtX[Pour],ExtY[Pour],clblack);
  End;
  SetColor(clblack);
  If svg then form1.memo1.lines.Add('</g>');
End;

Procedure Cree_Capteur(Xc,Yc:single;Modelec:Type_Cap;L_Etat:Byte);
Begin
  If Nb_Capteur>=Max_Capteur then exit;
  Inc(Nb_Capteur);
  With Capteur[Nb_Capteur] Do
  Begin
    X:=Xc;Y:=Yc;
    ExtX[1]:=X-7/8*CLargeur;
    ExtX[2]:=ExtX[1];
    if modelec<>non then ExtY[2]:=Y+3/4*CLargeur  else ExtY[2]:=-100;
    if modelec<>non then ExtY[1]:=Y+1/4*CLargeur  else ExtY[1]:=Y+3/4*CLargeur;
    ExtX[3]:=X+7/8*CLargeur;
    ExtY[3]:=Y+3/4*CLargeur;
    Modele:=Modelec;
    Etat:=L_Etat;
  End;
End;

Procedure ellipse_SVG(x1,y1,x2,y2:single);
begin
   If not SVG then feuille.Ellipse(round(x1), round(y1),round(x2) , round(y2)) else
   form1.memo1.lines.Add('   <ellipse cx= "'+Strg((X1+x2)/2)+'" cy= "'+strg((y1+y2)/2)+'" rx = "'+Strg(abs(x2-x1)/2)+
         '" ry= "'+Strg(abs(y2-y1)/2)+'"  fill="none" stroke="black"  stroke-width="1"  />');
end;

Procedure cercle(x,y,rr:single);
begin
  Ellipse_SVG((x-rr)*facteur, (Y-rr)*facteur, (X+rr)*facteur, (Y+rr)*facteur);
end;

Procedure Affiche_Capteur(Numero:Smallint;Couleur:tcolor;Blanc:Boolean);
Var Pour:Smallint;
    coul:tcolor;

Procedure Cellule_Et(X,Y:single);
Begin
  Rect(X-CLargeur/2,Y,X+CLargeur/2,Y+CLargeur);
  Otxy(Round(X-CLargeur/4+2),Round(Y+CLargeur/3-3),'&');
  Ligne(X-3/4*CLargeur-2,Y+1/4*CLargeur,X-CLargeur/2,Y+1/4*CLargeur);
  Ligne(X-3/4*CLargeur-2,Y+3/4*CLargeur,X-CLargeur/2,Y+3/4*CLargeur);
  Ligne(X+3/4*CLargeur+1,Y+3/4*CLargeur,X+CLargeur/2,Y+3/4*CLargeur);
End;

Procedure Cellule_Inhibition(X,Y:single);
Begin
  Rect(X-CLargeur/2,Y,X+CLargeur/2,Y+CLargeur);
  Otxy(Round(X-CLargeur/4+2),Round(Y+CLargeur/3-3),'&');
  Ligne(X-3/4*CLargeur-2,Y+1/4*CLargeur,X-CLargeur/2,Y+1/4*CLargeur);
  Ligne(X-3/4*CLargeur-2,Y+3/4*CLargeur,X-CLargeur/2 -CLargeur/5,Y+3/4*CLargeur);
  Cercle(X-CLargeur/2-Clargeur/8,Y+3/4*CLargeur,Clargeur/8+1);
  Ligne(X+3/4*CLargeur+1,Y+3/4*CLargeur,X+CLargeur/2,Y+3/4*CLargeur);
End;

Procedure Cellule_XOR(X,Y:single);
Begin
  Rect(X-CLargeur/2,Y,X+CLargeur/2,Y+CLargeur);
  Otxy(Round(X-Clargeur/3+2),Round(Y+CLargeur/3-3),'=1');
  Ligne(X-3/4*CLargeur-2,Y+1/4*CLargeur,X-CLargeur/2,Y+1/4*CLargeur);
  Ligne(X-3/4*CLargeur-2,Y+3/4*CLargeur,X-CLargeur/2,Y+3/4*CLargeur);
  Ligne(X+3/4*CLargeur+1,Y+3/4*CLargeur,X+CLargeur/2,Y+3/4*CLargeur);
End;

Procedure Cellule_Nand(X,Y:single);
Begin
  Rect(X-CLargeur/2,Y,X+CLargeur/2,Y+CLargeur);
  Otxy(Round(X-2),Round(Y+CLargeur/3)-3,'&');
  Ligne(X-3/4*CLargeur-2,Y+1/4*CLargeur,X-CLargeur/2,Y+1/4*CLargeur);
  Ligne(X-3/4*CLargeur-2,Y+3/4*CLargeur,X-CLargeur/2,Y+3/4*CLargeur);
  Cercle(X+CLargeur/2+Clargeur/8+1,Y+3/4*CLargeur,Clargeur/8+1);
End;

Procedure Cellule_Non(X,Y:single);
Begin
  Rect(X-CLargeur/2,Y,X+CLargeur/2,Y+CLargeur);
  Otxy(Round(X+2),Round(Y+CLargeur/3)-3,'1');
  Ligne(X-3/4*CLargeur-2,Y+3/4*CLargeur,X-CLargeur/2,Y+3/4*CLargeur);
  Cercle(X+CLargeur/2+Clargeur/8+1,Y+3/4*CLargeur,Clargeur/8+1);
End;

Procedure Cellule_Ou(X,Y:single);
Begin
  Rect(X-CLargeur/2,Y,X+CLargeur/2,Y+CLargeur);
  Ligne(X-CLargeur/2+2,Y+Clargeur/3,X-CLargeur/4+2,Y+Clargeur/2);
  Ligne(X-CLargeur/2+2,Y+Clargeur*2/3,X-CLargeur/4+2,Y+Clargeur/2);
  Ligne(X-CLargeur/2+2+2,Y+Clargeur*2/3+2,X-CLargeur/4+2+2,Y+Clargeur/2+2);
  Otxy(Round(X-Clargeur/3+6),Round(Y+CLargeur/3)-3,'1');
  Ligne(X-3/4*CLargeur-2,Y+1/4*CLargeur,X-CLargeur/2,Y+1/4*CLargeur);
  Ligne(X-3/4*CLargeur-2,Y+3/4*CLargeur,X-CLargeur/2,Y+3/4*CLargeur);
  Ligne(X+3/4*CLargeur+1,Y+3/4*CLargeur,X+CLargeur/2,Y+3/4*CLargeur);
End;

Procedure Cellule_NOr(X,Y:single);
Begin
  Rect(X-CLargeur/2,Y,X+CLargeur/2,Y+CLargeur);
  Ligne(X-CLargeur/2+2,Y+Clargeur/3,X-CLargeur/4+2,Y+Clargeur/2);
  Ligne(X-CLargeur/2+2,Y+Clargeur*2/3,X-CLargeur/4+2,Y+Clargeur/2);
  Ligne(X-CLargeur/2+2+2,Y+Clargeur*2/3+2,X-CLargeur/4+2+2,Y+Clargeur/2+2);
  Otxy(Round(X-Clargeur/3+6),Round(Y+CLargeur/3)-3,'1');
  Ligne(X-3/4*CLargeur-2,Y+1/4*CLargeur,X-CLargeur/2,Y+1/4*CLargeur);
  Ligne(X-3/4*CLargeur-2,Y+3/4*CLargeur,X-CLargeur/2,Y+3/4*CLargeur);
  Cercle(X+CLargeur/2+Clargeur/8+1,Y+3/4*CLargeur,Clargeur/8+1);
End;

Begin
  If svg then form1.memo1.lines.Add('<g>');
  SetLinemode(pmcopy);
  feuille.font.height:=8;
  If Not Blanc Then SetColor(Couleur) Else SetColor(clblack);
  With Capteur[Numero] Do
  Begin
    SetColor(Couleur);
    case modele of
      Inhibition:Cellule_Inhibition(X,Y);
              Et:Cellule_Et(X,Y);
              ou:Cellule_Ou(X,Y);
             Xou:Cellule_XOR(X,Y);
            Nand:Cellule_Nand(X,Y);
             Nor:Cellule_Nor(X,Y);
             Non:Cellule_Non(X,Y);
    end;
    If Couleur=clwhite Then Coul:=clwhite Else Coul:=clred;
    if blanc then coul:=clblack;
    For Pour:=1 To 3 Do  if not((pour=2) and (modele=non)) then If Etat_Ext[pour]=1 then  Npavepetit(ExtX[Pour],ExtY[Pour],Coul)
                                                           else Npavepetit(ExtX[Pour],ExtY[Pour],clblack);
  End;
  SetColor(clblack);
  If svg then form1.memo1.lines.Add('</g>');
End;

Function ENTREPOINT(Old_X,Old_Y:Smallint;Var Ext:Boolean;Var NX,NY:single;Var Branche:T_Bout):Boolean;
VAR DRA:BOOLEAN;
    Pour,X,Y,Pour2,Combien:Smallint;
    di2,Di,Distance,D,Xd,Yd:single;
    PourPt:Smallint;

procedure croix(x,Y:Smallint);
begin
  SetLinemode(pmnot);
  ligne(x,y-220,x,y+220);
  ligne(x-220,y,x+220,y);
  If Not Ext Then If (Abs(Old_X-X)<=Abs(Old_Y-Y)) Then ligne(Old_X,Old_Y,Old_X,Y)  Else ligne(Old_X,Old_Y,X,Old_Y);
  SetLinemode(pmCopy);
end;

Function Dista(X,Y:single):single;
Begin
  Dista:=Sqrt(Sqr(x_S-X)+Sqr(Y_S-Y));
End;

Procedure entre_pave(X,Y:single);
Begin
  setcolor(clPurple);
  npave(X,Y,clPurple);
  If Nb_Point<300 Then Inc(Nb_Point);
  Les_Points[Nb_Point,1]:=round(X);
  Les_Points[Nb_Point,2]:=round(Y);
End;

BEGIN
  form1.Image1.Cursor:=crnone;
  Nb_Point:=0;
  For Pour :=1 To Nb_Alim Do With Alim[Pour] Do Entre_Pave(X,Y);
  For Pour :=1 To Nb_ASCII Do With ASCII[Pour] Do For Pour2:=0 To 8 Do Entre_Pave(ExtX[Pour2],ExtY[Pour2]);
  For Pour :=1 To Nb_Carrefour Do With Carrefour[Pour] Do Entre_Pave(X,Y);
  For Pour :=1 To Nb_Lampe Do With Lampe[Pour] Do Entre_Pave(X,Y);
  For Pour :=1 to Nb_Capteur Do With Capteur[Pour] Do For Pour2:=1 To 3 Do Entre_Pave(ExtX[Pour2],ExtY[Pour2]);
  For Pour :=1 to Nb_Huit Do With Huit[Pour] Do  For Pour2:=1 To 4 Do Entre_Pave(ExtX[Pour2],ExtY[Pour2]);
  Entrepoint:=True;
  SetColor(clred);
  DRA:=TRUE;
  Distance:=100000;
  x:=Old_X;Y:=Old_Y;
  WHILE DRA DO
  BEGIN
    Croix(X,Y);
    gauche:=false;Droite:=False;
    While  (Not Gauche) And (Not Droite) And (x=X_S) And (y=Y_S)
    Do application.processmessages;
    PourPt:=1;While PourPt<=Nb_Point do
    Begin
      Di:=Sqrt(Sqr(1.0*x_S-Les_Points[PourPt,1])+Sqr(1.0*Y_S-Les_Points[PourPt,2]));
      If (Di<4) And (Di>1) Then
        Begin
          x_S:=Round(Les_Points[PourPt,1]);
          Y_S:=Round(Les_Points[PourPt,2]);
          PourPt:=Nb_Point+1;
        End;
        Inc(PourPt);
      End;
    Croix(x,Y);
    X:=X_S;Y:=Y_S;
    IF Droite Then
    Begin
      Entrepoint:=False;form1.Image1.Cursor:=crarrow;
      Exit;
    End Else
    If Gauche Then
    Begin
      For Pour :=1 To Nb_Alim Do With Alim[Pour] Do
      Begin
        D:=Dista(X,Y);
        If D<Distance Then
        Begin
          Distance:=D;
          Xd:=X;Yd:=Y;
          Branche.Quoi:=Une_Alim;
          Branche.Lequel:=Pour;
          Branche.Branche:=0;
        End;
      End;
      For Pour :=1 To Nb_Carrefour Do With Carrefour[Pour] Do
      Begin
        D:=Dista(X,Y);
        If D<Distance Then
        Begin
          Distance:=D;
          Xd:=X;Yd:=Y;
          Branche.Quoi:=Un_Carrefour;
          Branche.Lequel:=Pour;
          Branche.Branche:=0;
        End;
      End;
      For Pour :=1 To Nb_Lampe Do With Lampe[Pour] Do
      Begin
        D:=Dista(X,Y);
        If D<Distance Then
        Begin
          Distance:=D;
          Xd:=X;Yd:=Y;
          Branche.Quoi:=Une_lampe;
          Branche.Lequel:=Pour;
          Branche.Branche:=0;
        End;
      End;
      For Pour :=1 to Nb_Capteur Do With Capteur[Pour] Do
      Begin
        For Pour2:=1 To 3 Do
        Begin
          if not ((modele=Non) and (Pour2=2)) then
          Begin
            D:=Dista(ExtX[Pour2],ExtY[Pour2]);
            If D<Distance Then
            Begin
              Distance:=D;
              Xd:=ExtX[Pour2];Yd:=ExtY[Pour2];
              Branche.Quoi:=Un_Cap;
              Branche.Lequel:=Pour;
              Branche.Branche:=Pour2;
            End;
          End;
        End;
      End;
      For Pour :=1 to Nb_huit Do With Huit[Pour] Do
      Begin
        For Pour2:=1 To 4 Do
        Begin
          D:=Dista(ExtX[Pour2],ExtY[Pour2]);
          If D<Distance Then
          Begin
            Distance:=D;
            Xd:=ExtX[Pour2];Yd:=ExtY[Pour2];
            Branche.Quoi:=Un_Huit;
            Branche.Lequel:=Pour;
            Branche.Branche:=Pour2;
          End;
        End;
      End;
      For Pour :=1 to Nb_ASCII Do With ASCII[Pour] Do
      Begin
        For Pour2:=0 To 8 Do
        Begin
          D:=Dista(ExtX[Pour2],ExtY[Pour2]);
          If D<Distance Then
          Begin
            Distance:=D;
            Xd:=ExtX[Pour2];Yd:=ExtY[Pour2];
            Branche.Quoi:=Un_ASCII;
            Branche.Lequel:=Pour;
            Branche.Branche:=Pour2;
          End;
        End;
      End;
      If Distance<6 Then
      Begin
        Nx:=Xd;Ny:=Yd;
        dra:=false;
        If Not Ext then Ext:=True Else Ext:=False;
      End Else
      Begin
        If Not Ext then
        Begin
          dra:=false;
          NX:=X_s;Ny:=Y_S;
         End;
      End;
    End;
  END;
  SetColor(clblack);
END;

Procedure Affiche_Canal(Numero:Smallint;Blanc:Boolean);
Var Pour:Smallint;
    Xe,Ye:single;
Begin
  With Canal[Numero] Do
  Begin
    If Not Blanc Then
    Case etat of
      0:SetColor(clblack);
      1:SetColor(clred);
      2:Setcolor(clblue);
    End else SetColor(clblack);
    Xe:=ParcoursX[1];Ye:=ParcoursY[1];
    For Pour := 2 To NbPoint Do
    Begin
      Ligne(Xe,Ye,ParcoursX[Pour],ParcoursY[Pour]);
      Xe:=ParcoursX[Pour];Ye:=ParcoursY[Pour];
    End;
  End;
   SetLinestyle(psSolid,1);
   SetColor(clblack);
End;

Procedure Affiche_Alim(Numero,Couleur:tcolor;Blanc:Boolean);
var cc:tcolor;
Begin
  With Alim[Numero] Do
  Begin
    If blanc or (etat in [bof,zero]) then
    begin
      cc:=clblack;
      form1.image1.canvas.font.color:=clblack;
    end else
    begin
      cc:=clred;
      form1.image1.canvas.font.color:=clred;
    end;
    SetColor(Cc);
    Cercle(X,Y,ARayon+1);
    If barre then otxy_barre(round(x-10),round(y+7),Ident) else otxy(round(x-10),round(y+7),Ident);
    npavepetit(x,y,cc);
  End;
  SetColor(clblack);Feuille.font.color:=clblack;
End;

Procedure Affiche_Carrefour(Numero:Smallint;Blanc:Boolean);
var cc:tcolor;
Begin
  with Carrefour[numero] do
  begin
    If  Blanc or (etat=0) then cc:=clblack else if etat=1 then cc:=clred else cc:=clblue;
    npavepetit(x,y,cc);
    otxy(round(x-4),round(y+8),Carrefour[numero].Ident);
  end;
  SetColor(clblack);
End;

Procedure Affiche_Lampe(Numero:Smallint;Blanc:Boolean);
Const rr=8;
Var  coul:tcolor;
Begin
  Setcolor(clblack);
  with Lampe[Numero] do
  begin
    If  Blanc or (etat=2) then coul:=clwhite else coul:=lacouleur;
    Affiche_rectangle(round(x),round(y),round(largeur)+2,round(hauteur),angle,(etat=1),blanc,coul,clblack);
    otxy(round(x+4),round(y+3),Lampe[numero].Ident);
    if not blanc then
    begin
      if etat=1 then nPavepetit(X,Y,clred) else nPavepetit(X,Y,clblack);
    end else nPavepetit(X,Y,clblack);
  end;
  SetColor(clblack);
End;

Procedure Affiche_Texte(Numero:Smallint;Couleur:tcolor);
Begin
  SetColor(Couleur);
  With Texte[Numero] Do otxy(Round(X),Round(Y-8),Le_Texte);
  SetColor(clblack);
End;

Procedure entre_combo;
var pour, pour2:integer;
    affiche:boolean;
begin
 If cestledebut then exit;
  form2.ComboBox1.items.Clear;
  For pour:=1 to Nb_Alim do
    Begin
      affiche:=true;
      for pour2:=1 to pour-1 do if  Alim[pour].Ident=Alim[Pour2].ident then affiche:=false;
      if affiche Then  if Alim[pour].Ident<>'<0>' then If Alim[pour].Ident<> '<1>' then form2.ComboBox1.items.Add(Alim[pour].ident);
    End;
end;

Procedure Redessprinc(Blanc:Boolean);
Var Pour:Smallint;
Begin
  Setcolor(clblack);
  For Pour :=1 To Nb_Canal Do Affiche_Canal(Pour,Blanc);
  For Pour :=1 To Nb_Capteur      Do Affiche_Capteur(Pour,clblack,Blanc);
  For Pour :=1 To Nb_Alim  Do Affiche_Alim(Pour,clred,Blanc);
  For Pour :=1 To Nb_Carrefour  Do Affiche_Carrefour(Pour,Blanc);
  For Pour :=1 To Nb_Lampe  Do Affiche_Lampe(Pour,Blanc);
  For Pour :=1 To Nb_Huit  Do Affiche_Huit(Pour,clblack,Blanc);
  For Pour :=1 To Nb_ASCII  Do Affiche_ASCII(Pour,Blanc);
  For Pour:=1 to Nb_Texte Do Affiche_Texte(Pour,clblack);
  entre_combo;
  Feuille:=Form1.Image1.canvas;
End;

Procedure Redess(Blanc:Boolean);
Begin
  ClearDevice;
  Feuille:=Form1.Image1.canvas;
  Redessprinc(blanc);
end;

PROCEDURE Entre_Canal(Var Encore:Boolean);
VAR        XL,YL,Old_Xl,Old_Yl,Xfin,YFin:single;
           Debut,Ext:Boolean;
           Branche:T_Bout;
bEGIN
  PetitMenu(clPurple,'<Relier>  L''origine et l''extrémité sont placées sur les points d''accrochage');
  With Canal[NB_Canal] Do
  Begin
    Ext:=True;Debut:=True;NbPoint:=0;
    Old_XL:=x_S;Old_YL:=y_S;
    REPEAT
      If NbPoint>9 Then
      Begin
        NbPoint:=0;
        Encore:=False;
        Exit;
      End;
      If Not Entrepoint(Round(Old_Xl),Round(Old_Yl),Ext,XL,YL,Branche) Then
      Begin
        NbPoint:=0;
        Encore:=False;
        Exit;
      End;
      If Debut Then
      Begin
        Bout[1]:=Branche;
        Inc(NbPoint);
        ParcoursX[NbPoint]:=XL;
        ParcoursY[NbPoint]:=YL;
      End;
      If Ext Then
      Begin
        Xfin:=XL;Yfin:=YL;
        Bout[2]:=Branche;
      End;
      SetLinemode(pmCopy);
      If Not Debut Then
      Begin
        If abs(Old_XL-XL)<=(Abs(Old_YL-YL)) Then XL:=Old_XL Else YL:=Old_YL;
        Ligne(XL,Yl,Old_Xl,Old_Yl);
        Inc(NbPoint);
        ParcoursX[NbPoint]:=XL;
        ParcoursY[NbPoint]:=YL;
      End;
      Old_Xl:=XL;Old_Yl:=YL;
      If Ext Then
      Begin
        Ligne(XL,Yl,xFIN,YFin);
        Inc(NbPoint);
        ParcoursX[NbPoint]:=XFin;
        ParcoursY[NbPoint]:=YFin;
      End;
      Debut:=False;
    Until Ext;
  End;
End;

Procedure Cree_Canal;
Var Pour,marchant,Courant:Smallint;
    Pouet,Encore:Boolean;
Begin
  Encore:=True;
  If Nb_Canal=Max_Canal Then Encore:=False;
  While Encore Do
  Begin
    Inc(NB_Canal);
    FillChar(Canal[Nb_Canal],SizeOf(Canal[Nb_Canal]),0);
    Entre_Canal(Encore);
    Pouet:=False;
    If Canal[Nb_Canal].NBPoint=0 Then Pouet:=True;
    With Canal[Nb_Canal] Do
    Begin
      X:=ParcoursX[1];
      Y:=ParcoursY[1];
      If Not Pouet Then For Pour :=1 To 2 Do
      Begin
        If  (Bout[Pour].Quoi=Une_Alim) And (Bout[3-Pour].Quoi=Une_Alim) Then Pouet:=True;
        If  (Bout[Pour].Quoi=Une_Lampe) And (Bout[3-Pour].Quoi=Une_Lampe) Then Pouet:=True;
        If  (Bout[Pour].Quoi=Un_Huit) And   (Bout[3-Pour].Quoi=Un_huit) Then Pouet:=True;
        If  (Bout[Pour].Quoi=Un_Cap) And (Bout[3-Pour].Quoi=Un_Cap) And (Bout[1].Lequel=Bout[2].Lequel) Then pouet:=True;
        If  (Bout[Pour].Quoi=Un_Cap) then for marchant :=1 to Nb_Canal-1 do for courant :=1 To 2 do if
            (Canal[marchant].Bout[Courant].quoi=Un_Cap) ANd (Bout[Pour].Lequel=Canal[marchant].Bout[Courant].Lequel) ANd
               (Bout[Pour].Branche=Canal[marchant].Bout[Courant].Branche) And (Bout[Pour].Branche<>3) Then pouet:=True;
      End;
    End;
    If Pouet Then Dec(Nb_Canal);
    If Nb_Canal=Max_Canal Then Encore:=False;
  End;
  Redess(False);
End;

Procedure Pointe_Objet(Var Objet:Type_;Var Celui_La:Smallint;Couleur:tcolor);
Type Point=Array[1..2] Of Smallint;
VAR Pour,X,Y,Pour2,Combien:Smallint;
    Di,D:single;
    PourPt:Smallint;
    Prox:single;
    acote:boolean;

Function Dist(X,Y:single):Boolean;
Begin
  Dist:=Sqrt(Sqr(x_S-X*facteur)+Sqr(Y_S-Y*facteur))<Prox;
End;

Procedure Pave(X,Y:single;c:tcolor);
Begin
  Npave(x,y,c);
  If Nb_Point<300 Then Inc(Nb_Point);
  Les_Points[Nb_Point,1]:=round(X*facteur);
  Les_Points[Nb_Point,2]:=round(Y*facteur);
End;

BEGIN
  form1.image1.cursor:=crCross;
  form3.image1.cursor:=crCross;
  If Objet=action then prox:=8 else prox:=6;
  Nb_Point:=0;
  SetColor(Couleur);
  If (Objet=Tout) Or (Objet=Un_Cap) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_Capteur+1 to Nb_Capteur
  Do With Capteur[Pour] Do Pave(X,Y,couleur);
  If (Objet=Action) Or (Objet=Tout) Or (Objet=Une_Alim) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_Alim+1 To Nb_Alim Do
    With Alim[Pour] Do Pave(X,Y,couleur);
  If (Objet=Tout) Or (Objet=Un_Huit) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_huit+1 to Nb_huit Do With huit[Pour] Do Pave(X,Y,couleur);
  If (Objet=Tout) Or (Objet=Un_ASCII) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_ASCII+1 to Nb_ASCII Do With ASCII[Pour] Do Pave(X,Y,couleur);
  If (Objet=Deux_Canaux) Or (Objet=Tout) Or (Objet=Un_Canal) Then
  For Pour :=Vieux_Nb_Canal+1 to Nb_Canal Do  With Canal[Pour] Do Pave((ParcoursX[2]+ParcoursX[1])/2,(ParcoursY[2]+ParcoursY[1])/2,couleur);
  If (Objet=Tout) Or (Objet=Un_Carrefour) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_Carrefour+1 to Nb_Carrefour Do With Carrefour[Pour] Do Pave(X,Y,couleur);
  If (Objet=Tout) Or (Objet=Une_Lampe) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_Lampe+1 to Nb_Lampe Do With Lampe[Pour] Do Pave(X,Y,couleur);
  If (Objet=Tout) Or (Objet=Toutsaufcanal) Then For Pour:=1 To Nb_Texte  Do With Texte[Pour] Do Pave(X,Y,couleur);
  X:=X_S;Y:=Y_S;
  D:=0;
  WHILE true DO
  BEGIN
    gauche:=false;Droite:=False;
    While (Not Gauche)And (Not Droite) And (x=X_S) And (y=Y_S) and not(changespin) Do application.processmessages;
    if not changespin then
    begin
    acote:=false;PourPt:=1;While PourPt<=Nb_Point do
    Begin
      Di:=Sqrt(Sqr(1.0*x_S-Les_Points[PourPt,1])+Sqr(1.0*Y_S-Les_Points[PourPt,2]));
      If (Di<4) Then
      Begin
        x_S:=Round(Les_Points[PourPt,1]);
        Y_S:=Round(Les_Points[PourPt,2]);
        PourPt:=Nb_Point+1;acote:=true;
      End;
      Inc(PourPt);
    End;
    if not acote then
    begin
      form1.image1.cursor:=crCross;
      form3.image1.cursor:=crCross;
    end else
    begin
      form1.image1.cursor:=crhandpoint;
      form3.image1.cursor:=crhandpoint;
    end;
    end else begin objet:=temps;exit;end;;
    X:=X_S;Y:=Y_S;
    IF Droite Then
    Begin
      Objet:=Rien;
      Celui_La:=0;
      Exit;
    End Else
    If Gauche Then
    Begin
      If (Objet=Tout) Or (Objet=Un_Carrefour) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_Carrefour+1 To Nb_Carrefour Do
      With Carrefour[Pour] Do
      Begin
        If Dist(X,Y) Then
        Begin
          Objet:=Un_Carrefour;Celui_La:=Pour;Exit;
        End;
      End;
      If (Objet=Tout) Or (Objet=Une_Lampe) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_Lampe+1 To Nb_Lampe Do
      With Lampe[Pour] Do
      Begin
        If Dist(X,Y) Then
        Begin
          Objet:=Une_lampe;Celui_La:=Pour;Exit;
        End;
      End;
      If (Objet=Action) Or (Objet=Tout) Or (Objet=Une_Alim) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_Alim+1 To Nb_Alim Do
      With Alim[Pour] Do
      Begin
        If Dist(X,Y) Then
        Begin
          Objet:=Une_Alim;Celui_La:=Pour;Exit;
        End;
      End;
      If  (Objet=Action) Or (Objet=Tout) Or (Objet=Un_Cap) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_Capteur+1 to Nb_Capteur Do
      With Capteur[Pour] Do
      Begin
        If Dist(X,Y) Then
        Begin
          Objet:=Un_Cap;Celui_La:=Pour;Exit;
        End;
      End;
      If  (Objet=Tout) Or (Objet=Un_Huit) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_huit+1 to Nb_huit Do
      With huit[Pour] Do
      Begin
        If Dist(X,Y) Then
        Begin
          Objet:=Un_huit;Celui_La:=Pour;Exit;
        End;
      End;
      If  (Objet=Tout) Or (Objet=Un_ASCII) Or (Objet=Toutsaufcanal) Then For Pour :=Vieux_Nb_ASCII+1 to Nb_ASCII Do
      With ASCII[Pour] Do
      Begin
        If Dist(X,Y) Then
        Begin
          Objet:=Un_ASCII;Celui_La:=Pour;Exit;
        End;
      End;
      If  (Objet=Tout) Or (Objet=Toutsaufcanal) Then For Pour :=1 to Nb_Texte Do
      With Texte[Pour] Do
      Begin
        If Dist(X,Y) Then
        Begin
          Objet:=Un_Texte;Celui_La:=Pour;Exit;
        End;
      End;
      If (Objet=Deux_Canaux) Or (Objet=Tout) Or (Objet=Un_Canal) Then For Pour :=1 to Nb_Canal Do
      With Canal[Pour] Do
      Begin
        If Dist((ParcoursX[2]+ParcoursX[1])/2,(ParcoursY[2]+ParcoursY[1])/2) Then
        Begin
          Objet:=Un_Canal;Celui_La:=Pour;Exit;
        End;
      End;
    End else if changespin then objet:=temps;
  END;
  SetColor(clblack);
END;

Procedure Efface_Canal(Celui_La:Smallint);
Var Pour:Smallint;
Begin
  For Pour:=Celui_La To Nb_Canal-1 Do Canal[Pour]:=Canal[Pour+1];
  Dec(Nb_Canal);
End;

Procedure Effacer;
Var Pour,pour2,Celui_La:Smallint;
    Pointe_Quoi:Type_;
    On_Efface:Boolean;
Begin
  Celui_La:=1;
  Pointe_Quoi:=Tout;
  While (Pointe_Quoi=Tout)  Do
  Begin
    PetitMenu(clgray,'<Effacer>  Bouton droit = Fin');
    Pointe_Objet(Pointe_Quoi,Celui_La,clltgray);
    If Pointe_Quoi In [Une_Alim,Un_Carrefour,Un_Cap,
    Un_Huit,Une_lampe,Un_ASCII] Then
    Begin
      Pour:=1;While Pour <=Nb_Canal Do With Canal[Pour] Do
      Begin
        On_Efface:=False;
        For Pour2:=1 to 2 do
        Begin
          If (Bout[Pour2].Quoi=Pointe_Quoi) Then
          Begin
            If (Bout[Pour2].Lequel=Celui_La) Then On_Efface:=True;
            If (Bout[Pour2].Lequel>Celui_La) Then
            Bout[Pour2].Lequel:=(Bout[Pour2].Lequel-1);
          End;
        End;
        If On_Efface Then Efface_Canal(Pour) Else Inc(Pour);
      End;
    End;
    If Pointe_Quoi=Un_Canal Then
    Begin
      Efface_Canal(Celui_La);
      Pointe_Quoi:=Tout;
    End Else
    If Pointe_Quoi=Un_Cap Then
    Begin
      For Pour:=Celui_La To Nb_Capteur-1 Do Capteur[Pour]:=Capteur[Pour+1];
      Dec(Nb_Capteur);
      Pointe_Quoi:=Tout;
    End Else
    If Pointe_Quoi=Un_huit Then
    Begin
      For Pour:=Celui_La To Nb_huit-1 Do huit[Pour]:=huit[Pour+1];
      Dec(Nb_huit);
      Pointe_Quoi:=Tout;
    End Else
    If Pointe_Quoi=Un_ASCII Then
    Begin
      For Pour:=Celui_La To Nb_ASCII-1 Do ASCII[Pour]:=ASCII[Pour+1];
      Dec(Nb_ASCII);
      Pointe_Quoi:=Tout;
    End Else
    If Pointe_Quoi=Une_Alim Then
    Begin
      For Pour:=Celui_La To Nb_Alim-1 Do Alim[Pour]:=Alim[Pour+1];
      Dec(Nb_Alim);
      Pointe_Quoi:=Tout;
    End Else
    If Pointe_Quoi=Un_Texte Then
    Begin
      For Pour:=Celui_La To Nb_Texte-1 Do Texte[Pour]:=Texte[Pour+1];
      Dec(Nb_Texte);
      Pointe_Quoi:=Tout;
    End Else
    If Pointe_Quoi=Un_Carrefour Then
    Begin
      For Pour:=Celui_La To Nb_Carrefour-1 Do Carrefour[Pour]:=Carrefour[Pour+1];
      Dec(Nb_Carrefour);
      Pointe_Quoi:=Tout;
    End;
    If Pointe_Quoi=Une_Lampe Then
    Begin
      For Pour:=Celui_La To Nb_Lampe-1 Do Lampe[Pour]:=Lampe[Pour+1];
      Dec(Nb_Lampe);
      Pointe_Quoi:=Tout;
    End;
    Redess(False);
  End;
End;

Procedure Cree_Alim(Xe,Ye:single;s:str3;ba:Boolean);
var pour:Smallint;
Begin
If Nb_Alim>=Max_Alim then exit;
  Inc(Nb_Alim);
  With Alim[Nb_Alim] Do
  Begin
    X:=Xe;
    Y:=Ye;
    ident:=S;
    Etat:=Zero;
    barre:=ba;
    For Pour:=1 to nb_Alim-1 do if Alim[pour].ident=s then If Alim[pour].barre=barre then Etat:=Alim[pour].etat Else Etat:=1-Alim[pour].etat;
  End;
End;

Procedure Cree_Carrefour(Xe,Ye:single;identite:str3);
Begin
  If Nb_Carrefour>=Max_Carrefour then exit;
  Inc(Nb_Carrefour);
  With Carrefour[Nb_Carrefour] Do
  Begin
    X:=Xe;
    Y:=Ye;
    Etat:=bof;
    ident:=identite;
  End;
End;

Procedure Cree_Lampe(Xe,Ye,A,l,h:single;s:Str3;c:tcolor);
Begin
  If Nb_Lampe>=Max_Lampe then exit;
  Inc(Nb_Lampe);
  With Lampe[Nb_Lampe] Do
  Begin
    X:=Xe;
    Y:=Ye;
    Angle:=A;
    largeur:=l;hauteur:=h;
    Etat:=bof;
    ident:=s;
    lacouleur:=c;
    etat:=1;
  End;
End;

Procedure   RAZ;
Var i,k:Smallint;
Begin
  FOr I:=1 to Nb_huit do With huit[i] Do For K:=1 to 4 Do
  Etat_Ext[K]:=0;
  FOr I:=1 to Nb_ASCII do With ASCII[i] Do For K:=0 to 8 Do
  Etat_Ext[K]:=0;
  FOr I:=1 to Nb_Canal do With Canal[i] Do eTat:=bof;
  FOr I:=1 to Nb_Capteur do With Capteur[i] Do For K:=1 to 3 Do
  Etat_Ext[K]:=bof;
  FOr I:=1 to Nb_Carrefour do With Carrefour[i] Do eTat:=bof;
  FOr I:=1 to Nb_Lampe do With Lampe[i] Do eTat:=bof;
End;

Procedure Ou_Que(Var Old_X,Old_Y:Smallint;Var Objet:Type_);
VAR   X,Y,xx,yy:Smallint;
Const carreaux=22;
      Carreauy=34;

procedure croix(x,Y:Smallint);
Var V2:Smallint;
begin
  SetLinemode(pmnot);
  V2:=Round(1/4*CLargeur);
  ligne(x,y-200,x,y+200);ligne(x-200,y,x+200,y);
    Case Objet Of
      Un_Cap:Begin
               ligne(X-CLargeur/2,Y+CLargeur,X+CLargeur/2,Y+CLargeur);
               ligne(X+CLargeur/2,Y,X+CLargeur/2,Y+CLargeur);
               ligne(X-CLargeur/2,Y,X-CLargeur/2,Y+CLargeur);
               Ligne(x-Clargeur/2,y+V2,x-100,y+V2);
               Ligne(x+100,y+3*V2,x-100,y+3*V2);
             End;
    End;
  SetLinemode(pmCopy);
end;

Procedure petiteCroix(X,Y:single;Couleur:tcolor);
Begin
  SetColor(Couleur);
  Ligne(X-1,Y,X+1,Y);
  Ligne(X,Y+1,X,Y-1);
End;

BEGIN
form1.Image1.Cursor:=crnone;
  SetColor(clblack);
  x:=Old_X;Y:=Old_Y;
    xx:=00;
    While xx<getmaxx do
    begin
      yy:=0;
      while yy<getmaxy do
      begin
        petitecroix(xx,yy,clgray);
        inc(yy,carreauy);
      end;
      inc(xx,carreaux);
  end;
  while not zone do application.processmessages;
  WHILE true DO
  BEGIN
    Croix(x,Y);
    gauche:=false;Droite:=False;
    While  (Not Gauche) And (Not Droite) ANd (x=X_S) And (y=Y_S) Do application.processmessages;
    Croix(x,Y);
    If Sqrt(Sqr(round(x_S/Carreaux)*Carreaux-x_S)+
            Sqr(round(Y_S/Carreauy)*Carreauy-y_S))  <4 then
            begin
              x_s:=round(x_S/Carreaux)*Carreaux;
              y_S:=round(Y_S/Carreauy)*Carreauy;
            end;
    X:=X_S;Y:=Y_S;
    If Gauche Then
    Begin
      Old_X:=X;Old_Y:=Y;SetColor(clblack);
      Exit;form1.Image1.Cursor:=crarrow;
    End Else If Droite then
    Begin
      Old_X:=X;Old_Y:=Y;SetColor(clblack);Objet:=Ouste;
      Exit;
    End;
  END;
END;

Procedure Cree_Texte;
Var Xe,Ye:Smallint;
    s:Str16;
    Quoi_Donc:Type_;
    boo:boolean;
Begin
  If NB_Texte>=Max_Texte then exit;
  Xe:=300;Ye:=200;Quoi_Donc:=Un_Texte;
  PetitMenu(clgray,'<Texte>  Position du texte ?');
  Ou_Que(Xe,Ye,Quoi_Donc);
  If Quoi_Donc=Ouste then
  Begin
    Redess(False);Exit;
  End;
  PetitMenu(clgray,'Entrez Le Texte :');
  s:=ed('Entrez le texte : ','',boo);
  If S<>'' Then
  Begin
    Inc(Nb_Texte);
    With Texte[Nb_Texte] Do
    Begin
      X:=Xe;
      Y:=Ye;
      Le_Texte:=S;
    End;
  End;
  Redess(False);
End;

procedure AD(Var X:single;increment:single);
Begin
  X:=X+Increment;
End;

Procedure Change_Etat_Alim(Numero:Smallint);
Begin
  Affiche_Alim(Numero,clred,False);
  Alim[Numero].etat:=1-Alim[Numero].etat;
  Affiche_Alim(Numero,clred,False);
End;

Procedure Anime;
Var Pour,Pour2,Celui_La,Fois,ii,combiendebranche:Smallint;
    Le_Type:type_;
    debut,yadubug:Boolean;
    L_Action:Type_;

Begin
Changespin:=false;
  debut:=true;yadubug:=false;
  PetitMenu(clgreen,'<Exécuter>  Bouton Gauche : Action,  Bouton Droit : Retour');
  While true Do
  Begin
    L_Action:=Un_Cap;
    While l_Action = Un_Cap Do
    Begin
      redess(false);
      L_Action:=Action;
    if (not debut) or not (changespin) then Pointe_Objet(L_Action,Celui_La,clGreen)  else l_action:=temps;
      debut:=false;Changespin:=false;
      If Celui_La=0 Then
      Begin
        Redess(False);form1.SpinEdit1.Enabled:=false;Exit;
      End;
      Case L_Action Of
            Une_Alim:with alim[Celui_la] do if  not( (Ident='B10') or (Ident='B11') or (Ident='B12') or (Ident='B13') or (Ident='B14') or
                                                     (Ident='B15') or (Ident='B16') or (Ident='B17') or (Ident='GR0') or (Ident='GR1') or
                                                     (Ident='GR2') or (Ident='GR3') or (Ident='GR4') or (Ident='GR5') or (Ident='GR6') or
                                                     (Ident='GR7') or (Ident='CO0') or (Ident='CO1') or (Ident='CO2') or (Ident='CO3') or
                                                     (Ident='CO4') or (Ident='B20') or (Ident='B21') or (Ident='B22') or (Ident='B23') or
                                                     (Ident='B24') or (Ident='B25') or (Ident='B26') or (Ident='B27'))   then
                      begin
                       if Alim[Celui_la].Ident<>'<1>' then if  Alim[Celui_la].Ident<>'<0>' then
                       For pour:=1 to Nb_Alim do
                       Begin
                         if  Alim[Celui_la].Ident=Alim[Pour].ident Then
                         begin
                           Alim[pour].etat:=1-Alim[pour].etat;
                           Affiche_Alim(pour,clred,False);
                         end;
                        End;
                        l_action:=temps;
                      End else
                      Application.MessageBox('Les alimentations "B10...BI7,B20...B27,CO0..CO4,GR0...GR7"'+#13+' ne peuvent étre modifiées que par l''incrémenteur-décrémenteur.', '', MB_OK+MB_ICONHAND+MB_DEFBUTTON1+MB_APPLMODAL);
       End;
    End;
    RAZ;
    For Pour:=1 To Nb_Canal Do With Canal[Pour] Do For Pour2:= 1 To 2 Do If (Bout[Pour2].Quoi=Une_Alim) Then
      if etat in [Bof,0] then  Etat:=Alim[bout[pour2].lequel].etat;

    For Fois:=1 To 64 Do
    Begin
      For Pour:=1 To Nb_Canal Do With Canal[Pour] Do If Etat<>bof Then For Pour2:=1 To 2 Do If (Bout[Pour2].Quoi=Un_Carrefour) Then
          if Carrefour[Bout[Pour2].Lequel].Etat in [Bof,0] then Carrefour[Bout[Pour2].Lequel].Etat:=Canal[Pour].Etat;

      For Pour:=1 To Nb_Canal Do With Canal[Pour] Do If Etat<>bof Then  For Pour2:=1 To 2 Do If (Bout[Pour2].Quoi=Une_Lampe) Then
          if Lampe[Bout[Pour2].Lequel].Etat in [Bof,0] then Lampe[Bout[Pour2].Lequel].Etat:=Canal[Pour].Etat;

      For Pour:=1 To Nb_Canal Do With Canal[Pour] Do If Etat<>Bof Then For Pour2:=1 To 2 Do If (Bout[Pour2].Quoi=Un_Cap) Then
        If Bout[Pour2].Branche in [1,2] then If Capteur[Bout[Pour2].Lequel].Etat_Ext[Bout[Pour2].Branche] in  [bof,0] then
          Capteur[Bout[Pour2].Lequel].Etat_Ext[Bout[Pour2].Branche]:= Canal[Pour].Etat;
      For Pour:=1 To Nb_Capteur Do With Capteur[Pour] Do
      Begin
        Case Modele Of
          Ou:If (Etat_Ext[1]<>bof) And (Etat_Ext[2]<>Bof) Then If (Etat_Ext[1]=1) or (Etat_Ext[2]=1) Then Etat_Ext[3]:=1 Else Etat_Ext[3]:=0;
          Et:If ((Etat_Ext[1]<>bof) And (Etat_Ext[2]<>Bof)) Then If ((Etat_Ext[1]=1) And (Etat_Ext[2]=1)) Then Etat_Ext[3]:=1 Else Etat_Ext[3]:=0;
          Inhibition:If ((Etat_Ext[1]<>bof) And (Etat_Ext[2]<>Bof)) Then If (Etat_Ext[1]=1) And  (Etat_Ext[2]=0) Then Etat_Ext[3]:=1 else Etat_Ext[3]:=0;
          Nand:If ((Etat_Ext[1]<>bof) And (Etat_Ext[2]<>Bof)) Then If ((Etat_Ext[1]=1) And (Etat_Ext[2]=1)) Then Etat_Ext[3]:=0 else Etat_Ext[3]:=1;
          Non:If (Etat_Ext[1]<>bof) Then If (Etat_Ext[1]=1) Then Etat_Ext[3]:=0 else Etat_Ext[3]:=1;
          Nor:If ((Etat_Ext[1]<>bof) And (Etat_Ext[2]<>Bof)) Then If ((Etat_Ext[1]=0) And (Etat_Ext[2]=0)) Then Etat_Ext[3]:=1 else Etat_Ext[3]:=0;
          Xou:If ((Etat_Ext[1]<>bof) And (Etat_Ext[2]<>Bof)) Then If (Etat_Ext[1]=1) Xor (Etat_Ext[2]=1) Then Etat_Ext[3]:=1 Else Etat_Ext[3]:=0;
        End;
      End;
      For Pour:=1 To Nb_Canal Do With Canal[Pour] Do
 {*}     If (Etat=Bof) or (etat=0) Then
      Begin
        For Pour2:= 1 To 2 Do If (Bout[Pour2].Quoi=Un_Cap) Then If Bout[Pour2].Branche=3 then If Capteur[Bout[Pour2].Lequel].Etat_Ext[3]<>Bof
          Then if etat<>1 then Etat:=Capteur[Bout[Pour2].Lequel].Etat_Ext[3];
        For Pour2:= 1 To 2 Do If (Bout[Pour2].Quoi=Un_Carrefour) Then If Carrefour[Bout[Pour2].Lequel].Etat<>Bof Then
          If etat<>1 then Etat:=Carrefour[Bout[Pour2].Lequel].Etat;
      End;
      For Pour:=1 To Nb_Canal Do With Canal[Pour] Do If Etat=1 Then
        For Pour2:=1 To 2 Do If (Bout[Pour2].Quoi=Un_Huit) Then Huit[Bout[Pour2].Lequel].Etat_Ext[Bout[Pour2].Branche]:=1;
      For Pour:=1 To Nb_Canal Do With Canal[Pour] Do If Etat=1 Then
        For Pour2:=1 To 2 Do If (Bout[Pour2].Quoi=Un_ASCII) Then ASCII[Bout[Pour2].Lequel].Etat_Ext[Bout[Pour2].Branche]:=1;
    End;
    For Pour:=1 to Nb_Huit do With huit[pour] do
    Begin
      Valeur:=0;
      If etat_ext[4]=1 then inc(Valeur,1);
      If etat_ext[3]=1 then inc(Valeur,2);
      If etat_ext[2]=1 then inc(Valeur,4);
      If etat_ext[1]=1 then inc(Valeur,8);
      Affiche_Huit(pour,clwhite,false);
    End;
    For Pour :=1 To Nb_ASCII  Do Affiche_ASCII(Pour,false);
    For Pour:=1 To Nb_Canal Do Affiche_Canal(Pour,False);
  End;
  form1.SpinEdit1.Enabled:=false;
End;

Procedure Raz_Vieux;
Begin
    Vieux_Nb_Capteur:=0;
    Vieux_Nb_Alim:=0;
    Vieux_Nb_Carrefour:=0;
    Vieux_Nb_Lampe:=0;
    Vieux_Nb_Canal:=0;
    Vieux_Nb_Huit:=0;
    Vieux_Nb_ASCII:=0;
End;

Procedure Ajoute_Objet;
Var Objet:Type_;
    Pour,Celui_La:Smallint;
    Lax,Lay:Smallint;
    s,identite:Str3;
    boo:boolean;
    couleurlampe:Tcolor;
Begin
    vieux_facteur:=facteur;facteur:=1.1;
    petitmenu(clblue,'<Nouveau Composant>  Sortie : bouton droit. Les carrefours DOIVENT être créés AVANT les canaux, puis reliés');
    Objet:=Tout;
    Vieux_Nb_Capteur:=Nb_Capteur;
    Vieux_Nb_Alim:=Nb_Alim;
    Vieux_Nb_Carrefour:=Nb_Carrefour;
    Vieux_Nb_Lampe:=Nb_Lampe;
    Vieux_Nb_Canal:=Nb_Canal;
    Vieux_Nb_Texte:=Nb_Texte;
    Vieux_Nb_Huit:=Nb_Huit;
    Vieux_Nb_ASCII:=Nb_ASCII;
    Nb_Texte:=0;
    Nb_Canal:=0;cleardevice;
    If (Nb_Capteur<Max_Capteur-9) Then
    Begin
      Cree_Capteur(25,10,Et,1);
      Cree_Capteur(070,10,Ou,1);
      Cree_Capteur(115,10,Inhibition,1);
      Cree_Capteur(160,10,Nand,1);
      Cree_Capteur(205,10,Nor,1);
      Cree_Capteur(250,10,Xou,1);
      Cree_Capteur(295,10,Non,1);
    End;
    If (Nb_Alim<Max_Alim-2) then
    begin
       Cree_Alim(380,10,'ALI',False);
       Cree_Alim(410,90,'B1.',False);
       Cree_Alim(430,90,'B2.',False);
       Cree_Alim(410,120,'GR.',False);
       Cree_Alim(430,120,'CO.',False);
    end;
    If (Nb_Carrefour<Max_Carrefour-1) then
    begin
       Cree_Carrefour(42,130,'');
       Cree_Carrefour(62,130,'Plo');
    end;
    If (Nb_Huit<=Max_Huit-1) then  Cree_Huit(20,105);
    If (Nb_ASCII<=Max_ASCII-1) then  Cree_ASCII(110,100);
    If (Nb_Lampe<Max_Lampe-9) then
      begin
        Cree_Lampe(200,100,0,27,18,'DRA',clwhite);
        Cree_Lampe(210,85,0,50,6,'',12);
        Cree_Lampe(185,85,-pi/4,50,6,'',251);
        Cree_Lampe(295,95,-pi/2,50,6,'',45);
        Cree_Lampe(275,85,-3*pi/4,50,6,'',178);
        Cree_Lampe(260,100,0,25,25,'',120);
        Cree_Lampe(340,45,0,20,18,'16',clyellow);
        Cree_Lampe(340,70,0,20,18,'7',clyellow);
      end;
    For Pour:=Vieux_Nb_ASCII+1 To Nb_ASCII Do Affiche_ASCII(Pour,false);
    For Pour:=Vieux_Nb_huit+1 To Nb_huit Do Affiche_huit(Pour,clblack,False);
    For Pour:=Vieux_Nb_Capteur+1 To Nb_Capteur Do Affiche_Capteur(Pour,clblack,False);
    For Pour:=Vieux_Nb_Alim+1 To Nb_Alim Do Affiche_Alim(Pour,clred,False);
    For Pour:=Vieux_Nb_Carrefour+1 To Nb_Carrefour Do Affiche_Carrefour(Pour,False);
    For Pour:=Vieux_Nb_Lampe+1 To Nb_Lampe Do Affiche_Lampe(Pour,False);
    otxy(90,80,'Afficheur ASCII');otxy(325,95,'Segments'); otxy(400,70,'Codes');
    otxy(90,127,'Les carrefours DOIVENT être alimentés aprés création');
    Pointe_Objet(Objet,Celui_La,clblue);
     modeprendre:=false;
    Nb_Capteur:=Vieux_Nb_Capteur;
    Nb_Alim:=Vieux_Nb_Alim;
    Nb_Carrefour:=Vieux_Nb_Carrefour;
    Nb_Lampe:=Vieux_Nb_Lampe;
    Nb_Huit:=Vieux_Nb_huit;
    Nb_ASCII:=Vieux_Nb_ASCII;
    NB_Texte:=Vieux_NB_Texte;
    Nb_Canal:=Vieux_Nb_Canal;
    Raz_Vieux;facteur:=vieux_facteur;
    If Objet=Rien then
    Begin
      Redess(False);Exit;
    End;
    Lax:=150;LaY:=150;
    Feuille:=Form1.image1.canvas  ;
    If objet=Un_Carrefour then  PetitMenu(clred,'Position du carrefour ?    :     Le poser sur un fil n''assure pas son alimentation !!!') else
    PetitMenu(clblack,'Position du composant ?');
    zone:=false;
    Form3.Visible:=False;
    Ou_Que(Lax,Lay,Objet) ;
    Form3.Visible:=False;
    Case Objet Of
      Un_Cap:Begin
                Celui_La:=Celui_La-Nb_Capteur;
                Case Celui_La Of
                  1:Cree_Capteur(Lax,Lay,Et,1);
                  2:Cree_Capteur(Lax,Lay,Ou,1);
                  3:Cree_Capteur(Lax,Lay,Inhibition,1);
                  4:Cree_Capteur(Lax,Lay,Nand,1);
                  5:Cree_Capteur(Lax,Lay,Nor,1);
                  6:Cree_Capteur(Lax,Lay,Xou,1);
                  7:Cree_Capteur(Lax,Lay,Non,1);
                End;
              End;
      Une_Alim:if celui_la-nb_Alim =1 then
      Begin
        s:='';form2.ComboBox1.text:='';
        While s='' do
        begin
        reponsede2:=0;
          form2.showmodal;
          s:=form2.ComboBox1.text;
          While s[length(s)]=' ' do delete(s,length(s),1);
          case reponsede2 of
            1:If s<> '' then Cree_Alim(Lax,Lay,s,false);
            2:If s<> '' then Cree_Alim(Lax,Lay,s,true);
            3:begin
             s:='<1>';
             Cree_Alim(Lax,Lay,s,false);
             Alim[Nb_Alim].Etat:=1;
             end;
            4:begin
             s:='<0>';
             Cree_Alim(Lax,Lay,s,false);
          end;
          end;
         End;
      end else if celui_la-nb_Alim =2 then
      begin
        if lay<90 then lay:=lay+90;
         Cree_Alim(Lax,Lay-90,'B17',false);
         Cree_Alim(Lax,Lay-65,'B16',false);
         Cree_Alim(Lax,Lay-40,'B15',false);
         Cree_Alim(Lax,Lay-15,'B14',false);
         Cree_Alim(Lax,Lay+10,'B13',false);
         Cree_Alim(Lax,Lay+35,'B12',false);
         Cree_Alim(Lax,Lay+60,'B11',false);
         Cree_Alim(Lax,Lay+85,'B10',false);
       end else if celui_la-nb_Alim =3 then
      begin
        if lay<90 then lay:=lay+90;
         Cree_Alim(Lax,Lay-90,'B27',false);
         Cree_Alim(Lax,Lay-65,'B26',false);
         Cree_Alim(Lax,Lay-40,'B25',false);
         Cree_Alim(Lax,Lay-15,'B24',false);
         Cree_Alim(Lax,Lay+10,'B23',false);
         Cree_Alim(Lax,Lay+35,'B22',false);
         Cree_Alim(Lax,Lay+60,'B21',false);
         Cree_Alim(Lax,Lay+85,'B20',false);
       end else if celui_la-nb_Alim =5 then
      begin
        if lay<50 then lay:=lay+50;
        Cree_Alim(Lax,Lay-45,'CO4',false);
        Cree_Alim(Lax,Lay-20,'CO3',false);
        Cree_Alim(Lax,Lay+5,'CO2',false);
        Cree_Alim(Lax,Lay+30,'CO1',false);
        Cree_Alim(Lax,Lay+55,'CO0',false);
      end else
      begin
        if lay<90 then lay:=lay+90;
         Cree_Alim(Lax,Lay-90,'GR7',false);
         Cree_Alim(Lax,Lay-65,'GR6',false);
         Cree_Alim(Lax,Lay-40,'GR5',false);
         Cree_Alim(Lax,Lay-15,'GR4',false);
         Cree_Alim(Lax,Lay+10,'GR3',false);
         Cree_Alim(Lax,Lay+35,'GR2',false);
         Cree_Alim(Lax,Lay+60,'GR1',false);
         Cree_Alim(Lax,Lay+85,'GR0',false);
      end;
        Un_Carrefour:Begin
                       Celui_La:=Celui_La-Nb_Carrefour;
                       case celui_la of
                          1:Cree_Carrefour(Lax,Lay,'');
                          2:begin
                              identite:=ed('Identificateur : ','',boo);
                              Cree_Carrefour(Lax,Lay,identite);
                            end;
                       end;
                      End;
      Une_Lampe:begin
                   if form1.ColorDialog1.Execute then couleurlampe := form1.ColorDialog1.Color else couleurlampe:=clgreen;
                   Celui_La:=Celui_La-Nb_lampe;
                    case celui_la of
                      1:Begin
                             identite:=ed('Identificateur : ','',boo);
                             Cree_Lampe(Lax,Lay,0,length(identite)*9,18,identite,clred);
                        End;
                        2:Cree_Lampe(Lax,Lay,0,50,6,'',couleurlampe);
                        3:Cree_Lampe(Lax,Lay,-pi/4,50,6,'',couleurlampe);
                        4:Cree_Lampe(Lax,Lay,-pi/2,50,6,'',couleurlampe);
                        5:Cree_Lampe(Lax,Lay,-3*pi/4,50,6,'',couleurlampe);
                        6:Cree_Lampe(Lax,Lay,0,25,25,'',couleurlampe);
                        7:Begin
                            Cree_Lampe(Lax+60,Lay+3,pi,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+60,Lay+70,pi,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+60,Lay-64,pi,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-60,Lay-3,0,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-60,Lay-70,0,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-60,Lay+64,0,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-3,Lay+70,-pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-60,Lay+57,-pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+54,Lay+57,-pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-60,Lay-9,-pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+54,Lay-9,-pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+3,Lay-70,-3*pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+9,Lay-15,-pi/4,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-12,Lay-10,-3*pi/4,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-10,Lay+14,-5*pi/4,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+12,Lay+10,-7*pi/4,50,6,'',couleurlampe);
                         end;
                         8:Begin
                            Cree_Lampe(Lax+25,Lay+3,pi,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+25,Lay+70,pi,50,6,'',couleurlampe);
                            Cree_Lampe(Lax+25,Lay-64,pi,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-27,Lay+61,-pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-27,Lay-6,-pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-27+52,Lay+9,-3*pi/2,50,6,'',couleurlampe);
                            Cree_Lampe(Lax-27+52,Lay-58,-3*pi/2,50,6,'',couleurlampe);
                         end;
                    end;
                  end;
      Un_huit:    Cree_Huit(Lax,Lay);
      Un_ASCII:   Cree_ASCII(Lax,Lay);
    End;

    Redess(False);
End;

Procedure Super_Raz;
Var pour,pour2:Smallint;
Begin
    Raz_Vieux;
    NB_Canal:=0;
    Nb_Capteur:=0;
    Nb_Alim:=0;
    Nb_Carrefour:=0;
    Nb_Lampe:=0;
    Nb_Texte:=0;
    Nb_Huit:=0;
    NB_ASCII:=0;
    For Pour:=1 to Max_Canal do With Canal[Pour] Do For pour2:=1 to 2 Do
    Begin
      eTat:=Bof;
      Bout[pour2].Quoi:=Rien;
    End;
    For Pour:=1 to Max_Capteur do With Capteur[Pour] Do Etat:=0;
    for pour:=1 to Max_huit do with huit[pour] do for pour2:=1 to 4 do
    etat_ext[pour2]:=0;
    for pour:=1 to Max_ASCII do with ASCII[pour] do for pour2:=0 to 8 do
    etat_ext[pour2]:=0;
    Raz;
End;

procedure lecturede(nom:string);
var pour:smallint;
    F:File;
begin
ASSIGNfile(F,nomdefichier);
  ReSet(f,1);
  Pour:=0;
  BlockRead(f,NB_Canal,2);
  BlockRead(f,Nb_Capteur,2);
  BlockRead(f,Nb_Alim,2);
  BlockRead(f,Nb_Carrefour,2);
  BlockRead(f,Nb_Texte,2);
  BlockRead(f,Nb_Huit,2);
  BlockRead(f,Nb_Lampe,2);
  BlockRead(f,Nb_ASCII,2);
  BlockRead(f,pour,2);
  BlockRead(f,pour,2);
  BlockRead(f,Canal[1],Nb_Canal*SizeOf(Canal[1]));
  BlockRead(f,Capteur[1],Nb_Capteur*SizeOf(Capteur[1]));
  BlockRead(f,Alim[1],Nb_Alim*(SizeOf(Alim[1])));
  BlockRead(f,Carrefour[1],Nb_Carrefour*SizeOf(Carrefour[1]));
  For Pour:=1 to Nb_Texte Do BlockRead(f,Texte[Pour],SizeOf(Texte[Pour]));
  BlockRead(f,huit[1],Nb_huit*SizeOf(huit[1]));
  BlockRead(f,Lampe[1],Nb_Lampe*SizeOf(Lampe[1]));
  BlockRead(f,ASCII[1],Nb_ASCII*SizeOf(ASCII[1]));
  for pour:=1 to Nb_Alim do
  with Alim[pour] do if ident='<1>' then etat:=1 else if ident='<0>' then etat:=0;
  Closefile(f);
end;

procedure changemenu;
begin
  With form1 do
  begin
     composant1.enabled:=not actionencours;
     texte1.enabled:= not actionencours;
     efface1.enabled:= not actionencours;
     commande1.enabled:= not actionencours;
     fichier1.enabled:=not actionencours;
     Anime1.enabled:=not actionencours;
     apropos1.enabled:=not actionencours;
     loupe1.enabled:=not actionencours;
     loupe2.enabled:=not actionencours;
     dessus1.enabled:=not actionencours;
     dessous1.enabled:=not actionencours;
     gauche1.enabled:=not actionencours;
     droite1.enabled:=not actionencours;
     Dplacer1.enabled:=not actionencours;
     retour1.enabled:=actionencours;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cestledebut:=true;
  facteur:=1.1;
  fichiermodifie:=false;
  {Bitmap:=TBitmap.Create;
  Bitmap.Width:=1200;Bitmap.Height:=900;
  Bitmap.PixelFormat:=pf8bit;
  Bitmap.monochrome:=False;
  Image1.PICTURE.Graphic:=Bitmap; }
  Feuille:=Form1.Image1.canvas;
  {Getmaxx:=Bitmap.Width;
  Getmaxy:=Bitmap.Height;}
  Getmaxx:=image1.Width;
  Getmaxy:=image1.Height;
  Super_Raz;
  if  ParamCount>0 then
  begin
    NomdeFichier:=changefileext(ParamStr(1),'.LOW');
    Lecturede(nomdefichier);
    form1.Caption :='LOGI '+ExtractFilename(NomdeFichier);
  end;
  redess(false);
  SetLinemode(pmcopy);
  Cestledebut:=false;
  MetaFile := TMetaFile.Create;
  actionencours:=false;
  Changemenu;
  form1.SpinEdit1.Enabled:=false;
  form1.SpinEdit2.Enabled:=false;
  form1.SpinEdit3.Enabled:=false;
  form1.SpinEdit4.Enabled:=false;
  form1.Radiobutton1.Enabled:=false;
  form1.Radiobutton2.Enabled:=false;
  form1.Radiobutton3.Enabled:=false;
end;

procedure cacommence;
begin
  actionencours:=true;
  changemenu;
end;

 procedure cestfini;
begin
  actionencours:=false;
  Redess(False);
  PetitMenu(clblack,'Logi');
  form1.image1.cursor:=crarrow;
  SetColor(clblack);
  changemenu;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
  X_s:=x;y_s:=y;
  zone:=true;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   x_s:=x;y_s:=y;
   Droite:=(button=mbRight);
   Gauche:=(button=mbLeft);
end;

procedure TForm1.Composant1Click(Sender: TObject);
begin
   fichiermodifie:=true;
    cacommence;
    droite:=false;
    while not droite do
    begin
     form3.show;
     modeprendre:=true;
     Feuille:=Form3.image1.canvas  ;
     Ajoute_Objet;
    end;
    cestfini;
    Feuille:=Form1.Image1.canvas ;
    form3.Visible:=false;
    modeprendre:=false;
end;

procedure TForm1.Texte1Click(Sender: TObject);
begin
 cacommence;
 If Nb_Texte<Max_Texte Then
 begin
    fichiermodifie:=true;Cree_Texte;
 end;
 cestfini;
end;

procedure TForm1.Efface(Sender: TObject);
begin
  Form1.Image1.Cursor:=crHandPoint;
  cacommence;
  fichiermodifie:=true;
  Effacer;
  cestfini;
  Form1.Image1.Cursor:=crCross;
end;

procedure TForm1.Commande1Click(Sender: TObject);
begin
  cacommence;
  If Nb_Alim>0 Then
  begin
    fichiermodifie:=true;
    Cree_Canal;
  end else
    Application.MessageBox('Il n''y a pas d''alimentation ....', 'Relier', MB_OK+MB_ICONHAND+MB_DEFBUTTON1+MB_APPLMODAL);
  cestfini;
end;

Procedure placaun(i,val:byte;ca:string);
Var Nom:Str3;
    pour:integer;
begin
  Nom:=Ca+Char(48+i);
  For pour:=1 to Nb_Alim do
  Begin
     If Alim[Pour].ident=nom Then
     begin
        If not(Alim[Pour].barre) then Alim[pour].etat:=val else Alim[pour].etat:=1-Val;
        Affiche_Alim(pour,clred,False);
     end;
  End;
end;
Procedure change4;
var i,depart:integer;
begin
  If form1.radiobutton1.Checked then depart:=0
  else If form1.radiobutton2.Checked then depart:=10
  else depart:=20;
if not form1.spinedit4.Value in [0..9] then exit;
  For i:= 0 to 4 do if valeurducode[form1.spinedit4.Value+depart,4-i]=1
              then placaun(i,1,'CO') else placaun(i,0,'CO');
end;
procedure TForm1.Anime1Click(Sender: TObject);
begin
  cacommence;
 form1.SpinEdit1.Enabled:=true;
  form1.SpinEdit2.Enabled:=true;
  form1.SpinEdit3.Enabled:=true;
  form1.SpinEdit4.Enabled:=true;
  form1.Radiobutton1.Enabled:=true;
  form1.Radiobutton2.Enabled:=true;
  form1.Radiobutton3.Enabled:=true;
  Anime;
  cestfini;
  form1.SpinEdit1.Enabled:=false;
  form1.SpinEdit2.Enabled:=false;
  form1.SpinEdit3.Enabled:=false;
  form1.SpinEdit4.Enabled:=false;
  form1.Radiobutton1.Enabled:=false;
  form1.Radiobutton2.Enabled:=false;
  form1.Radiobutton3.Enabled:=false;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  X_s:=x;y_s:=y;
end;

procedure TForm1.Ouvrir1Click(Sender: TObject);
begin
  if fichiermodifie then
  begin
     Dialogvaleur:=MessageDlg('Sauver le fichier ?', mtConfirmation,
      [mbYes,mbno,mbcancel], 0);
     Case dialogvaleur of
       id_yes:Enregregistersous1Click(Self);
       id_Cancel:exit
     end;
  end;
  if openDialog1.execute then
  Begin
  nomdefichier:=OpenDialog1.Filename;
  fichiermodifie:=false;
  Lecturede(nomdefichier);
  facteur:=1;
  end;
  redess(false);
end;

procedure TForm1.Enregregistersous1Click(Sender: TObject);
Var Pour:Smallint;
    F:File;
Begin
  If SaveDialog1.execute then
  Begin
  fichiermodifie:=false;
    nomdefichier:=SaveDialog1.Filename;
    assignfile(F,nomdefichier);
    Pour:=0;
    ReWrite(f,1);
    try
      BlockWrite(f,NB_Canal,2);
      BlockWrite(f,Nb_Capteur,2);
      BlockWrite(f,Nb_Alim,2);
      BlockWrite(f,Nb_Carrefour,2);
      BlockWrite(f,Nb_Texte,2);
      BlockWrite(f,Nb_Huit,2);
      BlockWrite(f,Nb_Lampe,2);
      BlockWrite(f,Nb_ASCII,2);
      BlockWrite(f,pour,2);
      BlockWrite(f,pour,2);
      BlockWrite(f,Canal[1],Nb_Canal*SizeOf(Canal[1]));
      BlockWrite(f,Capteur[1],Nb_Capteur*SizeOf(Capteur[1]));
      BlockWrite(f,Alim[1],Nb_Alim*SizeOf(Alim[1]));
      BlockWrite(f,Carrefour[1],Nb_Carrefour*SizeOf(Carrefour[1]));
      For Pour:=1 to Nb_Texte Do BlockWrite(f,Texte[Pour],SizeOf(Texte[Pour]));
      BlockWrite(f,Huit[1],Nb_huit*SizeOf(huit[1]));
      BlockWrite(f,Lampe[1],Nb_Lampe*SizeOf(Lampe[1]));
      BlockWrite(f,ASCII[1],Nb_ASCII*SizeOf(ASCII[1]));
      finally
        Closefile(f);
      end;
  end;
end;

procedure TForm1.Nouveau1Click(Sender: TObject);
begin
   super_raz;facteur:=1;
   redess(false);
   fichiermodifie:=false;
end;

procedure TForm1.Pressepapier1Click(Sender: TObject);
begin
   ClipBoard.Assign(form1.Image1.picture);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if actionencours then begin canclose:=false;exit;end;
   If fichiermodifie then
  begin
     Dialogvaleur:=MessageDlg('Sauver le fichier ?', mtConfirmation,
      [mbYes,mbno,mbcancel], 0);
     Case dialogvaleur of
       id_yes:Enregregistersous1Click(Self);
       id_Cancel:Canclose:=false;
     end;
  end;

end;

procedure TForm1.Quitter1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Imprimer1Click(Sender: TObject);
Var rect:Trect;
    vieux_facteur,coef,nbx,nby:Double;
    margex,margey,largeur:Smallint;
begin
  vieux_facteur:=facteur;facteur:=1;
  nbx:=GetDeviceCaps(Printer.Handle,logpixelsX);
  nby:=GetDeviceCaps(Printer.Handle,logpixelsY);
  Margex:=round(Nbx*10/25.4);
  MargeY:=Round(Nby*10/25.4);
  Printer.Orientation := poPortrait;
  If PrintDialog1.execute Then
  Begin
    With printer Do
    begin
      Printer.Orientation :=poLandscape;
      coef:=Getmaxy/Getmaxx;
      rect.left:=margex;
      Rect.top:=margey;
      if pagewidth*getmaxy/getmaxx>pageheight then largeur:=pagewidth else largeur:=round(pageheight*getmaxx/getmaxy);
      rect.right:=largeur-MargeX;
      rect.bottom:=round(largeur*coef)-MargeY;
      PrintScale:=poproportional;
      BeginDoc;
        Canvas.StretchDraw(rect,form1.Image1.Picture.Graphic);
      EndDoc;
    end;
  end;
  facteur:=vieux_facteur;
end;

procedure TForm1.Apropos1Click(Sender: TObject);
begin

  Aboutbox.copyright.caption:='Montero-Ribas';
   Aboutbox.showmodal;
end;

procedure TForm1.Noiretblanc1Click(Sender: TObject);
begin
   redess(true);
end;

procedure TForm1.Sauverlimage1Click(Sender: TObject);
 var JpegImg: TJpegImage;
begin
   If SavePictureDialog1.execute then
   begin
     Nomdefichier:=SavepictureDialog1.Filename;
     nomdefichier:=changefileext(nomdefichier,'.jpg');
     JpegImg := TJpegImage.Create;
 try
  JpegImg.Assign(Form1.image1.picture.Bitmap);
  JpegImg.SaveToFile(nomdefichier);
 finally
  JpegImg.Free
 end;
   end;
end;

procedure TForm1.Couleur1Click(Sender: TObject);
begin
  redess(false);
end;
 procedure TForm1.Loupe1Click(Sender: TObject);
begin
  If facteur<2 then facteur:=facteur*1.1;
  redess(false);
end;

procedure TForm1.Loupe2Click(Sender: TObject);
begin
   If facteur>0.95 then facteur:=facteur/1.1;
  redess(false);
end;
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_escape then droite:=true;
   If (key = 107) then if ssCtrl in Shift then If loupe1.Enabled then loupe1Click(self);
   If (key = 109) then if ssCtrl in Shift then If loupe2.Enabled then Loupe2Click(self);
end;

procedure TForm1.MsPaintBmp1Click(Sender: TObject);
var s1,s3,result:string;
    DossierTemp: array[0..255] of Char;
begin
	result:='C:\';
	if GetTempPath(255, @DossierTemp)<>0 then Result := StrPas(DossierTemp);
  s1:='Mspaint';s3:='';
  Nomdefichier:=result+'Temporaire.bmp';
  try
    Form1.image1.picture.SaveToFile(nomdefichier);
    ShellExecute (handle,'Open', PChar(s1)  ,PChar(Nomdefichier),PChar(s3),SW_SHOWNORMAL);
  finally
  end;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
var valeur,reste,i:byte;
                 b:array[0..7] of boolean;
begin
For i:=0 to 7 do b[i]:=false;
  if not spinedit1.Value in [0..255] then exit;
  Valeur:=SpinEdit1.Value;
  i:=0;
  While Valeur>0 do
  begin
    Reste:=Valeur mod 2;
    Valeur:=Valeur div 2;
    b[i]:=(Reste=1);
    Inc(i);
  end;
  For i:=0 to 7 do if b[i] then placaun(i,1,'B1') else placaun(i,0,'B1');
  Changespin:=true;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
var deuxpuissance:array[0..8] of integer;
                i:Integer;
begin
  if not spinedit2.Value in [0..255] then exit;
  deuxpuissance[0]:=1;
  For i:=1 to 8 do deuxpuissance[i]:=deuxpuissance[i-1]*2;
  For i:=0 to 7 do if Odd((SpinEdit2.Value+deuxpuissance[i]) div deuxpuissance[i+1]) then placaun(i,1,'GR') else placaun(i,0,'GR');
  Changespin:=true;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
var valeur,reste,i:byte;
                 b:array[0..7] of boolean;
begin
  For i:=0 to 7 do b[i]:=false;
  if not spinedit3.Value in [0..255] then exit;
  Valeur:=SpinEdit3.Value;
  i:=0;
  While Valeur>0 do
  begin
    Reste:=Valeur mod 2;
    Valeur:=Valeur div 2;
    b[i]:=(Reste=1);
    Inc(i);
  end;
  For i:=0 to 7 do if b[i] then placaun(i,1,'B2') else placaun(i,0,'B2');
  Changespin:=true;
end;

procedure TForm1.SpinEdit4Change(Sender: TObject);
begin
change4;
  Changespin:=true;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  Form1.SpinEdit4Change(Self);
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
   Form1.SpinEdit4Change(Self);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
   Form1.SpinEdit4Change(Self);
end;

procedure TForm1.SauverlimageEMF1Click(Sender: TObject);
var MetaFileCanvas : TMetaFileCanvas;
begin
  Metafile.height:= image1.height+1;
  Metafile.width:=image1.width+1;
  SavepictureDialog2.Filename:=changefileext(nomdefichier,'.EMF');
  If SavePictureDialog2.execute then
   begin
     Nomdefichier:=SavepictureDialog2.Filename;
     nomdefichier:=changefileext(nomdefichier,'.EMF');
     MetaFileCanvas := TMetaFileCanvas.Create(MetaFile, 0);
   Feuille:= MetaFileCanvas;
   redessprinc(true);
   MetaFileCanvas.free;
   try
     MetaFile.SaveToFile(Nomdefichier);
   finally
   end;
   end;
  feuille:=Form1.Image1.Canvas;
end;

procedure TForm1.Retour1Click(Sender: TObject);
begin
   Droite:=true;
end;

Function minimumh:Single;
Var Pour:Smallint;
    mini:single;
begin
  mini:=10000;
  For Pour :=1 To Nb_Capteur Do If Capteur[Pour].x<mini then mini:=Capteur[Pour].x;
  For Pour :=1 To Nb_Alim  Do If Alim[Pour].x<mini then mini:=Alim[Pour].x;
  For Pour :=1 To Nb_Carrefour Do If Carrefour[Pour].x<mini then mini:=Carrefour[Pour].x;
  For Pour :=1 To Nb_Lampe  Do If Lampe[Pour].x<mini then mini:=Lampe[Pour].x;
  For Pour :=1 To Nb_Huit  Do If Huit[Pour].x<mini then mini:=Huit[Pour].x;
  For Pour :=1 To Nb_ASCII  Do If ASCII[Pour].x<mini then mini:=ASCII[Pour].x;
  For Pour:=1 to Nb_Texte Do If Texte[Pour].x<mini then mini:=Texte[Pour].x;
  minimumh:=mini;
end;

Function minimumv:Single;
Var Pour:Smallint;
    mini:single;
begin
  mini:=10000;
  For Pour :=1 To Nb_Capteur Do If Capteur[Pour].y<mini then mini:=Capteur[Pour].y;
  For Pour :=1 To Nb_Alim  Do If Alim[Pour].y<mini then mini:=Alim[Pour].y;
  For Pour :=1 To Nb_Carrefour Do If Carrefour[Pour].y<mini then mini:=Carrefour[Pour].y;
  For Pour :=1 To Nb_Lampe  Do If Lampe[Pour].y<mini then mini:=Lampe[Pour].y;
  For Pour :=1 To Nb_Huit  Do If Huit[Pour].y<mini then mini:=Huit[Pour].y;
  For Pour :=1 To Nb_ASCII  Do If ASCII[Pour].y<mini then mini:=ASCII[Pour].y;
  For Pour:=1 to Nb_Texte Do If Texte[Pour].y<mini then mini:=Texte[Pour].y;
  minimumv:=mini;
end;

Procedure Decah(combien:single);
Var Pour,pour2:Smallint;
begin
  For Pour :=1 To Nb_Canal Do For pour2:=1 to 11 do Canal[Pour].parcoursx[pour2]:=Canal[Pour].parcoursx[pour2]+combien;
  For Pour :=1 To Nb_Capteur Do
  begin
    Capteur[Pour].x:=Capteur[Pour].x+combien;
    For pour2:=1 to 3 do Capteur[Pour].extx[pour2]:= Capteur[Pour].extx[pour2]+combien;
  end;
  For Pour :=1 To Nb_Alim  Do  Alim[Pour].x:=Alim[Pour].x+combien;
  For Pour :=1 To Nb_Carrefour Do  Carrefour[Pour].x:=Carrefour[Pour].x+combien;
  For Pour :=1 To Nb_Lampe  Do  Lampe[Pour].x:=Lampe[Pour].x+combien;
  For Pour :=1 To Nb_Huit  Do
  begin
    Huit[Pour].x:=Huit[Pour].x+combien;
    For pour2:=1 to 4 do Huit[Pour].extx[pour2]:= Huit[Pour].extx[pour2]+combien;
  end;
  For Pour :=1 To Nb_ASCII  Do
  begin
    ASCII[Pour].x:=ASCII[Pour].x+combien;
    For pour2:=0 to 8 do ASCII[Pour].extx[pour2]:= ASCII[Pour].extx[pour2]+combien;
  end;
  For Pour:=1 to Nb_Texte Do  Texte[Pour].x:=Texte[Pour].x+combien;
end;

Procedure Decav(combien:single);
Var Pour,pour2:Smallint;
begin
  For Pour :=1 To Nb_Canal Do For pour2:=1 to 11 do Canal[Pour].parcoursy[pour2]:=Canal[Pour].parcoursy[pour2]+combien;
  For Pour :=1 To Nb_Capteur Do
  begin
    Capteur[Pour].y:=Capteur[Pour].y+combien;
    For pour2:=1 to 3 do Capteur[Pour].exty[pour2]:= Capteur[Pour].exty[pour2]+combien;
  end;
  For Pour :=1 To Nb_Alim  Do  Alim[Pour].y:=Alim[Pour].y+combien;
  For Pour :=1 To Nb_Carrefour Do  Carrefour[Pour].y:=Carrefour[Pour].y+combien;
  For Pour :=1 To Nb_Lampe  Do  Lampe[Pour].y:=Lampe[Pour].y+combien;
  For Pour :=1 To Nb_Huit  Do
  begin
    Huit[Pour].y:=Huit[Pour].y+combien;
    For pour2:=1 to 4 do Huit[Pour].exty[pour2]:= Huit[Pour].exty[pour2]+combien;
  end;
  For Pour :=1 To Nb_ASCII  Do
  begin
    ASCII[Pour].y:=ASCII[Pour].y+combien;
    For pour2:=0 to 8 do ASCII[Pour].exty[pour2]:= ASCII[Pour].exty[pour2]+combien;
  end;
  For Pour:=1 to Nb_Texte Do  Texte[Pour].y:=Texte[Pour].y+combien;
end;

procedure TForm1.Gauche1Click(Sender: TObject);
begin
  If minimumh>30 then  decah(-15);
  redess(false);
end;

procedure TForm1.Droite1Click(Sender: TObject);
begin
  If minimumh<200 then  decah(15);
  redess(false);
end;

procedure TForm1.Dessus1Click(Sender: TObject);
begin
  If minimumv>30 then  decav(-15);
  redess(false);
end;

procedure TForm1.Dessous1Click(Sender: TObject);
begin
  If minimumv<200 then  decav(15);
  redess(false);
end;

procedure TForm1.SauverlimageSVG1Click(Sender: TObject);
var s1,s2:string;

begin
  SVG:=false;vieux_facteur:=facteur;facteur:=1;
  Form1.Memo1.Lines.Clear;
  Form1.Memo1.Lines.Add('<?xml version ="1.0" encoding="ISO-8859-1" standalone="no" ?>');
  Form1.Memo1.Lines.Add('<!-- SVG  genere par Logi : ADMR');
  Form1.Memo1.Lines.Add(Format(' Date       : %s',[DateToStr(Now)]));
  Form1.Memo1.Lines.Add('-->');
  s1:=strint(image1.Width);
  s2:=strint(image1.Height);
  Form1.Memo1.Lines.Add('<svg width="'+s1+'" height="'+s2+'" viewbox="0 0 '+s1+' '+s2+'" xmlns="http://www.w3.org/2000/svg">');
  SaveDialog2.Filename:=changefileext(nomdefichier,'.svg');
  If SaveDialog2.execute then
   begin
     Nomdefichier:=SaveDialog2.Filename;
     nomdefichier:=changefileext(nomdefichier,'.svg');
     SVG:=true;     redessprinc(true);    SVG:=false;
     Form1.Memo1.Lines.Add('</svg>');
     try
       Form1.Memo1.Lines.SaveToFile(Nomdefichier);
     finally
     end;
  end;
  facteur:=vieux_facteur;
end;

Procedure Deplace_Objet;
Var Objet:Type_;
    Pour,pour2,pour3:Smallint;
    Lax,Lay:Smallint;
    dx,dy:single;
    mypoint:Tpoint;
Begin
  Objet:=Toutsaufcanal;    PetitMenu(clblack,'<Déplacer>  Choix du composant ?');
  Pointe_Objet(Objet,pour,clblue);
  If Objet=Rien then
  Begin
    Redess(False);Exit;
  End;
  Lax:=150;LaY:=150;
  PetitMenu(clblack,'<Déplacer>  Pointer la nouvelle position ?');
  zone:=false;
  GetCursorPos(MyPoint);
  SetCursorPos(round((mypoint.X)/facteur), round((mypoint.Y)/facteur));
  Ou_Que(Lax,Lay,Objet) ;
  if objet=ouste then exit;
  dx:=0;dy:=0;
  Case Objet of
    Un_Cap:with Capteur[pour] do
    begin
      dx:=lax-x;dy:=lay-y;   x:=x+dx;  y:=y+dy;
      For pour2:=1 to 3 do
      begin
        extx[pour2]:= extx[pour2]+dx;
        exty[pour2]:= exty[pour2]+dy;
      end;
    end;
    Une_Lampe:with Lampe[pour] do
    begin
      dx:=lax-round(x);dy:=lay-round(y);   x:=x+dx;  y:=y+dy;
    end;
    Un_texte:with Texte[pour] do
    begin
      dx:=lax-round(x);dy:=lay-round(y);   x:=x+dx;  y:=y+dy;
    end;
    Un_ASCII:with ASCII[pour] do
    begin
      dx:=lax-round(x);dy:=lay-round(y);   x:=x+dx;  y:=y+dy;
      For pour2:=0 to 8 do
      begin
        extx[pour2]:= extx[pour2]+dx;
        exty[pour2]:= exty[pour2]+dy;
      end;
    end;
    Un_huit:with Huit[pour] do
    begin
      dx:=lax-round(x);dy:=lay-round(y);   x:=x+dx;  y:=y+dy;
      For pour2:=1 to 4 do
      begin
        extx[pour2]:= extx[pour2]+dx;
        exty[pour2]:= exty[pour2]+dy;
      end;
    end;
    Une_Alim:with Alim[pour] do
    begin
      dx:=lax-round(x);dy:=lay-round(y);   x:=x+dx;  y:=y+dy;
    end;
    Un_Carrefour:with carrefour[pour] do
    begin
      dx:=lax-round(x);dy:=lay-round(y);   x:=x+dx;  y:=y+dy;
    end;
  end;
  For Pour2:=1 To Nb_Canal Do With Canal[Pour2] Do For Pour3:=1 To 2 Do If (Bout[Pour3].Quoi=objet) Then if Bout[Pour3].Lequel=pour then
  If pour3=2 then
  begin
    If nbpoint=2 then
    begin
       NbPoint:=3;
       parcoursx[3]:=parcoursx[2];
       Parcoursy[3]:=Parcoursy[2];
       parcoursx[2]:=(parcoursx[1]+parcoursx[3])/2;
       parcoursy[2]:=(parcoursy[1]+parcoursy[3])/2;
    end;
    If ((round(parcoursy[nbPoint])=round(Parcoursy[NbPoint-1])) and (round(parcoursx[nbPoint-1])=round(Parcoursx[NbPoint-2])))  { Cas C  } then
    begin
      parcoursx[Nbpoint]:=parcoursx[Nbpoint]+dx;Parcoursy[Nbpoint]:=Parcoursy[Nbpoint]+dy;
      Parcoursy[Nbpoint-1]:= Parcoursy[Nbpoint];
    end else if ((round(parcoursx[nbPoint])=round(Parcoursx[NbPoint-1])) and (round(parcoursx[nbPoint-1])=round(Parcoursx[NbPoint-2]))) {c'} then
    begin
      parcoursx[Nbpoint]:=parcoursx[Nbpoint]+dx;Parcoursy[Nbpoint]:=Parcoursy[Nbpoint]+dy;
      Parcoursx[Nbpoint-1]:= Parcoursx[Nbpoint];
      Parcoursy[Nbpoint-1]:= Parcoursy[Nbpoint-2];
    end else
    If ((round(parcoursx[nbPoint])=round(Parcoursx[NbPoint-1])) and (round(parcoursy[nbPoint-1])=round(Parcoursy[NbPoint-2]))) then   { D}
    begin
      parcoursx[Nbpoint]:=parcoursx[Nbpoint]+dx;Parcoursy[Nbpoint]:=Parcoursy[Nbpoint]+dy;
      Parcoursx[Nbpoint-1]:= Parcoursx[Nbpoint];
    end else
    if   ((round(parcoursy[nbPoint])=round(Parcoursy[NbPoint-1])) and (round(parcoursy[nbPoint-1])=round(Parcoursy[NbPoint-2]))) then   {d'}  {horiz}
    begin
      parcoursx[Nbpoint]:=parcoursx[Nbpoint]+dx;Parcoursy[Nbpoint]:=Parcoursy[Nbpoint]+dy;
      Parcoursx[Nbpoint-1]:= Parcoursx[Nbpoint];
    end;
  end else
  If pour3=1  then
  begin
    if nbpoint=2 then
     begin
       NbPoint:=3;
       parcoursx[3]:=parcoursx[2];
       Parcoursy[3]:=Parcoursy[2];
       parcoursx[2]:=(parcoursx[1]+parcoursx[3])/2;
       parcoursy[2]:=(parcoursy[1]+parcoursy[3])/2;
     end;
     If ((round(parcoursy[1])=round(Parcoursy[2])) and (round(parcoursx[2])=round(Parcoursx[3]))) then    {a}
     begin
       parcoursx[1]:=parcoursx[1]+dx;Parcoursy[1]:=Parcoursy[1]+dy;
       Parcoursy[2]:= Parcoursy[1];
     end else
     If ((round(parcoursx[1])=round(Parcoursx[2])) and (round(parcoursx[2])=round(Parcoursx[3]))) then  {a'}
     begin
       parcoursx[1]:=parcoursx[1]+dx;Parcoursy[1]:=Parcoursy[1]+dy;
       Parcoursy[2]:= Parcoursy[3];
       Parcoursx[2]:= Parcoursx[1];
     end else
     If ((round(parcoursx[1])=round(Parcoursx[2])) and (round(parcoursy[2])=round(Parcoursy[3]))) then
     begin
       parcoursx[1]:=parcoursx[1]+dx;Parcoursy[1]:=Parcoursy[1]+dy;
       Parcoursx[2]:= Parcoursx[1];
     end else
     if  ((round(parcoursy[1])=round(Parcoursy[2])) and (round(parcoursy[2])=round(Parcoursy[3]))) then     {b'}
     begin
       parcoursx[1]:=parcoursx[1]+dx;Parcoursy[1]:=Parcoursy[1]+dy;
       Parcoursx[2]:= Parcoursx[1];
     end;
  end;
  Redess(False);
End;

procedure TForm1.Dplacer1Click(Sender: TObject);
begin
    fichiermodifie:=true;
    cacommence;
    droite:=false;
    while not droite do deplace_Objet;
    cestfini;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Getmaxx:=image1.Width;
  Getmaxy:=image1.Height;
end;

end.


