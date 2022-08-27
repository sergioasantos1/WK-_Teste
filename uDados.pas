unit uDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.ODBCDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.ODBC, Data.Win.ADODB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.UI;

type
  TDM = class(TDataModule)
    tbParametros: TFDMemTable;
    tbParametrostbState: TStringField;
    dsGrid: TDataSource;
    Con: TADOConnection;
    qrProdutos: TADOQuery;
    dsProdutos: TDataSource;
    qrClientes: TADOQuery;
    dsClientes: TDataSource;
    tbParametrosPedido: TStringField;
    qrPedidos: TADOQuery;
    dsPedidos: TDataSource;
    qrPedidosID: TAutoIncField;
    qrPedidosNumeroPedido: TIntegerField;
    qrPedidosDataEmissao: TDateField;
    qrPedidosCodigoCliente: TIntegerField;
    qrPedidosValorTotal: TBCDField;
    tbGrid: TFDMemTable;
    tbGridDescricao: TStringField;
    qrProdutosCodigoProduto: TAutoIncField;
    qrProdutosDescricao: TWideStringField;
    qrProdutosPrecoVenda: TBCDField;
    tbGridCodProduto: TIntegerField;
    tbGridVlUnit: TCurrencyField;
    tbGridQuantidade: TFloatField;
    tbGridVlTotal: TCurrencyField;
    tbGridCancelado: TBooleanField;
    qrNumeros: TADOQuery;
    qrNumerosPedido: TIntegerField;
    qrNumerosItem: TIntegerField;
    qrPedidoItens: TADOQuery;
    dsPedidoItens: TDataSource;
    qrPedidoItensid: TAutoIncField;
    qrPedidoItensNumeroPedido: TIntegerField;
    qrPedidoItensCodigoProduto: TIntegerField;
    qrPedidoItensQuantidade: TBCDField;
    qrPedidoItensValorUnitario: TBCDField;
    qrPedidoItensValorTotal: TBCDField;
    qrPedidoItensCodigoProduto_1: TAutoIncField;
    qrPedidoItensDescricao: TWideStringField;
    qrPedidoItensPrecoVenda: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
