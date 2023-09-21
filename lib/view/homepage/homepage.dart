import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/model/cart_item_view.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/utils/app_helper/app_color.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';
import 'package:shop_heaven/view_model/homepage_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int countItems = 0;

class _HomePageState extends State<HomePage> {
  List<Cart> list = [];
  @override
  void initState() {
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
              return FutureBuilder(
                  future: value.totalPrice,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      int totalPrice = snapshot.data!;
                      return Text(totalPrice.toString());
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }));
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<HomePageViewModel>(
                builder: (context, value, child) {
                  return Badge(
                      backgroundColor: AppColors.black,
                      label: FutureBuilder(
                          future: value.totalPrice,
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              int totalPrice = snapshot.data!;
                              return Text(totalPrice.toString());
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          })),
                      child: InkWell(
                          onTap: () {
                            value.deleteDatabase();
                          },
                          child: const Icon(
                            Icons.delete,
                            size: 30,
                            color: AppColors.blueAccent,
                          )));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<HomePageViewModel>(
                builder: (context, value, child) {
                  return Badge(
                      backgroundColor: AppColors.black,
                      label: FutureBuilder(
                          future: value.counter,
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              int totalPrice = snapshot.data!;
                              return Text(totalPrice.toString());
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          })),
                      child: InkWell(
                          onTap: ()  {
                            Navigator.pushNamed(context, RouteName.cartPage);
                          },
                          child: const Icon(
                            Icons.shopping_bag,
                            size: 30,
                            color: AppColors.blueAccent,
                          )));
                },
              ),
            ),
          ]),
      body: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: ((context, index) {
                      return CartViewUI(cart: list[index]);
                    })))
          ],
        ),
      )),
    );
  }
}
