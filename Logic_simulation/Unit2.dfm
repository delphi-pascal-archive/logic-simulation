object Form2: TForm2
  Left = 247
  Top = 345
  BorderStyle = bsToolWindow
  Caption = 'Form2'
  ClientHeight = 111
  ClientWidth = 192
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 16
    Width = 89
    Height = 13
    Caption = 'Nom ? (sans barre)'
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 8
    Width = 81
    Height = 25
    Caption = 'Normale'
    TabOrder = 0
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 104
    Top = 32
    Width = 81
    Height = 25
    Caption = 'Compl'#233'ment'#233'e'
    TabOrder = 1
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 104
    Top = 56
    Width = 81
    Height = 25
    Caption = 'Toujours '#224' 1'
    TabOrder = 2
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 104
    Top = 80
    Width = 81
    Height = 25
    Caption = 'Toujours '#224' 0'
    TabOrder = 3
    OnClick = BitBtn5Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 32
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    ItemHeight = 13
    MaxLength = 3
    TabOrder = 4
    Text = 'COMBOBOX1'
  end
end
