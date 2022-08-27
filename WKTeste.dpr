program WKTeste;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {FPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  uDados in 'uDados.pas' {DM: TDataModule},
  Ufuncoes in 'Ufuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.Title := 'WK Teste';
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
