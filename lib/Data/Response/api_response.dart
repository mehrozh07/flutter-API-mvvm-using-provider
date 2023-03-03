import 'package:laravel_api_provider/Data/Response/status.dart';

class ApiResponse<T>{
  Status? status;
  String? message;
  T? data;

  ApiResponse(this.status, this.message, this.data);

  ApiResponse.loading(): status = Status.LOADING;

  ApiResponse.completed(this.data): status = Status.COMPLETED;

  ApiResponse.error(this.message): status = Status.ERROR;

  @override
  String toString(){
    return "status: $status \n message: $message \n data: $data";
  }
}