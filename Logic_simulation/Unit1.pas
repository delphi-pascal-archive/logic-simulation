unit Unit1;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
  private
    { d�clarations priv�es }
  public
    { d�clarations publiques }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

end.
 
