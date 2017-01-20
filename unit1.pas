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
    Button12: TButton;
    Button13: TButton;
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
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
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
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Panel1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure TabControl1Change(Sender: TObject);
    procedure TabControl1Changing(Sender: TObject; var AllowChange: Boolean);
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
  procedure OtherGridFormating(Pos: Integer);
  procedure OtherShow();
  procedure CrashGridFormating(Pos: Integer);
  procedure CrashShow();

var
  Form1: TForm1;

  ObjGridKey: Integer;
  ObjLGridKey: Integer;
  OtherGridKey: Integer;
  CrashGridKey: Integer;
  sqlStrings: String;
  sqlStringa: String;
  sqlStringe: String;
  sqlStringd: String;
  sqlField: String;
  sqlTable: String;
  noChange: Boolean;


implementation

{$R *.lfm}

{ TForm1 }

//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
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
  TabControl1.TabIndex := 0;
  TabControl1Change(Sender);
  noChange := False;
  PageControl1.TabIndex := 1;
  PageControl1.TabIndex := 0;
  SpinEdit2.Value := (CurrentYear + 2012)/2;
end;
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
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

procedure TForm1.DBGrid3CellClick(Column: TColumn);
begin
  ObjGridKey := DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger;
  ObjShow();
end;

//******************************************************************************
//******************************************************************************
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
  ObjLGridFormating(ObjLGridKey);
  ObjLShow();
end;
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
procedure TForm1.Button5Click(Sender: TObject);
begin
  ObjLGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  if((condDBLookupComboBox1.KeyValue <> null) and (ltDBLookupComboBox.KeyValue <> null)) then
    begin
      SQLQuery6.Close;
      SQLQuery6.SQL.Clear;
      SQLQuery6.SQL.Add('select * from lights_installed where light_type_key = ' + IntToStr(ltDBLookupComboBox.KeyValue)
        + ' and object_key = ' + DBGrid3.DataSource.DataSet.FieldByName('key').AsString
        + ' and condition_key = ' + IntToStr(condDBLookupComboBox1.KeyValue)
//        + ' and quantity = ' + quantSpinEdit.Text
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
  DbGrid1.DataSource.DataSet.Locate('object_key;light_type_key;condition_key', VarArrayOf([DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger, ltDBLookupComboBox.KeyValue, condDBLookupComboBox1.KeyValue]), []);
// Не работает этот локейт, сволочь. Разобраться надо бы как-нибудь.
  ObjLGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  ObjLShow();
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ObjLGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  if((Edit1.Text <> '') and (cityDBLookupComboBox.KeyValue <> null)) then
    begin
      SQLQuery6.Close;
      SQLQuery6.SQL.Clear;
      SQLQuery6.SQL.Add('update lights_installed set '
      + 'light_type_key = ' + IntToStr(ltDBLookupComboBox.KeyValue)
      + ', condition_key = ' + IntToStr(condDBLookupComboBox1.KeyValue)
      + ', quantity = ' + quantSpinEdit.Text
      + ' where key = ' + IntToStr(ObjLGridKey)
      + ';');
      SQLQuery6.ExecSQL;
      SQLite3Connection1.Transaction.Commit;
      AfterCommit();
    end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  TempKey: Integer;
begin
  TempKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  DBGrid1.DataSource.DataSet.Prior;
  ObjLGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  SQLQuery6.Close;
  SQLQuery6.SQL.Clear;
  SQLQuery6.SQL.Add('delete from lights_installed'
  + ' where key = ' + IntToStr(TempKey)
  + ';');
  SQLQuery6.ExecSQL;
  SQLite3Connection1.Transaction.Commit;
  AfterCommit();
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  ObjLGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  ObjLShow();
end;

//******************************************************************************
//******************************************************************************
procedure ObjLGridFormating(Pos: Integer);
begin
  Form1.SQLQuery7.Active := False;
  Form1.SQLQuery7.Params.ParamByName('obj_key').AsInteger := Form1.DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger;
  Form1.SQLQuery7.Active := True;
  Form1.DBGrid1.Columns[0].Visible := False;
  Form1.DBGrid1.Columns[1].Visible := False;
  Form1.DBGrid1.Columns[2].Visible := False;
  Form1.DBGrid1.Columns[3].Visible := False;
  Form1.DBGrid1.Columns[4].Width := Round(Form1.DBGrid1.Width/2);
  Form1.DBGrid1.Columns[5].Width := Round(Form1.DBGrid1.Width/3);
  Form1.DBGrid1.Columns[6].Width := Round(Form1.DBGrid1.Width/6-20);
  Form1.DBGrid1.DataSource.DataSet.Locate('key', Pos, []);
end;

procedure ObjLShow();
begin
  if(not Form1.DbGrid1.DataSource.DataSet.IsEmpty) then begin
    Form1.ltDBLookupComboBox.KeyValue := Form1.DbGrid1.DataSource.DataSet.FieldByName('light_type_key').AsString;
    Form1.condDBLookupComboBox1.KeyValue := Form1.DbGrid1.DataSource.DataSet.FieldByName('condition_key').AsString;
    Form1.quantSpinEdit.Value := Form1.DbGrid1.DataSource.DataSet.FieldByName('quantity').AsInteger;
  end;
end;
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
procedure TForm1.TabControl1Change(Sender: TObject);
var
  sqlString: String;
begin
  case TabControl1.TabIndex of
    0: begin
      sqlField := 'city';
      sqlTable := 'cities';
    end;
    1: begin
      sqlField := 'type';
      sqlTable := 'light_types';
    end;
    2: begin
      sqlField := 'ps_release';
      sqlTable := 'ps_releases';
    end;
    3: begin
      sqlField := 'condition';
      sqlTable := 'conditions';
    end;
  end;
  sqlString := 'select "key", ' + sqlField + ' from ' + sqlTable + ';';
  SQLQuery8.Close;
  SQLQuery8.SQL.Clear;
  SQLQuery8.SQL.Add(sqlString);
  SQLQuery8.Open;
  OtherGridFormating(0);
end;

procedure TForm1.TabControl1Changing(Sender: TObject; var AllowChange: Boolean);
begin
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  TempKey: Integer;
begin
  TempKey := DBGrid2.DataSource.DataSet.FieldByName('key').AsInteger;
  sqlStringd := 'delete from ' + sqlTable + ' where key = ' + IntToStr(TempKey) + ';';
  DBGrid2.DataSource.DataSet.Prior;
  OtherGridKey := DBGrid2.DataSource.DataSet.FieldByName('key').AsInteger;
  SQLQuery6.Close;
  SQLQuery6.SQL.Clear;
  SQLQuery6.SQL.Add(sqlStringd);
  SQLQuery6.ExecSQL;
  SQLite3Connection1.Transaction.Commit;
  AfterCommit();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  OtherGridKey := DBGrid2.DataSource.DataSet.FieldByName('key').AsInteger;
  sqlStringe := 'update ' + sqlTable + ' set ' + sqlField + ' = ''' + Edit2.Caption + ''' where key = ' + IntToStr(OtherGridKey) + ';';
//  Label18.Caption := sqlStringe;
  if(Edit2.Caption <> '') then
    begin
      SQLQuery6.Close;
      SQLQuery6.SQL.Clear;
      SQLQuery6.SQL.Add(sqlStringe);
      SQLQuery6.ExecSQL;
      SQLite3Connection1.Transaction.Commit;
      AfterCommit();
    end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  returnString: String;
begin
  sqlStrings := 'select * from ' + sqlTable + ' where ' + sqlField + ' = ''' + Edit2.Caption + ''';';
  sqlStringa := 'insert into ' + sqlTable + ' (' + sqlField + ') values (''' + Edit2.Caption + ''');';
  returnString := Edit2.Caption;
  OtherGridKey := DBGrid2.DataSource.DataSet.FieldByName('key').AsInteger;
  if(Edit2.Caption <> '') then
    begin
      SQLQuery6.Close;
      SQLQuery6.SQL.Clear;
      SQLQuery6.SQL.Add(sqlStrings);
      SQLQuery6.Open;
      if SQLQuery6.IsEmpty then
        begin
          SQLQuery6.Close;
          SQLQuery6.SQL.Clear;
          SQLQuery6.SQL.Add(sqlStringa);
          SQLQuery6.ExecSQL;
          SQLite3Connection1.Transaction.Commit;
          AfterCommit();
        end;
    end;
  DbGrid2.DataSource.DataSet.Locate(sqlField, returnString, []);
  OtherGridKey := DBGrid2.DataSource.DataSet.FieldByName('key').AsInteger;
  OtherShow();
end;

procedure TForm1.DBGrid2CellClick(Column: TColumn);
begin
  OtherGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  OtherShow();
end;
//******************************************************************************
//******************************************************************************
procedure OtherGridFormating(Pos: Integer);
begin
  Form1.DBGrid2.Columns[0].Visible := False;
  Form1.DBGrid2.DataSource.DataSet.Locate('key', Pos, []);
  OtherShow();
end;

procedure OtherShow();
begin
  if(not Form1.DbGrid2.DataSource.DataSet.IsEmpty) then Form1.Edit2.Text := Form1.DbGrid2.DataSource.DataSet.FieldByName(sqlField).AsString;
end;
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
procedure TForm1.DBGrid4DblClick(Sender: TObject);
begin

  Button12Click(Sender);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin

  Button3.Caption := 'Сохранить новую запись';
  Button4.Visible := True;
  Button13.Visible := False;
  noChange := True;
  PageControl1.TabIndex := 0;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  addString: String;
begin
//  addString := 'insert into lights_crashed '
//    + '(date, ser_num, ps_release_key, opened, intruded, crash_description, '
//    + 'ps_crashed_parts, non_ps_crashed_parts, object_key, condition_key, ps_sn) '
//    + 'values ('''
//    + DateToStr(DateTimePicker1.Date) + ''', '
//    + ');');
  CrashGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  if((condDBLookupComboBox1.KeyValue <> null) and (ltDBLookupComboBox.KeyValue <> null)) then
    begin
      SQLQuery6.Close;
      SQLQuery6.SQL.Clear;
      SQLQuery6.SQL.Add('select * from lights_installed where light_type_key = ' + IntToStr(ltDBLookupComboBox.KeyValue)
        + ' and object_key = ' + DBGrid3.DataSource.DataSet.FieldByName('key').AsString
        + ' and condition_key = ' + IntToStr(condDBLookupComboBox1.KeyValue)
//        + ' and quantity = ' + quantSpinEdit.Text
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
  DbGrid1.DataSource.DataSet.Locate('object_key;light_type_key;condition_key', VarArrayOf([DBGrid3.DataSource.DataSet.FieldByName('key').AsInteger, ltDBLookupComboBox.KeyValue, condDBLookupComboBox1.KeyValue]), []);
// Не работает этот локейт, сволочь. Разобраться надо бы как-нибудь.
  ObjLGridKey := DBGrid1.DataSource.DataSet.FieldByName('key').AsInteger;
  ObjLShow();


  Button3.Caption := 'Сохранить';
  Button4.Visible := False;
  Button13.Visible := True;
  PageControl1.TabIndex := 1;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

  Button3.Caption := 'Сохранить';
  Button4.Visible := False;
  Button13.Visible := True;
  PageControl1.TabIndex := 1;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

  if(noChange) then begin
    noChange := False;
  end else begin
    Button3.Caption := 'Сохранить';
    Button4.Visible := False;
    Button13.Visible := True;
  end;
end;
//******************************************************************************
//******************************************************************************
procedure CrashGridFormating(Pos: Integer);
begin
  Form1.DBGrid4.Columns[0].Visible := False;
  Form1.DBGrid4.DataSource.DataSet.Locate('key', Pos, []);
  CrashShow();
end;

procedure CrashShow();
begin
//  if(not Form1.DbGrid4.DataSource.DataSet.IsEmpty) then Form1.Edit2.Text := Form1.DbGrid2.DataSource.DataSet.FieldByName(sqlField).AsString;
end;
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
procedure AfterCommit();
begin
  Form1.SQLQuery1.Active := True;
  Form1.SQLQuery2.Active := True;
  Form1.SQLQuery3.Active := True;
  Form1.SQLQuery4.Active := True;
  Form1.SQLQuery5.Active := True;
  Form1.SQLQuery7.Active := True;
  Form1.SQLQuery8.Active := True;
  Form1.SQLQuery9.Active := True;
  ObjGridFormating(ObjGridKey);
  ObjShow();
  ObjLShow();
  OtherGridFormating(OtherGridKey);
  CrashGridFormating(CrashGridKey);
end;

end.

