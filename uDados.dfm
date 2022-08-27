object DM: TDM
  Height = 428
  Width = 445
  PixelsPerInch = 96
  object tbParametros: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 368
    Top = 8
    object tbParametrostbState: TStringField
      FieldName = 'tbState'
      Size = 1
    end
    object tbParametrosPedido: TStringField
      FieldName = 'Pedido'
      Size = 1
    end
  end
  object dsGrid: TDataSource
    DataSet = tbGrid
    Left = 80
    Top = 88
  end
  object Con: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=gestor;Da' +
      'ta Source=ODBC_MySQL;Mode=ReadWrite;Initial Catalog=WKTeste'
    DefaultDatabase = 'wkteste'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDASQL'
    Left = 24
    Top = 8
  end
  object qrProdutos: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produtos')
    Left = 24
    Top = 168
    object qrProdutosCodigoProduto: TAutoIncField
      FieldName = 'CodigoProduto'
      ReadOnly = True
    end
    object qrProdutosDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qrProdutosPrecoVenda: TBCDField
      FieldName = 'PrecoVenda'
      Precision = 10
      Size = 2
    end
  end
  object dsProdutos: TDataSource
    DataSet = qrProdutos
    Left = 104
    Top = 168
  end
  object qrClientes: TADOQuery
    Active = True
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from clientes')
    Left = 24
    Top = 224
  end
  object dsClientes: TDataSource
    DataSet = qrClientes
    Left = 104
    Top = 224
  end
  object qrPedidos: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from pedido')
    Left = 23
    Top = 288
    object qrPedidosID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qrPedidosNumeroPedido: TIntegerField
      FieldName = 'NumeroPedido'
    end
    object qrPedidosDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object qrPedidosCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object qrPedidosValorTotal: TBCDField
      FieldName = 'ValorTotal'
      Precision = 10
      Size = 2
    end
  end
  object dsPedidos: TDataSource
    DataSet = qrPedidos
    Left = 103
    Top = 288
  end
  object tbGrid: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 32
    Top = 88
    object tbGridCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tbGridDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tbGridVlUnit: TCurrencyField
      FieldName = 'VlUnit'
    end
    object tbGridQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tbGridVlTotal: TCurrencyField
      FieldName = 'VlTotal'
    end
    object tbGridCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
  end
  object qrNumeros: TADOQuery
    Active = True
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from numeros')
    Left = 368
    Top = 64
    object qrNumerosPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object qrNumerosItem: TIntegerField
      FieldName = 'Item'
    end
  end
  object qrPedidoItens: TADOQuery
    Active = True
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from pedidoitem pi'
      'inner join produtos p'
      'on p.codigoproduto = pi.codigoproduto')
    Left = 23
    Top = 344
    object qrPedidoItensid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qrPedidoItensNumeroPedido: TIntegerField
      FieldName = 'NumeroPedido'
    end
    object qrPedidoItensCodigoProduto: TIntegerField
      FieldName = 'CodigoProduto'
    end
    object qrPedidoItensQuantidade: TBCDField
      FieldName = 'Quantidade'
      Precision = 10
      Size = 3
    end
    object qrPedidoItensValorUnitario: TBCDField
      FieldName = 'ValorUnitario'
      Precision = 10
      Size = 2
    end
    object qrPedidoItensValorTotal: TBCDField
      FieldName = 'ValorTotal'
      Precision = 10
      Size = 2
    end
    object qrPedidoItensCodigoProduto_1: TAutoIncField
      FieldName = 'CodigoProduto_1'
      ReadOnly = True
    end
    object qrPedidoItensDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qrPedidoItensPrecoVenda: TBCDField
      FieldName = 'PrecoVenda'
      Precision = 10
      Size = 2
    end
  end
  object dsPedidoItens: TDataSource
    DataSet = qrPedidoItens
    Left = 103
    Top = 344
  end
end
