import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/res/components/custom_toast.dart';
import 'package:shop_heaven/utils/database/db_manager.dart';

class HomePageViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  static const String _keyCounter = "counter";
  static const String _keyTotalPrice = "totalPrice";

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  /// Add Product into the Cart, it required [Cart] and [BuildContext] to add
  Future<void> addToCart(Cart cart, BuildContext context) async {
    DBManager db = DBManager();
    db.insert(cart).then((value) {
      _totalPrice += cart.productPrice;
      _counter++;
      addItem();
    }).onError((error, stackTrace) {
      print(error);
      // CustomToast(message: "$error", context: context);
    });
  }

  /// Remove Product from the cart, it required [productPrice] to remove
  void removeFromCart(int productPrice) {
    _totalPrice -= productPrice;
    _counter--;
    addItem();
  }

  void addItem() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(_keyCounter, _counter);
    sp.setInt(_keyTotalPrice, totalPrice);
    notifyListeners();
  }

  void getItem() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.getInt(_keyCounter);
    sp.getDouble(_keyTotalPrice);
    notifyListeners();
  }
}
