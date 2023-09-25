import 'package:flutter/material.dart';
import 'package:shop_heaven/utils/app_helper/app_color.dart';
import 'package:shop_heaven/utils/app_helper/app_style.dart';

class AppButton
{
  static Widget googleButton()
  {
    return Container
    (
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.black),
        boxShadow: const [
          BoxShadow(color: AppColors.grey)
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          Flexible(child: SizedBox(
              child: Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"))),
          Expanded(child: Text("Google", style: AppStyle.blackMedium16,))
        ],
      ),
    );
  }
  static Widget facebookButton()
  {
    return Container
    (
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.blueSplashScreen,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.black),
        boxShadow: const
        [
          BoxShadow(color: AppColors.grey)
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
        [
          const Flexible(
            child: SizedBox(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage("https://mekes.com/app/uploads/2020/12/facebook-logo-png-5a35528eaa4f08.7998622015134439826976.jpg",),))),
          Expanded(child: Text("Facebook", style: AppStyle.whiteMedium16,))
        ],
      ),
    );
  }
}