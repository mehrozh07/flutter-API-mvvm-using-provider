import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier{

  Future<bool> saveUser(UserModel userModel) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", userModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("token");
    return UserModel(token: token.toString());
  }

  Future<bool> removeUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return true;
  }
}