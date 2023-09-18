import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/model/cart_model.dart';
import 'package:shop_heaven/view_model/homepage_view_model.dart';

class CartViewUI extends StatelessWidget {
  CartViewUI({super.key, required this.cart, this.isAddRemove = false});

  Cart cart;
  bool isAddRemove = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black, width: 1),
                        borderRadius:
                            BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                          cart.image),
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(cart.productName),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Text(cart.unitTag),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            cart.productPrice.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        (!isAddRemove)?Flexible(
          child: Consumer<HomePageViewModel>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  value.addToCart(
                      cart,
                      context);
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius:
                          BorderRadius.circular(20)),
                  child: const Center(
                      child: Text("Add to cart")),
                ),
              );
            },
          ),
        ):CircularProgressIndicator()        
      ],
    );
  }
}
