object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Mors'
  ClientHeight = 342
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 337
    Height = 329
    TabOrder = 0
    object ComComboBox1: TComComboBox
      Left = 105
      Top = 17
      Width = 127
      Height = 23
      ComPort = ComPort1
      ComProperty = cpPort
      Text = ''
      Style = csDropDownList
      ItemIndex = -1
      TabOrder = 0
      OnChange = ComComboBox1Change
    end
    object Button1: TButton
      Left = 24
      Top = 15
      Width = 75
      Height = 25
      Caption = 'A'#231
      TabOrder = 1
      OnClick = Button1Click
    end
    object Memo1: TMemo
      Left = 24
      Top = 46
      Width = 289
      Height = 57
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object Memo2: TMemo
      Left = 24
      Top = 110
      Width = 289
      Height = 57
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object Button2: TButton
      Left = 238
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Temizle'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Memo3: TMemo
      Left = 24
      Top = 173
      Width = 289
      Height = 57
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object Memo4: TMemo
      Left = 24
      Top = 247
      Width = 289
      Height = 57
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 6
    end
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = False
    Left = 216
    Top = 256
  end
  object ComDataPacket1: TComDataPacket
    ComPort = ComPort1
    StartString = 'M'
    StopString = 'K'
    OnDiscard = ComDataPacket1Discard
    OnPacket = ComDataPacket1Packet
    Left = 264
    Top = 256
  end
end
