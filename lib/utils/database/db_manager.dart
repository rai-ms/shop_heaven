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

  // Future<Cart> insert(Cart cart) async {
  //   var dbClient = await database;
  //   await dbClient.insert(table_shop_heaven_cart, cart.toMap());
  //   return cart;
  // }
  Future<Cart> insert(Cart cart) async {
    final dbClient = await database;
    await dbClient.insert(
      table_shop_heaven_cart,
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return cart;
  }

  Future<List<Cart>> getCartDataList() async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult =
        await dbClient.query(table_shop_heaven_cart);
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }
}
