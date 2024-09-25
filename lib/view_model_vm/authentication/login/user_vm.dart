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

     Response res=await http.postRequest(url: HttpUrls.LOGIN_URL, data:user.authData() );
       User u=User.fromJson(res.data);
       saveUser(u);
       return "Success";
       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Admin for support";
   }
  }


  
  saveUser(User u){

    StorageHelper storageHelper=StorageHelper.instance;
    storageHelper.writeKey("f_name", u.firstName!);
    storageHelper.writeKey("l_name", u.lastName!);
    storageHelper.writeKey("image", u.image!);
    storageHelper.writeKey("accessToken", u.accessToken!);
    storageHelper.writeKey("email", u.email!);
  }
}