object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'WK Teste'
  ClientHeight = 520
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 501
    Width = 774
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end>
    ExplicitTop = 438
    ExplicitWidth = 701
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 774
    Height = 41
    ButtonHeight = 38
    ButtonWidth = 93
    Caption = 'ToolBar1'
    Images = ImageList1
    ShowCaptions = True
    TabOrder = 1
    ExplicitWidth = 701
    object b5: TToolButton
      Left = 0
      Top = 0
      Caption = 'Carregar Pedido'
      ImageIndex = 1
      OnClick = b5Click
    end
    object b1: TToolButton
      Left = 93
      Top = 0
      Caption = 'Novo Pedido'
      ImageIndex = 0
      OnClick = b1Click
    end
    object b2: TToolButton
      Left = 186
      Top = 0
      Caption = 'Gravar Pedido'
      ImageIndex = 2
      OnClick = b2Click
    end
    object b3: TToolButton
      Left = 279
      Top = 0
      Caption = 'Cancelar Pedido'
      ImageIndex = 3
      OnClick = b3Click
    end
    object b4: TToolButton
      Left = 372
      Top = 0
      Caption = 'Sair'
      ImageIndex = 4
      OnClick = b4Click
    end
  end
  object p1: TPanel
    Left = 0
    Top = 41
    Width = 774
    Height = 68
    Align = alTop
    BorderWidth = 2
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 119
    ExplicitWidth = 701
    object GroupBox1: TGroupBox
      Left = 17
      Top = 6
      Width = 672
      Height = 52
      Caption = '  Cliente:  '
      TabOrder = 0
      object edtCodCliente: TEdit
        Left = 14
        Top = 22
        Width = 91
        Height = 23
        ReadOnly = True
        TabOrder = 0
      end
      object edtNomeCliente: TEdit
        Left = 111
        Top = 22
        Width = 546
        Height = 23
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object p3: TPanel
    Left = 0
    Top = 424
    Width = 774
    Height = 77
    Align = alBottom
    BorderWidth = 2
    TabOrder = 3
    ExplicitWidth = 701
    object GroupBox2: TGroupBox
      Left = 17
      Top = 8
      Width = 152
      Height = 63
      Caption = 'N'#250'mero de Itens'
      TabOrder = 0
      object edtNumeroItens: TEdit
        Left = 14
        Top = 24
        Width = 121
        Height = 23
        Alignment = taCenter
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
    end
    object GroupBox3: TGroupBox
      Left = 175
      Top = 8
      Width = 152
      Height = 63
      Caption = 'Valor Total R$'
      TabOrder = 1
      object edtValorTotalGeral: TEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 23
        Alignment = taRightJustify
        TabOrder = 0
        Text = '0,00'
      end
    end
    object GroupBox4: TGroupBox
      Left = 464
      Top = 6
      Width = 302
      Height = 63
      Caption = '<  Produto  >'
      TabOrder = 2
      object ToolBar2: TToolBar
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 292
        Height = 38
        Align = alClient
        ButtonHeight = 38
        ButtonWidth = 96
        Caption = 'ToolBar2'
        Images = ImageList1
        ShowCaptions = True
        TabOrder = 0
        ExplicitLeft = 21
        ExplicitTop = 22
        ExplicitWidth = 282
        object btIncluir: TToolButton
          Left = 0
          Top = 0
          Caption = '[F2]  -  Incluir'
          ImageIndex = 5
          OnClick = btIncluirClick
        end
        object btEditar: TToolButton
          Left = 96
          Top = 0
          Caption = '[Enter]  -  Editar'
          ImageIndex = 7
          OnClick = btEditarClick
        end
        object btDeletar: TToolButton
          Left = 192
          Top = 0
          Caption = '[Delete] - Deletar'
          ImageIndex = 6
          OnClick = btDeletarClick
        end
      end
    end
  end
  object p2: TPanel
    Left = 0
    Top = 109
    Width = 774
    Height = 315
    Align = alClient
    BorderWidth = 5
    TabOrder = 4
    ExplicitLeft = 328
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 762
      Height = 303
      Align = alClient
      DataSource = DM.dsGrid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnKeyDown = FormKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CodProduto'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Title.Caption = '          Produto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 360
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlUnit'
          Title.Alignment = taCenter
          Title.Caption = 'Vl. Unit'#225'rio R$'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlTotal'
          Title.Alignment = taCenter
          Title.Caption = 'Vl. Total R$'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end>
    end
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 584
    Top = 8
  end
  object ImageList1: TImageList
    Left = 528
    Top = 169
    Bitmap = {
      494C010108001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00FEFEFE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FBFBFB000000
      000000000000FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FEFEFE00000000000000000000000000000000000000000000000000FCFC
      FC00FEFEFE0000000000000000000000000000000000FEFEFE00FEFEFE00FEFE
      FE00FCFCFC000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00000000000000
      0000000000000101010000000000010101000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008B8B
      8B00000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      00002E2E2E000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FAFAFA008080800080808000FAFAFA00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000001111
      1100ECECEC00FEFEFE000000000000000000FDFDFD000000000000000000FBFB
      FB00020202000000000000000000000000000000000000000000000000000000
      00001010100031313100FDFDFD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001414
      1400F0F0F000000000000000000000000000FEFEFE00FEFEFE00000000000000
      00000000000000000000000000000000000000000000FAFAFA004D4D4D000F0F
      0F00FBFBFB001010100030303000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE00000000000000000000000000EFEFEF007171
      710000000000FDFDFD00FDFDFD0000000000000000000000000000000000FEFE
      FE0000000000FEFEFE00000000007F7F7F007F7F7F0000000000FEFEFE000000
      0000FEFEFE000000000000000000000000000000000000000000000000001010
      1000EFEFEF00717171007070700000000000000000007373730070707000FCFC
      FC00000000000000000000000000000000000000000000000000000000004E4E
      4E000F0F0F0000000000121212002E2E2E00FDFDFD00FDFDFD00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC000000000000000000FCFCFC00000000000404
      04006F6F6F000000000000000000FAFAFA00000000000000000000000000FEFE
      FE000000000000000000000000007E7E7E007E7E7E0000000000000000000000
      0000FEFEFE000000000000000000000000000000000000000000000000000F0F
      0F00EFEFEF000000000001010100717171007272720003030300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000505050000E0E0E0000000000111111002D2D2D00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE007F7F7F007D7D7D0083838300818181007F7F7F008080
      80000606060072727200FEFEFE00FDFDFD000000000000000000000000008080
      80007E7E7E007E7E7E007C7C7C0042424200424242007C7C7C007E7E7E007E7E
      7E00808080000000000000000000000000000000000000000000000000001010
      1000EEEEEE00FCFCFC0000000000040404000202020000000000FDFDFD000000
      000001010100000000000000000000000000000000000000000000000000FDFD
      FD00000000005252520012121200FEFEFE001515150033333300FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE007F7F7F007D7D7D007E7E7E0081818100848484007F7F
      7F00040404008B8B8B0000000000000000000000000000000000000000008080
      80007E7E7E007E7E7E007C7C7C0042424200424242007C7C7C007E7E7E007E7E
      7E00808080000000000000000000000000000000000000000000000000001010
      1000EDEDED00FCFCFC009191910000000000000000007777770000000000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00505050001010100000000000111111002E2E2E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC000000000000000000FEFEFE00FEFEFE000000
      00008D8D8D00FDFDFD000000000000000000000000000000000000000000FEFE
      FE000000000000000000000000007E7E7E007E7E7E0000000000000000000000
      0000FEFEFE000000000000000000000000000000000000000000000000001010
      1000EFEFEF008F8F8F000303030000000000000000000000000080808000FEFE
      FE00030303000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004F4F4F001313130000000000101010003131
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE0000000000FDFDFD00FCFCFC00DDDDDD009494
      94000000000000000000FEFEFE00FCFCFC00000000000000000000000000FEFE
      FE0000000000FEFEFE00000000007F7F7F007F7F7F0000000000FEFEFE000000
      0000FEFEFE000000000000000000000000000000000000000000000000001111
      1100F0F0F000000000000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC005353530011111100000000000000
      0000BEBEBE0000000000000000000000000000000000FEFEFE00000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F0F
      0F00EDEDED00000000000000000000000000000000000000000000000000FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005353530000000000C0C0
      C0000000000030303000FBFBFB00FAFAFA00000000000000000000000000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FAFAFA008080800080808000FAFAFA00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000001111
      1100717171008080800080808000808080008080800080808000808080008181
      8100010101000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC0000000000D1D1D1000000
      00000000000000000000FEFEFE00FDFDFD0000000000FDFDFD00050505000303
      0300020202000101010000000000010101000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00000000000303030000000000000000007E7E7E007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005151
      51000202020031313100000000000000000000000000FCFCFC00FDFDFD00FEFE
      FE0000000000FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F9000000000000000000FBFBFB0000000000FDFDFD000000000000000000FCFC
      FC00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000FEFEFE00FEFEFE00000000000000000000000000000000000000
      000000000000FCFCFC0000000000FDFDFD00FDFDFD0000000000FEFEFE00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFC0000000000FDFDFD00000000000000000000000000FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFC0000000000FDFDFD00000000000000000000000000FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFC0000000000FDFDFD00000000000000000000000000FDFD
      FD0000000000000000000000000000000000000000000000000000000000FCFC
      FC00FCFCFC0000000000919191001F1F1F001E1E1E007B7B7B00000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00FCFCFC0000000000919191001F1F1F001D1D1D0080808000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00FCFCFC0000000000919191001F1F1F001D1D1D0080808000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00FCFCFC0000000000919191001F1F1F001D1D1D0080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001E1E1E000000000062626200E0E0E000F0F0F00071717100020202001111
      1100FAFAFA000000000000000000000000000000000000000000000000000000
      00001E1E1E000000000062626200E0E0E000DFDFDF0072727200000000001111
      1100FAFAFA000000000000000000000000000000000000000000000000000000
      00001E1E1E000000000062626200E0E0E000DFDFDF0072727200000000001111
      1100FAFAFA000000000000000000000000000000000000000000000000000000
      00001E1E1E000000000062626200E0E0E000DFDFDF0072727200000000001111
      1100FAFAFA0000000000000000000000000000000000FEFEFE00000000000000
      00003F3F3F000000000000000000FEFEFE0000000000FBFBFB00000000005E5E
      5E0000000000FBFBFB00000000000000000000000000FEFEFE00000000000000
      0000444444000000000000000000000000000000000000000000000000005F5F
      5F0000000000FBFBFB00000000000000000000000000FEFEFE00000000000000
      00003F3F3F000000000000000000000000000000000000000000FEFEFE005E5E
      5E0000000000FBFBFB00000000000000000000000000FEFEFE00000000000000
      00003F3F3F000000000000000000000000000000000000000000FEFEFE005E5E
      5E0000000000FBFBFB000000000000000000FBFBFB00000000001F1F1F003E3E
      3E00FDFDFD00000000000000000000000000FCFCFC0000000000000000000000
      00006464640012121200FEFEFE0000000000FBFBFB00000000001F1F1F003E3E
      3E00FEFEFE0000000000FDFDFD000000000000000000FBFBFB00FCFCFC00FEFE
      FE005E5E5E0012121200FEFEFE0000000000FBFBFB00000000001F1F1F003E3E
      3E00FDFDFD0000000000FAFAFA000000000000000000FBFBFB00FDFDFD000000
      00006464640012121200FEFEFE0000000000FBFBFB00000000001F1F1F003E3E
      3E00FDFDFD0000000000FDFDFD000000000000000000FBFBFB00FDFDFD000000
      00006464640012121200FEFEFE000000000000000000FDFDFD0000000000FEFE
      FE00000000000000000000000000AEAEAE004D4D4D00FCFCFC00FEFEFE00FEFE
      FE000000000000000000000000000000000000000000FDFDFD0000000000FEFE
      FE00FDFDFD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00000000000000
      000000000000FEFEFE006F6F6F005F5F5F000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD0000000000FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00000000000000000000000000000000009F9F9F0053535300FDFD
      FD00FCFCFC000000000000000000ADADAD004F4F4F0000000000000000000000
      0000FDFDFD005F5F5F0080808000FEFEFE00000000009F9F9F00535353000000
      0000FDFDFD00000000000000000000000000FBFBFB00FAFAFA0000000000FAFA
      FA00FDFDFD005F5F5F0080808000FEFEFE00000000009F9F9F00535353000000
      0000000000007070700003030300000000006363630000000000FEFEFE00FEFE
      FE00000000005F5F5F0080808000FEFEFE00000000009F9F9F0053535300FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000005F5F5F0080808000FEFEFE00FBFBFB002E2E2E00CECECE000000
      0000000000003E3E3E004242420030303000111111003D3D3D00404040000000
      0000FCFCFC00E1E1E1002222220000000000FBFBFB002E2E2E00CECECE000000
      000000000000FCFCFC0000000000000000001313130000000000FDFDFD000000
      000000000000E1E1E1002222220000000000FBFBFB002E2E2E00CECECE00FBFB
      FB00707070000303030000000000000000000000000061616100000000000000
      000000000000E1E1E1002222220000000000FBFBFB002E2E2E00CECECE000000
      0000FEFEFE009E9E9E009E9E9E009E9E9E009E9E9E009E9E9E009E9E9E000000
      0000FEFEFE00E1E1E10022222200000000000000000020202000DCDCDC00FDFD
      FD0000000000C0C0C000BCBCBC007F7F7F0042424200BDBDBD00C1C1C1000000
      0000FDFDFD00F1F1F10013131300000000000000000020202000DCDCDC000000
      000000000000000000000303030001010100000000000B0B0B00FCFCFC000000
      000000000000F1F1F10013131300000000000000000020202000DCDCDC00FEFE
      FE0000000000FAFAFA00000000000000000000000000030303005B5B5B00FEFE
      FE0000000000F1F1F10013131300000000000000000020202000DCDCDC000000
      000000000000606060006060600060606000606060006060600060606000FEFE
      FE00FEFEFE00F1F1F1001313130000000000FDFDFD008D8D8D00515151000000
      000000000000FEFEFE0000000000ADADAD0052525200FEFEFE00000000000000
      0000FEFEFE00717171008F8F8F00FDFDFD00FDFDFD008D8D8D00515151000000
      0000FEFEFE0080808000343434006E6E6E008A8A8A0023232300A0A0A0000000
      0000FEFEFE00717171008F8F8F00FDFDFD00FDFDFD008D8D8D0051515100FCFC
      FC00FEFEFE00FEFEFE0000000000FEFEFE00FBFBFB00FCFCFC00000000006464
      6400FEFEFE00717171008F8F8F00FDFDFD00FDFDFD008D8D8D00515151000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000717171008F8F8F00FDFDFD0000000000FEFEFE00000000000000
      000000000000FEFEFE00FEFEFE00AFAFAF0052525200FDFDFD0000000000FEFE
      FE00FEFEFE0000000000000000000000000000000000FEFEFE00000000000000
      0000FEFEFE00FEFEFE00FCFCFC006F6F6F008F8F8F00FEFEFE00000000000000
      00000000000000000000000000000000000000000000FEFEFE0000000000FDFD
      FD00FEFEFE00FEFEFE00FEFEFE0000000000FCFCFC000000000000000000FAFA
      FA00FDFDFD0000000000000000000000000000000000FEFEFE0000000000FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000353535006060
      6000FBFBFB000000000000000000000000000000000000000000FCFCFC000000
      0000515151000E0E0E0000000000000000000000000000000000353535006060
      6000FBFBFB0000000000000000007373730091919100FEFEFE00000000000000
      0000515151000E0E0E0000000000000000000000000000000000353535006060
      6000FBFBFB0000000000FEFEFE000000000000000000FAFAFA00000000000000
      0000515151000E0E0E0000000000000000000000000000000000353535006060
      6000FBFBFB0000000000FEFEFE000000000000000000FAFAFA00000000000000
      0000515151000E0E0E0000000000000000000000000000000000000000000000
      0000434343000000000000000000FEFEFE0000000000FBFBFB00000000004C4C
      4C0001010100FEFEFE00FEFEFE00FDFDFD000000000000000000000000000000
      000043434300000000000000000000000000FEFEFE00FEFEFE00000000004C4C
      4C0001010100FEFEFE00FEFEFE00FDFDFD000000000000000000000000000000
      0000434343000000000000000000FEFEFE000000000000000000000000004C4C
      4C0001010100FEFEFE00FEFEFE00FDFDFD000000000000000000000000000000
      0000434343000000000000000000FEFEFE000000000000000000000000004C4C
      4C0001010100FEFEFE00FEFEFE00FDFDFD000000000000000000000000000000
      000034343400000000004E4E4E00CDCDCD00DDDDDD005D5D5D00000000001111
      1100000000000000000000000000000000000000000000000000000000000000
      000034343400000000004F4F4F00CCCCCC00DDDDDD005D5D5D00000000001111
      1100000000000000000000000000000000000000000000000000000000000000
      000034343400000000004F4F4F00CCCCCC00DDDDDD005D5D5D00000000001111
      1100000000000000000000000000000000000000000000000000000000000000
      000034343400000000004F4F4F00CCCCCC00DDDDDD005D5D5D00000000001111
      110000000000000000000000000000000000000000000000000000000000FCFC
      FC0000000000FDFDFD008E8E8E00343434001C1C1C0083838300FCFCFC000000
      0000FDFDFD00000000000000000000000000000000000000000000000000FCFC
      FC0000000000FDFDFD008E8E8E00333333001C1C1C0083838300FCFCFC000000
      0000FDFDFD00000000000000000000000000000000000000000000000000FCFC
      FC0000000000FDFDFD008E8E8E00333333001C1C1C0083838300FCFCFC000000
      0000FDFDFD00000000000000000000000000000000000000000000000000FCFC
      FC0000000000FDFDFD008E8E8E00333333001C1C1C0083838300FCFCFC000000
      0000FDFDFD00000000000000000000000000000000000000000000000000FEFE
      FE0000000000000000000000000000000000FEFEFE000000000000000000FDFD
      FD0000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000FDFDFD000000000000000000FEFEFE000000000000000000FDFD
      FD0000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000FDFDFD000000000000000000FEFEFE000000000000000000FDFD
      FD0000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000FDFDFD000000000000000000FEFEFE000000000000000000FDFD
      FD0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000007FFFFFFFF7FFE7FF9BFFFFFFE7E787FF
      00FFFFFFE007C7FFCFFFF81FE367D1FF9FFFFE7FE73781FFD9C9EA57E187E41F
      DDA6EE77E437F23FD800E007E257E81FD803E007E027F89FDD83EE77E187FE4F
      D90CEA57E777FE279FEFFE7FE7E7FF88CFFFF81FE007FF5080FFFFFFE007FFE3
      8BFFFFFFFDFFFFED67FFFFFFFF7FFFE9FA4FFAEFFAEFFAEFE43FE43FE43FE43F
      F007F007F007F007A6A3A7E3A7C3A7C347714581459145918E0B801B98FB8FF3
      8670972098488FF818111A590339101188119C198B8998011A30101002001FF8
      9823903B81638FFBC7D3C633C5B3C5B3E6A0E720E6E0E6E0F00FF00FF00FF00F
      E817E817E817E817EF6FEB6FEB6FEB6F00000000000000000000000000000000
      000000000000}
  end
end