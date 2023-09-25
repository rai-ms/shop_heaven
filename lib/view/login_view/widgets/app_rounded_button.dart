import 'package:flutter/material.dart';
import 'package:shop_heaven/utils/app_helper/app_color.dart';
import 'package:shop_heaven/utils/app_helper/app_style.dart';

class AppRoundedButton extends StatelessWidget {
  String title;
  VoidCallback onTap;
  bool loading;

  AppRoundedButton(
      {super.key,
        required this.onTap,
        required this.title,
        this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.blueSplashScreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: loading? const CircularProgressIndicator(color: AppColors.white,) : Text(title,style: AppStyle.whiteBold16,)),
      ),
    );
  }
}