import 'package:flutter/cupertino.dart';

class IntroPageSplashScreen extends StatelessWidget {
  const IntroPageSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 300,
        width: 350,
        child: Image.network("https://static.wixstatic.com/media/e19f61_5b6f7d29cead49418403d8330de8709a~mv2_d_1200_1200_s_2.gif"),
      ),
    );
  }
}
