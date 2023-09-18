import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/model/cart_item_view.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/view_model/cart_view_model.dart';
import 'package:shop_heaven/view_model/homepage_view_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Consumer<HomePageViewModel>(
            builder: (context, value, child) {
              String totalPrice = value.totalPrice.toString();
              return Text(totalPrice);
            },
          ),
         ),
      body: Center(
        child: Column(
          children: [
            Expanded(child:
                Consumer<CartViewModelProvider>(builder: (key, value, child) {
              return FutureBuilder(
                  future: value.getData(),
                  builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
                    List<Cart> cartList = snapshot.data!;
                    if (!snapshot.hasData || snapshot.hasError) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) 
                    {
                      return ListView.builder(itemBuilder: (context, index) => CartViewUI(cart: cartList[index],), itemCount: cartList.length,);
                    } else
                      return const Center(child: CircularProgressIndicator());
                  });
            }))
          ],
        ),
      ),
    );
  }
}
