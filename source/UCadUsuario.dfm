object FcadUsuarios: TFcadUsuarios
  Left = 0
  Top = 0
  Caption = 'FcadUsuarios'
  ClientHeight = 378
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 8
    Width = 465
    Height = 369
    Caption = 'Usuario'
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 170
      Width = 461
      Height = 32
      Align = alTop
      AutoSize = True
      TabOrder = 0
      object Label16: TLabel
        Left = 384
        Top = 6
        Width = 52
        Height = 13
        Caption = '0000/0000'
      end
      object Button2: TButton
        Left = 325
        Top = 1
        Width = 53
        Height = 25
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 266
        Top = 6
        Width = 53
        Height = 25
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button5: TButton
        Left = 213
        Top = 1
        Width = 53
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button4: TButton
        Left = 157
        Top = 1
        Width = 53
        Height = 25
        Caption = 'Editar'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button1: TButton
        Left = 102
        Top = 1
        Width = 53
        Height = 25
        Caption = 'Novo'
        TabOrder = 4
        OnClick = Button1Click
      end
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 1
        Width = 88
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 5
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 15
      Width = 461
      Height = 155
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 27
        Top = 1
        Width = 33
        Height = 13
        AutoSize = False
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 27
        Top = 41
        Width = 29
        Height = 13
        Caption = 'NOME'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 27
        Top = 81
        Width = 31
        Height = 13
        Caption = 'LOGIN'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 239
        Top = 81
        Width = 33
        Height = 13
        Caption = 'SENHA'
        FocusControl = DBEdit4
      end
      object DBText1: TDBText
        Left = 27
        Top = 137
        Width = 65
        Height = 17
        DataField = 'SITUACAO'
        DataSource = DataSource1
      end
      object DBEdit1: TDBEdit
        Left = 27
        Top = 20
        Width = 63
        Height = 21
        DataField = 'ID_USUARIO'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 27
        Top = 55
        Width = 199
        Height = 21
        DataField = 'NOME'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 27
        Top = 100
        Width = 134
        Height = 21
        DataField = 'LOGIN'
        DataSource = DataSource1
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 239
        Top = 100
        Width = 134
        Height = 21
        DataField = 'SENHA'
        DataSource = DataSource1
        TabOrder = 3
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 202
      Width = 461
      Height = 165
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDUsuario
    OnDataChange = DataSource1DataChange
    Left = 240
    Top = 24
  end
end
