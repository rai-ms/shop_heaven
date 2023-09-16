import 'package:flutter/material.dart';
import 'package:shop_heaven/utils/routes/navigate_route.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: RouteName.splashscreen,
     onGenerateRoute: NavigateRoute.onGenerate,
    );
  }
}
