object FCadProduto: TFCadProduto
  Left = 0
  Top = 0
  Caption = 'FCadProduto'
  ClientHeight = 437
  ClientWidth = 642
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
  object Panel1: TPanel
    Left = 0
    Top = 209
    Width = 642
    Height = 29
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Label16: TLabel
      Left = 360
      Top = 8
      Width = 52
      Height = 13
      Caption = '0000/0000'
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 2
      Width = 88
      Height = 25
      DataSource = DSProduto
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object Button1: TButton
      Left = 100
      Top = 2
      Width = 48
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 306
      Top = 2
      Width = 48
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 254
      Top = 2
      Width = 48
      Height = 25
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 150
      Top = 2
      Width = 48
      Height = 25
      Caption = 'Editar'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 202
      Top = 2
      Width = 48
      Height = 25
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = Button5Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 238
    Width = 642
    Height = 199
    Align = alClient
    DataSource = DSProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 209
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 21
      Top = 13
      Width = 49
      Height = 13
      Caption = 'PRODUTO'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 183
      Top = 15
      Width = 41
      Height = 13
      Caption = 'CODIGO'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 19
      Top = 59
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 333
      Top = 13
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label5: TLabel
      Left = 19
      Top = 107
      Width = 70
      Height = 13
      Caption = 'Pre'#231'o Unitario '
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 19
      Top = 150
      Width = 101
      Height = 13
      Caption = 'Unidade em Estoque '
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 183
      Top = 150
      Width = 94
      Height = 13
      Caption = 'Unidade de Pedidos'
      FocusControl = DBEdit7
    end
    object DBText1: TDBText
      Left = 497
      Top = 35
      Width = 41
      Height = 13
      AutoSize = True
      DataField = 'NOME'
      DataSource = DS_FORNECEDOR
    end
    object Label8: TLabel
      Left = 335
      Top = 150
      Width = 92
      Height = 13
      Caption = 'Unidade Devolu'#231#227'o'
      FocusControl = DBEdit4
    end
    object Label9: TLabel
      Left = 183
      Top = 106
      Width = 68
      Height = 13
      Caption = '% Segura'#231#227'o '
      FocusControl = DBEdit8
    end
    object Label10: TLabel
      Left = 479
      Top = 151
      Width = 48
      Height = 13
      Caption = 'Disponivel'
      FocusControl = DBEdit9
    end
    object DBEdit1: TDBEdit
      Left = 19
      Top = 32
      Width = 89
      Height = 21
      DataField = 'PRODUTO'
      DataSource = DSProduto
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 183
      Top = 31
      Width = 134
      Height = 21
      DataField = 'CODIGO'
      DataSource = DSProduto
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 19
      Top = 78
      Width = 500
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = DSProduto
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 19
      Top = 123
      Width = 134
      Height = 21
      DataField = 'PRECOUNITARIO'
      DataSource = DSProduto
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 19
      Top = 169
      Width = 97
      Height = 21
      DataField = 'UNIDADEEMESTOQUE'
      DataSource = DSProduto
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 183
      Top = 169
      Width = 97
      Height = 21
      DataField = 'UNIDADEDEPEDIDOS'
      DataSource = DSProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBLCB_Fornecedor: TDBLookupComboBox
      Left = 333
      Top = 32
      Width = 136
      Height = 21
      DataField = 'ID_ENTIDADE'
      DataSource = DSProduto
      DropDownWidth = 500
      KeyField = 'ID_ENTIDADE'
      ListField = 'INSCRICAO_FISCAL;NOME'
      ListSource = DS_FORNECEDOR
      TabOrder = 6
    end
    object DBEdit4: TDBEdit
      Left = 335
      Top = 170
      Width = 97
      Height = 21
      DataField = 'UNIDADEDEVOLUCAO'
      DataSource = DSProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit8: TDBEdit
      Left = 183
      Top = 123
      Width = 134
      Height = 21
      DataField = 'PERCSEGURACAO'
      DataSource = DSProduto
      TabOrder = 8
    end
    object DBEdit9: TDBEdit
      Left = 479
      Top = 170
      Width = 97
      Height = 21
      DataField = 'DISPONIVEL'
      DataSource = DSProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object DSProduto: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDProdutos
    OnDataChange = DSProdutoDataChange
    Left = 528
    Top = 48
  end
  object DS_FORNECEDOR: TDataSource
    DataSet = DM_testepratico.FDFornecedor
    Left = 512
    Top = 96
  end
end
