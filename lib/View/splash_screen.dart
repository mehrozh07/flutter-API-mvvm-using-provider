import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Data/Services/splash_service.dart';
import 'package:laravel_api_provider/Utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   SplashService splashService = SplashService();
  @override
  void initState() {
    super.initState();
    splashService.getUserSession(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Splash Screen", style: Utils.bigStyle)),
          ],
        ),
      ),
    );
  }
}
