class AppException implements Exception{
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString(){
    return "$_message$_prefix";
  }

}

class NetworkExceptions extends AppException{
  NetworkExceptions([String? message]) : super(message, "Error during communications");
}

class AuthorizationExceptions extends AppException{
  AuthorizationExceptions([String? message]) : super(message, "Error in Authorizations");
}

class RateLimitExceptions extends AppException{
  RateLimitExceptions([String? message]) : super(message, "Request Rate Limit Exceeded");
}

class BadRequestExceptions extends AppException{
  BadRequestExceptions([String? message]) : super(message, "Bad requests occurs or missing parameters");
}

class ServerSideExceptions extends AppException{
  ServerSideExceptions([String? message]) : super(message, "Server Errors occurring");
}

class UnHandledExceptions extends AppException{
  UnHandledExceptions([String? message]) : super(message, "UnExpected behaviour");
}

class DataNotFoundExceptions extends AppException{
  DataNotFoundExceptions([String? message]) : super(message, "Data Not Found");
}