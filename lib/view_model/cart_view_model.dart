import 'package:flutter/material.dart';
import 'package:shop_heaven/model/cart_model.dart';

import '../utils/database/db_manager.dart';

class CartViewModelProvider extends ChangeNotifier {
  final DBManager _dbManager = DBManager();

  Future<int> getCounter() async {
    int counter = await _dbManager.getTotalItemCount();
    notifyListeners();
    return counter;
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
    return await _dbManager.getCartDataList();
  }

  Future<void> deleteFromDatabase(Cart cart) async {
    // int res = await _dbManager.deleteCartItem(cart.id!);
    // _counter--;
    // _totalPrice -= cart.initialPrice;
    int res = await _dbManager.getCartQuantity(cart);
    // CustomToast(context: context, message: "$res");
    if (res != 0) {
      // CustomToast(context: context, message: "Item Removed");
    }
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
      print("Error in CartViewModel increase $error");
    });
  }

  Future<void> decrease(Cart cart) async {
    int ct = await getItemCount(cart);
    if (ct > 1) {
      await _dbManager.updateQuantity(cart, ct - 1).then((value) {
        print("Success decrease");
        notifyListeners();
      }).onError((error, stackTrace) {
        print("Error in CartViewModel decrase $error");
      });
    } else {
      await deleteFromDatabase(cart).then((value) {
        notifyListeners();
      }).onError((error, stackTrace) {
        print("Error in CartViewModel delete $error");
      });
    }
  }
}
