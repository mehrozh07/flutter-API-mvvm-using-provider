import 'package:laravel_api_provider/Data/Network/base_api_service.dart';
import 'package:laravel_api_provider/Resources/api_end_point.dart';
import 'package:laravel_api_provider/Utils/utils.dart';
import '../Data/Network/network_api_service.dart';

class AuthRepositry{

  BaseApiResponseService baseApiResponseService = NetworkApiResponse();

  Future<void> loginApi(context, dynamic data) async{
    try{
      var loginApi = baseApiResponseService.getPostApiResponse(ApiEndPoint.loginUrl, data);
      return loginApi;
    }catch(e){
      return Utils.flushBarMessage(context, e.toString(), Utils.warningColor);
    }
  }

  Future<void> registerApi(context, dynamic data) async{
    try{
      var response = baseApiResponseService.getPostApiResponse(ApiEndPoint.registerUrl, data);
      return response;
    }catch(e){
      return Utils.flushBarMessage(context, e.toString(), Utils.warningColor);
    }
  }

Future<void> addNoteApi(context, dynamic data) async{
    try{
      var response = baseApiResponseService.getPostApiResponse(ApiEndPoint.noteBaseApi, data);
      return response;
    }catch(e){
      return Utils.flushBarMessage(context, e.toString(), Utils.warningColor);
    }
}

  Future<void> getNoteApi(context) async{
    try{
      var response = baseApiResponseService.getFetchApiResponse(ApiEndPoint.getNotesApi);
      return response;
    }catch(e){
      return Utils.flushBarMessage(context, e.toString(), Utils.warningColor);
    }
  }

}