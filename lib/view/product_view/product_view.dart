import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/cart_model.dart';
import '../../view_model/wish_list_provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.cart});
  final Cart cart;
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WishListProvider()),
    ],
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const SizedBox(width: 20,)
          ],
        ),
        body: Column(
          children: [
            Text(widget.cart.productName),
            Stack(
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.greenAccent,
                    ),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.cart.image,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                )),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Consumer <WishListProvider>(
                      builder: (context, provider, child){
                        return InkWell(
                            onTap: ()
                            {
                              provider.setWishList(widget.cart);
                            },
                            child: Icon(Icons.favorite_border, color: Colors.red,));
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
