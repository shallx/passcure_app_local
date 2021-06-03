import 'dart:async';
import 'package:passcure/models/model.dart';
import 'package:passcure/utils/sqflite_helper.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      var databasesPath = await getDatabasesPath();
      String _path = p.join(databasesPath, 'crud.db');
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    await _createTable(db);
  }

  static Future<void> _createTable(Database db) async {
    await db.execute(Table('emails')
        .primaryId()
        .string('provider')
        .string('email')
        .string('password')
        .string('refNumber')
        .string('refEmail')
        .string('notes')
        .createTable());

    await db.execute(Table('accounts')
        .primaryId()
        .string('emailId')
        .string('categoryId')
        .string('userName')
        .string('password')
        .string('domainName')
        .string('domainLink')
        .string('domainPicture')
        .string('notes')
        .createTable());

    await db.execute(
        Table('categories').primaryId().string('accountType').createTable());
  }

  static Future<void> dropTable() async {
    try {
      // var databasesPath = await getDatabasesPath();
      // String _path = p.join(databasesPath, 'crud.db');
      // _db = await openDatabase(_path, version: _version, onCreate: onCreate);
      init();
      await _db.execute('DROP TABLE IF EXISTS emails');
      await _db.execute('DROP TABLE IF EXISTS accounts');
      await _db.execute('DROP TABLE IF EXISTS categories');
      await _createTable(_db);
    } catch (ex) {
      print(ex);
    }
  }

  static Future<void> clearTable() async {
    init();
    await _db.execute('DELETE FROM emails');
    await _db.execute('DELETE FROM accounts');
    await _db.execute('DELETE FROM categories');
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, Model model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async => await _db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static Future<Batch> batch() async => _db.batch();
}
