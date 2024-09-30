import 'package:dio/dio.dart';

class HttpHelpers {   
  static HttpHelpers? httpHelpers;
HttpHelpers._();
  static HttpHelpers get instance{
    if(httpHelpers==null){
     httpHelpers=  HttpHelpers._();
     return httpHelpers!;
    }
    return httpHelpers!;

  }  
    Dio dio=Dio();
     Future<Response> getRequest({required String url,Options? options})async{
    return await dio.get(url,options: options);
  }
  Future<Response> postRequest({required String url,required dynamic data,Options? options})async{
    return await dio.post(url,data: data,options: options);
  }
    


}