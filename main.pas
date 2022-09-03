unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Inifiles;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

var
  appIni: TIniFile;
  FN: string;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label1.Caption:=TimeToStr(Now);
  Label2.Caption:=DateToStr(Now);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FN := 'klok.ini';
  appINI := TIniFile.Create(FN);
  try
    Top := appINI.ReadInteger('Placement','Top',Top);
    Left := appINI.ReadInteger('Placement','Left',Left);
    Width := appINI.ReadInteger('Placement','Width',Width);
    Height := appINI.ReadInteger('Placement','Height',Height);
  finally
    appINI.Free;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  appINI := TIniFile.Create(FN);
  try
    with appINI do
    begin
      WriteInteger('Placement','Top',Top);
      WriteInteger('Placement','Left',Left);
      WriteInteger('Placement','Width',Width);
      WriteInteger('Placement','Height',Height);
    end;
  finally
    appINI.Free;
  end;
  CloseAction := caFree;
end;

end.

