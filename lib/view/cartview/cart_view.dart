import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/model/cart_item_view.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/utils/app_helper/app_color.dart';
import 'package:shop_heaven/utils/app_helper/app_strings.dart';
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
          backgroundColor: AppColors.greenAccent,
          title: const Text(AppStrings.buyAddedProducts)),
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
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());}
                      });
                })),
            Expanded(flex: 2, child: generateBill())
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
              return FutureBuilder(
                  future: value.counter,
                  builder: (context, AsyncSnapshot<int> val) {
                    if (!val.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return Visibility(
                      visible: (val.data == 0) ? false : true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${AppStrings.totalItemCount}$ct"),
                          Text("${AppStrings.totalPrice}$tp"),
                        ],
                      ),
                    );
                  });
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
