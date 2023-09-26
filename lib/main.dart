import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/firebase_options.dart';
import 'package:shop_heaven/utils/routes/navigate_route.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';
import 'package:shop_heaven/view_model/cart_view_model.dart';
import 'package:shop_heaven/view_model/homepage_view_model.dart';
import 'package:shop_heaven/view_model/login_page_view_model.dart';
import 'package:shop_heaven/view_model/sign_up_view_model.dart';
import 'package:shop_heaven/view_model/wish_list_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomePageViewModel()),
          ChangeNotifierProvider(create: (context) => CartViewModelProvider()),
          ChangeNotifierProvider(create: (context) => LoginPageViewModel()),
          ChangeNotifierProvider(create: (context) => SignUpViewModel()),
          ChangeNotifierProvider(create: (context) => WishListProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: RouteName.splashscreen,
          onGenerateRoute: NavigateRoute.onGenerate,
        ));
  }
}
