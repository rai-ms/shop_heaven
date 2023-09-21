import 'package:flutter/material.dart';
import 'package:shop_heaven/data/app_exceptions/app_exception.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/res/components/custom_toast.dart';

import '../utils/database/db_manager.dart';

class CartViewModelProvider extends ChangeNotifier {
  final DBManager _dbManager = DBManager();
  List<Cart> _list = [];
  Future<int> getCounter() async {
    int counter = await _dbManager.getTotalItemCount();
    notifyListeners();
    return counter;
  }

  get list {
    getAllData();
    return _list;
  }

  Future<int> getTotalPrice() async {
    List<Cart> data = await getAllData();
    int totalPrice = 0;
    for (var element in data) {
      totalPrice = totalPrice + element.quantity * element.initialPrice;
    }
    return totalPrice;
  }

  Future<List<Cart>> getAllData() async {
    return _list = await _dbManager.getCartDataList();
  }

  Future<void> deleteFromDatabase(Cart cart) async {
    await _dbManager.deleteCartItem(cart).then((value) {
      print("Item Removed");
    }).onError((error, stackTrace) {
      throw DatabaseException(error.toString());
    });
    notifyListeners();
  }

  Future<int> getItemCount(Cart cart) async {
    return await _dbManager.getCartQuantity(cart);
  }

  Future<void> increase(Cart cart) async {
    int ct = await _dbManager.getCartQuantity(cart);
    if (ct == 0) {
      _dbManager.insert(cart);
    }
    await _dbManager.updateQuantity(cart, ct + 1).then((value) {
      print("Success in increase");
      notifyListeners();
    }).onError((error, stackTrace) {
      throw DatabaseException(error.toString());
    });
  }

  Future<void> decrease(Cart cart) async {
    int ct = await getItemCount(cart);
    if (ct > 1) {
      await _dbManager.updateQuantity(cart, ct - 1).then((value) {
        print("Success decrease");
        notifyListeners();
      }).onError((error, stackTrace) {
        throw DatabaseException(error.toString());
      });
    } else {
      await deleteFromDatabase(cart).then((value) {
        notifyListeners();
      }).onError((error, stackTrace) {
        throw DatabaseException(error.toString());
      });
    }
  }
}
