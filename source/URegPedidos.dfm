object FRegPedidos: TFRegPedidos
  Left = 0
  Top = 0
  Caption = 'Registro de Vendas'
  ClientHeight = 476
  ClientWidth = 1257
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
  object Panel5: TPanel
    Left = 646
    Top = 0
    Width = 472
    Height = 476
    Align = alLeft
    TabOrder = 0
    object DBGrid3: TDBGrid
      Left = 1
      Top = 1
      Width = 470
      Height = 200
      Align = alTop
      DataSource = DSPEDIDOS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 646
    Height = 476
    Align = alLeft
    AutoSize = True
    TabOrder = 1
    ExplicitLeft = -5
    object PG_RegPedidos: TPageControl
      Left = 1
      Top = 1
      Width = 644
      Height = 23
      ActivePage = TabSheet5
      Align = alTop
      Style = tsButtons
      TabOrder = 0
      OnChange = PG_RegPedidosChange
      object TabSheet1: TTabSheet
        Caption = 'Pedido'
      end
      object TabSheet2: TTabSheet
        Caption = 'Faturamento'
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Caption = 'Entrega'
        ImageIndex = 2
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 636
          Height = 185
          Align = alTop
          Caption = 'Panel5'
          TabOrder = 0
          object DBGrid4: TDBGrid
            Left = 1
            Top = 1
            Width = 528
            Height = 183
            Align = alLeft
            DataSource = DSPEDIDOS
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Demostra'
        ImageIndex = 3
      end
      object TabSheet5: TTabSheet
        Caption = 'Cancelado'
        ImageIndex = 4
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 24
      Width = 644
      Height = 169
      Align = alTop
      BevelInner = bvSpace
      TabOrder = 1
      object Label1: TLabel
        Left = 20
        Top = 37
        Width = 47
        Height = 13
        Caption = 'N'#186' Pedido'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 112
        Top = 38
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object Label4: TLabel
        Left = 20
        Top = 83
        Width = 73
        Height = 13
        Caption = 'Data do Pedido'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 118
        Top = 83
        Width = 79
        Height = 13
        Caption = 'Data de Entrega'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 203
        Top = 83
        Width = 67
        Height = 13
        Caption = 'Data de Envio'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 20
        Top = 125
        Width = 14
        Height = 13
        Caption = 'Via'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 111
        Top = 124
        Width = 26
        Height = 13
        Caption = 'Frete'
        FocusControl = DBEdit8
      end
      object DBText2: TDBText
        Left = 205
        Top = 146
        Width = 77
        Height = 17
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = DSPEDIDOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 251
        Top = 127
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object DBText3: TDBText
        Left = 253
        Top = 59
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = DSPEDIDOS
      end
      object DBText4: TDBText
        Left = 304
        Top = 102
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'SITUACAO'
        DataSource = DSPEDIDOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 304
        Top = 128
        Width = 59
        Height = 13
        Caption = 'Total Pedido'
      end
      object DBText5: TDBText
        Left = 304
        Top = 146
        Width = 65
        Height = 17
        Alignment = taRightJustify
        DataField = 'TOTAL_PEDIDO'
        DataSource = DSPEDIDOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 304
        Top = 83
        Width = 41
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object DBEdit1: TDBEdit
        Left = 20
        Top = 56
        Width = 77
        Height = 21
        DataField = 'ID_PEDIDO'
        DataSource = DSPEDIDOS
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 22
        Top = 100
        Width = 77
        Height = 21
        DataField = 'DT_DOPEDIDO'
        DataSource = DSPEDIDOS
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 112
        Top = 99
        Width = 77
        Height = 21
        DataField = 'DT_DEENTREGA'
        DataSource = DSPEDIDOS
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 203
        Top = 99
        Width = 77
        Height = 21
        DataField = 'DT_DEENVIO'
        DataSource = DSPEDIDOS
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 20
        Top = 141
        Width = 19
        Height = 21
        DataField = 'VIA'
        DataSource = DSPEDIDOS
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 111
        Top = 141
        Width = 77
        Height = 21
        DataField = 'FRETE'
        DataSource = DSPEDIDOS
        TabOrder = 6
      end
      object dblCliente: TDBLookupComboBox
        Left = 111
        Top = 57
        Width = 136
        Height = 21
        DataField = 'ID_ENTIDADE'
        DataSource = DSPEDIDOS
        DropDownWidth = 500
        KeyField = 'ID_ENTIDADE'
        ListField = 'INSCRICAO_FISCAL;NOME'
        ListSource = dsCliente
        TabOrder = 1
        OnExit = dblClienteExit
      end
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 640
        Height = 31
        Align = alTop
        AutoSize = True
        BevelInner = bvLowered
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 7
        object Label16: TLabel
          Left = 653
          Top = 8
          Width = 52
          Height = 13
          Caption = '0000/0000'
        end
        object DBNavigator1: TDBNavigator
          Left = 9
          Top = 2
          Width = 88
          Height = 25
          DataSource = DSPEDIDOS
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
        object Button1: TButton
          Left = 103
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 1
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 426
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 2
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 345
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Gravar'
          Enabled = False
          TabOrder = 3
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 183
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 4
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 264
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 5
          OnClick = Button5Click
        end
        object BtFechar: TButton
          Left = 507
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Fechamento'
          TabOrder = 6
          OnClick = BtFecharClick
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 193
      Width = 644
      Height = 258
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 2
      object Label9: TLabel
        Left = 184
        Top = 5
        Width = 70
        Height = 13
        Caption = 'Pre'#231'o Unitario '
        FocusControl = DBEdit2
      end
      object Label10: TLabel
        Left = 297
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Quantidade'
        FocusControl = DBEdit3
      end
      object Label11: TLabel
        Left = 368
        Top = 5
        Width = 45
        Height = 13
        Caption = 'Desconto'
        FocusControl = DBEdit9
      end
      object Label12: TLabel
        Left = 31
        Top = 5
        Width = 38
        Height = 13
        Caption = 'Produto'
      end
      object DBText1: TDBText
        Left = 471
        Top = 27
        Width = 106
        Height = 17
        Alignment = taRightJustify
        DataField = 'TOTALITEM'
        DataSource = dsItemPedido
      end
      object Panel4: TPanel
        Left = 2
        Top = 227
        Width = 640
        Height = 29
        Align = alBottom
        AutoSize = True
        BevelInner = bvLowered
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 5
        ExplicitTop = 223
        object Label3: TLabel
          Left = 651
          Top = 3
          Width = 52
          Height = 13
          Caption = '0000/0000'
        end
        object DBNavigator2: TDBNavigator
          Left = -3
          Top = 2
          Width = 100
          Height = 25
          DataSource = dsItemPedido
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
        object Button6: TButton
          Left = 103
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 1
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 339
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 2
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 258
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Gravar'
          Enabled = False
          TabOrder = 3
          OnClick = Button8Click
        end
        object Button10: TButton
          Left = 184
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 4
          OnClick = Button10Click
        end
      end
      object DBEdit2: TDBEdit
        Left = 182
        Top = 24
        Width = 97
        Height = 21
        DataField = 'PRECOUNITARIO'
        DataSource = dsItemPedido
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 297
        Top = 24
        Width = 56
        Height = 21
        DataField = 'QUANTIDADE'
        DataSource = dsItemPedido
        TabOrder = 2
        OnExit = DBEdit3Exit
      end
      object DBEdit9: TDBEdit
        Left = 368
        Top = 24
        Width = 97
        Height = 21
        DataField = 'DESCONTO'
        DataSource = dsItemPedido
        TabOrder = 3
      end
      object DBLCBProduto: TDBLookupComboBox
        Left = 31
        Top = 24
        Width = 145
        Height = 21
        DataField = 'ID_PRODUTO'
        DataSource = dsItemPedido
        DropDownRows = 14
        DropDownWidth = 540
        KeyField = 'PRODUTO'
        ListField = 'CODIGO;DESCRICAO'
        ListFieldIndex = 1
        ListSource = DSConsProdutos
        TabOrder = 0
        OnExit = DBLCBProdutoExit
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 50
        Width = 640
        Height = 177
        Align = alBottom
        DataSource = dsItemPedido
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taRightJustify
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECOUNITARIO'
            Title.Alignment = taRightJustify
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Desconto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_PEDIDO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_PRODUTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TOTALITEM'
            Title.Alignment = taRightJustify
            Visible = True
          end>
      end
    end
  end
  object DSPEDIDOS: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDPedidos
    OnDataChange = DSPEDIDOSDataChange
    Left = 784
    Top = 312
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDConsCliente
    Left = 792
    Top = 208
  end
  object DSProdutos: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDProdutos
    Left = 792
    Top = 256
  end
  object dsItemPedido: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDDetalheDoPedido
    Left = 792
    Top = 160
  end
  object DSConsProdutos: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FDConsProduto
    Left = 481
    Top = 105
  end
end
