import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'database_model.dart';


abstract class DB {
  static Database? _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      var databasesPath = await getDatabasesPath();
      String path = p.join(databasesPath, 'buchi.db');
      _db = await openDatabase(path, version: _version, onCreate: onCreate);
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE buchis (Id INTEGER PRIMARY KEY NOT NULL, type STRING , gender STRING, size STRING, age STRING, photos STRING, gwchildren STRING)');

  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db!.query(table);

  static Future<int> insert(String table, DBBaseModel model) async =>
      await _db!.insert(table, model.toMap());

  static Future<List<Map<String, dynamic>>> rawQuery(String sql) async =>
      _db!.rawQuery(sql);

  static Future<int> rawInsert(String sql) async => await _db!.rawInsert(sql);
}
