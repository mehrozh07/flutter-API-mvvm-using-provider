import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Resources/Components/rounded_button.dart';
import 'package:laravel_api_provider/Utils/Routes/route_names.dart';
import 'package:laravel_api_provider/Utils/utils.dart';
import 'package:laravel_api_provider/View-Models/auth_view_model.dart';
import 'package:provider/provider.dart';

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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final auth = Provider.of<AuthViewModel>(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("${widget.title}",
                style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value){
                    Utils.onNextFocus(context, emailFocusNode, passwordFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.only(left: width * 0.03, right: 0, top: 0, bottom: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: const Color(0xffF3F3F3),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: "Password",
                    contentPadding: EdgeInsets.only(left: width * 0.03, right: 0, top: 0, bottom: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: const Color(0xffF3F3F3),
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: Utils.coloredTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.2,
                ),
                RoundedButton(
                title: "Login",
                  loading: auth.loader,
                  onTap: (){
                  if(emailController.text.isEmpty){
                    Utils.topFlushBarMessage("please enter email", context, Utils.warningColor);
                  }else if(passwordController.text.isEmpty){
                    Utils.topFlushBarMessage("please enter password", context, Utils.warningColor);
                  }else if(passwordController.text.length <6 ){
                    Utils.topFlushBarMessage("password length should be grater than 6 characters",
                        context, Utils.warningColor);
                  }else{
                     Map data = {
                       "email": emailController.text.trim().toString(),
                       "password": passwordController.text.trim().toString(),
                     };
                     auth.loginUser(context, data);
                    if (kDebugMode) {
                      print("api hit");
                    }
                   }
                  },
              ),
                SizedBox(
                  height: height * 0.2,
                ),
                Wrap(
                  children: [
                     Text("Don't have an account?", style: Utils.simpleTitleStyle),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesNames.registerScreen);
                      },
                        child: Text("Sign Up",style: Utils.coloredTextStyle),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
