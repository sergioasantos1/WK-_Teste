unit UFuncoes;

interface


uses  System.IniFiles, System.SysUtils, Vcl.Forms, Json, Winapi.Windows,
       winapi.Messages;

type
// registro para receber os dados do INI
  Dini = record
    Servidor: string;
    Porta: string;
    Banco: string;
    Usuario: string;
    Senha: String;
    DataSource: String;
  end;


    function GravaINI(Arquivo:String; Secao: String; Chave: String; Valor:String):Boolean;
    function LerINI(Arquivo:String; Secao: String; Chave: String):String;
    function CriaForm(NomeForm: TFormClass): string;
    function NomeComputador: String;
    function CarregaConfig(Arquivo:String):Dini;
    function GeraNumero(campo:string):Integer;
    procedure ControleTela(b1,b2,b3,b4,b5,p1,p2,p3:Boolean);
    procedure Calcula(qtd:Extended;valor:Currency;Op:String);


implementation

uses  DB, uDados , Uprincipal;

function GeraNumero(campo:string):Integer;
var
  Numero:Integer;
begin
  DM.qrNumeros.SQL.Text := 'select * from numeros';
  DM.qrNumeros.Open;
  Numero := DM.qrNumerosPedido.AsInteger + 1;
  DM.qrNumeros.Close;
  DM.qrNumeros.SQL.Text := 'update numeros '+
                           'set Pedido = '+IntToStr(Numero);
  DM.qrNumeros.ExecSQL;
  Result := Numero;
end;

procedure Calcula(qtd:Extended;valor:Currency;Op:String);
var
  tqtd: Extended;
  tvalor: Currency;
begin
  tqtd := StrToFloat(FPrincipal.edtNumeroItens.Text);
  tvalor := StrToFloat(FPrincipal.edtValorTotalGeral.Text);
  if Op = 'S' then
     begin
       tqtd := tqtd + qtd;
       tvalor := tvalor + valor;
     end
  else
     begin
       tqtd := tqtd - qtd;
       tvalor := tvalor - valor;
     end;
  FPrincipal.edtNumeroItens.Text := FloatToStr(tqtd);
  FPrincipal.edtValorTotalGeral.Text := FormatFloat('##,###.##',tvalor);
end;

procedure ControleTela(b1,b2,b3,b4, b5,p1,p2,p3:Boolean);
// Controla exibição de botões e paineis
begin
  FPrincipal.b1.Enabled := b1;
  FPrincipal.b2.Enabled := b2;
  FPrincipal.b3.Enabled := b3;
  FPrincipal.b4.Enabled := b4;
  FPrincipal.b5.Enabled := b5;
  FPrincipal.p1.Visible := p1;
  FPrincipal.p2.Visible := p2;
  FPrincipal.p3.Visible := p3;
end;

function CarregaConfig(Arquivo:String):Dini;
var
 TConfig: Dini;
begin
  TConfig.Servidor := LerINI(Arquivo,'Config','Servidor');
  TConfig.Porta    := LerINI(Arquivo,'Config','Porta');
  TConfig.Banco    := LerINI(Arquivo,'Config','Banco');
  TConfig.Usuario  := LerINI(Arquivo,'Config','Usuario');
  TConfig.Senha    := LerINI(Arquivo,'Config','Senha');
  TConfig.DataSource    := LerINI(Arquivo,'Config','DataSource');
  Result := TConfig;
end;

function NomeComputador: String;
var
  lpBuffer : PChar;
  nSize : DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;




function CriaForm(NomeForm: TFormClass): string;
var
  form: TForm;
begin
  form := NomeForm.Create(Application);
  try
    form.ShowModal;
  finally
    form.Free;
  end;
end;


function GravaINI(Arquivo:String; Secao: String; Chave: String; Valor:String):Boolean;
var
  ArqINI: TIniFile;
begin
  try
    ArqINI := TIniFile.Create(Arquivo);
    ArqINI.WriteString(Secao,Chave,Valor);
    ArqINI.Free;
    Result := True;
  except
    Result := False;
  end;
end;

function LerINI(Arquivo:String; Secao: String; Chave: String):String;
var
  ArqINI: TIniFile;
begin
  ArqINI := TIniFile.Create(Arquivo);
  try
    Result := Arqini.ReadString(Secao,Chave,'');
  except
    Result := 'Erro!';
  end;
end;

end.
