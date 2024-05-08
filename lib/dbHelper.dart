import 'package:note_app/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDataBase();
    return _db;
  }

  initDataBase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "notes_db");
    var db = await openDatabase(path, version: 1, onCreate: _OnCreate);
    return db;
  }

  _OnCreate(Database db, int version) async {
    db.execute(
        'CREATE TABLE notes( id INTEGER PRIMARY KEY AUTOINCREMENT , titleName TEXT NOT NULL , body TEXT NOT NULL  )');
  }

  Future<NoteModel> insert(NoteModel noteModel) async {
    var clientDB = await db;
    await clientDB?.insert('notes', noteModel.toMap());
    return noteModel;
  }

  Future<List<NoteModel>> getNoteList() async {
    var clientDB = await db;
    final List<Map<String, Object?>> getquery = await clientDB!.query('notes');
    return getquery.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var clientDB = await db;
    return clientDB!.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(NoteModel noteModel) async {
    var clientDB = await db;
    return clientDB!.update('notes', noteModel.toMap(),
        where: 'id = ?', whereArgs: [noteModel.id]);
  }
}
