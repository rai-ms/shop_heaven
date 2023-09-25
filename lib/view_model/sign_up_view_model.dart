import 'package:flutter/cupertino.dart';

import '../utils/utils.dart';

class SignUpViewModel extends ChangeNotifier
{
  final GlobalKey<FormState> formKey = GlobalKey();
  var emailCont = TextEditingController();
  var passCont = TextEditingController();
  var nameCont = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode createAccountFocus = FocusNode();

  bool obsText = false;

  submit(BuildContext context)
  {

    if(formKey.currentState!.validate()){
      String email = emailCont.text.toString().trim();
      String pass = passCont.text.toString().trim();
      String name = nameCont.text.toString().trim();
      Utils.hideKeyboard(context);
      debugPrint("Email: $email \nName: $name \nPass: $pass");
    }
  }

  passShowHide(){
    obsText = !obsText;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailCont.dispose();
    passCont.dispose();
    formKey.currentState!.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    passFocus.dispose();
    createAccountFocus.dispose();
    super.dispose();
  }
}