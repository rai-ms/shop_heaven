import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cart_model.dart';

class WishListProvider extends ChangeNotifier {
  static List<Cart> _wishList = [];
  bool _isPresented = false;

  setWishList(Cart cart) async {
    cart.quantity = 1;
    int isPresent = -1;
    for (int i = 0; i < _wishList.length; ++i) {
      if (_wishList[i].productName == cart.productName) {
        isPresent = i;
        break;
      }
    }
    if (isPresent == -1) {
      _wishList.add(cart);
      _isPresented = true;
    } else {
      _wishList.removeAt(isPresent);
      _isPresented = false;
    }
    notifyListeners();
  }

  bool isPresented(String productId) {
    for (int i = 0; i < _wishList.length; ++i) {
      if (_wishList[i].productId == productId) {
        return true;
      }
    }
    return false;
  }

  List<Cart> get wishList => _wishList;
}
