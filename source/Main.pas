unit Main;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Actions,
  Vcl.ActnList,
  System.ImageList,
  Vcl.ImgList,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TfMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelWorkArea: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ActionCadCliente: TAction;
    ActionCadVenda: TAction;
    ActionUsuario: TButton;
    Button4: TButton;
    ActionListarArquivos: TAction;
    ActionCadUsuario: TAction;
    Button3: TButton;
    ActionCadFornecedor: TAction;
    ActionCadProdutos: TAction;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ActionCadClienteExecute(Sender: TObject);
    procedure ActionUsuarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure ActionCadFornecedorExecute(Sender: TObject);
    procedure ActionCadProdutosExecute(Sender: TObject);
    procedure ActionCadVendaExecute(Sender: TObject);
  private
    { Private declarations }
    FFormActive: TForm;
    procedure LoadForm(AClass: TFormClass);
  public
    { Public declarations }
    function  GeneratorID(aName: string; Incrementa: Boolean): integer;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses
  CadCliente, ListagemArquivos, uDM_testePratico,Ucadusuario
  ,cadfornecedor,ucadproduto,uregPedidos ;

procedure TfMain.ActionCadClienteExecute(Sender: TObject);
begin
  Self.LoadForm(TfCadCliente);
end;

procedure TfMain.ActionCadFornecedorExecute(Sender: TObject);
begin
  Self.LoadForm(tfCadFornecedor);
end;

procedure TfMain.ActionCadProdutosExecute(Sender: TObject);
begin
  Self.LoadForm(TfCadCliente);
end;

procedure TfMain.ActionCadVendaExecute(Sender: TObject);
begin
  Self.LoadForm(TFRegPedidos);
end;

procedure TfMain.ActionUsuarioClick(Sender: TObject);
begin
  Self.LoadForm(TFcadUsuarios);
end;

procedure TfMain.Button3Click(Sender: TObject);
begin
  Self.LoadForm(TFCadProduto);
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Halt(0);
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  DM_testepratico.fdcDB.Open();
end;

procedure TfMain.LoadForm(AClass: TFormClass);
var
  slQuery: TStringList;
begin
  slQuery := TStringList.Create;

  if Assigned(Self.FFormActive) then
  begin
    Self.FFormActive.Close;
    Self.FFormActive.Free;
    Self.FFormActive := nil;
  end;

  Self.FFormActive             := AClass.Create(nil);
  Self.FFormActive.Parent      := Self.PanelWorkArea;
  Self.FFormActive.BorderStyle := TFormBorderStyle.bsNone;

  Self.FFormActive.Top   := 0;
  Self.FFormActive.Left  := 0;
  Self.FFormActive.Align := TAlign.alClient;

  Self.FFormActive.Show;
end;

function TfMain.GeneratorID(aName: string; Incrementa: Boolean): integer;
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


end.
