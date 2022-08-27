unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  Vcl.ComCtrls, System.UITypes, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TFPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    IdHTTP1: TIdHTTP;
    ToolBar1: TToolBar;
    p1: TPanel;
    b1: TToolButton;
    b2: TToolButton;
    b3: TToolButton;
    b4: TToolButton;
    GroupBox1: TGroupBox;
    edtCodCliente: TEdit;
    edtNomeCliente: TEdit;
    p3: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edtNumeroItens: TEdit;
    edtValorTotalGeral: TEdit;
    p2: TPanel;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    GroupBox4: TGroupBox;
    ToolBar2: TToolBar;
    btIncluir: TToolButton;
    btDeletar: TToolButton;
    btEditar: TToolButton;
    b5: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btDeletarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btEditarClick(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SomaItems, SomaTotais: Currency;
  vPedido: String;

const
  String_MySql = '';
var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses uDados, Ufuncoes;

procedure TFPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if p2.Visible then
     if key = VK_F2 then
        btIncluir.Click
     else if key = VK_F3 then
        btEditar.Click
     else if key = VK_F3 then
        btDeletar.Click
     else if key = VK_RETURN then
        btEditar.Click
     else if key = VK_DELETE then
        btDeletar.Click;

end;

procedure TFPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // Tecla Enter funcinar como TAB
  if key = #13 then
     begin
       key := #0;
       Perform(CM_DIALOGKEY, VK_TAB,0);
     end;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
var
  caminho :String;
  TConfig : Dini;
begin
  caminho := ExtractFilePath(Application.ExeName)+'WKTeste.INI';
  if FileExists(caminho) then
     begin
        TConfig := CarregaConfig(caminho);
        DM.Con.Connected := False;
        DM.Con.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;'+
                                    'User ID='+TConfig.Usuario+';Data Source=ODBC_MySQL;Mode=ReadWrite;'+
                                    'Initial Catalog='+TConfig.Banco+';';
        try
          DM.Con.Connected := True;
          if DM.Con.Connected then
             begin
               DM.tbParametros.Open;
               DM.tbGrid.Open;
               StatusBar1.Panels[0].Text := '  Terminal: '+NomeComputador;
               StatusBar1.Panels[1].Text := '  Servidor: '+TConfig.Servidor;
               ControleTela(True,False,False,True,True,False,False,False);
             end
        except on E: Exception do
             begin
               MessageDlg('Não foi possível conectar ao servidor!'+#13+
                          E.Message,TMsgDlgType.mtWarning,[mbOk], 0);
               Application.Terminate;
             end;

        end;
     end
  else
     begin
       MessageDlg('Arquivo WKTeste.INI não encontrado'+#13+
                  'Crie e coloque na pasta do executavel',TMsgDlgType.mtWarning,[mbOk], 0);
       Application.Terminate;
     end;

end;

procedure TFPrincipal.btDeletarClick(Sender: TObject);
begin
  if MessageDlg('Excluir Produto ?',TMsgDlgType.mtConfirmation,[mbYes, mbNo], 0) = mrYes then
     begin
       Calcula(DM.tbGridQuantidade.AsFloat,DM.tbGridVlTotal.AsCurrency,'D');
       DM.tbGrid.Delete;
     end;
end;

procedure TFPrincipal.btEditarClick(Sender: TObject);
var
  VlUnit,Qtd, txt1, txt2: String;
begin
  txt1 := 'Produto: '+DM.tbGridCodProduto.AsString+' - '+DM.tbGridDescricao.AsString;
  txt2 := 'Valor Unitario R$: ';
  VlUnit := InputBox(txt1,txt2,DM.tbGridVlUnit.AsString);
  if StrToFloat(VlUnit) > 0 then
     begin
       txt2 := 'Valor Unitario R$: '+FormatFloat('##,###.00',StrToFloat(VlUnit))
              +#13+'Quantidade: ';
       Qtd := InputBox(txt1,txt2,DM.tbGridQuantidade.AsString);
       if StrToFloat(qtd)  > 0 then
          begin
            // Subtrai valor atual
            Calcula(DM.tbGridQuantidade.AsFloat,DM.tbGridVlTotal.AsCurrency,'D');
            // Soma no valor
            Calcula(StrToFloat(qtd),(StrToFloat(qtd)*StrToFloat(VlUnit)),'S');
            // Atualiza Grid
            DM.tbGrid.Edit;
            DM.tbGridVlUnit.AsCurrency  := StrToFloat(VlUnit);
            DM.tbGridQuantidade.AsFloat := StrToFloat(qtd);
            DM.tbGridVlTotal.AsCurrency := (StrToFloat(qtd)*StrToFloat(VlUnit));
            DM.tbGrid.Post;
            DBGrid1.SetFocus;
          end;
     end;
end;

procedure TFPrincipal.btIncluirClick(Sender: TObject);
var
  CodProduto: String;
  Qtd: String;
begin
  CodProduto := InputBox('Digite','Código do Produto:  ','');
  DM.qrProdutos.Close;
  DM.qrProdutos.SQL.Text := 'select * from produtos where codigoproduto = '+CodProduto;
  DM.qrProdutos.Open;
  if DM.qrProdutos.RecordCount = 1 then
     begin
       qtd := InputBox('  Produto',DM.qrProdutosCodigoProduto.AsString+' - '+
              Copy(DM.qrProdutosDescricao.AsString,1,30)+#13+
              'Valor unitário R$: '+FormatFloat('##,###.00',DM.qrProdutosPrecoVenda.AsFloat)+#13+
              'Digite a Quantidade: ','');
       if (qtd <> '') and (qtd <> '0') then
         begin
           DM.tbGrid.Append;
           DM.tbGridCodProduto.AsInteger := DM.qrProdutosCodigoProduto.AsInteger;
           DM.tbGridDescricao.AsString   := DM.qrProdutosDescricao.AsString;
           DM.tbGridVlUnit.AsCurrency    := DM.qrProdutosPrecoVenda.AsCurrency;
           DM.tbGridQuantidade.AsFloat   := StrToFloat(qtd);
           DM.tbGridVlTotal.AsCurrency   :=(StrToFloat(qtd) * DM.qrProdutosPrecoVenda.AsCurrency);
           DM.tbGrid.Post;
           Calcula(StrToFloat(qtd),StrToFloat(qtd) * DM.qrProdutosPrecoVenda.AsCurrency,'S');
           DBGrid1.SetFocus;
         end;
     end
  else
    MessageDlg('Produto não cadastrado!',TMsgDlgType.mtError,[mbOk], 0);
end;

procedure TFPrincipal.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Zebrar o DbGrid
  if not odd(DM.tbGrid.RecNo) then
     if not (gdSelected in State) then
        begin
          DBGrid1.Canvas.Brush.Color := clGray;
          DBGrid1.Canvas.Font.Color := clWhite;
          DBGrid1.Canvas.FillRect(Rect);
          DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
        end;
end;

procedure TFPrincipal.b1Click(Sender: TObject);
var
  vCliente: String;
begin
  vPedido := '';
  vCliente := InputBox('Digite','Código do Cliente: ','');
  if vCliente <> '' then
   begin
     DM.qrClientes.Close;
     DM.qrClientes.SQL.Text := 'select * from clientes where CodigoCliente = '+vCliente;
     DM.qrClientes.Open;
     if DM.qrClientes.RecordCount = 0 then
        begin
          MessageDlg('Cliente não exite!',TMsgDlgType.mtWarning,[mbOk], 0);
          Exit;
        end
     else
       begin
          ControleTela(False,True,True,True,False,True,True,True);
          edtCodCliente.Text  := DM.qrClientes.FieldByName('CodigoCliente').AsString;
          edtNomeCliente.Text := DM.qrClientes.FieldByName('Nome').AsString;
          // Zera Totais do pedido
          SomaItems := 0;
          SomaTotais := 0;
          edtNumeroItens.Text := '0';
          edtValorTotalGeral.Text := '0,00';
          // Limpa tabela temporaria
          DM.tbGrid.EmptyDataSet;
          DBGrid1.SetFocus;
       end;
   end;
end;

procedure TFPrincipal.b2Click(Sender: TObject);
var
 NPedido: String;
 VTotal:  String;
 VUnit:   String;
 Qtd:     String;
begin
  if StrToFloat(edtNumeroItens.Text) = 0 then
     MessageDlg('Este pedido não pode ser gravado.'+
                'Erro: O Pedido não tem itens!',TMsgDlgType.mtWarning,[mbOk], 0)
  else if vPedido <> '' then
     begin
      VTotal  := StringReplace(edtValorTotalGeral.Text,'.','',[]);
      VTotal  := StringReplace(VTotal,',','.',[]);
      DM.qrPedidos.Close;
      DM.qrPedidos.SQL.Text := 'delete from pedido where numeropedido = '+vPedido;
      DM.qrPedidos.ExecSQL;
      DM.qrPedidos.SQL.Text := 'insert into pedido (NumeroPedido,DataEmissao,CodigoCliente,ValorTotal) '+
                               ' values ('+VPedido+
                               ', now(), '+QuotedStr(edtCodCliente.Text)+
                               ', '+VTotal+')';
      DM.qrPedidos.ExecSQL;
      DM.tbGrid.First;
      DM.qrPedidoItens.Close;
      DM.qrPedidoItens.SQL.Text := 'delete from pedidoitem where numeropedido = '+vPedido;
      DM.qrPedidoItens.ExecSQL;
      DM.tbGrid.First;
      while not DM.tbGrid.Eof do
        begin
          Qtd    := StringReplace(DM.tbGridQuantidade.AsString,',','.',[]);
          VUnit  := StringReplace(DM.tbGridVlUnit.AsString,'.','',[]);
          VUnit  := StringReplace(VUnit,',','.',[]);
          VTotal := StringReplace(DM.tbGridVlTotal.AsString,'.','',[]);
          VTotal := StringReplace(VTotal,',','.',[]);
          DM.qrPedidoItens.Close;
          DM.qrPedidoItens.SQL.Text := 'insert into pedidoitem (NumeroPedido,CodigoProduto,Quantidade,ValorUnitario,ValorTotal) '+
                                       'values ('+vPedido+
                                       ', '+DM.tbGridCodProduto.AsString+
                                       ', '+Qtd+
                                       ', '+VUnit+
                                       ', '+VTotal+')';
          DM.qrPedidoItens.ExecSQL;
          DM.tbGrid.Next;
        end;
      ShowMessage('Pedido '+NPedido+', salvo com sucesso!');
      DM.tbGrid.EmptyDataSet;
      ControleTela(True,False,False,True,True,False,False,False);
     end
  else
    begin
      DM.qrPedidos.Close;
      NPedido := IntToStr(GeraNumero('Pedido'));
      VTotal  := StringReplace(edtValorTotalGeral.Text,'.','',[]);
      VTotal  := StringReplace(VTotal,',','.',[]);
      DM.qrPedidos.SQL.Text := 'insert into pedido (NumeroPedido,DataEmissao,CodigoCliente,ValorTotal) '+
                               ' values ('+NPedido+
                               ', now(), '+QuotedStr(edtCodCliente.Text)+
                               ', '+VTotal+')';
      DM.qrPedidos.ExecSQL;
      DM.tbGrid.First;
      while not DM.tbGrid.Eof do
        begin
          Qtd    := StringReplace(DM.tbGridQuantidade.AsString,',','.',[]);
          VUnit  := StringReplace(DM.tbGridVlUnit.AsString,'.','',[]);
          VUnit  := StringReplace(VUnit,',','.',[]);
          VTotal := StringReplace(DM.tbGridVlTotal.AsString,'.','',[]);
          VTotal := StringReplace(VTotal,',','.',[]);
          DM.qrPedidoItens.Close;
          DM.qrPedidoItens.SQL.Text := 'insert into pedidoitem (NumeroPedido,CodigoProduto,Quantidade,ValorUnitario,ValorTotal) '+
                                       'values ('+NPedido+
                                       ', '+DM.tbGridCodProduto.AsString+
                                       ', '+Qtd+
                                       ', '+VUnit+
                                       ', '+VTotal+')';
          DM.qrPedidoItens.ExecSQL;
          DM.tbGrid.Next;
        end;
      ShowMessage('Pedido '+NPedido+', salvo com sucesso!');
      DM.tbGrid.EmptyDataSet;
      ControleTela(True,False,False,True,True,False,False,False);
    end;
end;

procedure TFPrincipal.b3Click(Sender: TObject);
begin
  if MessageDlg('Cancelar o Pedido ?',TMsgDlgType.mtConfirmation,[mbYes, mbNo], 0) = mrYes then
     if vPedido = '' then
        begin
          ControleTela(True,False,False,True,True,False,False,False);
          edtCodCliente.Text := '';
          edtNomeCliente.Text := '';
          edtNumeroItens.Text := '0';
          edtValorTotalGeral.Text := '0,00';
          DM.tbGrid.EmptyDataSet;
        end
      else
        begin
          DM.qrPedidos.Close;
          DM.qrPedidos.SQL.Text := 'delete from pedido where numeropedido = '+vPedido;
          DM.qrPedidos.ExecSQL;

          DM.qrPedidoItens.Close;
          DM.qrPedidoItens.SQL.Text := 'delete from pedidoitem where numeropedido = '+vPedido;
          DM.qrPedidoItens.ExecSQL;
          ControleTela(True,False,False,True,True,False,False,False);
        end;
end;

procedure TFPrincipal.b4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrincipal.b5Click(Sender: TObject);
var
  tqtd: Extended;
begin
  tqtd := 0;
  vPedido := InputBox('Digite','Código do Cliente: ','');
  if vPedido <> '' then
   begin
     DM.qrPedidos.Close;
     DM.qrPedidos.SQL.Text := 'select * from pedido where NumeroPedido = '+vPedido;
     DM.qrPedidos.Open;
     if DM.qrPedidos.RecordCount = 0 then
        begin
          MessageDlg('Pedido '+vPedido+', não exite!',TMsgDlgType.mtWarning,[mbOk], 0);
          Exit;
        end
     else
       begin
          ControleTela(False,True,True,True,False,True,True,True);
          DM.qrClientes.Close;
          DM.qrClientes.SQL.Text := 'select * from clientes where CodigoCliente = '+DM.qrPedidosCodigoCliente.AsString;
          DM.qrClientes.Open;
          edtCodCliente.Text  := DM.qrClientes.FieldByName('CodigoCliente').AsString;
          edtNomeCliente.Text := DM.qrClientes.FieldByName('Nome').AsString;
          SomaTotais := DM.qrPedidosValorTotal.AsCurrency;
          edtValorTotalGeral.Text := FormatFloat('##,###.00',SomaTotais);
          // Limpa tabela temporaria
          DM.tbGrid.EmptyDataSet;
          DM.qrPedidoItens.Close;
          DM.qrPedidoItens.SQL.Text := 'select * from pedidoitem pi '+
                                       'inner join produtos p on p.codigoproduto = pi.codigoproduto '+
                                       'where numeropedido = '+vPedido;
          DM.qrPedidoItens.Open;
          while not DM.qrPedidoItens.eof do
            begin
              DM.tbGrid.Append;
              DM.tbGridCodProduto.AsInteger := DM.qrPedidoItensCodigoProduto.AsInteger;
              DM.tbGridDescricao.AsString   := DM.qrPedidoItens.FieldByName('Descricao').AsString;
              DM.tbGridVlUnit.AsCurrency    := DM.qrPedidoItensValorUnitario.AsCurrency;
              DM.tbGridQuantidade.AsFloat   := DM.qrPedidoItensQuantidade.AsFloat;
              DM.tbGridVlTotal.AsCurrency   := DM.qrPedidoItensValorTotal.AsCurrency;
              tqtd := tqtd + DM.qrPedidoItensQuantidade.AsFloat;
              DM.qrPedidoItens.Next;
            end;
           edtNumeroItens.Text := FloatToStr(tqtd);
       end;
       DM.tbGrid.First;
       DBGrid1.SetFocus;
   end;
end;

end.
