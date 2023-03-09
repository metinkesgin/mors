unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CPortCtl, CPort,
  FireDAC.UI.Intf, System.StrUtils, FireDAC.VCLUI.Login, FireDAC.Stan.Intf, FireDAC.Comp.UI,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    ComComboBox1: TComComboBox;
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    ComPort1: TComPort;
    ComDataPacket1: TComDataPacket;
    Button2: TButton;
    Memo3: TMemo;
    Memo4: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure ComComboBox1Change(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
    procedure ComDataPacket1Discard(Sender: TObject; const Str: string);
    procedure MorstoASCII;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
var
 rxBuffer : String;
 rxMorsBuffer : String;
 firstLet : Boolean;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if ComPort1.Connected = True then
    begin
      Button1.Caption := 'Aç';
      ComPort1.Close;
    end
  else
    begin
      Button1.Caption := 'Kapat';
      ComPort1.Open;
    end;
end;


procedure TForm2.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
  Memo3.Clear;
  Memo4.Clear;
end;

procedure TForm2.ComComboBox1Change(Sender: TObject);
begin
  ComPort1.Port := ComComboBox1.Text;
end;


procedure TForm2.ComDataPacket1Discard(Sender: TObject; const Str: string);
begin
    //Memo4.Lines.Add(Str);
end;

procedure TForm2.ComDataPacket1Packet(Sender: TObject; const Str: string);
begin
  rxBuffer := Str;
  Memo1.Lines.Add(rxBuffer);
  if rxBuffer = 'DAH' then
    Memo2.Text := Memo2.Text + '-'
  else if rxBuffer = 'DIT' then
    Memo2.Text := Memo2.Text + '.'
  else if rxBuffer = '/' then
  begin
    Memo2.Text := Memo2.Text + '/';
    rxMorsBuffer := Memo2.Text;

    MorstoASCII;
  end;

end;

procedure TForm2.MorstoASCII;
const
  AlphaTable: array['A'..'Z'] of string = (
    '.-', '-...', '-.-.', '-..', '.', '..-.', '--.', '....', '..', '.---',
    '-.-', '.-..', '--', '-.', '---', '.--.', '--.-', '.-.', '...', '-',
    '..-', '...-', '.--', '-..-', '-.--', '--..'
  );
var
 let : String;
begin
  let := Copy(rxMorsBuffer,0,pos('/',rxMorsBuffer)-1);
  Delete(rxMorsBuffer,1,Pos('/',rxMorsBuffer));
  Memo2.Text := rxMorsBuffer;
  Memo3.Text := let;
  Memo4.Text := Memo4.Text + Chr(Ord('A') + IndexStr(let,AlphaTable));
end;

end.
