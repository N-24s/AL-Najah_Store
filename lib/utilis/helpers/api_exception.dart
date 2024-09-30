import 'package:dio/dio.dart';

class ApiException {
 static handleException(DioException error){

  
  switch(error.type){
     case DioExceptionType.badResponse:{
     switch (error.response?.statusCode) {
          case 400:
         return "Bad Request: ${error.response?.statusCode}";
          case 401:
            return"Unauthorized: ${error.response?.statusCode}";
          case 403:
          return "Forbidden: ${error.response?.statusCode}";
          case 404:
          return "Not Found: ${error.response?.statusCode}";
          case 500:
            return "Internal Server Error: ${error.response?.statusCode}";
          default:
            return "Unknown Error: ${error.response?.statusCode}";
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