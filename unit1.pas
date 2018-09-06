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
              //Zeichnet n Linien von der Mitte zu jeweils einem zufälligem Punkt
              // in der Farbe C.
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
 DrawLines(10000,clBlack); //Aufrufen der Procedure mit verschiedenen Farben um
 DrawLines(5000,clRed);    // eine "Explosion" zu erzeugen
 DrawLines(6000,clYellow);
 DrawLines(100000,clBlack);
                           // Komplettes Bild wieder Schwarz setzen
 Form1.Canvas.Brush.Color:=clBlack;
 Form1.Canvas.FillRect(0,0,Form1.Width,Form1.Height);
end;

procedure TForm1.DrawLines(n: integer; C: TColor);
var randomPoint : TPoint;
    i :integer;
begin
 Form1.Canvas.Pen.Color := C; //Setzt die Farbe C als Zeichenfarbe
  randomize;
for i := 0 to n do            //For-Schleife um n-mal eine Linie zu zeichnen
  begin
       //Zufälligen Punkt auswählen
  randomPoint.x:= random(Form1.Width);
  randomPoint.y:= random(Form1.Height);
       //Von der Mitte zu diesem Punkt eine Linie zeichnen
  Form1.Canvas.MoveTo(Form1.Width div 2, Form1.Height div 2);
  Form1.Canvas.LineTo(randomPoint);
  end;
end;

end.

