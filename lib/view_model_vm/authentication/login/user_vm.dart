import 'dart:io';

import 'package:al_najah_store/models/authentication/login/user.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
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


  
  saveUser(User u){

    StorageHelper storageHelper=StorageHelper.instance;
    storageHelper.writeKey("name", u.name!);
    // storageHelper.writeKey("bio", u.bio);
    storageHelper.writeKey("accessToken", u.token!);
    storageHelper.writeKey("email", u.email!);
    // storageHelper.writeKey("avatar", u.avatar);
    // storageHelper.writeKey("city", u.city);
    // storageHelper.writeKey("phone", u.phone);
    storageHelper.writeKey("role", u.role!);





  }
}