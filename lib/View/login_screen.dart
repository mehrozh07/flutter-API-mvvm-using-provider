import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Utils/Routes/route_names.dart';
import 'package:laravel_api_provider/Utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, required title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: (){
                  Utils.flushBarMessage(context, "No Internet Connection", Utils.errorColor);
                  Utils.topFlushBarMessage("No Internet Connection", context, Utils.errorColor);
                  // Navigator.pushNamed(context, RoutesNames.homePage);
                },
                child: const Text("Login")),
          )
        ],
      ),
    ));
  }
}
