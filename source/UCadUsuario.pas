unit UCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Data.DB, Vcl.Mask,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, Xml.xmldom, Xml.XMLIntf, Xml.XmlTransform, Xml.XMLDoc,
  Vcl.Grids, Vcl.DBGrids;

type
  TFcadUsuarios = class(TForm)
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label16: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button4: TButton;
    Button1: TButton;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;

    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FcadUsuarios: TFcadUsuarios;

implementation

{$R *.dfm}

uses uDM_testePratico;

procedure TFcadUsuarios.Button1Click(Sender: TObject);
  function GeneratorID(aName: string; Incrementa: Boolean): integer;
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
      Qry.Open;
      Result := Qry.Fields[0].AsInteger;
    finally
      FreeAndNil(Qry);
    end;
  end;

begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := not(Button1.Enabled);

  DM_testepratico.FDUsuario.Append;
  DM_testepratico.FDUsuario.FieldByName('ID_USUARIO').Value :=
    GeneratorID('GEN_USUARIOS_ID', true);

end;

procedure TFcadUsuarios.Button2Click(Sender: TObject);
begin
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TFcadUsuarios.Button3Click(Sender: TObject);
begin

  try
    DM_testepratico.fdcDB.StartTransaction;
    DM_testepratico.FDUsuario.Post;
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
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);

end;

procedure TFcadUsuarios.Button4Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := not(Button1.Enabled);
  DM_testepratico.FDUsuario.Edit;
end;

procedure TFcadUsuarios.Button5Click(Sender: TObject);
var
  salva: TFDQuery;
  SS: STRING;
begin
  if MessageDlg('Confirma a exclusão?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin

    SS := ' Update USUARIOS SET ';

    if DM_testepratico.FDUsuarioATIVO.Value = 1 then
      SS := SS + ' ATIVO =0 '
    else
      SS := SS + ' ATIVO =1 ';

    SS := SS + ' WHERE ID_USUARIO = ' +
      DM_testepratico.FDUsuarioID_USUARIO.AsString;

    salva := TFDQuery.Create(nil);

    salva.SQL.Text := SS;
    salva.Connection := DM_testepratico.FDUsuario.Connection;
    salva.ExecSQL;

    DM_testepratico.FDUsuario.Close;
    DM_testepratico.FDUsuario.Open;

  end;
end;

procedure TFcadUsuarios.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_testepratico.FDUsuario.RecNo) + '/'
    + FormatFloat('0###', DM_testepratico.FDUsuario.RecordCount);
end;

procedure TFcadUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_testepratico.FDUsuario.close;
end;

procedure TFcadUsuarios.FormCreate(Sender: TObject);
begin
  DM_testepratico.FDUsuario.Open;

end;

end.
