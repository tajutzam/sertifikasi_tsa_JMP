import 'package:path/path.dart' as m;
import 'package:sertifikasi_jmp/model/user.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createDatabase(sql.Database database) async {
    await database.execute("""
    create table user(
      id INTEGER PRIMARY KEY autoincrement NOT NULL,
      username TEXT ,
      password TEXT , 
      nama_lengkap TEXT , 
      noHp TEXT
    )
""");
  }
  
  static Future<sql.Database> db() async {
    var databasePath = await sql.getDatabasesPath();
    String path = m.join(databasePath, "user.db");
    return await sql.openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => createDatabase(db),
    );
  }

  static Future<List<Map<String, Object?>>> findById(
      UserModel userModel) async {
    sql.Database db = await SqlHelper.db();
    return await db.query('user', where: "id = ?", whereArgs: [userModel.id]);
  }

  static Future<List<Map<String, Object?>>> findByUsername(
      UserModel userModel) async {
    sql.Database db = await SqlHelper.db();
    return await db
        .query('user', where: "username = ?", whereArgs: [userModel.username]);
  }

  static Future<int> insertData(UserModel userModel) async {
    sql.Database database = await SqlHelper.db();
    Map<String, dynamic> data = {
      'username': userModel.username.toString(),
      'password': userModel.password.toString(),
      'nama_lengkap': userModel.name.toString(),
      'noHp': userModel.noHp.toString()
    };
    return database.insert('user', data);
  }

  static Future<int> updateData(UserModel userModel , int id) async {
    sql.Database database = await SqlHelper.db();
    Map<String, dynamic> data = {
      'username': userModel.username.toString(),
      'password': userModel.password.toString(),
      'nama_lengkap': userModel.name.toString(),
      'noHp': userModel.noHp.toString()
    };
    return database.update('user', data, where: "id = ? " , whereArgs: [id]);
  }

  static Future<List<Map<String, Object?>>> findAll() async {
    final sql.Database db = await SqlHelper.db();
    return await db.query('user');
  }
}
