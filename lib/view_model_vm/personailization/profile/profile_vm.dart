import 'dart:io';

import 'package:al_najah_store/app.dart';
import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';




class ProfileVM extends GetxController {
  static ProfileVM get instance=>Get.find();

  var userProfile = {}.obs;  
  var imagePath=''.obs;
final localStorage=NLocalStorage.instance();
  @override
  void onInit() {
    super.onInit();
    getProfile();  
  }

  final storage = GetStorage();

  Future<String> getProfile()async{
   try{
     HttpHelpers http=HttpHelpers.instance;
       String? token = localStorage.readData('accessToken');


       if(token!=null){
        
     Response response=await http.getRequest(url: HttpUrls.getProfile,options: Options(
        headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
        
      ), );

      
               userProfile.value = response.data['user'];
               print(userProfile);
              return "Success";


       }
       else{
        return "Token not found, please login again.";


       }

       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Error $e";
   }
  }


  Future<void> updateProfile({
    required String city,
    required String phone,
    required String bio,
    required File avatarFile, 
  }) async {
    try {
           HttpHelpers http=HttpHelpers.instance;
       String? token = localStorage.readData('accessToken');

      if (token != null) {
        Dio dio = Dio();

        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept'] = 'application/json';
        dio.options.headers['Content-Type']='application/json';

        FormData formData = FormData.fromMap({
          'city': city,
          'phone': phone,
          'bio': bio,
          'avatar': await MultipartFile.fromFile(avatarFile.path, filename: avatarFile.path.split('/').last),
        });

           Response response=await http.postRequest(url: HttpUrls.editProfile,data:formData ,options: Options(
        headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
        
      ) );

        if (response.statusCode == 200) {
          NLoaders.successSnackBar(title: "",message: "تم التعديل بنجاح");
        } else {
          NLoaders.errorSnackBar(title: "",message:  "فشل تعديل الملف الشخصي: ${response.statusMessage}");
        }
      } else {
        NLoaders.errorSnackBar(title: "خطاء",message:  "التوكن غير موجود ، رجاءً حاول مره اخرى");
      }
    } catch (e) {
      NLoaders.errorSnackBar(title: "خطاء",message: "An error occurred: $e");
    }
  }




}





