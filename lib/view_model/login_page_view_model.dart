import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';

import '../data/app_exceptions/app_exception.dart';
import '../repository/google_auth_firebase/google_auth_service.dart';
import '../view/login_view/widgets/introduction_page.dart';
import '../view/login_view/widgets/login_page_login_widget.dart';

class LoginPageViewModel extends ChangeNotifier
{

  final List<Widget> screens = [const IntroPageSplashScreen(), LoginPageLoginWidget()];

  final GlobalKey<FormState> formKey = GlobalKey();
  var emailCont = TextEditingController();
  var passCont = TextEditingController();
  FocusNode idFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  FocusNode loginButtonFocusNode = FocusNode();

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
    idFocusNode.dispose();
    passFocusNode.dispose();
    loginButtonFocusNode.dispose();
    super.dispose();
  }

  signUpUsingGoogle(BuildContext context) async {
    GoogleAuthService googleAuthService = GoogleAuthService();
    try {
      final user = await googleAuthService.signInWithGoogle();
      if(!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, RouteName.homepage, (route) => false);
        } catch (e){
      // throw UnableToLogin(e.toString());
      debugPrint(e.toString());
    }
  }
}