import 'package:sqflite/sqflite.dart';

class DatabaseProvider{
  static const _dbName = 'imobisoft.db';
  static const _dbVersion = 2;

  DatabaseProvider._init();
  static final DatabaseProvider instance = DatabaseProvider._init();

  Database? _database;

  Future<Database> get database async {
    if(_database == null){
      _database = await _initDatabase();
    }

    return _database!;
  }

  Future<Database> _initDatabase() async{
    String databasePath = await getDatabasesPath();
    String dbPath = '$databasePath/$_dbName';
    return await openDatabase(
      dbPath,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade
    );
  }

  Future<void> _onCreate(Database db, int version) async{
    await db.execute(
      '''
      CREATE TABLE IMOVEL (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        NUMERO TEXT,
        RUA TEXT,
        CIDADE TEXT
      );
      '''
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async{

    switch(oldVersion) {
      case 1:
        await db.execute(
          '''
          CREATE TABLE ANOTACAO (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            DESCRICAO TEXT,
            IMOVEL INTEGER
          );
          '''
        );
        break;
    }

  }

  Future<void> close() async{
    if(_database != null){
      await _database!.close();
    }
  }
}