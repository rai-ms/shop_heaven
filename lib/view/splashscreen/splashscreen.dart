import 'package:flutter/material.dart';
import 'package:shop_heaven/global/global.dart';
import 'package:shop_heaven/utils/app_helper/app_color.dart';
import 'package:shop_heaven/utils/app_helper/app_strings.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';

import '../../services/splashscreen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loading();
  }

  Future<void> loading() async {
    await SplashScreenServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: getFullHeight(context),
        width: getFullWidth(context),
        decoration: const BoxDecoration(color: AppColors.blueSplashScreen),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.home_max_outlined,
              color: AppColors.white,
              size: 50,
            ),
            const Text(
              AppStrings.appName,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: LinearProgressIndicator(
                    color: AppColors.white,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
