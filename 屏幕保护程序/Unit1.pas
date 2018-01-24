unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    img1: TImage;
    tmr1: TTimer;
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TButton;
    tmr2: TTimer;
    tmr3: TTimer;
    lbl2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure tmr3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  flag:Boolean=True;
  n:Integer= 3 ;
implementation
            const
              Password:string='857452800';
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
     Img1.Left:=0;
     Img1.Top:=0;
     Img1.Width:=1920;
     Img1.Height:=1080;
     edt1.Visible:=False;
     btn1.Visible:=False;
     lbl2.Visible:=False;

end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
            
            lbl1.Left:=Random(1500)  ;
            lbl1.Top:=Random(900)    ;
            lbl1.Font.Size:=Random( 45 );

            case(Random(5)) of
              0:lbl1.Font.Color:=clRed;
              1:lbl1.Font.Color:=clYellow;
              2:lbl1.Font.Color:=clOlive;
              3:lbl1.Font.Color:=clBlack;
              4:lbl1.Font.Color:=clGreen;
            end;
            case(Random(3)) of
              0:lbl1.Color:=clWhite;
              1:lbl1.Color:=clNavy;
              2:lbl1.Color:=clFuchsia;
            end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if((Key=Vk_Space)  and ( flag = True))then
     begin
        edt1.Visible:=True;
        btn1.Visible:=True;
        lbl2.Visible:=True;
     end
     else
      begin
        if( flag = False )then
        MessageBox(Handle,'错误次数太多，程序暂时禁止再次输入，请稍候再试！','警告',MB_OK or MB_ICONSTOP)
        else
        MessageBox(Handle,'请按下空格并输入密码解锁','提醒',MB_ICONSTOP);
      end;


end;

procedure TForm1.btn1Click(Sender: TObject);
begin
       if((edt1.Text=Password) and (n > 0 ))then
          Close
       else
          if( n > 0)then
          begin
            MessageBox(Handle,'密码错误！','警告',MB_OK or MB_ICONWARNING);
            n:=n-1;
            edt1.Text:='';
          end
         else
            begin

              MessageBox(Handle,'错误次数太多，程序暂时禁止再次输入，请5秒后再试！','警告',MB_OK or MB_ICONSTOP);
              tmr2.Enabled:=True;
            end;

end;

procedure TForm1.tmr2Timer(Sender: TObject);
begin
     flag:=True;
     n:=3;
     tmr2.Enabled:=False;

end;

procedure TForm1.tmr3Timer(Sender: TObject);
begin
SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOSIZE+SWP_NOMOVE)  ;
end;

end.
