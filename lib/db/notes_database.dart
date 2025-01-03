import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../model/note.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  // initializing db
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  // opening db
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // creating db
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE $tableNotes (
    ${NoteFields.id} $idType,
    ${NoteFields.number} $integerType,
    ${NoteFields.title} $textType,
    ${NoteFields.description} $textType,
    ${NoteFields.time} $textType,
    )
    ''');
  }

  // creating fields
  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  // reading one note
  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('OD $id not found');
    }

  }

  // reading all notes
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NoteFields.time} ASC';
    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => Note.fromJson(json)).toList();
  }

  // updating notes
  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  // deleting notes
  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  // closing db
  Future close() async {
    final db = await instance.database;

    await db.close();
  }

}