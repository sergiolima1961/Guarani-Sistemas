unit uDM_testePratico;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM_testepratico = class(TDataModule)
    FDCliente: TFDQuery;
    FDUsuario: TFDQuery;
    FDUsuarioID_USUARIO: TLargeintField;
    FDUsuarioNOME: TStringField;
    FDUsuarioLOGIN: TStringField;
    FDUsuarioSENHA: TStringField;
    FDUsuarioATIVO: TSmallintField;
    FD_login: TFDQuery;
    LargeintField1: TLargeintField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    SmallintField1: TSmallintField;
    FDQuery3: TFDQuery;
    LargeintField2: TLargeintField;
    StringField4: TStringField;
    DateField1: TDateField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    LargeintField3: TLargeintField;
    FDQuery3USUARIO: TStringField;
    FDClienteID_ENTIDADE: TLargeintField;
    FDClienteNOME: TStringField;
    FDClienteINSCRICAO_FISCAL: TStringField;
    FDClienteEMAIL: TStringField;
    FDClienteTELEFONE: TStringField;
    FDClienteTIPO_ENTIDADE: TIntegerField;
    FDClientePESSOA: TStringField;
    FDEndereco: TFDQuery;
    FDEnderecoIDENDECO: TIntegerField;
    FDEnderecoCEP: TStringField;
    FDEnderecoLOGRADOURO: TStringField;
    FDEnderecoNUMERO: TStringField;
    FDEnderecoCOMPLEMENTO: TStringField;
    FDEnderecoBAIRRO: TStringField;
    FDEnderecoCIDADE: TStringField;
    FDEnderecoESTADO: TStringField;
    FDEnderecoPAIS: TStringField;
    FDEnderecoTIPO_LOGRADOURO: TStringField;
    FDEnderecoID_ENTIDADE: TLargeintField;
    FDClienteNASCIMENTO: TSQLTimeStampField;
    FDClienteID_USUARIO: TLargeintField;
    FDFornecedor: TFDQuery;
    FDFornecedorID_ENTIDADE: TLargeintField;
    FDFornecedorNOME: TStringField;
    FDFornecedorINSCRICAO_FISCAL: TStringField;
    FDFornecedorEMAIL: TStringField;
    FDFornecedorTELEFONE: TStringField;
    FDFornecedorTIPO_ENTIDADE: TIntegerField;
    FDFornecedorPESSOA: TStringField;
    FDFornecedorNASCIMENTO: TSQLTimeStampField;
    FDFornecedorID_USUARIO: TLargeintField;
    FDPedidos: TFDQuery;
    FDPedidosID_PEDIDO: TLargeintField;
    FDPedidosID_ENTIDADE: TLargeintField;
    FDPedidosID_USUARIO: TLargeintField;
    FDPedidosDT_DOPEDIDO: TSQLTimeStampField;
    FDPedidosDT_DEENTREGA: TSQLTimeStampField;
    FDPedidosDT_DEENVIO: TSQLTimeStampField;
    FDPedidosVIA: TSmallintField;
    FDDetalheDoPedido: TFDQuery;
    FDDetalheDoPedidoID_DETALHEDOPEDIDO: TLargeintField;
    FDDetalheDoPedidoPRECOUNITARIO: TFMTBCDField;
    FDDetalheDoPedidoQUANTIDADE: TIntegerField;
    FDDetalheDoPedidoDESCONTO: TFMTBCDField;
    FDDetalheDoPedidoID_PEDIDO: TLargeintField;
    FDDetalheDoPedidoID_PRODUTO: TLargeintField;
    FDProdutos: TFDQuery;
    FDProdutosPRODUTO: TIntegerField;
    FDProdutosCODIGO: TStringField;
    FDProdutosDESCRICAO: TStringField;
    FDProdutosID_ENTIDADE: TLargeintField;
    FDProdutosPRECOUNITARIO: TFMTBCDField;
    FDProdutosUNIDADEEMESTOQUE: TSmallintField;
    FDProdutosUNIDADEDEPEDIDOS: TSmallintField;
    FDClienteSTATUS: TSmallintField;
    FDPedidosSTATUS: TSmallintField;
    FDFornecedorSTATUS: TSmallintField;
    FDProdutosSTATUS: TSmallintField;
    FDDetalheDoPedidoTOTALITEM: TFMTBCDField;
    FDPedidosTOTAL: TFMTBCDField;
    FDDetalheDoPedidoDESCRICAO: TStringField;
    fdcDB: TFDConnection;
    FDPedidosFRETE: TFMTBCDField;
    FDPedidosSITUACAO: TStringField;
    FDPedidosTOTAL_PEDIDO: TFMTBCDField;
    FDPedidosINSCRICAO_FISCAL: TStringField;
    FDPedidosNOME: TStringField;
    FDProdutosUNIDADEDEVOLUCAO: TSmallintField;
    FDProdutosPERCSEGURACAO: TIntegerField;
    FDConsProduto: TFDQuery;
    FDConsProdutoPRODUTO: TIntegerField;
    FDConsProdutoCODIGO: TStringField;
    FDConsProdutoDESCRICAO: TStringField;
    FDConsProdutoPRECOUNITARIO: TFMTBCDField;
    FDUsuarioSITUACAO: TStringField;
    FDConsCliente: TFDQuery;
    LargeintField4: TLargeintField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    IntegerField1: TIntegerField;
    StringField21: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    LargeintField5: TLargeintField;
    SmallintField2: TSmallintField;
    FDProdutosDISPONIVEL: TSmallintField;
    FDConsProdutoDISPONIVEL: TSmallintField;
    FDClienteSITUACAO: TStringField;
    FDFornecedorSITUACAO: TStringField;
    procedure FDClienteAfterInsert(DataSet: TDataSet);
    procedure FDClienteAfterScroll(DataSet: TDataSet);
    procedure FDFornecedorAfterInsert(DataSet: TDataSet);
    procedure FDFornecedorAfterScroll(DataSet: TDataSet);
    procedure FDPedidosAfterInsert(DataSet: TDataSet);
    procedure FDDetalheDoPedidoAfterInsert(DataSet: TDataSet);
    procedure FDDetalheDoPedidoBeforePost(DataSet: TDataSet);
    procedure FDDetalheDoPedidoBeforeDelete(DataSet: TDataSet);
    procedure FDDetalheDoPedidoAfterScroll(DataSet: TDataSet);
    procedure FDDetalheDoPedidoAfterPost(DataSet: TDataSet);
    procedure FDPedidosAfterPost(DataSet: TDataSet);
    procedure FDPedidosAfterScroll(DataSet: TDataSet);
    procedure FDClienteINSCRICAO_FISCALValidate(Sender: TField);
    procedure FDFornecedorINSCRICAO_FISCALValidate(Sender: TField);
    procedure FDDetalheDoPedidoAfterCancel(DataSet: TDataSet);
    procedure FDDetalheDoPedidoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_testepratico: TDM_testepratico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses CadCliente, Main,
  InscricaoFiscal;

{$R *.dfm}

procedure TDM_testepratico.FDClienteAfterInsert(DataSet: TDataSet);
begin
  FDClienteID_USUARIO.Value := FD_login.FieldByName('ID_USUARIO').Value;
  FDClienteTIPO_ENTIDADE.Value := 300;
end;

procedure TDM_testepratico.FDClienteAfterScroll(DataSet: TDataSet);
begin
  if not FDCliente.FieldByName('ID_ENTIDADE').IsNull then
  begin
    FDEndereco.Close;
    FDEndereco.Params.ParamByName('ID_ENTIDADE').AsInteger :=
      FDCliente.FieldByName('ID_ENTIDADE').Value;
    FDEndereco.open;

    if FDClientePESSOA.Value = 'F' then
    Begin
      FDClienteINSCRICAO_FISCAL.EditMask :=
        '999.999.999-99;0;_';
    End
    else if FDClientePESSOA.Value = 'J' then
    begin
      DM_testepratico.FDClienteINSCRICAO_FISCAL.EditMask :=
        '99.999.999/9999-99;0;_';
    end;

  end;

end;

procedure TDM_testepratico.FDClienteINSCRICAO_FISCALValidate(Sender: TField);
var
  oValidador: TInscricaoFiscal;
begin
  oValidador := nil;

  try
    if DM_testepratico.FDClientePESSOA.Value = 'F' then
    begin
      oValidador := TCPF.Create;
    end;

    if DM_testepratico.FDClientePESSOA.Value = 'J' then
    begin
      oValidador := TCNPJ.Create;
    end;

    if not Assigned(oValidador) then
      raise Exception.Create('O tipo de pessoa não foi definido');

    if Assigned(oValidador) and not oValidador.DocumentoValido(Sender.AsString)
    then
      raise Exception.Create('Documento inválido');
  finally
    if Assigned(oValidador) then
      oValidador.Free;
  end;

end;

procedure TDM_testepratico.FDDetalheDoPedidoAfterCancel(DataSet: TDataSet);
begin
  FDPedidos.Filtered := false;
  FDPedidos.Filter := ' ID_PEDIDO = ' + FDDetalheDoPedidoID_PEDIDO.AsString;
  FDDetalheDoPedido.Close;
  FDPedidos.Close;
  FDPedidos.open;
  FDPedidos.Filtered := true;
  FDDetalheDoPedido.open;
  FDPedidos.Filtered := false;

end;

procedure TDM_testepratico.FDDetalheDoPedidoAfterDelete(DataSet: TDataSet);
begin
  FDPedidos.Close;
  FDPedidos.open;
  FDPedidos.Filtered := true;
  FDPedidos.Filtered := false;
end;

procedure TDM_testepratico.FDDetalheDoPedidoAfterInsert(DataSet: TDataSet);
begin
  FDDetalheDoPedido.FieldByName('ID_DETALHEDOPEDIDO').Value :=
    fMain.GeneratorID('GEN_DETALHESDOPEDIDO_ID', true);
  FDDetalheDoPedidoID_PEDIDO.Value := FDPedidosID_PEDIDO.Value;
end;

procedure TDM_testepratico.FDDetalheDoPedidoAfterPost(DataSet: TDataSet);
begin

  FDPedidos.Filtered := false;
  FDPedidos.Filter := ' ID_PEDIDO = ' + FDDetalheDoPedidoID_PEDIDO.AsString;
  FDDetalheDoPedido.Close;
  FDPedidos.Close;
  FDPedidos.open;
  FDPedidos.Filtered := true;
  FDDetalheDoPedido.open;
  FDPedidos.Filtered := false;

end;

procedure TDM_testepratico.FDDetalheDoPedidoAfterScroll(DataSet: TDataSet);
begin
  DM_testepratico.FDConsProduto.Close;
  DM_testepratico.FDConsProduto.Params.ParamByName('ID_PEDIDO').Value :=
    FDPedidos.FieldByName('ID_PEDIDO').Value;
  DM_testepratico.FDConsProduto.open;
end;

procedure TDM_testepratico.FDDetalheDoPedidoBeforeDelete(DataSet: TDataSet);
begin
  FDProdutos.Filtered := false;
  FDProdutos.Filter := ' PRODUTO = ' + FDDetalheDoPedidoID_PRODUTO.AsString;
  FDProdutos.Filtered := true;

  FDProdutos.Edit;
  FDProdutosUNIDADEDEVOLUCAO.Value := FDProdutosUNIDADEDEVOLUCAO.Value +
    FDDetalheDoPedidoQUANTIDADE.Value;
  FDProdutos.Post;
  FDProdutos.Filtered := false;

  FDPedidos.Filtered := false;
  FDPedidos.Filter := ' ID_PEDIDO = ' + FDDetalheDoPedidoID_PEDIDO.AsString;

end;

procedure TDM_testepratico.FDDetalheDoPedidoBeforePost(DataSet: TDataSet);
begin
  FDProdutos.Filtered := false;
  FDProdutos.Filter := ' PRODUTO = ' + FDDetalheDoPedidoID_PRODUTO.AsString;
  FDProdutos.Filtered := true;

  FDProdutos.Edit;
  FDProdutosUNIDADEDEPEDIDOS.Value := FDProdutosUNIDADEDEPEDIDOS.Value +
    FDDetalheDoPedidoQUANTIDADE.Value;
  FDProdutos.Post;
  FDProdutos.Filtered := false;

end;

procedure TDM_testepratico.FDFornecedorAfterInsert(DataSet: TDataSet);
begin
  FDFornecedor.FieldByName('ID_USUARIO').Value :=
    FD_login.FieldByName('ID_USUARIO').Value;
  FDFornecedor.FieldByName('TIPO_ENTIDADE').Value := 600;
end;

procedure TDM_testepratico.FDFornecedorAfterScroll(DataSet: TDataSet);
begin
  if not FDFornecedor.FieldByName('ID_ENTIDADE').IsNull then
  begin
    FDEndereco.Close;
    FDEndereco.Params.ParamByName('ID_ENTIDADE').AsInteger :=
      FDFornecedor.FieldByName('ID_ENTIDADE').Value;
    FDEndereco.open;

    if DM_testepratico.FDFornecedorPESSOA.Value = 'F' then
    Begin
      DM_testepratico.FDFornecedorINSCRICAO_FISCAL.EditMask :=
        '999.999.999-99;0;_';
    End
    else if DM_testepratico.FDFornecedorPESSOA.Value = 'J' then
    begin
      DM_testepratico.FDFornecedorINSCRICAO_FISCAL.EditMask :=
        '99.999.999/9999-99;0;_';
    end;

  end;

end;

procedure TDM_testepratico.FDFornecedorINSCRICAO_FISCALValidate(Sender: TField);
var
  oValidador: TInscricaoFiscal;
begin
  oValidador := nil;

  try
    if DM_testepratico.FDFornecedorPESSOA.Value = 'F' then
    begin
      oValidador := TCPF.Create;
    end;

    if DM_testepratico.FDFornecedorPESSOA.Value = 'J' then
    begin
      oValidador := TCNPJ.Create;
    end;

    if not Assigned(oValidador) then
      raise Exception.Create('O tipo de pessoa não foi definido');

    if Assigned(oValidador) and not oValidador.DocumentoValido(Sender.AsString)
    then
      raise Exception.Create('Documento inválido');
  finally
    if Assigned(oValidador) then
      oValidador.Free;
  end;

end;

procedure TDM_testepratico.FDPedidosAfterInsert(DataSet: TDataSet);
begin

  FDPedidosID_USUARIO.Value := FD_login.FieldByName('ID_USUARIO').Value;

end;

procedure TDM_testepratico.FDPedidosAfterPost(DataSet: TDataSet);
begin
  if not FDPedidos.FieldByName('ID_PEDIDO').IsNull then
  begin
    DM_testepratico.FDDetalheDoPedido.Close;
    DM_testepratico.FDDetalheDoPedido.Params.ParamByName('ID_PEDIDO').Value :=
      FDPedidos.FieldByName('ID_PEDIDO').Value;
    DM_testepratico.FDDetalheDoPedido.open;
  end;

end;

procedure TDM_testepratico.FDPedidosAfterScroll(DataSet: TDataSet);
begin
  DM_testepratico.FDDetalheDoPedido.Close;
  DM_testepratico.FDDetalheDoPedido.Params.ParamByName('ID_PEDIDO').Value :=
    DM_testepratico.FDPedidos.FieldByName('ID_PEDIDO').Value;
  DM_testepratico.FDDetalheDoPedido.open;

end;

end.
