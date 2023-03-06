import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Data/Network/base_api_service.dart';
import 'package:laravel_api_provider/Data/Network/network_api_service.dart';
import 'package:laravel_api_provider/Models/shop_model.dart';
import 'package:laravel_api_provider/Resources/api_end_point.dart';
import 'package:laravel_api_provider/Utils/utils.dart';

class HomeRepository{
  BaseApiResponseService apiResponseService = NetworkApiResponse();

  Future<ShopModel?> getFoodList(context) async{

    try{
      dynamic response = await apiResponseService.getFetchApiResponse(ApiEndPoint.foodBaseApi);
      return response = ShopModel.fromJson(response);
    }catch(e){
      rethrow;
      Utils.topFlushBarMessage(e.toString(), context, Colors.pinkAccent);
    }
  }
}