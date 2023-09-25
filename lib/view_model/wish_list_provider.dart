import 'package:flutter/cupertino.dart';

import '../model/cart_model.dart';

class WishListProvider extends ChangeNotifier
{
  static List<Cart> wishList = [];
  bool _isPresented = false;

  setWishList(Cart cart)
  {
    cart.quantity = 1;
    int isPresent = -1;
    for(int i = 0; i < wishList.length; ++i){
      if(wishList[i].productName == cart.productName){
        isPresent = i;
        break;
      }
    }
    if(isPresent == -1) {
      wishList.add(cart);
      _isPresented = true;
    }
    else
    {
      wishList.removeAt(isPresent);
      _isPresented = false;
    }

    notifyListeners();
  }


}