object fCadFornecedor: TfCadFornecedor
  Left = 0
  Top = 0
  Caption = 'Cadastro de Fornecedor'
  ClientHeight = 489
  ClientWidth = 638
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 633
    Height = 489
    Align = alLeft
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 15
      Width = 629
      Height = 156
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 79
        Top = 5
        Width = 29
        Height = 13
        Caption = 'NOME'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 13
        Top = 48
        Width = 66
        Height = 13
        Caption = 'NASCIMENTO'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 153
        Top = 48
        Width = 50
        Height = 13
        Caption = 'TELEFONE'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 307
        Top = 46
        Width = 30
        Height = 13
        Caption = 'EMAIL'
        FocusControl = DBEdit4
      end
      object Label12: TLabel
        Left = 15
        Top = 3
        Width = 31
        Height = 13
        Caption = 'codigo'
        FocusControl = DBEdit12
      end
      object Label14: TLabel
        Left = 153
        Top = 109
        Width = 98
        Height = 13
        Caption = 'INSCRICAO_FISCAL'
        FocusControl = DBEdit14
      end
      object DBEdit1: TDBEdit
        Left = 77
        Top = 20
        Width = 516
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = DS_FORNECEDOR
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 13
        Top = 64
        Width = 134
        Height = 21
        DataField = 'NASCIMENTO'
        DataSource = DS_FORNECEDOR
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 153
        Top = 65
        Width = 147
        Height = 21
        DataField = 'TELEFONE'
        DataSource = DS_FORNECEDOR
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 306
        Top = 65
        Width = 288
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = DS_FORNECEDOR
        TabOrder = 3
      end
      object DBEdit12: TDBEdit
        Left = 13
        Top = 20
        Width = 58
        Height = 21
        DataField = 'ID_ENTIDADE'
        DataSource = DS_FORNECEDOR
        Enabled = False
        TabOrder = 4
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 13
        Top = 104
        Width = 134
        Height = 45
        Caption = 'Tipo Pessoa'
        Columns = 2
        DataField = 'PESSOA'
        DataSource = DS_FORNECEDOR
        Items.Strings = (
          'F'#237'sica'
          'Jur'#237'dica')
        TabOrder = 5
        Values.Strings = (
          'F'
          'J')
        OnExit = DBRadioGroup1Exit
      end
      object DBEdit14: TDBEdit
        Left = 153
        Top = 128
        Width = 186
        Height = 21
        DataField = 'INSCRICAO_FISCAL'
        DataSource = DS_FORNECEDOR
        TabOrder = 6
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 171
      Width = 629
      Height = 213
      Align = alTop
      Caption = 'Endere'#231'o'
      TabOrder = 1
      object Label5: TLabel
        Left = 16
        Top = 52
        Width = 98
        Height = 13
        Caption = 'TIPO LOGRADOURO'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 16
        Top = 89
        Width = 103
        Height = 13
        Caption = 'NOME LOGRADOURO'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 520
        Top = 89
        Width = 43
        Height = 13
        Caption = 'NUMERO'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 16
        Top = 129
        Width = 75
        Height = 13
        Caption = 'COMPLEMENTO'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 273
        Top = 169
        Width = 38
        Height = 13
        Caption = 'CIDADE'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 429
        Top = 169
        Width = 13
        Height = 13
        Caption = 'UF'
        FocusControl = DBEdit10
      end
      object Label11: TLabel
        Left = 16
        Top = 12
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit11
      end
      object Label13: TLabel
        Left = 16
        Top = 169
        Width = 39
        Height = 13
        Caption = 'BAIRRO'
        FocusControl = DBEdit13
      end
      object DBEdit5: TDBEdit
        Left = 17
        Top = 68
        Width = 48
        Height = 21
        DataField = 'TIPO_LOGRADOURO'
        DataSource = DS_LOGRADOURO
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 105
        Width = 498
        Height = 21
        DataField = 'LOGRADOURO'
        DataSource = DS_LOGRADOURO
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 520
        Top = 105
        Width = 69
        Height = 21
        DataField = 'NUMERO'
        DataSource = DS_LOGRADOURO
        TabOrder = 2
      end
      object DBEdit8: TDBEdit
        Left = 16
        Top = 142
        Width = 573
        Height = 21
        DataField = 'COMPLEMENTO'
        DataSource = DS_LOGRADOURO
        Enabled = False
        TabOrder = 3
      end
      object DBEdit9: TDBEdit
        Left = 273
        Top = 186
        Width = 150
        Height = 21
        DataField = 'CIDADE'
        DataSource = DS_LOGRADOURO
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 429
        Top = 186
        Width = 30
        Height = 21
        DataField = 'ESTADO'
        DataSource = DS_LOGRADOURO
        Enabled = False
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit11: TDBEdit
        Left = 16
        Top = 28
        Width = 108
        Height = 21
        DataField = 'CEP'
        DataSource = DS_LOGRADOURO
        TabOrder = 0
        OnKeyPress = DBEdit11KeyPress
      end
      object DBEdit13: TDBEdit
        Left = 16
        Top = 185
        Width = 251
        Height = 21
        DataField = 'BAIRRO'
        DataSource = DS_LOGRADOURO
        Enabled = False
        ReadOnly = True
        TabOrder = 8
      end
      object Button_Buscar_Cep: TButton
        Left = 130
        Top = 25
        Width = 89
        Height = 25
        Caption = 'Buscar CEP'
        TabOrder = 1
        OnClick = Button_Buscar_CepClick
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 384
      Width = 629
      Height = 29
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 2
      object Label16: TLabel
        Left = 373
        Top = 9
        Width = 52
        Height = 13
        Caption = '0000/0000'
      end
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 2
        Width = 88
        Height = 25
        DataSource = DS_FORNECEDOR
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object Button1: TButton
        Left = 101
        Top = 2
        Width = 50
        Height = 25
        Caption = 'Novo'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 317
        Top = 2
        Width = 50
        Height = 25
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 262
        Top = 2
        Width = 50
        Height = 25
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 3
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 154
        Top = 2
        Width = 50
        Height = 25
        Caption = 'Editar'
        TabOrder = 4
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 206
        Top = 2
        Width = 50
        Height = 25
        Caption = 'Inativa'
        TabOrder = 5
        OnClick = Button5Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 413
      Width = 629
      Height = 74
      Align = alClient
      DataSource = DS_FORNECEDOR
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object DS_FORNECEDOR: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDFornecedor
    OnDataChange = DS_FORNECEDORDataChange
    Left = 472
    Top = 16
  end
  object Svd1: TSaveDialog
    FileName = 'C:\Users\slima\Documents\teste julho\database\arquivo'
    Left = 528
    Top = 48
  end
  object OpenDialog1: TOpenDialog
    Left = 696
    Top = 368
  end
  object XMLDocument1: TXMLDocument
    Left = 671
    Top = 57
  end
  object IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'smtp.mail.yahoo.com:587'
    Host = 'smtp.mail.yahoo.com'
    MaxLineAction = maException
    Port = 587
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 699
    Top = 179
  end
  object IdSMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 696
    Top = 136
  end
  object IdHTTP: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 691
    Top = 235
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 664
    Top = 288
  end
  object DS_LOGRADOURO: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDEndereco
    OnDataChange = DS_FORNECEDORDataChange
    Left = 344
    Top = 16
  end
end
