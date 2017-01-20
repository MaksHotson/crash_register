unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldblib, sqldb, db, sqlite3conn, FileUtil, DateTimePicker,
  RTTICtrls, RTTIGrids, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, DbCtrls, Spin, DBGrids, Types, Messages, Variants;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    cityDBLookupComboBox: TDBLookupComboBox;
    ltDBLookupComboBox: TDBLookupComboBox;
    cityDBLookupComboBox2: TDBLookupComboBox;
    condDBLookupComboBox1: TDBLookupComboBox;
    DataSource10: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    DataSource8: TDataSource;
    DataSource9: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Panel2: TPanel;
    psrlzDBLookupComboBox: TDBLookupComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    lightsnEdit: TEdit;
    pssnEdit: TEdit;
    objDBLookupComboBox: TDBLookupComboBox;
    condDBLookupComboBox: TDBLookupComboBox;
    DBLookupListBox1: TDBLookupListBox;
    DBLookupListBox2: TDBLookupListBox;
    PageControl1: TPageControl;
    Panel1: TPanel;
    quantSpinEdit: TSpinEdit;
    ScrollBox1: TScrollBox;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SQLDBLibraryLoader1: TSQLDBLibraryLoader;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery10: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLQuery4: TSQLQuery;
    SQLQuery5: TSQLQuery;
    SQLQuery6: TSQLQuery;
    SQLQuery7: TSQLQuery;
    SQLQuery8: TSQLQuery;
    SQLQuery9: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    TabControl1: TTabControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure TabControl1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

  procedure ObjGridFormating(Pos: Integer);
  procedure ObjShow();
  procedure ObjLGridFormating(Pos: Integer);
  procedure ObjLShow();
  procedure AfterCommit();

var
  Form1: TForm1;

  ObjGridKey: Integer;
  ObjLGridKey: Integer;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  SQlite3Connection1.DatabaseName := ExtractFilePath(Application.ExeName) + ChangeFileExt(ExtractFileName(Application.ExeName),'.db');
  SQlite3Connection1.Connected := True;
end;

procedure TForm1.Panel1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta > 0 then ScrollBox1.Perform(WM_VSCROLL,0,0);
  if WheelDelta < 0 then ScrollBox1.Perform(WM_VSCROLL,1,0);
  Handled := true;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  SQLQuery1.Active := True;
  SQLQuery2.Active := True;
  SQLQuery3.Active := True;
  SQLQuery4.Active := True;
  SQLQuery5.Active := True;
  SQLQuery7.Active := True;
  DateTimePicker1.Date := Now;
  ObjGridFormating(0);
  ObjShow();
  ObjLGridFormating(0);
//  ObjLShow();
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  ObjGridKey := DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger;
  if((Edit1.Text <> '') and (cityDBLookupComboBox.KeyValue <> null)) then
    begin
      SQLQuery6.Close;
      SQLQuery6.SQL.Clear;
      SQLQuery6.SQL.Add('select * from objects where city_key = ' + IntToStr(cityDBLookupComboBox.KeyValue) + ' and object = ''' + Edit1.Text + ''';');
      SQLQuery6.Open;
      if SQLQuery6.IsEmpty then
        begin
          SQLQuery6.Close;
          SQLQuery6.SQL.Clear;
          SQLQuery6.SQL.Add('insert into objects (city_key, object) values (' + IntToStr(cityDBLookupComboBox.KeyValue) + ', ''' + Edit1.Text + ''');');
          SQLQuery6.ExecSQL;
          SQLite3Connection1.Transaction.Commit;
          AfterCommit();
        end;
    end;
  DbGrid3.DataSource.DataSet.Locate('c_k;o_o', VarArrayOf([cityDBLookupComboBox.KeyValue, Edit1.Text]), []);
  ObjShow();
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  ObjGridKey := DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger;
  if((Edit1.Text <> '') and (cityDBLookupComboBox.KeyValue <> null)) then
    begin
      SQLQuery6.Close;
      SQLQuery6.SQL.Clear;
      SQLQuery6.SQL.Add('select * from objects where city_key = ' + IntToStr(cityDBLookupComboBox.KeyValue) + ' and object = ''' + Edit1.Text + ''';');
      SQLQuery6.Open;
      if SQLQuery6.IsEmpty then
        begin
          SQLQuery6.Close;
          SQLQuery6.SQL.Clear;
          SQLQuery6.SQL.Add('update objects set '
          + 'city_key = ' + IntToStr(cityDBLookupComboBox.KeyValue)
          + ', object = ''' + Edit1.Text
          + ''' where key = ' + IntToStr(ObjGridKey)
          + ';');
          SQLQuery6.ExecSQL;
          SQLite3Connection1.Transaction.Commit;
          AfterCommit();
        end;
    end;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  TempKey: Integer;
begin
  TempKey := DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger;
  DBGrid3.DataSource.DataSet.Prior;
  ObjGridKey := DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger;
  SQLQuery6.Close;
  SQLQuery6.SQL.Clear;
  SQLQuery6.SQL.Add('delete from objects'
  + ' where key = ' + IntToStr(TempKey)
  + ';');
  SQLQuery6.ExecSQL;
  SQLite3Connection1.Transaction.Commit;
  AfterCommit();

  ObjShow();
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  ObjLShow();
end;

procedure TForm1.DBGrid3CellClick(Column: TColumn);
begin
  ObjShow();
end;

procedure ObjGridFormating(Pos: Integer);
begin
  Form1.DBGrid3.DataSource.DataSet.Active := True;
  Form1.DBGrid3.Columns[0].Visible := False;
  Form1.DBGrid3.Columns[1].Visible := False;
  Form1.DBGrid3.Columns[2].Visible := False;
  Form1.DBGrid3.DataSource.DataSet.Locate('key', Pos, []);
end;

procedure ObjShow();
begin
  Form1.Edit1.Text := Form1.DbGrid3.DataSource.DataSet.FieldByName('o_o').AsString;
  Form1.cityDBLookupComboBox.KeyValue := Form1.DbGrid3.DataSource.DataSet.FieldByName('c_k').AsString;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ObjLGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  if((condDBLookupComboBox1.KeyValue <> null) and (ltDBLookupComboBox.KeyValue <> null)) then
    begin
      SQLQuery6.Close;
      SQLQuery6.SQL.Clear;
      SQLQuery6.SQL.Add('select * from lights_installed where light_type_key = ' + IntToStr(ltDBLookupComboBox.KeyValue)
        + ' and condition_key = ' + IntToStr(condDBLookupComboBox1.KeyValue)
        + ' and quantity = ' + quantSpinEdit.Text
        + ';');
      SQLQuery6.Open;
      if SQLQuery6.IsEmpty then
        begin
          SQLQuery6.Close;
          SQLQuery6.SQL.Clear;
          SQLQuery6.SQL.Add('insert into lights_installed (object_key, light_type_key, condition_key, quantity) values ('
            + DBGrid3.DataSource.DataSet.FieldByName('key').AsString + ', '
            + IntToStr(ltDBLookupComboBox.KeyValue) + ', '
            + IntToStr(condDBLookupComboBox1.KeyValue) + ', '
            + quantSpinEdit.Text
            + ');');
          SQLQuery6.ExecSQL;
          SQLite3Connection1.Transaction.Commit;
          AfterCommit();
        end;
    end;
//  DbGrid1.DataSource.DataSet.Locate('c_k;o_o', VarArrayOf([cityDBLookupComboBox.KeyValue, Edit1.Text]), []);
  ObjLShow();
end;

procedure ObjLGridFormating(Pos: Integer);
begin
//  Form1.DBGrid1.DataSource.DataSet.Active := True;
  Form1.SQLQuery7.Active := True;
//  Form1.SQLQuery7.Params.ParamByName('obj_key').AsInteger := Form1.DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger;
//  Form1.SQLQuery7.Params.ParamByName('obj_key').AsInteger := 1;
  Form1.SQLQuery7.Params.ParamValues['obj_key'] := 1;
//  Form1.SQLQuery7.Params.ParamByName('obj_key').AsString := Form1.DBGrid3.DataSource.DataSet.FieldByName('key').AsString;
  Form1.DBGrid1.Columns[0].Visible := False;
  Form1.DBGrid1.Columns[1].Visible := False;
  Form1.DBGrid1.Columns[2].Visible := False;
  Form1.DBGrid1.Columns[3].Width := Round(Form1.DBGrid1.Width/2);
  Form1.DBGrid1.Columns[4].Width := Round(Form1.DBGrid1.Width/3);
  Form1.DBGrid1.Columns[5].Width := Round(Form1.DBGrid1.Width/6-20);
  Form1.DBGrid1.DataSource.DataSet.Locate('key', Pos, []);
end;

procedure ObjLShow();
begin
  Form1.ltDBLookupComboBox.KeyValue := Form1.DbGrid1.DataSource.DataSet.FieldByName('light_type_key').AsString;
  Form1.condDBLookupComboBox1.KeyValue := Form1.DbGrid1.DataSource.DataSet.FieldByName('condition_key').AsString;
  Form1.quantSpinEdit.Value := Form1.DbGrid1.DataSource.DataSet.FieldByName('quantity').AsInteger;
end;

procedure AfterCommit();
begin
  Form1.SQLQuery1.Active := True;
  Form1.SQLQuery2.Active := True;
  Form1.SQLQuery3.Active := True;
  Form1.SQLQuery4.Active := True;
  Form1.SQLQuery5.Active := True;
  Form1.SQLQuery7.Active := True;
  ObjGridFormating(ObjGridKey);
  ObjShow();
  ObjLGridFormating(ObjLGridKey);
  ObjLShow();
end;

end.

