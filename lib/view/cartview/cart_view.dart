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
          title: const Text("Buy Added Products")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 8,
                child: Consumer<CartViewModelProvider>(
                    builder: (key, value, child) {
                      return FutureBuilder(
                        future: value.getAllData(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Cart>> snapshot) {
                          List<Cart> cartList = snapshot.data!;
                          if (!snapshot.hasData || snapshot.hasError) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                              itemBuilder: (context, index) => CartViewUI(
                                cart: snapshot.data![index],
                                isAddRemove: true,
                              ),
                              itemCount: snapshot.data!.length,
                            );
                          } else
                            // ignore: curly_braces_in_flow_control_structures
                            return const Center(
                                child: CircularProgressIndicator());
                        });
                })),
            Expanded(
              flex: 2,
              child: generateBill()
              )
          ],
        ),
      ),
    );
  }

  Widget generateBill() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<HomePageViewModel>(
            builder: (context, value, child) {
              setValues(value.counter, value.totalPrice);
              return Visibility(
                visible: value.counter == 0 ? false:true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Total Item count:${ct}"),
                    Text("Total Price is:$tp"),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  int ct = 0, tp = 0;
  setValues(Future<int> itmct, Future<int> itmpr) async {
    ct = await itmct;
    tp = await itmpr;
  }
}
