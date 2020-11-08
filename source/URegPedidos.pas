unit URegPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFRegPedidos = class(TForm)
    DSPEDIDOS: TDataSource;
    dsCliente: TDataSource;
    DSProdutos: TDataSource;
    dsItemPedido: TDataSource;
    Panel5: TPanel;
    DBGrid3: TDBGrid;
    Panel7: TPanel;
    PG_RegPedidos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    DBGrid4: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    Label13: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    Label14: TLabel;
    DBText5: TDBText;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    dblCliente: TDBLookupComboBox;
    Panel3: TPanel;
    Label16: TLabel;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    Panel4: TPanel;
    Label3: TLabel;
    DBNavigator2: TDBNavigator;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    DBLCBProduto: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    DSConsProdutos: TDataSource;
    BtFechar: TButton;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPEDIDOSDataChange(Sender: TObject; Field: TField);
    procedure DBLCBProdutoExit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure PG_RegPedidosChange(Sender: TObject);
    procedure BtFecharClick(Sender: TObject);
    procedure dblClienteExit(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegPedidos: TFRegPedidos;

implementation

{$R *.dfm}

uses
  Main,
  uDM_testePratico;

procedure TFRegPedidos.Button10Click(Sender: TObject);
begin
  DM_testepratico.FDDetalheDoPedido.Delete;
  Button7.Enabled := true;
  Button10.Enabled := (Button7.Enabled);
  Button4.Enabled := not(Button7.Enabled);
  Button8.Enabled := not(Button7.Enabled);

end;

procedure TFRegPedidos.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);

  DM_testepratico.FDPedidos.Append;

  DM_testepratico.FDPedidos.FieldByName('ID_PEDIDO').Value :=
    fMain.GeneratorID('GEN_PEDIDOS_ID', true);

end;

procedure TFRegPedidos.Button2Click(Sender: TObject);
begin
  DM_testepratico.FDPedidos.Cancel;
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TFRegPedidos.Button3Click(Sender: TObject);
begin
  try
    DM_testepratico.fdcDB.StartTransaction;
    DM_testepratico.FDPedidos.Post;
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
  BtFechar.Enabled := (Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
end;

procedure TFRegPedidos.Button4Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  DBNavigator1.Enabled := (Button1.Enabled);
  DM_testepratico.FDPedidos.Edit;
end;

procedure TFRegPedidos.Button5Click(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    DM_testepratico.FDPedidos.Edit;
    DM_testepratico.FDPedidos.FieldByName('STATUS').Value := 4;
    Button3Click(Self);

    DM_testepratico.FDDetalheDoPedido.First;
    while not DM_testepratico.FDDetalheDoPedido.eof do
    begin

      DM_testepratico.FDProdutos.Filtered := false;
      DM_testepratico.FDProdutos.Filter := ' PRODUTO = ' +
        DM_testepratico.FDDetalheDoPedidoID_PRODUTO.AsString;
      DM_testepratico.FDProdutos.Filtered := true;

      DM_testepratico.FDProdutos.Edit;
      DM_testepratico.FDProdutosUNIDADEDEVOLUCAO.Value :=
        DM_testepratico.FDProdutosUNIDADEDEVOLUCAO.Value +
        DM_testepratico.FDDetalheDoPedidoQUANTIDADE.Value;
      DM_testepratico.FDProdutos.Post;
      DM_testepratico.FDProdutos.Filtered := false;

      DM_testepratico.FDDetalheDoPedido.Next;
    end;

  end;
end;

procedure TFRegPedidos.Button6Click(Sender: TObject);
begin

  DM_testepratico.FDDetalheDoPedido.Append;

  {DM_testepratico.FDProdutos.FieldByName('PRODUTO').Value :=
    GeneratorID('GEN_PRODUTOS_ID', true);}

  Button6.Enabled := false;
  Button10.Enabled :=  (Button6.Enabled);
  Button7.Enabled := not(Button6.Enabled);
  Button8.Enabled := not(Button6.Enabled);

end;

procedure TFRegPedidos.Button7Click(Sender: TObject);
begin
  DM_testepratico.FDDetalheDoPedido.Cancel;
  Button6.Enabled := True;
  Button10.Enabled :=  (Button6.Enabled);
  Button7.Enabled := not(Button6.Enabled);
  Button8.Enabled := not(Button6.Enabled);

end;

procedure TFRegPedidos.Button8Click(Sender: TObject);
begin
  try
    DM_testepratico.fdcDB.StartTransaction;
    DM_testepratico.FDDetalheDoPedido.Post;
    DM_testepratico.fdcDB.Commit;
  except
    On E: Exception do
    begin
      DM_testepratico.fdcDB.Rollback;
      ShowMessage(
        'Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

  Button6.Enabled := True;
  Button10.Enabled :=  (Button6.Enabled);
  Button7.Enabled := not(Button6.Enabled);
  Button8.Enabled := not(Button6.Enabled);
  DBNavigator2.Enabled := (Button6.Enabled);

end;

procedure TFRegPedidos.BtFecharClick(Sender: TObject);
begin

  case PG_RegPedidos.TabIndex of
    0:
      begin
        if MessageDlg('Confirma a Fechamento do Pedido ?',
          TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes
        then
        begin
          if DM_testepratico.FDDetalheDoPedido.RecordCount > 0 then
          begin
            DM_testepratico.FDPedidos.Edit;
            DM_testepratico.FDPedidos.FieldByName('STATUS').Value := 1;
            DM_testepratico.FDPedidos.FieldByName('DT_DEENTREGA').Value := now;
            DM_testepratico.FDPedidos.Post;
            DM_testepratico.FDPedidos.Close;
            DM_testepratico.FDPedidos.open;
          end
          else
          begin
            ShowMessage('Falta Itens  ');
          end;
        end
      end;
    1:
      begin
        if MessageDlg('Confirma a Fechamento do Faturamento  ?',
          TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes
        then
        begin
          DM_testepratico.FDPedidos.Edit;
          DM_testepratico.FDPedidos.FieldByName('STATUS').Value := 2;
          DM_testepratico.FDPedidos.FieldByName('DT_DEENTREGA').Value := now;
          DM_testepratico.FDPedidos.Post;
          DM_testepratico.FDPedidos.Close;
          DM_testepratico.FDPedidos.open;
        end;
      end;
    2:
      begin
        if MessageDlg('Confirma a Fechamento do Faturamento  ?',
          TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes
        then
        begin
          DM_testepratico.FDPedidos.Edit;
          DM_testepratico.FDPedidos.FieldByName('STATUS').Value := 3;
          DM_testepratico.FDPedidos.FieldByName('DT_DEENTREGA').Value := now;
          DM_testepratico.FDPedidos.Post;
          DM_testepratico.FDPedidos.Close;
          DM_testepratico.FDPedidos.open;
        end;
      end;
  end;

end;

procedure TFRegPedidos.DBEdit3Exit(Sender: TObject);
begin

  if DM_testepratico.FDDetalheDoPedido.State = dsInsert then
  begin
    if (DM_testepratico.FDDetalheDoPedidoQUANTIDADE.Value < 1) then
    begin
      MessageDlg('Quantidade mínimo inválido ', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbOK], 0);
      DBEdit3.SetFocus;
      Exit;
    end;

    if (DM_testepratico.FDDetalheDoPedidoQUANTIDADE.Value >
      DM_testepratico.FDConsProdutoDISPONIVEL.Value) then
    begin
      MessageDlg('Quantidade Superior em Estoque ', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbOK], 0);
      DM_testepratico.FDDetalheDoPedidoQUANTIDADE.Value :=
        DM_testepratico.FDConsProdutoDISPONIVEL.Value;
      DBEdit3.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFRegPedidos.DBLCBProdutoExit(Sender: TObject);
begin

  DM_testepratico.FDDetalheDoPedidoPRECOUNITARIO.Value :=
    DM_testepratico.FDConsProdutoPRECOUNITARIO.Value;

end;

procedure TFRegPedidos.dblClienteExit(Sender: TObject);
begin
  DM_testepratico.FDPedidosNOME.Value :=
  DM_testepratico.FDConsCliente.FieldByName('nome').value;
end;

procedure TFRegPedidos.DSPEDIDOSDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_testepratico.FDPedidos.RecNo) + '/'
    + FormatFloat('0###', DM_testepratico.FDPedidos.RecordCount);
end;

procedure TFRegPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_testepratico.FDFornecedor.Close;
  DM_testepratico.FDProdutos.Close;
  DM_testepratico.FDConsCliente.Close;
  DM_testepratico.FDENDERECO.Close;
  DM_testepratico.FDPedidos.Close;
  DM_testepratico.FDDetalheDoPedido.Close;
  DM_testepratico.FDConsProduto.Close;
end;

procedure TFRegPedidos.FormCreate(Sender: TObject);
begin
  PG_RegPedidos.TabIndex := 0;
  DM_testepratico.FDProdutos.open;
  DM_testepratico.FDConsCliente.open;
  DM_testepratico.FDENDERECO.open;

  DM_testepratico.FDPedidos.Params.ParamByName('STATUS').Value :=
    PG_RegPedidos.TabIndex;
  DM_testepratico.FDPedidos.open;
  DM_testepratico.FDDetalheDoPedido.open;
  DM_testepratico.FDConsProduto.open;
  DM_testepratico.FDConsProduto.Params.ParamByName('ID_PEDIDO').Value :=
    DM_testepratico.FDPedidos.FieldByName('ID_PEDIDO').Value;
  DM_testepratico.FDConsProduto.open;

end;

procedure TFRegPedidos.PG_RegPedidosChange(Sender: TObject);
begin

  BtFechar.Enabled := (PG_RegPedidos.TabIndex = 999);
  DBNavigator2.Enabled := (PG_RegPedidos.TabIndex = 999);
  Button1.Enabled := BtFechar.Enabled;
  Button4.Enabled := Button1.Enabled;
  Button5.Enabled := Button1.Enabled;

  DBNavigator1.Enabled := (PG_RegPedidos.TabIndex in [0 .. 5]);
  DBNavigator2.Enabled := (PG_RegPedidos.TabIndex in [0 .. 5]);
  if PG_RegPedidos.TabIndex = 0 then
  begin
    DBNavigator2.VisibleButtons := [nbNext, nbFirst, nbPrior, nbLast, nbInsert,
      nbDelete, nbPost, nbCancel];
  end
  else
    DBNavigator2.VisibleButtons := [nbNext, nbFirst, nbPrior, nbLast];

  DM_testepratico.FDPedidos.Close;
  DM_testepratico.FDPedidos.Params.ParamByName('STATUS').Value :=
    PG_RegPedidos.TabIndex;
  DM_testepratico.FDPedidos.open;

  DM_testepratico.FDDetalheDoPedido.Close;

  if not DM_testepratico.FDPedidos.eof then
  begin
    case PG_RegPedidos.TabIndex of
      0:
        begin
          DM_testepratico.FDDetalheDoPedido.Params.ParamByName('ID_PEDIDO')
            .Value := DM_testepratico.FDPedidos.FieldByName('ID_PEDIDO').Value;
          DM_testepratico.FDDetalheDoPedido.open;

          dblCliente.KeyValue := DM_testepratico.FDPedidosID_ENTIDADE.Value;
          DBLCBProduto.KeyValue :=
            DM_testepratico.FDDetalheDoPedidoID_PRODUTO.Value;

          BtFechar.Enabled := (PG_RegPedidos.TabIndex in [0]);
          Button1.Enabled := BtFechar.Enabled;
          Button4.Enabled := Button1.Enabled;
          Button5.Enabled := Button1.Enabled;

        end;
      1 .. 4:
        begin
          DM_testepratico.FDDetalheDoPedido.Params.ParamByName('ID_PEDIDO')
            .Value := DM_testepratico.FDPedidos.FieldByName('ID_PEDIDO').Value;
          DM_testepratico.FDDetalheDoPedido.open;

          DBLCBProduto.KeyValue :=
            DM_testepratico.FDDetalheDoPedidoID_PRODUTO.Value;
          dblCliente.KeyValue := DM_testepratico.FDPedidosID_ENTIDADE.Value;

          BtFechar.Enabled := (PG_RegPedidos.TabIndex in [1 .. 2]);
        end;
    end;

  end;

end;

end.
