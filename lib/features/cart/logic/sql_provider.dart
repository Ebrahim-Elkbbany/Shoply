import 'package:path/path.dart';
import 'package:shoply/features/cart/logic/sql_cart.dart';
import 'package:sqflite/sqflite.dart';

const String tableCart = 'tableCart';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnImage = 'image';
const String columnPrice = 'price';

class CartProvider {
  late Database db;
  static final CartProvider instance = CartProvider._internal();
  factory CartProvider() {
    return instance;
  }
  CartProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'food.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
create table $tableCart ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnImage text not null,
  $columnPrice real not null)
''');
        });
  }

  Future<List<SQLModel>> getAllCart() async {
    List<Map<String , dynamic >> cartmaps = await db.query(tableCart);
    if (cartmaps.isEmpty) {
      return [];
    }else {
      List<SQLModel> recipes = [];
      for ( var element in cartmaps){
        recipes.add(SQLModel.fromMap(element));
      }
      return recipes;
    }
  }

  Future<SQLModel> insert(SQLModel sqlmodel) async {
    sqlmodel.id = await db.insert(tableCart, sqlmodel.toMap());
    return sqlmodel;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableCart, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(SQLModel sqlmodel) async {
    return await db.update(tableCart, sqlmodel.toMap(),
        where: '$columnId = ?', whereArgs: [sqlmodel.id]);
  }

  Future close() async => db.close();

}