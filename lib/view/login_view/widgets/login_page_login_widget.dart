import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/global/global.dart';
import 'package:shop_heaven/utils/app_helper/app_strings.dart';
import 'package:shop_heaven/utils/app_helper/app_style.dart';
import 'package:shop_heaven/utils/routes/route_name.dart';
import 'package:shop_heaven/utils/utils.dart';
import 'package:shop_heaven/view_model/login_page_view_model.dart';
import '../../../utils/app_helper/app_color.dart';
import '../../../res/components/app_rounded_button.dart';
import 'other_button.dart';

class LoginPageLoginWidget extends StatelessWidget {
  LoginPageLoginWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageViewModel>(builder: (context, provider, child){
      return Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: provider.emailCont,
                  focusNode: provider.idFocusNode,
                  onFieldSubmitted: (_) {
                    Utils.changeFocus(context, provider.idFocusNode, provider.passFocusNode);
                  },
                  validator: (em) {
                    return Utils.isValidEmail(em!) ? null : AppStrings.notValidMail;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                          BorderSide(width: 2, color: AppColors.black)),
                      hintText: AppStrings.id,
                      label: Text(AppStrings.id),
                      constraints: BoxConstraints(
                        maxWidth: 400,
                      ),
                      hoverColor: AppColors.blueAccent),
                ),
                sizedBox(hei: 20),
                TextFormField(
                  controller: provider.passCont,
                  focusNode: provider.passFocusNode,
                  validator: Utils.isValidPass,
                  onFieldSubmitted: (_) {
                    Utils.changeFocus(context, provider.passFocusNode, provider.loginButtonFocusNode);
                  },
                  obscuringCharacter: "*",
                  obscureText: provider.obsText,
                  decoration:  InputDecoration(
                      suffixIcon: InkWell(
                          onTap: (){
                            provider.passShowHide();
                          },
                          child: Icon(provider.obsText ? Icons.visibility_outlined : Icons.visibility_off_outlined)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                          BorderSide(width: 2, color: AppColors.black)),
                      hintText: AppStrings.pass,
                      label: const Text(AppStrings.pass),
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      hoverColor: AppColors.blueAccent),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(AppStrings.forgetPassword, style: AppStyle.blueItalicBold15, textAlign: TextAlign.end,),
                ),
                sizedBox(hei: 10),
                AppRoundedButton(
                  focusNode: provider.loginButtonFocusNode,
                  onTap: (){
                    Utils.hideKeyboard(context);
                  Navigator.pushNamedAndRemoveUntil(context, RouteName.homepage, (route) => false);
                }, title: AppStrings.signIn, loading: false),
                sizedBox(hei: 30),
                InkWell(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, RouteName.signupPage, (route) => route.isFirst);
                  },
                  child: RichText(
                    text: TextSpan(
                      style: AppStyle.blackBold16,
                      children: const <TextSpan>[
                        TextSpan(text:  AppStrings.dontHaveAccount,),
                        TextSpan(text: AppStrings.signUp, style: TextStyle(
                          color: AppColors.blue,
                        )),
                      ],
                    ),
                  ),
                ),
                sizedBox(hei: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 10,),
                      Flexible(child: AppButton.googleButton()),
                      const SizedBox(width: 10,),
                      Flexible(child: AppButton.facebookButton()),
                      const SizedBox(width: 10,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
