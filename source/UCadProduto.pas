unit UCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFCadProduto = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DSProduto: TDataSource;
    DS_FORNECEDOR: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBLCB_Fornecedor: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSProdutoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    function GeneratorID(aName: string; Incrementa: Boolean): integer;
  public
    { Public declarations }
  end;

var
  FCadProduto: TFCadProduto;

implementation

{$R *.dfm}

uses uDM_testePratico;

procedure TFCadProduto.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := not(Button1.Enabled);

  DM_testepratico.FDProdutos.Append;

  DM_testepratico.FDProdutos.FieldByName('PRODUTO').Value :=
    GeneratorID('GEN_PRODUTOS_ID', true);

end;

procedure TFCadProduto.Button2Click(Sender: TObject);
begin
  DM_testepratico.FDProdutos.Cancel;

  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TFCadProduto.Button3Click(Sender: TObject);
begin
  try
    DM_testepratico.fdcDB.StartTransaction;
    DM_testepratico.FDProdutos.Post;
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

procedure TFCadProduto.Button4Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBNavigator1.Enabled := not(Button1.Enabled);
  DM_testepratico.FDProdutos.Edit;
end;

procedure TFCadProduto.Button5Click(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    DM_testepratico.FDProdutos.Edit;
    DM_testepratico.FDProdutos.FieldByName('STATUS').Value := 1;
    DM_testepratico.FDProdutos.Post;
  end;
end;

procedure TFCadProduto.DSProdutoDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_testepratico.FDProdutos.RecNo) + '/'
    + FormatFloat('0###', DM_testepratico.FDProdutos.RecordCount);
end;

procedure TFCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_testepratico.FDFornecedor.Close;
  DM_testepratico.FDProdutos.Close;
end;

procedure TFCadProduto.FormCreate(Sender: TObject);
begin
  DM_testepratico.FDFornecedor.Open;
  DM_testepratico.FDProdutos.Open;
end;

function TFCadProduto.GeneratorID(aName: string; Incrementa: Boolean): integer;
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

end.
