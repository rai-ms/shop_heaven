import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  static const String _keyCounter = "counter";
  static const String _keyTotalPrice = "totalPrice";

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  /// Add Product into the Cart, it required [productPrice] to add
  void addToCart(double productPrice) {
    _totalPrice += productPrice;
    _counter++;
    addItem();
  }

  /// Remove Product from the cart, it required [productPrice] to remove
  void removeFromCart(double productPrice) {
    _totalPrice -= productPrice;
    _counter--;
    addItem();
  }

  void addItem() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.setInt(_keyCounter, _counter);
    _sp.setDouble(_keyTotalPrice, totalPrice);
    notifyListeners();
  }

  void getItem() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.getInt(_keyCounter);
    _sp.getDouble(_keyTotalPrice);
    notifyListeners();
  }
}
