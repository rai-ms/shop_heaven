import 'package:flutter/cupertino.dart';

class SignUpViewModel extends ChangeNotifier
{
  final GlobalKey<FormState> formKey = GlobalKey();
  var emailCont = TextEditingController();
  var passCont = TextEditingController();
  var nameCont = TextEditingController();

  bool obsText = false;

  submit()
  {
    if(formKey.currentState!.validate()){
      String email = emailCont.text.toString().trim();
      String pass = passCont.text.toString().trim();
      String name = nameCont.text.toString().trim();
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
    super.dispose();
  }
}