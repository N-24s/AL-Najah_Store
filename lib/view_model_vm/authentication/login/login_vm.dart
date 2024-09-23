import 'dart:ffi';
import 'dart:io';

import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/models/login/user.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:al_najah_store/utilis/popups/full_screen_loader.dart';
import 'package:al_najah_store/view_model_vm/authentication/login/user_vm.dart';
import 'package:al_najah_store/views/authentication/splash/splash.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../utilis/constants/image_strings.dart';

class LoginVm extends GetxController{
UserVm uvm=UserVm();

  // static LoginVm get instance => Get.find();
  // final httpHelpers=HttpHelpers.instance;


// Variables 
final hidePassword=true.obs;
final privacyPolicy=true.obs;
final rememberMe=true.obs;
final email=TextEditingController();
final password=TextEditingController();



GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();



// Login
Future<void> login()async{


try{
  // Start Loading
  //Replace logo to animation
   NFullScreenLoader.openLoadingDialog("We are processing your information...", NImages.logo);

  //Check Internet Connectivity 
  // final  isConnected=await NetworkManager.instance.isConnectedh;
  // !isConnected
  // if(isConnected == false) return;
      
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
  
     User user= User(username: email.text,password: password.text);
      uvm.login(user).then((x){
        checkLoging(x: x);
        });
           
  



                


  


  // Register user in the Firebase Authentication & Save user data in the firebase
   
  // Show Authentication  user data in the FireStore

  //Show Success Message 

  //Move to Verify Email  Screen



}catch(e){
  //Show some Generic Error to the user
  NLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());



}finally{
//Remove Loader
NFullScreenLoader.stopLoading();

}

}

checkLoging({required String x}){
   if(x=="Success"){

     NLoaders.successSnackBar(
      title: x,
      message: x,
      );
      Get.to(()=>const SplashScreen());
 
      }else{
          NLoaders.errorSnackBar(
      title: "Error",
      message: x,
      );
      }
}



}