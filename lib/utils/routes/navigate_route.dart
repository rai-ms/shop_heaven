import 'package:flutter/material.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';
import 'package:shop_heaven/view/homepage/homepage.dart';
import 'package:shop_heaven/view/splashscreen/splashscreen.dart';

class NavigateRoute
{
  static Route<dynamic> onGenerate(RouteSettings settings){
    switch(settings.name)
    {
      case RouteName.homepage:
        return MaterialPageRoute(builder: (context)=> const HomePage());
      case RouteName.splashscreen:
        return MaterialPageRoute(builder: (context)=> const SplashScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(
            child: Text("Error 404"),
          ),
        ));
    }
  }
}

