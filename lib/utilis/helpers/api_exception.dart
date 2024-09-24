import 'package:dio/dio.dart';

class ApiException {
 static handleException(DioException error){

  
  switch(error.type){
     case DioExceptionType.badResponse:{
     switch (error.response?.statusCode) {
          case 400:
            print("Bad Request: ${error.response?.statusCode}");
            break;
          case 401:
            print("Unauthorized: ${error.response?.statusCode}");
            break;
          case 403:
            print("Forbidden: ${error.response?.statusCode}");
            break;
          case 404:
            print("Not Found: ${error.response?.statusCode}");
            break;
          case 500:
            print("Internal Server Error: ${error.response?.statusCode}");
            break;
          default:
            print("Unknown Error: ${error.response?.statusCode}");
        }
     }
     case DioException.connectionTimeout:{
      return "server take long time out to response";
     }
     case DioException.receiveTimeout:{
      return " didn't get any response from server";
     }
     case DioException.connectionError:{
      return "error in connection with internet";
     }
     default:{
      return "unkonw error please check your internet connection";
     }
     
    }
  
  }
}