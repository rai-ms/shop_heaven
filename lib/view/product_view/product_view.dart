import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/global/global.dart';
import 'package:shop_heaven/model/button_add_to_cart.dart';
import 'package:shop_heaven/utils/app_helper/app_color.dart';
import 'package:shop_heaven/utils/app_helper/app_strings.dart';
import 'package:shop_heaven/utils/app_helper/app_style.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';
import 'package:shop_heaven/view_model/homepage_view_model.dart';

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
        ChangeNotifierProvider(create: (context) => HomePageViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Product Description Page",
            style: AppStyle.blackBold16,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                widget.cart.productName,
                style: AppStyle.blackBold24,
              ),
            ),
            Stack(
              children: [
                Card(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                          color: AppColors.blueSplashScreen, width: 2.5),
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
                    child: Consumer<WishListProvider>(
                      builder: (context, provider, child) {
                        return InkWell(
                            onTap: () {
                              provider.setWishList(widget.cart);
                            },
                            child: CircleAvatar(
                                radius: 20,
                                child: Icon(
                                  provider.isPresented(widget.cart.productId)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                )));
                      },
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: AppStyle.blackBold16,
                      children: <TextSpan>[
                        const TextSpan(
                          text: "₹",
                        ),
                        TextSpan(
                            text: "${widget.cart.productPrice - 10}/",
                            style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 40)),
                        TextSpan(
                            text: widget.cart.unitTag.toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 60, 62, 67),
                            )),
                      ],
                    ),
                  ),
                  sizedBox(hei: 10),
                  RichText(
                    text: TextSpan(
                      style: AppStyle.blackBold16,
                      children: <TextSpan>[
                        TextSpan(
                            text: "M.R.P.: ₹", style: AppStyle.blackSmall12),
                        TextSpan(
                            text: "${widget.cart.initialPrice}/",
                            style: AppStyle.blackSmall12),
                        TextSpan(
                            text: widget.cart.unitTag.toString(),
                            style: AppStyle.blackSmall12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: AddToCart(cart: widget.cart)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RouteName.cartPage, (route) => route.isFirst);
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            color: AppColors.blueSplashScreen,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          AppStrings.buyAddedProducts,
                          style: AppStyle.whiteBold16,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
