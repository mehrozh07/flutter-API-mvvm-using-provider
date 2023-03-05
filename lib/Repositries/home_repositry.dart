import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Data/Network/base_api_service.dart';
import 'package:laravel_api_provider/Data/Network/network_api_service.dart';
import 'package:laravel_api_provider/Models/FoodModel.dart';
import 'package:laravel_api_provider/Resources/api_end_point.dart';
import 'package:laravel_api_provider/Utils/utils.dart';

class HomeRepository{
  BaseApiResponseService apiResponseService = NetworkApiResponse();

  Future<FoodModel?>? getFoodList(context) async{

    try{

      dynamic response = apiResponseService.getFetchApiResponse(ApiEndPoint.foodBaseApi);
      return response = FoodModel.fromJson(response);

    }catch(e){
     print(e.toString());
      // Utils.topFlushBarMessage(e.toString(), context, Colors.pinkAccent);
    }
  }
}