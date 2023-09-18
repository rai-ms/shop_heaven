import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/model/cart_item_view.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/res/components/custom_toast.dart';
import 'package:shop_heaven/utils/random_no_generator.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';
import 'package:shop_heaven/view_model/homepage_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cart> list = [];
  @override
  void initState() {
    // TODO: implement initState
    list = Cart.getCartListFromLists();
    super.initState();
  }

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
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<HomePageViewModel>(
                builder: (context, value, child) {
                  int count = value.counter;
                  return Badge(
                      backgroundColor: Colors.yellow,
                      label: Text(
                        "$count",
                        style: const TextStyle(color: Colors.black),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.cartPage);
                          },
                          child: const Icon(
                            Icons.shopping_bag,
                            size: 30,
                            color: Colors.blueAccent,
                          )));
                },
              ),
            )
          ]),
      body: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Column(
          children: [
            Expanded(child: ListView.builder(itemCount: list.length, itemBuilder: ((context, index) {
              return CartViewUI(cart:list[index]);
            })))
          ],
        ),
      )),
    );
  }
}
