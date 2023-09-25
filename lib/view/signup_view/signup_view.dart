import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_heaven/utils/app_helper/app_style.dart';
import 'package:shop_heaven/view_model/sign_up_view_model.dart';

import '../../global/global.dart';
import '../../utils/app_helper/app_color.dart';
import '../../utils/app_helper/app_strings.dart';
import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';
import '../login_view/widgets/app_rounded_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
          child: Consumer<SignUpViewModel>(builder: (context, provider, child){
            return Form(
              key: provider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: NetworkImage("https://img.freepik.com/premium-photo/blue-shopping-cart-is-flying-with-blue-surface_37225-450.jpg"), fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                        )
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: Text(AppStrings.hello, style: AppStyle.blackBold16,)),
                          Flexible(child: Text(AppStrings.createAnAccount, style: AppStyle.greyMedium14,)),
                          Flexible(child: sizedBox(hei: 10)),
                          Flexible(child: Text(AppStrings.yourName, style: AppStyle.blackBold16,)),
                          Flexible(child: sizedBox(hei: 2)),
                          TextFormField(
                            controller: provider.nameCont,
                            validator: (em) {
                              return Utils.isValidName(em!);
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(width: 2, color: AppColors.black)),
                                hintText: AppStrings.fullName,
                                constraints: BoxConstraints(
                                  maxWidth: 400,
                                ),
                                hoverColor: AppColors.blueAccent),
                          ),
                          Flexible(child: sizedBox(hei: 10)),
                          Flexible(child: Text(AppStrings.yourEmail, style: AppStyle.blackBold16,)),
                          Flexible(child: sizedBox(hei: 2)),
                          TextFormField(
                            controller: provider.emailCont,
                            validator: (em) {
                              return Utils.isValidEmail(em!) ? null : AppStrings.notValidMail;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(width: 2, color: AppColors.black)),
                                hintText: AppStrings.enterEmailAddress,
                                constraints: BoxConstraints(
                                  maxWidth: 400,
                                ),
                                hoverColor: AppColors.blueAccent),
                          ),
                          Flexible(child: sizedBox(hei: 10)),
                          Flexible(child: Text(AppStrings.password, style: AppStyle.blackBold16,)),
                          Flexible(child: sizedBox(hei: 2)),
                          TextFormField(
                            controller: provider.passCont,
                            validator: Utils.isValidPass,
                            obscureText: provider.obsText,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
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
                          Flexible(child: sizedBox(hei: 10)),
                          Center(
                            child: AppRoundedButton(onTap: (){
                              provider.submit();
                            }, title: AppStrings.createAccount, loading: false),
                          ),
                          Flexible(child: sizedBox(hei: 10)),
                          Flexible(
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  Navigator.pop(context, RouteName.loginPage);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    style: AppStyle.blackBold16,
                                    children: const <TextSpan>[
                                      TextSpan(text:  AppStrings.alreadyHaveAccount,),
                                      TextSpan(text: AppStrings.signIn, style: TextStyle(
                                        color: AppColors.blue,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },)),
    );
  }
}
