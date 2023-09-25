import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';

class SplashScreenServices {
  static checkAuthentication(BuildContext context) async {
    SharedPreferences? preferences = await SharedPreferences.getInstance();
    String? userKey = preferences.getString('user');
    if (userKey == null || userKey == 'null' || userKey!.isEmpty) {
      await Future.delayed(const Duration(seconds: 3));
      if (!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.loginPage, (route) => false);
    } else {
      if (!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.homepage, (route) => false);
    }
  }
}
