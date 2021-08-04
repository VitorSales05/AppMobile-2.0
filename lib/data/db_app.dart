import 'package:filtro/models/bomba.dart';
import 'package:filtro/models/filtro.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;


class DbApp {

  DbApp._privateConstructor();
  static final DbApp instanse = DbApp._privateConstructor();

  static sql.Database _database;
  Future<sql.Database> get database async {
    if(_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }


  Future<sql.Database> _initDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    String _banco = 'aplicacao';
    String path = join(dbPath, _banco);
    
    return await sql.openDatabase(
      path,
      version: 1,
      onCreate: _criarBanco,   
    );
  }

  Future<void> _criarBanco(sql.Database db, int novaVersao) async {
    List<String> queryes = [
      "CREATE TABLE bomba (id TEXT PRIMARY KEY, modelo TEXT, performanse TEXT, preco TEXT);",
      "CREATE TABLE filtro (id TEXT PRIMARY KEY, modelo TEXT, performanse TEXT, preco TEXT);",
      "CREATE TABLE sistema (id TEXT PRIMARY KEY, nome TEXT, modeloFiltro TEXT, performanseFiltro TEXT, precoFiltro TEXT, modeloBomba TEXT, performanseBomba TEXT, precoBomba TEXT)",
      "CREATE TABLE estado (id TEXT PRIMARY KEY, nome TEXT, tarifa TEXT);",
     /*  "CREATE TEBLE sistema (id TEXT PRIMARY KEY, nome TEXT, filtro TEXT, )" */
    ];
    for(String query in queryes){
      await db.execute(query);
    }
  } 

  static Future<List<Map<String, dynamic>>> buscaDados(String table) async {
    final db = await DbApp.instanse.database;
    return db.query(table);
  }

  static Future<void> inserir(String table, Map<String, Object> data) async {
    final db = await DbApp.instanse.database;
    await db.insert(
      table, 
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    ); 
  }

  static Future<void> apagar(String table, String idItem) async {
    String tabela = table;
    final db = await DbApp.instanse.database;
    await db.delete(tabela, where: ' id = ? ', whereArgs: [idItem]);
  }


  static Future<void> editarFilt(String table, Filtro filtro) async {
    String tabela = table;
    final db = await DbApp.instanse.database;
    await db.update(tabela, filtro.toMap(), where: ' id = ?', whereArgs: [filtro.id]);
  //  await db.update('filtro', filtro.toMap(), where: ' id = ?', whereArgs: [filtro.id]);
  }

  static Future<void> editarBomb(String table, Bomba bomba) async {
    String tabela = table;
    final db = await DbApp.instanse.database;
    await db.update(tabela, bomba.toMap(), where: ' id = ?', whereArgs: [bomba.id]);
  //  await db.update('filtro', filtro.toMap(), where: ' id = ?', whereArgs: [filtro.id]);
  }


}