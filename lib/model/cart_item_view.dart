import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/cart_view_model.dart';
import '../view_model/homepage_view_model.dart';
import 'cart_model.dart';

class CartViewUI extends StatefulWidget {
  CartViewUI({super.key, required this.cart, this.isAddRemove = false});

  Cart cart;
  bool isAddRemove = false;

  @override
  State<CartViewUI> createState() => _CartViewUIState();
}

class _CartViewUIState extends State<CartViewUI> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Row(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      // child: Image.network(widget.cart.image),
                      child: CachedNetworkImage(
                        imageUrl: widget.cart.image,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.cart.productName),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Text(widget.cart.unitTag),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(widget.cart.productPrice.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        (!widget.isAddRemove)
            ? Expanded(
                flex: 3,
                child: Consumer<HomePageViewModel>(
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        // value.addToCart(widget.cart, context);
                        // print(widget.cart.id);
                        value.increase(widget.cart);
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(child: Text("Add to cart")),
                      ),
                    );
                  },
                ),
              )
            : Expanded(flex: 3, child: addRemoveItemFromCart())
      ],
    );
  }

  Widget addRemoveItemFromCart() {
    return SizedBox(
        height: 90,
        child:
            Consumer<CartViewModelProvider>(builder: (context, value, child) {
          return FutureBuilder(
              future: value.getItemCount(widget.cart),
              builder: ((context, AsyncSnapshot<int> snapshot) {
                int count = snapshot.data!;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        await value.decrease(widget.cart);
                      },
                      child: Container(
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: const Icon(
                          Icons.exposure_plus_1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      color: Colors.white,
                      child: Text(count.toString()),
                    ),
                    InkWell(
                      onTap: () async {
                        await value.decrease(widget.cart);
                      },
                      child: Container(
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: const Icon(
                          Icons.exposure_minus_1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }));
        }));
  }
}
