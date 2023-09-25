import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

import '../view/login_view/widgets/introduction_page.dart';
import '../view/login_view/widgets/login_page_login_widget.dart';

class LoginPageViewModel extends ChangeNotifier
{

  final List<Widget> screens = [const IntroPageSplashScreen(), LoginPageLoginWidget()];

  final GlobalKey<FormState> formKey = GlobalKey();
  var emailCont = TextEditingController();
  var passCont = TextEditingController();

  int currentIndex = 0;

  bool obsText = false;

  passShowHide(){
    obsText = !obsText;
    notifyListeners();
  }

  List<Widget> generateScreenTiles() {
    return screens.map((index) => index).toList();
  }

  CarouselController buttonCarouselController = CarouselController();
  prevPage(){
    buttonCarouselController.previousPage(
        duration:const Duration(milliseconds: 300), curve: Curves.linear);
    notifyListeners();
  }

  nextPage(){
    buttonCarouselController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passCont.dispose();
    emailCont.dispose();
    formKey.currentState!.dispose();
    super.dispose();
  }
}