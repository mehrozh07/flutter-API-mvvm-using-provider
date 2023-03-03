import 'package:flutter/cupertino.dart';
import 'package:laravel_api_provider/Repositries/auth_repositries.dart';
import 'package:laravel_api_provider/Utils/Routes/route_names.dart';
import 'package:laravel_api_provider/Utils/utils.dart';
import 'package:laravel_api_provider/View-Models/user_view_model.dart';
import 'package:provider/provider.dart';

import '../Models/UserModel.dart';

class AuthViewModel extends ChangeNotifier{

  final authRepo = AuthRepository();
  bool loading = false;
  bool get loader => loading;
   setLoading(bool loading){
    this.loading = loading;
    notifyListeners();
  }

  bool regLoading = false;
  bool get regLoader => loading;
  setRegLoading(bool loading){
    regLoading = loading;
    notifyListeners();
  }

  Future<void> loginUser(context, dynamic data) async{
    setLoading(true);
    authRepo.loginApi(context, data).then((value){
      setLoading(false);
      final saveUserInfo = Provider.of<UserViewModel>(context, listen: false);
      saveUserInfo.saveUser(UserModel(
        token: value['token'].toString(),
      ));
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, RoutesNames.homePage);
      Utils.topFlushBarMessage("Congratulations! Login Successfully",context,  Utils.successColor);
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.topFlushBarMessage(error.toString(),context,  Utils.errorColor);
    });
  }

  Future<void> registerUser(context, dynamic data) async{
    setRegLoading(true);
    authRepo.loginApi(
      context,
      data,
    ).then((value){
      setRegLoading(false);
      Navigator.pushNamed(context, RoutesNames.loginScreen);
      Utils.topFlushBarMessage("Congratulations! Login Successfully",context,  Utils.successColor);
    }).onError((error, stackTrace){
      setRegLoading(false);
      Utils.topFlushBarMessage(error.toString(),context,  Utils.errorColor);
    });
  }

  Future<void> addNote(context, dynamic data) async{
     authRepo.addNoteApi(context, data).then((value){
       Navigator.pop(context);
       Utils.topFlushBarMessage("Note added successfully",context,  Utils.successColor);
     }).onError((error, stackTrace){
       Utils.topFlushBarMessage(error.toString(),context,  Utils.errorColor);
       debugPrint(error.toString());
     });
  }

  Future<void> getNote(context) async{
    await authRepo.getNoteApi(context).then((value){
    // final result = value['items'] as Map;
    }).onError((error, stackTrace){
      Utils.topFlushBarMessage(error.toString(),context,  Utils.errorColor);
      debugPrint(error.toString());
    });
  }
}