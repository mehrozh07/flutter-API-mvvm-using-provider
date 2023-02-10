import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laravel_api_provider/Resources/Components/rounded_button.dart';
import 'package:laravel_api_provider/Utils/utils.dart';

class LoginView extends StatefulWidget {
  final String? title;
   const LoginView({Key? key, this.title}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("${widget.title}",
                style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              controller: emailController,
              clearButtonMode: OverlayVisibilityMode.editing,
              keyboardType: TextInputType.emailAddress,
              placeholder: "email",
              focusNode: emailFocusNode,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onSubmitted: (value){
                Utils.onNextFocus(context, emailFocusNode, passwordFocusNode);
              },
              onChanged: (v) {
                if (v.isEmpty) {
                  Utils.topFlushBarMessage(
                    "enter email",
                      context,
                      Utils.warningColor,
                  );
                }
                return;
              },
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),

            ),
            const SizedBox(height: 10),
            CupertinoTextField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              obscureText: true,
              obscuringCharacter: "*",
              clearButtonMode: OverlayVisibilityMode.editing,
              keyboardType: TextInputType.visiblePassword,
              placeholder: "password",
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onChanged: (v) {
                if (v.isEmpty) {
                  Utils.topFlushBarMessage(
                    "enter password",
                    context,
                    Utils.warningColor,
                  );
                }
                return;
              },
              autofocus: true,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),

            ),
          const SizedBox(height: 50),
          RoundedButton(
            title: "Login",
              onTap: (){
              if(emailController.text.isEmpty){
                Utils.topFlushBarMessage("please enter email", context, Utils.warningColor);
              }else if(passwordController.text.isEmpty){
                Utils.topFlushBarMessage("please enter password", context, Utils.warningColor);
              }else if(passwordController.text.length <6 ){
                Utils.topFlushBarMessage("password length should be grater than 6 characters",
                    context, Utils.warningColor);
              }else{
                Utils.topFlushBarMessage("Api hit",
                    context, Utils.successColor);
                if (kDebugMode) {
                  print("api hit");
                }
              }
              },
          ),
          ],
        ),
      ),
    ));
  }
}
