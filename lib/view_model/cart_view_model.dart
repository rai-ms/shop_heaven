import 'package:flutter/material.dart';
import 'package:shop_heaven/model/cart_model.dart';

import '../utils/database/db_manager.dart';

class CartViewModelProvider extends ChangeNotifier {
  DBManager _dbManager = DBManager();

  int _counter = 0;
  int get counter => _counter;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    return _cart = _dbManager.getCartDataList();
  }
}
