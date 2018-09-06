unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    DrawBtn: TButton;
    procedure DrawBtnClick(Sender: TObject);
    procedure DrawLines(n : integer; C : TColor);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DrawBtnClick(Sender: TObject);
begin
 DrawLines(10000,clBlack);
 DrawLines(5000,clRed);
 DrawLines(6000,clYellow);
 DrawLines(100000,clBlack);
 Form1.Canvas.Brush.Color:=clBlack;
 Form1.Canvas.FillRect(0,0,Form1.Width,Form1.Height);
end;

procedure TForm1.DrawLines(n: integer; C: TColor);
var randomPoint : TPoint;
    i :integer;
begin
 Form1.Canvas.Pen.Color := C;
  randomize;
for i := 0 to n do
  begin
  randomPoint.x:= random(Form1.Width);
  randomPoint.y:= random(Form1.Height);

  Form1.Canvas.MoveTo(Form1.Width div 2, Form1.Height div 2);
  Form1.Canvas.LineTo(randomPoint);
  end;
end;

end.

