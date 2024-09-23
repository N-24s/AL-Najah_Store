import 'package:dio/dio.dart';

class ApiException {
 static handleException(DioException error){
  switch(error.type){
     case DioExceptionType.badResponse:{
      return "bad response check username or password";
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