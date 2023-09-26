import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/res/components/custom_toast.dart';
import 'package:shop_heaven/utils/app_helper/app_color.dart';
import 'package:shop_heaven/utils/app_helper/app_strings.dart';
import 'package:shop_heaven/view_model/homepage_view_model.dart';

class AddToCart extends StatefulWidget {
  AddToCart({super.key, required this.cart});
  Cart cart;
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            value.increase(widget.cart);
            CustomToast(context: context, message: "Item Added");
          },
          child: Container(
            height: 50,
            width: 120,
            decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(20)),
            child: const Center(child: Text(AppStrings.addToCart)),
          ),
        );
      },
    );
  }
}
