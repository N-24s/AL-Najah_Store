
import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/models/authentication/login/user.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:al_najah_store/utilis/helpers/upload_image.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:al_najah_store/utilis/popups/full_screen_loader.dart';
import 'package:al_najah_store/view_model_vm/authentication/auth_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilis/constants/image_strings.dart';

class AuthValidation extends GetxController{
static AuthValidation get instance=> Get.find<AuthValidation>();

NLocalStorage _nLocalStorage=NLocalStorage.instance();

  // static LoginVm get instance => Get.find();
  // final httpHelpers=HttpHelpers.instance;


// Variables 
final hidePassword=true.obs;
final hidePasswordConfirmation=true.obs;
final privacyPolicy=true.obs;
final isLoading=false.obs;
final rememberMe=true.obs;
  var imagePath = ''.obs;  

final email=TextEditingController();
final name=TextEditingController();
final password=TextEditingController();
final password_confirmation=TextEditingController();

GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();
GlobalKey<FormState> signUpFormKey=GlobalKey<FormState>();


final auth=AuthVm.instance;


// SignUp
Future<void> register()async{


try{
  // Start Loading
   NFullScreenLoader.openLoadingDialog("We are processing your information...", NImages.logo);
 
 
  //Form Validation
  if(!signUpFormKey.currentState!.validate()) return;
  

  // Privacy Policy Check 
  if(!privacyPolicy.value){
    NLoaders.warningSnackBar(
      title: "قبول سياسة الخصوصية",
      message: "لإنشاء حساب، يجب عليك قراءة وقبول سياسة الخصوصية وشروط الاستخدام"
      );
      return;
  }
  
     User user= User(email: email.text,password: password.text,name: name.text,password_confirmation: password_confirmation.text,avatar: imagePath.value);
      auth.register(user).then((x){
        checkAuth(x: x);
    });
           
  





}catch(e){
  //Show some Generic Error to the user
  NLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());



}finally{
//Remove Loader
NFullScreenLoader.stopLoading();
}

}



// Login validation
Future<void> login()async{


try{
  // Start Loading
   NFullScreenLoader.openLoadingDialog("We are processing your information...", NImages.logo);
 
 
  //Form Validation
  if(!loginFormKey.currentState!.validate()) return;
  

  // Privacy Policy Check 
  if(!rememberMe.value){
    NLoaders.warningSnackBar(
      title: "Accept Privacy Policy",
      message: "In order to create account, you must have to read accept the Privacy Policy & Terms of Use."
      );
      return;
  }
  
     User user= User(email: email.text,password: password.text);
      auth.login(user).then((x){
        checkAuth(x: x);
        });
           
  





}catch(e){
  //Show some Generic Error to the user
  NLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());



}finally{
//Remove Loader
NFullScreenLoader.stopLoading();

}

}


// Check Auth
checkAuth({required String x}){
   if(x=="Success"){

     NLoaders.successSnackBar(
      title: "",
      message: "تم تسجيل الدخول بنجاح",
      );

      Get.offNamed('/nav');
 
      }else{
          NLoaders.errorSnackBar(
      title: "",
      message: x,
      );
      }
}

//Pick Iamge
Future<void> pickImage(ImageSource source) async {
    ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      imagePath.value = image.path;
    }
  }



}