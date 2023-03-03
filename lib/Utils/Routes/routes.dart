import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Utils/Routes/route_names.dart';
import 'package:laravel_api_provider/View/home_screen.dart';
import 'package:laravel_api_provider/View/login_view.dart';
import 'package:laravel_api_provider/View/signup_view.dart';
import 'package:laravel_api_provider/View/splash_screen.dart';

class Routes{
  static Route? onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case RoutesNames.splashScreen:
        return CupertinoPageRoute(builder: (_)=> const SplashScreen());
      case RoutesNames.loginScreen:
      Map arguments = (settings.arguments??{'title': "Login"}) as Map;
        return CupertinoPageRoute(builder: (_)=> LoginView(
          title: arguments['title'],
        ));
      case RoutesNames.homePage:
        Map arguments = (settings.arguments??{'title': "Notes App"}) as Map;
        return CupertinoPageRoute(builder: (_)=> HomeScreen(
          title: arguments['title'],
        ));
      case RoutesNames.registerScreen:
        Map arguments = (settings.arguments??{'title': "Sign Up"}) as Map;
        return CupertinoPageRoute(builder: (_)=> SignUpView(
          title: arguments['title'],
        ));
      // case RoutesNames.orderDetails:
      //   return CupertinoPageRoute(builder: (_)=> const OrderDetails());
      // case RoutesNames.mainScreen:
      //   return CupertinoPageRoute(builder: (_)=> const MainScreen());
      // case RoutesNames.scheduledPickUp:
      //   return CupertinoPageRoute(builder: (_)=> SchedulePickup());
      // case RoutesNames.pickUpAddress:
      //   return CupertinoPageRoute(builder: (_)=> const PickUpAddress());
      default:
        return CupertinoPageRoute(builder: (_)=> const Scaffold(
          body: Center(child: Text('Wrong Navigation')),
        ));
    }
  }
}