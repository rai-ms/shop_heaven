import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  static Database? _database;

  // Database Name
  static const String database_name = "shop_heaven.db";

  // Table CartHeavenShop
  static const String table_shop_heaven_cart = "CartHeavenShop";

  // CartHeavenShop table columns start
  static const String id = "id";
  static const String productId = "productId";
  static const String productName = "productName";
  static const String initialPrice = "initialPrice";
  static const String productPrice = "productPrice";
  static const String quantity = "quantity";
  static const String unitTag = "unitTag";
  static const String image = "image";
  // CartHeavenShop table columns end

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    return _database = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, database_name);

    return _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table_shop_heaven_cart (
      $id INTEGER PRIMARY KEY,
      $productId TEXT UNIQUE,
      $productName TEXT,
      $productPrice INTEGER,
      $initialPrice INTEGER,
      $quantity INTEGER,
      $unitTag TEXT,
      $image TEXT
    )
  ''');
  }

  // onUpgrade will run only if user is already using the app
  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS $table_shop_heaven_cart');
      await db.execute(
          'CREATE TABLE $table_shop_heaven_cart ($id INTEGER PRIMARY KEY , $productId VARCHAR UNIQUE, $productName TEXT, $productPrice INTEGER , $initialPrice INTEGER, $quantity INTEGER, $unitTag TEXT , $image TEXT');
    }
  }

  Future<Cart> insert(Cart cart) async {
    final dbClient = await database;
    await dbClient.insert(
      table_shop_heaven_cart,
      cart.toMap(),
    );
    return cart;
  }

  Future<List<Cart>> getCartDataList() async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult =
        await dbClient.query(table_shop_heaven_cart);
    // print(queryResult);
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> deleteCartItem(Cart cart) async {
    var dbClient = await database;
    return await dbClient.delete(table_shop_heaven_cart,
        where: "id = ?", whereArgs: [cart.productId]);
  }

  Future<int> getCartQuantity(Cart cart) async {
  var dbClient = await database;
  String cartProductId = cart.productId;

  String query = '''
    SELECT SUM($quantity) AS total_quantity FROM $table_shop_heaven_cart
    WHERE $productId = '$cartProductId'
  ''';

  // Execute the query and get the result as a list of maps
  List<Map<String, dynamic>> result = await dbClient.rawQuery(query);

  // Check if the total quantity is greater than zero
  int totalQuantity = result[0]['total_quantity'] ?? 0;
  return totalQuantity;
}


  Future<int> getTotalItemCount() async {
    var dbClient = await database;

    String query = '''
      SELECT SUM($quantity) AS total_items FROM $table_shop_heaven_cart
    ''';

    var result = await dbClient.rawQuery(query);

    int totalItems = Sqflite.firstIntValue(result) ?? 0;
    return totalItems;
  }

  Future<void> updateQuantity(Cart cart, int newQuantity) async {
    var dbClient = await database;
    String query = '''
    UPDATE $table_shop_heaven_cart
    SET $quantity = $newQuantity
    WHERE $id = ${cart.id!}
  ''';
    await dbClient.rawQuery(query);
  }

  Future<List<Map<String, dynamic>>> getItemsWithQuantityGreaterThanTwo(
      int val) async {
    var dbClient = await database;

    // Define the SQL query to retrieve items with quantity > 2
    String query = '''
      SELECT * FROM $table_shop_heaven_cart
      WHERE $quantity > $val
    ''';

    // Execute the query and return the result as a list of maps
    return await dbClient.rawQuery(query);
  }

  Future<void> clearCart() async {
    var dbClient = await database;

    // Define the SQL query to clear the CartHeavenShop table
    String query = 'DELETE FROM $table_shop_heaven_cart';

    // Execute the query to clear the table
    await dbClient.rawDelete(query);
  }
}
