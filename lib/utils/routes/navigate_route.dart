import 'package:flutter/material.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';
import 'package:shop_heaven/view/homepage/homepage.dart';
import 'package:shop_heaven/view/login_view/login_view.dart';
import 'package:shop_heaven/view/signup_view/signup_view.dart';
import 'package:shop_heaven/view/splashscreen/splashscreen.dart';
import 'package:shop_heaven/view/wish_list_view/wish_list_view.dart';
import '../../view/cartview/cart_view.dart';
import '../../view/product_view/product_view.dart';

class NavigateRoute {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homepage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteName.signupPage:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case RouteName.productView:
        Map cart = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => ProductView(cart: cart['cart'],));
      case RouteName.wishListPage:
        return MaterialPageRoute(builder: (context) => const WishListView());
      case RouteName.splashscreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.cartPage:
        return MaterialPageRoute(builder: (context) => const CartView());
      case RouteName.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginView());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("Error 404"),
                  ),
                ));
    }
  }
}
