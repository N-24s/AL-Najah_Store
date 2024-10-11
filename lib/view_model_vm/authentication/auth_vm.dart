import 'package:al_najah_store/models/authentication/login/user.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:al_najah_store/utilis/helpers/upload_image.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:dio/dio.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class AuthVm extends GetxController{
static AuthVm get instance=>Get.find<AuthVm>();

NLocalStorage _nLocalStorage=NLocalStorage.instance();






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
            _nLocalStorage.saveUser(u);
 
       return "Success";
       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Error is :$e";
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
            _nLocalStorage.saveUser(u);
       return "Success";
       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Error is :${e.toString()}";
   }
  }


  



}