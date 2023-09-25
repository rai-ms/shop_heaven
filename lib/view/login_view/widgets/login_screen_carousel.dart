import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/view_model/login_page_view_model.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});
  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  SizedBox(
      width: width,
      child: Consumer<LoginPageViewModel>(builder:(context, provider, child){
        return CarouselSlider(
          carouselController: provider.buttonCarouselController,
          items: provider.generateScreenTiles(),
          options: CarouselOptions(
              autoPlay: false,
              reverse: true,
              aspectRatio: 1.5/2,
              viewportFraction: 2.0,
              autoPlayInterval: const Duration(milliseconds: 4000),
              autoPlayCurve: Curves.linearToEaseOut,
              autoPlayAnimationDuration: const Duration(microseconds: 1),
              enlargeFactor: 0.9,
            ),
        );
      }),
    );
  }
}