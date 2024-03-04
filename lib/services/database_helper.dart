import 'package:visiteo/models/visitor_model.dart';
import 'package:visiteo/models/tarif_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static const int _version = 1;
  final String _dbName = "Visitor.db";
  final String _tableName = "Visitor";

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, _dbName);

    return await openDatabase(path, version: _version,
        onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            numero TEXT NOT NULL,
            nom TEXT NOT NULL,
            tarifJournalier INTEGER NOT NULL,
            nombreJour INTEGER NOT NULL,
            date TEXT NOT NULL
          )
        ''');
    }, singleInstance: true);
  }

  Future<int> insertVisitor(Visitor visitor) async {
    final db = await database;
    return await db.insert(
      _tableName,
      visitor.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateVisitor(Visitor visitor) async {
    final db = await database;
    return await db.update(
      _tableName,
      visitor.toJson(),
      where: 'id = ?',
      whereArgs: [visitor.id],
    );
  }

  Future<int> deleteVisitor(Visitor visitor) async {
    //renvoie > 0 si operation reussi
    final db = await database;
    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [visitor.id],
    );
  }

  Future<List<Visitor>> getAllVisitor() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (index) => Visitor.fromJson(maps[index]));
  }

 Future<List<Visitor>> searchVisitorsByQuery(String query) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'nom LIKE ? OR numero LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );
   return List.generate(maps.length, (index) => Visitor.fromJson(maps[index]));
  }

  Future<String> generateNumero() async {
    final db = await database;
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT MAX(id) as max_id FROM $_tableName');

    int lastId = result[0]['max_id'] ?? 0;
    int nextId = lastId + 1;

    String numeroPrefix = 'vst/';
    String formattedId = nextId.toString().padLeft(3, '0');

    return '$numeroPrefix$formattedId';
  }

  Future<int> getVisitorCount() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM $_tableName');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  }

  Future<Tarif?> getVisitorTarif() async {
    final db = await database;

    List<Map<String, dynamic>> result = await db.rawQuery('''
    SELECT 
      MIN(tarifJournalier * nombreJour) as min_tarif, 
      MAX(tarifJournalier * nombreJour) as max_tarif, 
      SUM(tarifJournalier * nombreJour) as total_tarif 
    FROM 
      $_tableName
  ''');

    if (result.isNotEmpty) {
      List<Map<String, dynamic>> minResult = await db.rawQuery('''
      SELECT * 
      FROM 
        $_tableName
      WHERE 
        (tarifJournalier * nombreJour) = ${result[0]['min_tarif']}
      LIMIT 1
    ''');

      List<Map<String, dynamic>> maxResult = await db.rawQuery('''
      SELECT * 
      FROM 
        $_tableName
      WHERE 
        (tarifJournalier * nombreJour) = ${result[0]['max_tarif']}
      LIMIT 1
    ''');

      Visitor? minVisitor;
      Visitor? maxVisitor;

      if (minResult.isNotEmpty && maxResult.isNotEmpty) {
        minVisitor = Visitor.fromJson(minResult[0]);
        maxVisitor = Visitor.fromJson(maxResult[0]);
        return Tarif(
          minTarif: result[0]['min_tarif'],
          maxTarif: result[0]['max_tarif'],
          totalTarif: result[0]['total_tarif'],
          minVisitor: minVisitor,
          maxVisitor: maxVisitor,
        );
      }
    } else {
      // Si result est vide, renvoyer null ou une valeur par défaut selon vos besoins
      return null;
    }
    return null;
  }

  
}
