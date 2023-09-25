import 'package:flutter/material.dart';
import 'package:shop_heaven/model/cart_item_view.dart';
import 'package:shop_heaven/model/cart_model.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  
  List<Cart> list = Cart.getCartListFromLists();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index){
                return CartViewUI(cart: list[index]);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
