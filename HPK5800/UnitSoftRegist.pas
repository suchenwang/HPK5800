unit UnitSoftRegist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFrmRegist = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegist: TFrmRegist;

implementation

uses UnitVar;

{$R *.dfm}

procedure TFrmRegist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmRegistCrt := False;
    Action := caFree;
end;

end.
