object DM_testepratico: TDM_testepratico
  OldCreateOrder = False
  Height = 355
  Width = 516
  object FDCliente: TFDQuery
    AfterInsert = FDClienteAfterInsert
    AfterScroll = FDClienteAfterScroll
    Connection = fdcDB
    SQL.Strings = (
      'SELECT '
      'ID_ENTIDADE        ,'
      '    NOME            ,'
      '    INSCRICAO_FISCAL  ,'
      '    EMAIL              ,'
      '    TELEFONE           ,'
      '    TIPO_ENTIDADE      ,'
      '    PESSOA             ,'
      '    NASCIMENTO,'
      '    ID_USUARIO ,'
      '    STATUS,'
      '    case '
      '     when  STATUS=0 then '#39'Ativo'#39
      '    else '#39'Inativo'#39' end SITUACAO'
      'FROM ENTIDADE'
      'WHERE  TIPO_ENTIDADE = 300'
      ' ')
    Left = 168
    Top = 24
    object FDClienteID_ENTIDADE: TLargeintField
      DisplayLabel = 'Codigo'
      DisplayWidth = 6
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDClienteINSCRICAO_FISCAL: TStringField
      DisplayLabel = 'Inscri'#231#227'o Fiscal'
      DisplayWidth = 19
      FieldName = 'INSCRICAO_FISCAL'
      Origin = 'INSCRICAO_FISCAL'
      OnValidate = FDClienteINSCRICAO_FISCALValidate
      Size = 14
    end
    object FDClienteNOME: TStringField
      DisplayWidth = 18
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDClienteNASCIMENTO: TSQLTimeStampField
      DisplayLabel = 'Data Origem'
      DisplayWidth = 10
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
      EditMask = '!99/99/9999;1;_'
    end
    object FDClientePESSOA: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 3
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object FDClienteEMAIL: TStringField
      DisplayWidth = 30
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Visible = False
      Size = 200
    end
    object FDClienteTELEFONE: TStringField
      DisplayWidth = 16
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Visible = False
      EditMask = '!\(999\)0000-00000;0;_'
      Size = 16
    end
    object FDClienteTIPO_ENTIDADE: TIntegerField
      DisplayWidth = 13
      FieldName = 'TIPO_ENTIDADE'
      Origin = 'TIPO_ENTIDADE'
      Visible = False
    end
    object FDClienteID_USUARIO: TLargeintField
      DisplayWidth = 15
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Visible = False
    end
    object FDClienteSTATUS: TSmallintField
      DisplayWidth = 10
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Visible = False
    end
    object FDClienteSITUACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
  end
  object FDUsuario: TFDQuery
    Connection = fdcDB
    SQL.Strings = (
      'SELECT ID_USUARIO,'
      '       NOME,'
      '       LOGIN,'
      '       SENHA,'
      '       ATIVO,'
      '       CASE'
      '         WHEN ATIVO = 0 THEN '#39'Ativo'#39
      '         WHEN ATIVO = 1 THEN '#39'Inativo'#39
      '       END SITUACAO'
      'FROM   USUARIOS ')
    Left = 344
    Top = 32
    object FDUsuarioID_USUARIO: TLargeintField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 6
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0#####'
    end
    object FDUsuarioNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object FDUsuarioLOGIN: TStringField
      DisplayWidth = 10
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
    end
    object FDUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Visible = False
      Size = 30
    end
    object FDUsuarioATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Visible = False
    end
    object FDUsuarioSITUACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
  end
  object FD_login: TFDQuery
    Connection = fdcDB
    SQL.Strings = (
      'SELECT *'
      'FROM USUARIOS'
      'where LOGIN =:log'
      'and SENHA=:pw')
    Left = 56
    Top = 136
    ParamData = <
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = 'llima'
      end
      item
        Name = 'PW'
        DataType = ftString
        ParamType = ptInput
        Value = '1234'
      end>
    object LargeintField1: TLargeintField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 30
    end
    object SmallintField1: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
    end
  end
  object FDQuery3: TFDQuery
    AfterInsert = FDClienteAfterInsert
    Connection = fdcDB
    SQL.Strings = (
      'SELECT C.*,U.NOME AS USUARIO'
      'FROM CLIENTES C'
      'LEFT JOIN USUARIOS U ON U.ID_USUARIO = C.ID_USUARIO'
      '')
    Left = 416
    Top = 16
    object LargeintField2: TLargeintField
      DisplayLabel = 'codigo'
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object DateField1: TDateField
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
      Required = True
      EditMask = '99/99/9999'
    end
    object StringField5: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      EditMask = '(99)99999-9999;0'
      FixedChar = True
      Size = 11
    end
    object StringField6: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 150
    end
    object StringField7: TStringField
      DisplayLabel = 'TIPO'
      FieldName = 'END_TIPO_LOGRADOURO'
      Origin = 'END_TIPO_LOGRADOURO'
      Required = True
    end
    object StringField8: TStringField
      DisplayLabel = 'LOGRADOURO'
      FieldName = 'END_NOME_LOGRADOURO'
      Origin = 'END_NOME_LOGRADOURO'
      Required = True
      Size = 150
    end
    object StringField9: TStringField
      DisplayLabel = 'NUMERO'
      FieldName = 'END_NUMERO'
      Origin = 'END_NUMERO'
      Required = True
      Size = 10
    end
    object StringField10: TStringField
      DisplayLabel = 'COMPLEMENTO'
      FieldName = 'END_COMPLEMENTO'
      Origin = 'END_COMPLEMENTO'
      Size = 50
    end
    object StringField11: TStringField
      DisplayLabel = 'BAIRRO'
      FieldName = 'END_BAIRRO'
      Origin = 'END_BAIRRO'
      Required = True
      Size = 150
    end
    object StringField12: TStringField
      DisplayLabel = 'CIDADE'
      FieldName = 'END_CIDADE'
      Origin = 'END_CIDADE'
      Required = True
      Size = 150
    end
    object StringField13: TStringField
      DisplayLabel = 'UF'
      FieldName = 'END_UF'
      Origin = 'END_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object StringField14: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'END_CEP'
      Origin = 'END_CEP'
      Required = True
      EditMask = '99999-999;0'
      FixedChar = True
      Size = 8
    end
    object StringField15: TStringField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField16: TStringField
      DisplayLabel = 'INSCRICAOFISCAL'
      FieldName = 'INSCRICAO_FISCAL'
      Origin = 'INSCRICAO_FISCAL'
      Required = True
      Size = 14
    end
    object LargeintField3: TLargeintField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object FDQuery3USUARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object FDEndereco: TFDQuery
    Connection = fdcDB
    SQL.Strings = (
      'SELECT IDENDECO,'
      '       CEP,'
      '       LOGRADOURO,'
      '       NUMERO,'
      '       COMPLEMENTO,'
      '       BAIRRO,'
      '       CIDADE,'
      '       ESTADO,'
      '       PAIS,'
      '       TIPO_LOGRADOURO,'
      '       ID_ENTIDADE'
      'FROM   ENDERECO'
      'WHERE  ID_ENTIDADE = :ID_ENTIDADE ')
    Left = 160
    Top = 88
    ParamData = <
      item
        Name = 'ID_ENTIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDEnderecoIDENDECO: TIntegerField
      FieldName = 'IDENDECO'
      Origin = 'IDENDECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDEnderecoCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object FDEnderecoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object FDEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object FDEnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object FDEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object FDEnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object FDEnderecoESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object FDEnderecoPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Size = 40
    end
    object FDEnderecoTIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
      Origin = 'TIPO_LOGRADOURO'
      Size = 10
    end
    object FDEnderecoID_ENTIDADE: TLargeintField
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
    end
  end
  object FDFornecedor: TFDQuery
    AfterInsert = FDFornecedorAfterInsert
    AfterScroll = FDFornecedorAfterScroll
    Connection = fdcDB
    SQL.Strings = (
      'SELECT '
      'ID_ENTIDADE        ,'
      '    NOME            ,'
      '    INSCRICAO_FISCAL  ,'
      '    EMAIL              ,'
      '    TELEFONE           ,'
      '    TIPO_ENTIDADE      ,'
      '    PESSOA             ,'
      '    NASCIMENTO,'
      '    ID_USUARIO,'
      '    STATUS,'
      '    case '
      '     when  STATUS=0 then '#39'Ativo'#39
      '    else '#39'Inativo'#39' end SITUACAO'
      'FROM ENTIDADE'
      'WHERE  TIPO_ENTIDADE = 600'
      ' ')
    Left = 160
    Top = 152
    object FDFornecedorID_ENTIDADE: TLargeintField
      DisplayLabel = 'Codigo'
      DisplayWidth = 6
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDFornecedorINSCRICAO_FISCAL: TStringField
      DisplayWidth = 19
      FieldName = 'INSCRICAO_FISCAL'
      Origin = 'INSCRICAO_FISCAL'
      OnValidate = FDFornecedorINSCRICAO_FISCALValidate
      Size = 14
    end
    object FDFornecedorNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Visible = False
      Size = 200
    end
    object FDFornecedorTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Visible = False
      EditMask = '!\(999\)0000-00000;0;_'
      Size = 16
    end
    object FDFornecedorTIPO_ENTIDADE: TIntegerField
      FieldName = 'TIPO_ENTIDADE'
      Origin = 'TIPO_ENTIDADE'
      Visible = False
    end
    object FDFornecedorPESSOA: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object FDFornecedorNASCIMENTO: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
      EditMask = ' !99/99/9999;1;_'
    end
    object FDFornecedorID_USUARIO: TLargeintField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Visible = False
    end
    object FDFornecedorSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Visible = False
    end
    object FDFornecedorSITUACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
  end
  object FDPedidos: TFDQuery
    AfterInsert = FDPedidosAfterInsert
    AfterPost = FDPedidosAfterPost
    AfterScroll = FDPedidosAfterScroll
    Connection = fdcDB
    SQL.Strings = (
      'SELECT PD.ID_PEDIDO,'
      '       PD.ID_ENTIDADE,'
      '       PD.ID_USUARIO,'
      '       PD.DT_DOPEDIDO,'
      '       PD.DT_DEENTREGA,'
      '       PD.DT_DEENVIO,'
      '       PD.VIA,'
      '       PD.FRETE,'
      '       PD.STATUS,'
      
        '       COALESCE(Sum(( DDP.QUANTIDADE * ( DDP.PRECOUNITARIO - DDP' +
        '.desconto ) ) ), 0.00)  TOTAL,'
      '       PD.FRETE'
      
        '       + COALESCE(Sum(( DDP.QUANTIDADE * ( DDP.PRECOUNITARIO - D' +
        'DP.desconto  ) ) ), 0.00)      TOTAL_PEDIDO,'
      '       CASE'
      '         WHEN PD.STATUS = 0 THEN '#39'PEDIDO'#39
      '         WHEN PD.STATUS = 1 THEN '#39'FATURADO'#39
      '         WHEN PD.STATUS = 2 THEN '#39'ENVIADO'#39
      '         WHEN PD.STATUS = 3 THEN '#39'ENCERRADO'#39
      '         WHEN PD.STATUS = 4 THEN '#39'CANCELADO'#39
      '       END                               SITUACAO,'
      '       ET.INSCRICAO_FISCAL,'
      '       ET.NOME'
      'FROM   PEDIDOS PD'
      '       LEFT JOIN DETALHESDOPEDIDO DDP'
      '              ON DDP.ID_PEDIDO = PD.ID_PEDIDO'
      '       LEFT JOIN ENTIDADE ET'
      '              ON ET.ID_ENTIDADE = PD.ID_ENTIDADE'
      'WHERE  PD.STATUS = :STATUS'
      'GROUP  BY PD.ID_PEDIDO,'
      '          PD.ID_ENTIDADE,'
      '          PD.ID_USUARIO,'
      '          PD.DT_DOPEDIDO,'
      '          PD.DT_DEENTREGA,'
      '          PD.DT_DEENVIO,'
      '          PD.VIA,'
      '          PD.FRETE,'
      '          PD.STATUS,'
      '          ET.INSCRICAO_FISCAL,'
      '          ET.NOME ')
    Left = 368
    Top = 104
    ParamData = <
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
    object FDPedidosID_PEDIDO: TLargeintField
      DisplayLabel = 'N'#186' Pedido'
      DisplayWidth = 8
      FieldName = 'ID_PEDIDO'
      Origin = 'ID_PEDIDO'
      Required = True
      DisplayFormat = '0#####'
    end
    object FDPedidosID_ENTIDADE: TLargeintField
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
      Visible = False
    end
    object FDPedidosID_USUARIO: TLargeintField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Visible = False
    end
    object FDPedidosDT_DOPEDIDO: TSQLTimeStampField
      DisplayLabel = 'Data do Pedido'
      DisplayWidth = 18
      FieldName = 'DT_DOPEDIDO'
      Origin = 'DT_DOPEDIDO'
      EditMask = ' !99/99/9999;1;_'
    end
    object FDPedidosINSCRICAO_FISCAL: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Inscri'#231#227'o Fiscal'
      DisplayWidth = 10
      FieldName = 'INSCRICAO_FISCAL'
      Origin = 'INSCRICAO_FISCAL'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 14
    end
    object FDPedidosNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome/ Raz'#227'o Social '
      DisplayWidth = 20
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 50
    end
    object FDPedidosDT_DEENTREGA: TSQLTimeStampField
      DisplayLabel = 'Data de Entrega'
      DisplayWidth = 10
      FieldName = 'DT_DEENTREGA'
      Origin = 'DT_DEENTREGA'
      Visible = False
      EditMask = ' !99/99/9999;1;_'
    end
    object FDPedidosDT_DEENVIO: TSQLTimeStampField
      DisplayLabel = 'Data de Envio'
      DisplayWidth = 10
      FieldName = 'DT_DEENVIO'
      Origin = 'DT_DEENVIO'
      Visible = False
      EditMask = ' !99/99/9999;1;_'
    end
    object FDPedidosVIA: TSmallintField
      DisplayWidth = 3
      FieldName = 'VIA'
      Origin = 'VIA'
      Visible = False
    end
    object FDPedidosFRETE: TFMTBCDField
      DisplayLabel = 'Frete'
      DisplayWidth = 10
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Visible = False
      DisplayFormat = ',#0.00;1'
      EditFormat = ',#0.00;1;'
      Precision = 18
      Size = 2
    end
    object FDPedidosTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Total'
      DisplayWidth = 10
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      DisplayFormat = ',#0.00;1'
      Precision = 18
      Size = 2
    end
    object FDPedidosSTATUS: TSmallintField
      DisplayWidth = 5
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Visible = False
    end
    object FDPedidosTOTAL_PEDIDO: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Total Pedido'
      DisplayWidth = 12
      FieldName = 'TOTAL_PEDIDO'
      Origin = 'TOTAL_PEDIDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',#0.00;1'
      EditFormat = ',#0.00;1'
      Precision = 18
      Size = 2
    end
    object FDPedidosSITUACAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
  end
  object FDDetalheDoPedido: TFDQuery
    AfterInsert = FDDetalheDoPedidoAfterInsert
    BeforePost = FDDetalheDoPedidoBeforePost
    AfterPost = FDDetalheDoPedidoAfterPost
    AfterCancel = FDDetalheDoPedidoAfterCancel
    BeforeDelete = FDDetalheDoPedidoBeforeDelete
    AfterDelete = FDDetalheDoPedidoAfterDelete
    AfterScroll = FDDetalheDoPedidoAfterScroll
    Connection = fdcDB
    SQL.Strings = (
      'SELECT DDP.ID_DETALHEDOPEDIDO,'
      '       DDP.PRECOUNITARIO,'
      '       DDP.QUANTIDADE,'
      '       DDP.DESCONTO,'
      '       DDP.ID_PEDIDO,'
      '       DDP.ID_PRODUTO,'
      
        '       COALESCE( (DDP.QUANTIDADE *( DDP.PRECOUNITARIO  - DDP.des' +
        'conto ) ),0.00) TOTALITEM'
      '       ,COALESCE( PR.descricao ,'#39#39') descricao'
      'FROM   DETALHESDOPEDIDO DDP'
      'LEFT JOIN  PRODUTOS PR ON PR.PRODUTO = DDP.ID_PRODUTO'
      'WHERE  DDP.ID_PEDIDO = :ID_PEDIDO '
      'ORDER BY DDP.ID_DETALHEDOPEDIDO')
    Left = 368
    Top = 160
    ParamData = <
      item
        Name = 'ID_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 4
      end>
    object FDDetalheDoPedidoID_DETALHEDOPEDIDO: TLargeintField
      FieldName = 'ID_DETALHEDOPEDIDO'
      Origin = 'ID_DETALHEDOPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDDetalheDoPedidoPRECOUNITARIO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o Unitario '
      FieldName = 'PRECOUNITARIO'
      Origin = 'PRECOUNITARIO'
      Required = True
      DisplayFormat = ',#0.00;1'
      EditFormat = '#0.00;1;_'
      Precision = 18
      Size = 2
    end
    object FDDetalheDoPedidoQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object FDDetalheDoPedidoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      DisplayFormat = ',#0.00;1'
      EditFormat = '#0.00;1;_'
      Precision = 18
      Size = 2
    end
    object FDDetalheDoPedidoID_PEDIDO: TLargeintField
      FieldName = 'ID_PEDIDO'
      Origin = 'ID_PEDIDO'
      Required = True
    end
    object FDDetalheDoPedidoID_PRODUTO: TLargeintField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object FDDetalheDoPedidoTOTALITEM: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Total Unitario'
      DisplayWidth = 19
      FieldName = 'TOTALITEM'
      Origin = 'TOTALITEM'
      ProviderFlags = []
      DisplayFormat = ',#0.00;1'
      EditFormat = '#0.00;1;_'
      Precision = 18
      Size = 2
    end
    object FDDetalheDoPedidoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 30
    end
  end
  object FDProdutos: TFDQuery
    Connection = fdcDB
    SQL.Strings = (
      'SELECT PRODUTO,'
      '       CODIGO,'
      '       DESCRICAO,'
      '       ID_ENTIDADE,'
      '       PRECOUNITARIO,'
      '       UNIDADEEMESTOQUE,'
      '       UNIDADEDEPEDIDOS,'
      '       UNIDADEDEVOLUCAO,'
      
        '       Cast(( ( PR.UNIDADEEMESTOQUE - PR.UNIDADEDEPEDIDOS ) + PR' +
        '.UNIDADEDEVOLUCAO ) * ( Cast ('
      
        '                 1 - ( PR.PERCSEGURACAO / 100.00 ) AS NUMERIC(10' +
        ', 4)) ) AS SMALLINT) Disponivel,'
      '       PERCSEGURACAO,'
      '       STATUS'
      'FROM   PRODUTOS PR ')
    Left = 264
    Top = 64
    object FDProdutosPRODUTO: TIntegerField
      DisplayWidth = 6
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object FDProdutosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 15
    end
    object FDProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDProdutosID_ENTIDADE: TLargeintField
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
      Visible = False
    end
    object FDProdutosPRECOUNITARIO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o Unitario '
      DisplayWidth = 14
      FieldName = 'PRECOUNITARIO'
      Origin = 'PRECOUNITARIO'
      DisplayFormat = '#,###.00;0;_'
      EditFormat = '#0.00;1;_'
      Precision = 18
      Size = 2
    end
    object FDProdutosUNIDADEEMESTOQUE: TSmallintField
      DisplayLabel = 'Un Estoque '
      DisplayWidth = 7
      FieldName = 'UNIDADEEMESTOQUE'
      Origin = 'UNIDADEEMESTOQUE'
    end
    object FDProdutosUNIDADEDEPEDIDOS: TSmallintField
      DisplayLabel = 'Un Pedidos'
      DisplayWidth = 7
      FieldName = 'UNIDADEDEPEDIDOS'
      Origin = 'UNIDADEDEPEDIDOS'
    end
    object FDProdutosUNIDADEDEVOLUCAO: TSmallintField
      DisplayLabel = 'Un Devolu'#231#227'o'
      DisplayWidth = 7
      FieldName = 'UNIDADEDEVOLUCAO'
      Origin = 'UNIDADEDEVOLUCAO'
    end
    object FDProdutosSTATUS: TSmallintField
      DisplayLabel = 'Situacao'
      DisplayWidth = 7
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object FDProdutosPERCSEGURACAO: TIntegerField
      DisplayLabel = '% seguro'
      DisplayWidth = 7
      FieldName = 'PERCSEGURACAO'
      Origin = 'PERCSEGURACAO'
    end
    object FDProdutosDISPONIVEL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DISPONIVEL'
      Origin = 'DISPONIVEL'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object fdcDB: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      
        'Database=C:\Users\slima\Documents\Guarani Sistemas\DBsergio\TEST' +
        'EDB.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 57
    Top = 17
  end
  object FDConsProduto: TFDQuery
    Connection = fdcDB
    SQL.Strings = (
      'SELECT PR.PRODUTO,'
      '       PR.CODIGO,'
      '       PR.DESCRICAO,'
      '       PR.PRECOUNITARIO,'
      
        '       Cast(( ( PR.UNIDADEEMESTOQUE - PR.UNIDADEDEPEDIDOS ) + PR' +
        '.UNIDADEDEVOLUCAO ) * ( Cast ('
      
        '                 1 - ( PR.PERCSEGURACAO / 100.00 ) AS NUMERIC(10' +
        ', 4)) ) AS SMALLINT) Disponivel'
      'FROM   PRODUTOS PR'
      'WHERE  NOT EXISTS (SELECT DDPI.ID_PRODUTO'
      '                   FROM   DETALHESDOPEDIDO DDPI'
      '                   WHERE  PR.PRODUTO = DDPI.ID_PRODUTO'
      '                          AND DDPI.ID_PEDIDO = :id_pedido)'
      '       AND STATUS = 0'
      'ORDER  BY 3 ')
    Left = 216
    Top = 216
    ParamData = <
      item
        Name = 'ID_PEDIDO'
        DataType = ftLargeint
        ParamType = ptInput
        Value = 0
      end>
    object FDConsProdutoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDConsProdutoCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 15
    end
    object FDConsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDConsProdutoPRECOUNITARIO: TFMTBCDField
      FieldName = 'PRECOUNITARIO'
      Origin = 'PRECOUNITARIO'
      Precision = 18
      Size = 2
    end
    object FDConsProdutoDISPONIVEL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DISPONIVEL'
      Origin = 'DISPONIVEL'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDConsCliente: TFDQuery
    AfterInsert = FDClienteAfterInsert
    AfterScroll = FDClienteAfterScroll
    Connection = fdcDB
    SQL.Strings = (
      'SELECT '
      'ID_ENTIDADE        ,'
      '    NOME            ,'
      '    INSCRICAO_FISCAL  ,'
      '    EMAIL              ,'
      '    TELEFONE           ,'
      '    TIPO_ENTIDADE      ,'
      '    PESSOA             ,'
      '    NASCIMENTO,'
      '    ID_USUARIO ,'
      '    STATUS'
      'FROM ENTIDADE'
      'WHERE  TIPO_ENTIDADE = 300')
    Left = 320
    Top = 216
    object LargeintField4: TLargeintField
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField17: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object StringField18: TStringField
      DisplayWidth = 19
      FieldName = 'INSCRICAO_FISCAL'
      Origin = 'INSCRICAO_FISCAL'
      Size = 14
    end
    object StringField19: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 200
    end
    object StringField20: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '!\(999\)0000-00000;0;_'
      Size = 16
    end
    object IntegerField1: TIntegerField
      FieldName = 'TIPO_ENTIDADE'
      Origin = 'TIPO_ENTIDADE'
    end
    object StringField21: TStringField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
      EditMask = '!99/99/9999;1;_'
    end
    object LargeintField5: TLargeintField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object SmallintField2: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
  end
end
