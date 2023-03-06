import 'package:flutter/cupertino.dart';
import 'package:laravel_api_provider/Data/Response/api_response.dart';
import 'package:laravel_api_provider/Models/shop_model.dart';
import 'package:laravel_api_provider/Repositries/home_repositry.dart';

class FoodViewModel extends ChangeNotifier{

  final myRep = HomeRepository();

  ApiResponse<ShopModel> foodList = ApiResponse.loading();

  setFoodList(ApiResponse<ShopModel> response){
    foodList = response;
    notifyListeners();
  }

  Future<void> getFoodList(context) async{

    setFoodList(ApiResponse.loading());

    myRep.getFoodList(context).then((value){

      setFoodList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      print(error.toString());
      setFoodList(ApiResponse.error(error.toString()));

    });
  }

}