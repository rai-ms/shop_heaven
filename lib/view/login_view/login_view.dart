import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/utils/app_helper/app_style.dart';
import 'package:shop_heaven/view_model/login_page_view_model.dart';
import '../../global/global.dart';
import 'widgets/login_screen_carousel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(hei: 10),
                  Text("Get the Fruits", style: AppStyle.yellowBold16,),
                  sizedBox(hei: 20),
                  Text("Easy and Secure", style: AppStyle.blueBold30,),
                  sizedBox(hei: 30),
                  Text("As soon as the booking is accepted, We provide the smooth delivery",
                    style: AppStyle.greyRegular20,maxLines: 3, ),
                  sizedBox(hei: 30),
                ],
              ),
            ),
            const MyCarousel(),
            Consumer<LoginPageViewModel>(builder: (context, provider, child){
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                  [
                    InkWell( onTap: provider.prevPage, child: Text("<", style: AppStyle.blueBold20,)),
                    InkWell(onTap: provider.nextPage,child: Text(">", style: AppStyle.blueBold20,)),
                  ]
              );
            })
          ],
        ),
      ),
    );
  }
}