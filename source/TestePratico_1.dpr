program TestePratico_1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  CadFornecedor in 'CadFornecedor.pas' {fCadFornecedor},
  InscricaoFiscal in 'InscricaoFiscal.pas',
  uDM_testePratico in 'uDM_testePratico.pas' {DM_testepratico: TDataModule},
  UCadUsuario in 'UCadUsuario.pas' {FcadUsuarios},
  Ulogin in 'Ulogin.pas' {FLogin},
  CadCliente in 'CadCliente.pas' {fCadCliente},
  UCadProduto in 'UCadProduto.pas' {FCadProduto},
  URegPedidos in 'URegPedidos.pas' {FRegPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_testepratico, DM_testepratico);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
