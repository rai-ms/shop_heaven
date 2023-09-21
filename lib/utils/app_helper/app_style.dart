import 'package:flutter/material.dart';
import 'package:shop_heaven/utils/app_helper/app_color.dart';

class AppStyle {
  // Bold, 16, whiteBold
  static TextStyle get whiteBold16 {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get blackBold16 {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get blackBold24 {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get greyRegular20 {
    return const TextStyle(
      color: AppColors.grey,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get blackMedium16 {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  // Bold, 14, grey Medium
  static TextStyle get greyMedium14 {
    return const TextStyle(
      color: AppColors.grey,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }
}