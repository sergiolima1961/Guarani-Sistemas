unit CadCliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  // Units Necessárias
  FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Xml.xmldom, Xml.XmlTransform, Xml.XMLIntf, Xml.XMLDoc,
  FireDAC.VCLUI.Wait, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdTelnet, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdBaseComponent, IdMessage,

  IdText, IdAttachmentFile, Vcl.ComCtrls, IdCustomTCPServer,
  IdSocksServer, IdHTTP, Vcl.Grids, Vcl.DBGrids;

type
  TEnderecoCompleto = record
    CEP, logradouro, complemento, bairro, localidade, uf, unidade,
      IBGE: string end;

  type
    TfCadCliente = class(TForm)
      DS_CLIENTE: TDataSource;
      Svd1: TSaveDialog;
      OpenDialog1: TOpenDialog;
      XMLDocument1: TXMLDocument;
      IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
      IdSMTP: TIdSMTP;
      IdHTTP: TIdHTTP;
      IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
      DS_LOGRADOURO: TDataSource;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit12: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit14: TDBEdit;
    Panel1: TPanel;
    Label16: TLabel;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    Button_Buscar_Cep: TButton;
    Label15: TLabel;
      procedure Button1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
      procedure FDQuery1EMAILValidate(Sender: TField);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Button_Buscar_CepClick(Sender: TObject);
      procedure FDQuery1AfterInsert(DataSet: TDataSet);
      procedure FDQuery1AfterPost(DataSet: TDataSet);
      procedure FDQuery1AfterCancel(DataSet: TDataSet);
      procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
      procedure FDQuery1AfterEdit(DataSet: TDataSet);
      procedure Button4Click(Sender: TObject);
      procedure Button5Click(Sender: TObject);
      procedure DBRadioGroup1Exit(Sender: TObject);
      procedure FDQuery1AfterScroll(DataSet: TDataSet);
      procedure DS_CLIENTEDataChange(Sender: TObject; Field: TField);

    private
      { Private declarations }
      function GeneratorID(aName: string; Incrementa: Boolean): integer;

    var
      dadosEnderecoCompleto: TEnderecoCompleto;

    const
      sFrom = 'sergiolima.lima90@gmail.com'; // seu email
      sHost = 'smtp.gmail.com';
      iPort = 587;
      sUserName = ''; // email gmail
      sPassword = ''; // senha app

      procedure ConsultaCEP(CEP: String);
      procedure mensagemAviso(mensagem: string);
      procedure Preparo_Email(id: integer);
      procedure EnviarEmail(AAssunto, aanexo: String);

    public
      { Public declarations }
    end;

  var
    fCadCliente: TfCadCliente;

implementation

{$R *.dfm}

uses
  Main,
  System.RegularExpressions,
  InscricaoFiscal, uDM_testePratico;

procedure TfCadCliente.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);

  DM_testepratico.FDCLIENTE.Append;
  DM_testepratico.FDENDERECO.Append;

  DM_testepratico.FDCLIENTE.FieldByName('ID_ENTIDADE').Value :=
    GeneratorID('GEN_ENTIDADE_ID', true);

  DM_testepratico.FDENDERECO.FieldByName('IDENDECO').Value :=
    GeneratorID('GEN_ENDERECO_ID', true);

  DM_testepratico.FDENDERECO.FieldByName('ID_ENTIDADE').Value :=
    DM_testepratico.FDCLIENTE.FieldByName('ID_ENTIDADE').Value;

end;

procedure TfCadCliente.Button2Click(Sender: TObject);
begin
  DM_testepratico.FDCLIENTE.Cancel;
  DM_testepratico.FDENDERECO.Cancel;
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.Button3Click(Sender: TObject);
begin

  try
    DM_testepratico.fdcDB.StartTransaction;
    DM_testepratico.FDCLIENTE.Post;
    DM_testepratico.FDENDERECO.Post;
    DM_testepratico.fdcDB.Commit;
  except
    On E: Exception do
    begin
      ShowMessage(
        'Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
      DM_testepratico.fdcDB.Rollback;
    end;
  end;

  Button1.Enabled := true;
  DBGrid1.Enabled := (Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.Button4Click(Sender: TObject);
begin
  DBGrid1.Enabled := false;
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBGrid1.Enabled := (Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
  DM_testepratico.FDCLIENTE.Edit;
  DM_testepratico.FDENDERECO.Edit;
end;

procedure TfCadCliente.Button5Click(Sender: TObject);
begin
  try
      DM_testepratico.FDCLIENTE.Edit;
      DBGrid1.Tag := DM_testepratico.FDCLIENTE.FieldByName('ID_ENTIDADE').Value  ;


      if DM_testepratico.FDCLIENTE.FieldByName('STATUS').Value=0 then
      begin
        if MessageDlg('Confirma a Inativação ?', TMsgDlgType.mtConfirmation,
          [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
          DM_testepratico.FDCLIENTE.FieldByName('STATUS').Value := 1;
      end else
      if DM_testepratico.FDCLIENTE.FieldByName('STATUS').Value=1 then
      begin
        if MessageDlg('Confirma a Ativação ?', TMsgDlgType.mtConfirmation,
          [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
          DM_testepratico.FDCLIENTE.FieldByName('STATUS').Value := 0;
      end;

      try
        DM_testepratico.fdcDB.StartTransaction;
        DM_testepratico.FDCLIENTE.Post;
        DM_testepratico.fdcDB.Commit;
      except
        On E: Exception do
        begin
          ShowMessage(
            'Ocorreu um erro.' + #13 +
            'Por favor, entre em contato com o administrador do sistema.');
          DM_testepratico.fdcDB.Rollback;
        end;
      end;
  finally
      DM_testepratico.FDCLIENTE.Close;
      DM_testepratico.FDCLIENTE.Open;
      DM_testepratico.FDCLIENTE.Locate('ID_ENTIDADE',DBGrid1.Tag,[]);
  end;
end;

procedure TfCadCliente.Button_Buscar_CepClick(Sender: TObject);
// var  jsonObject: TJSONObject;
begin
  try
    if Length(DBEdit11.Text) <> 8 then
    begin
      mensagemAviso('CEP inválido');
      DBEdit11.SetFocus;
      exit;
    end;

    try
      dadosEnderecoCompleto.CEP := DBEdit11.Text;
      ConsultaCEP(dadosEnderecoCompleto.CEP);
      DBEdit7.SetFocus;
    except
      mensagemAviso('CEP inválido');
      DBEdit11.SetFocus;
    end;
  finally
  end;
end;

procedure TfCadCliente.FDQuery1AfterCancel(DataSet: TDataSet);
begin
  Button1.Enabled := true;
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterEdit(DataSet: TDataSet);
begin
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterInsert(DataSet: TDataSet);
begin
  Button3.Enabled := Not(Button4.Enabled);
  Button2.Enabled := Not(Button4.Enabled);
  DBNavigator1.Enabled := (Button4.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterPost(DataSet: TDataSet);
begin
  Button1.Enabled := true;
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterScroll(DataSet: TDataSet);
begin
  if DM_testepratico.FDCLIENTEPESSOA.Value = 'F' then
  Begin
    DM_testepratico.FDCLIENTEINSCRICAO_FISCAL.EditMask := '999.999.999-99;0;_';
  End
  else if DM_testepratico.FDCLIENTEPESSOA.Value = 'J' then
  begin
    DM_testepratico.FDCLIENTEINSCRICAO_FISCAL.EditMask :=
      '99.999.999/9999-99;0;_';
  end;

end;

procedure TfCadCliente.FDQuery1EMAILValidate(Sender: TField);
var
  rRegex: TRegex;
  bRet: Boolean;
begin
  // bRet := rRegex.IsMatch(Sender.AsString, '^[^@]+@[^.]+\.com\.br');
  bRet := rRegex.IsMatch(Sender.AsString, '^[^@]+@[^.]+\.com\.br');
  if NOT bRet then
    raise Exception.Create('e-Mail inválido!');
end;


procedure TfCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_testepratico.FDCLIENTE.Close;
  DM_testepratico.FDENDERECO.Close;
end;

procedure TfCadCliente.FormCreate(Sender: TObject);
begin
  DM_testepratico.FDCLIENTE.OPEN;
  DM_testepratico.FDENDERECO.Close;
  DM_testepratico.FDENDERECO.Params.ParamByName('ID_ENTIDADE').Value := 0;
  if not DM_testepratico.FDCLIENTE.FieldByName('ID_ENTIDADE').IsNull then
    DM_testepratico.FDENDERECO.Params.ParamByName('ID_ENTIDADE').Value :=
      DM_testepratico.FDCLIENTE.FieldByName('ID_ENTIDADE').Value;
  DM_testepratico.FDENDERECO.OPEN;
  fMain.Caption := fCadCliente.Caption;

end;

function TfCadCliente.GeneratorID(aName: string; Incrementa: Boolean): integer;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DM_testepratico.FDCLIENTE.Connection;
    if Incrementa then
      Qry.SQL.Add('SELECT GEN_ID(' + aName + ', 1) FROM RDB$DATABASE')
    else
      Qry.SQL.Add('SELECT GEN_ID(' + aName + ', 0) FROM RDB$DATABASE');
    Qry.OPEN;
    Result := Qry.Fields[0].AsInteger;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TfCadCliente.ConsultaCEP(CEP: String);
var
  tempXML: IXMLNode;
  tempNodePAI: IXMLNode;
  tempNodeFilho: IXMLNode;
  i: integer;
begin

  XMLDocument1.FileName := 'https://viacep.com.br/ws/' + Trim(CEP) + '/xml/';
  XMLDocument1.Active := true;
  tempXML := XMLDocument1.DocumentElement;

  tempNodePAI := tempXML.ChildNodes.FindNode('logradouro');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.logradouro := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('bairro');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.bairro := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('localidade');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.localidade := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('uf');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.uf := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('complemento');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.complemento := tempNodeFilho.Text;
  end;

  DBEdit5.Text := Copy(dadosEnderecoCompleto.logradouro, 1,
    Pos(' ', dadosEnderecoCompleto.logradouro) - 1);
  DBEdit6.Text := Copy(dadosEnderecoCompleto.logradouro,
    Pos(' ', dadosEnderecoCompleto.logradouro) + 1,
    Length(dadosEnderecoCompleto.logradouro));
  DBEdit10.Text := dadosEnderecoCompleto.uf;
  DBEdit9.Text := dadosEnderecoCompleto.localidade;
  DBEdit13.Text := dadosEnderecoCompleto.bairro;

  // EditComplemento.Clear;

end;

procedure TfCadCliente.DS_CLIENTEDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_testepratico.FDCLIENTE.RecNo) + '/'
    + FormatFloat('0###', DM_testepratico.FDCLIENTE.RecordCount);
end;

procedure TfCadCliente.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0' .. '9', #8, #13, #27, ^C, ^V, ^X, ^Z]) then
  begin
    Key := #0;
  end;
end;

procedure TfCadCliente.DBRadioGroup1Exit(Sender: TObject);
begin
  if DM_testepratico.FDCLIENTEPESSOA.Value = 'F' then
  Begin
    DM_testepratico.FDCLIENTEINSCRICAO_FISCAL.EditMask := '999.999.999-99;0;_';
    Label2.Caption := 'Nascimento';
  End
  else if DM_testepratico.FDCLIENTEPESSOA.Value = 'J' then
  begin
    DM_testepratico.FDCLIENTEINSCRICAO_FISCAL.EditMask :=
      '99.999.999/9999-99;0;_';
    Label2.Caption := 'Fundação';
  end;
end;

procedure TfCadCliente.mensagemAviso(mensagem: string);
begin
  Application.MessageBox(PChar(mensagem), '', MB_OK + MB_ICONERROR);
end;

procedure TfCadCliente.Preparo_Email(id: integer);
var
  XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;
  AAssunto, ADestino, aanexo: String;
  ACorpo: TStrings;
begin
  XMLDocument := TXMLDocument.Create(nil);
  XMLDocument.Active := true;
  NodeTabela := XMLDocument.AddChild('clientes');
  NodeRegistro := NodeTabela.AddChild('Registro');
  NodeRegistro.ChildValues['Nome'] := DM_testepratico.FDCLIENTENOME.Value;
  NodeRegistro.ChildValues['Nascimento'] :=
    DM_testepratico.FDCLIENTENASCIMENTO.AsString;
  NodeRegistro.ChildValues['InscricaoFiscal'] :=
    DM_testepratico.FDCLIENTEINSCRICAO_FISCAL.Value;
  NodeRegistro.ChildValues['Pessoa'] := DM_testepratico.FDCLIENTEPESSOA.Value;
  NodeRegistro.ChildValues['Telefone'] :=
    DM_testepratico.FDCLIENTETELEFONE.Value;
  NodeRegistro.ChildValues['Email'] := DM_testepratico.FDCLIENTETELEFONE.Value;

  NodeEndereco := NodeRegistro.AddChild('Endereço');
  NodeEndereco.ChildValues['Cep'] := DM_testepratico.FDENDERECOCEP.Value;
  NodeEndereco.ChildValues['Tipo'] :=
    DM_testepratico.FDENDERECOTIPO_LOGRADOURO.Value;
  NodeEndereco.ChildValues['Logradouro'] :=
    DM_testepratico.FDENDERECOLOGRADOURO.Value;
  NodeEndereco.ChildValues['Numero'] := DM_testepratico.FDENDERECONUMERO.Value;
  NodeEndereco.ChildValues['Complemento'] :=
    DM_testepratico.FDENDERECOCOMPLEMENTO.Value;
  NodeEndereco.ChildValues['Bairro'] := DM_testepratico.FDENDERECOBAIRRO.Value;
  NodeEndereco.ChildValues['Cidade'] := DM_testepratico.FDENDERECOCIDADE.Value;
  NodeEndereco.ChildValues['Estado'] := DM_testepratico.FDENDERECOESTADO.Value;

  aanexo := ExtractFilePath(Application.ExeName) +
    DM_testepratico.FDCLIENTEINSCRICAO_FISCAL.Value + '.xml';

  XMLDocument.SaveToFile(aanexo);

  EnviarEmail('Cadastro de Cliente', aanexo);
end;

procedure TfCadCliente.EnviarEmail(AAssunto, aanexo: String);
var
  idMsg: TIdMessage;
  IdText: TIdText;
  sAnexo: string;
begin
  try
    LoadOpenSSLLibrary;
    try

      idMsg := TIdMessage.Create(Self);
      idMsg.CharSet := 'utf-8';
      idMsg.Encoding := meMIME;
      idMsg.From.Name := 'Cadastro Clientes';
      idMsg.From.Address := DM_testepratico.FDCLIENTEEMAIL.AsString; // sFrom;
      idMsg.Priority := mpNormal;
      idMsg.Subject := AAssunto;

      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses :=
        DM_testepratico.FDCLIENTEEMAIL.AsString;

      IdText := TIdText.Create(idMsg.MessageParts);
      IdText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS := utUseRequireTLS;
      IdSMTP.AuthType := satDefault;
      IdSMTP.Host := sHost;
      IdSMTP.AuthType := satDefault;
      IdSMTP.Port := iPort;
      IdSMTP.Username := sUserName;
      IdSMTP.Password := sPassword;

      if aanexo <> EmptyStr then
        if FileExists(aanexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, aanexo);
      // backup do email
      idMsg.SaveToFile(DM_testepratico.FDCLIENTEINSCRICAO_FISCAL.Value
        + '.eml');

      IdSMTP.Connect;

      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except
          on E: Exception do
          begin
            ShowMessage('Erro ao tentar enviar: ' + E.Message);
          end;
        end;
      end;

      if IdSMTP.Connected then
        IdSMTP.Disconnect;

    finally

      UnLoadOpenSSLLibrary;

      FreeAndNil(idMsg);
    end;
  except
    on E: Exception do
    begin
    end;
  end;
end;

end.
