import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:laravel_api_provider/Data/Network/base_api_service.dart';
import 'package:laravel_api_provider/Data/exceptions.dart';
import 'package:http/http.dart' as http;

class NetworkApiResponse extends BaseApiResponseService{
  @override
  Future getFetchApiResponse(String? url) async{
    dynamic fetchDataJson;
   try{
      final response = await http.get(
        Uri.parse(url!),
      ).timeout(const Duration(seconds: 10));
      fetchDataJson = returnResponse(response);
   }on SocketException {
     throw NetworkExceptions("No Internet Connection");
   }
   return fetchDataJson;
  }

  @override
  Future getPostApiResponse(String? url, dynamic data) async {
    dynamic postDataJson;
    try{
      Response response = await http.post(
        Uri.parse(url!),
        body: data,
        // header is used while communication with json type application
        // headers: {
        //   "Content-Type": "application/json"
        // }
      ).timeout(const Duration(seconds: 10));
      postDataJson = returnResponse(response);
    }on SocketException {
      throw NetworkExceptions("No Internet Connection");
    }
    return postDataJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        return throw BadRequestExceptions(response.body);
      case 401:
        return throw AuthorizationExceptions(response.body);
      case 402:
        return throw ServerSideExceptions(response.body);
      case 404:
        return throw DataNotFoundExceptions(response.body);
      default:
        throw NetworkExceptions("Error While communicating with server. with server code: ${response.statusCode.toString()}");
    }
  }

}