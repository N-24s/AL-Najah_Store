import 'dart:io';

import 'package:al_najah_store/models/authentication/login/user.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/utilis/helpers/upload_image.dart';
import 'package:dio/dio.dart';

class UserVm {
  

   Future<String> login(User user)async{
   try{
     HttpHelpers http=HttpHelpers.instance;

     Response res=await http.postRequest(url: HttpUrls.LOGIN_URL, data:user.authData(),options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
      ), );
       User u=User.fromJson(res.data['data']);
       print(u.email);

       saveUser(u);
       return "Success";
       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Admin for support$e";
   }
  }


   Future<String> register(User user)async{


    
   try{
     HttpHelpers http=HttpHelpers.instance;
      FormData formData = FormData.fromMap({
      "name": user.name,
      "email": user.email,
      "password": user.password,  
      "password_confirmation": user.password,
      "avatar": user.avatar==''? null:uploadImageToAPI(user.avatar), 
    });

     Response res=await http.postRequest(url: HttpUrls.regsiter_URL, data:formData,options: Options(
        headers: {
          'Content-Type':'multipart/form-data',
          'Accept':'application/json',
        },
      ), );
       User u=User.fromJson(res.data['data']);
       print(u.email);

       saveUser(u);
       return "Success";
       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Admin for support${e.toString()}";
   }
  }


  
  saveUser(User u){

try{
      StorageHelper storageHelper=StorageHelper.instance;
    storageHelper.writeKey("name", u.name!);
    storageHelper.writeKey("accessToken", u.token!);
    storageHelper.writeKey("email", u.email!);
    storageHelper.writeKey("avatar", u.avatar);
    storageHelper.writeKey("bio", u.bio??'null');
    storageHelper.writeKey("city", u.city??'null');
    storageHelper.writeKey("phone", u.phone??'null');
    storageHelper.writeKey("role", u.role??'null');

}catch (e){
  print( "Save Users in Loacl Storage $e");
}





  }
}