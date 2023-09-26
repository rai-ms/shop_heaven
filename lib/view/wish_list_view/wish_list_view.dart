import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/model/cart_item_view.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';
import 'package:shop_heaven/view_model/wish_list_provider.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  List<Cart> list = Cart.getCartListFromLists();
  WishListProvider provider = WishListProvider();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WishListProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(
                  context, RouteName.homepage);
            },
          ),
          title: const Text("Wish List Page"),
        ),
        body: Column(
          children: [
            Consumer<WishListProvider>(builder: (context, provider, child) {
              if (provider.wishList.isEmpty) {
                return const Center(
                  child:  Text("WishList is empty"));
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: provider.wishList.length,
                    itemBuilder: (context, index) {
                      return CartViewUI(cart: provider.wishList[index]);
                    }),
              );
            }),
            // ListenableBuilder(
            //   listenable: provider,
            //   builder: (context, child) {
            //     if (provider.wishList.isEmpty) {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //     return Expanded(
            //       child: ListView.builder(
            //         itemCount: provider.wishList.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: CartViewUI(cart: provider.wishList[index]),
            //           );
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
