object Form3: TForm3
  Left = 734
  Top = 205
  Cursor = crHandPoint
  BorderStyle = bsToolWindow
  Caption = 'Choisissez un composant'
  ClientHeight = 172
  ClientWidth = 521
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 521
    Height = 172
    Cursor = crHandPoint
    Align = alClient
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object MainMenu1: TMainMenu
    Left = 152
    Top = 88
    object retour1: TMenuItem
      Caption = 'retour'
      OnClick = retour1Click
    end
  end
end
