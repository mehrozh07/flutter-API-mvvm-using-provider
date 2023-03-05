import 'package:flutter/cupertino.dart';
import 'package:laravel_api_provider/Data/Response/api_response.dart';
import 'package:laravel_api_provider/Models/FoodModel.dart';
import 'package:laravel_api_provider/Repositries/home_repositry.dart';

class FoodViewModel extends ChangeNotifier{

  final myRep = HomeRepository();

  ApiResponse<FoodModel> foodList = ApiResponse.loading();

  setFoodList(ApiResponse<FoodModel> response){
    foodList = response;
    notifyListeners();
  }

  Future<void> getFoodList(context) async{

    setFoodList(ApiResponse.loading());

    myRep.getFoodList(context)?.then((value){

      setFoodList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setFoodList(ApiResponse.error(error.toString()));

    });
  }

}