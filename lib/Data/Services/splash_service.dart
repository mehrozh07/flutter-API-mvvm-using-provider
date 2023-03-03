import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Models/UserModel.dart';
import 'package:laravel_api_provider/Utils/Routes/route_names.dart';
import 'package:laravel_api_provider/Utils/utils.dart';
import 'package:laravel_api_provider/View-Models/user_view_model.dart';

class SplashService{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void getUserSession(context){
    getUserData().then((value){
      debugPrint("${value.token}");
      if(value.token.toString() == "null" || value.token.toString().isEmpty || value.token.toString() == ""){
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesNames.loginScreen);
      }else{
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesNames.homePage);
      }

    }).onError((error, stackTrace){
      Utils.topFlushBarMessage(error.toString(), context, Colors.redAccent);
    });
  }

}