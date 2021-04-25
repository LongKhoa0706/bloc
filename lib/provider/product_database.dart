import 'package:demo_bloc/test6/Product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductDatabase{
  Database _database;

  Future opentDB() async{
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(),"product.db"),
        version: 1,onCreate: (Database db,int version)  async {
          await db.execute("CREATE TABLE product (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price TEXT )");
      }
      );
    }
  }
  Future addProduct(Product product) async {
    await opentDB();
    await _database.insert("product", product.toJson());
  }

  static final ProductDatabase _instance = ProductDatabase._internal();

  factory ProductDatabase(){
    return _instance;
  }
  ProductDatabase._internal(){
    
  }
}