import 'package:shop_app_task/data/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String path = await getDatabasesPath();
    path = '$path/products.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Mahsulotlar jadvalini yaratish
        await db.execute(
          'CREATE TABLE products ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'title TEXT, '
              'price REAL, '
              'description TEXT, '
              'category TEXT, '
              'image TEXT, '
              'rating_rate REAL, '
              'rating_count INTEGER,'
              'is_cart,'
              'is_like'
              ')',
        );
      },
    );
  }

  Future<int> insertProducts(List<Product> products) async {
    final db = await this.db;
    final batch = db.batch();

    for (final product in products) {
      batch.insert('products', product.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);
    }

    final results = await batch.commit();
    return results.length;
  }

  Future<List<Product>> getProducts() async {
    final db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        image: maps[i]['image'],
        rating: Rating(
          rate: maps[i]['rating_rate'],
          count: maps[i]['rating_count'],
        ),
      );
    });
  }


  Future<int> likeAdd(Product product) async {
    final db = await this.db;
    return await db.update(
      'products',
      {
        'is_like': product.is_like != null && product.is_like==true ? 0 : 1,
      },
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> cardAdd(Product product) async {
    final db = await this.db;
    return await db.update(
      'products',
      {
        'is_cart': product.is_cart != null && product.is_cart == true ? 1 : 1,
      },
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<void> deleteProduct(Product product)async{
    final db = DatabaseHelper();
    await db.db;
    await db.deleteProduct(product);
    await getCartProducts();
  }


  Future<List<Product>> getLikedProducts() async {
    final db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query(
      'products',
      where: 'is_like = ?',
      whereArgs: [1],
    );

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        image: maps[i]['image'],
        rating: Rating(
          rate: maps[i]['rating_rate'],
          count: maps[i]['rating_count'],
        ),
        is_cart: maps[i]['is_cart']==1, // integer to boolean
        is_like: maps[i]['is_like']==1,// integer to boolean
      );
    });
  }

  Future<List<Product>> getCartProducts() async {
    final db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query(
      'products',
      where: 'is_cart = ?',
      whereArgs: [1],
    );

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        image: maps[i]['image'],
        rating: Rating(
          rate: maps[i]['rating_rate'],
          count: maps[i]['rating_count'],
        ),
        is_cart: maps[i]['is_cart']==1, // integer to boolean
        is_like: maps[i]['is_like']==1,// integer to boolean
      );
    });
  }
}