abstract class BaseApiResponseService{

  Future<dynamic> getFetchApiResponse(String? url);

  Future<dynamic> getPostApiResponse(String? url, dynamic data);

}