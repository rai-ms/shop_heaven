import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/res/components/custom_toast.dart';
import 'package:shop_heaven/utils/database/db_manager.dart';

class HomePageViewModel extends ChangeNotifier {
  List<Cart> _cart = [];
  final DBManager _dbManager = DBManager();

  int _counter = 0;
  Future<int> get counter async {
    _counter = await getTotalItemCount();
    notifyListeners();
    return _counter;
  }

  int _totalPrice = 0;
  Future<int> get totalPrice async {
    List<Cart> data = await getData();
    _totalPrice = 0;
    for (var element in data) {
      _totalPrice = _totalPrice + element.quantity * element.initialPrice;
    }
    notifyListeners();
    return _totalPrice;
  }

  Future<List<Cart>> getData() async {
    _cart = await _dbManager.getCartDataList();
    _counter = _cart.length;
    notifyListeners();
    return _cart;
  }

  Future<void> increase(Cart cart) async {
    int ct = await _dbManager.getCartQuantity(cart);
    print(ct.toString() + " Ct");
    if (ct > 0) {
      await _dbManager.updateQuantity(cart, ct + 1).then((value) async {
        print("Success in updating ");
        _cart = await getData();
        // print(_cart);
        notifyListeners();
      }).onError((error, stackTrace) {
        print("Error in HomeViewModel $error");
      });
    } else {
      await _dbManager.insert(cart).then((value) async {
        print("Success in insert ");
        _cart = await getData();
        // print(_cart);
        notifyListeners();
      }).onError((error, stackTrace) {
        print("Error in HomeViewModel insert $error");
      });
    }
  }

  Future<void> deleteFromDatabase(Cart cart) async {
    await _dbManager.getCartQuantity(cart);
    notifyListeners();
  }

  Future<void> decrease(Cart cart) async {
    int ct = await getItemCount(cart);
    if (ct > 1) {
      await _dbManager.updateQuantity(cart, ct - 1).then((value) async {
        _cart = await getData();
        notifyListeners();
        print("Success in CartViewModel");
      }).onError((error, stackTrace) {
        print("Error in HomeViewModel decrease $error");
      });
    } else {
      await deleteFromDatabase(cart).then((value) async {
        _cart = await getData();
        notifyListeners();
      }).onError((error, stackTrace) {
        print("Error in CartViewModel delete $error");
      });
    }
  }

  Future<int> getItemCount(Cart cart) async {
    return await _dbManager.getCartQuantity(cart);
  }

  deleteDatabase() {
    _dbManager.clearCart();
    notifyListeners();
  }

  Future<int> getTotalItemCount() async {
    _counter = await _dbManager.getTotalItemCount();
    notifyListeners();
    return _counter;
  }
}
