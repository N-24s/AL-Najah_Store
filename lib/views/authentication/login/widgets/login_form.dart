

import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/utilis/validators/validation.dart';
import 'package:al_najah_store/view_model_vm/authentication/login/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NLoginForm extends StatelessWidget {
  const NLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    // final controller=Get.put(LoginVm());
    StorageHelper  storageHelper=StorageHelper.instance;

LoginVm controller =LoginVm();
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: NSizes.spaceBtwSections),
        child: Column(
        children: [
          // Email
           NTextFormField(
            controller: controller.email,
                  validator: (value) => NValidator.validateEmail(value),

            labelText: NTexts.email,prefixIcon: Iconsax.direct_right,),

          const SizedBox(height: NSizes.spaceBtwInputFieldss,),
        //Password
         Obx(
      () =>  NTextFormField(
             validator: (value) => NValidator.validatePassword(value),
                 controller: controller.password,
                 obscureText: controller.hidePassword.value, 
            prefixIcon: Iconsax.password_check,
            labelText: NTexts.password,   
              suffixIcon:IconButton(
                      onPressed: () => controller.hidePassword.value= !controller.hidePassword.value, 
                      icon: Icon(controller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye)),
               
                  
              ),
         ),
          
          const SizedBox(height: NSizes.spaceBtwInputFieldss /2,),
          
        //Remember Me & Forget PassWord
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Remember Me
            Row(children: [
              Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value)=>controller.rememberMe.value=!controller.rememberMe.value)),
              const Text(NTexts.rememberMe),
            ],),

            // Forget PassWord
            TextButton(onPressed: ()=> Get.to((){}), child: const Text(NTexts.forgetPassword)),
          ],),
            const SizedBox(height: NSizes.spaceBtwSections,),
        
        //Sign in Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>controller.login(),
               child: const Text(NTexts.signIn)),
            ),
          
           const SizedBox(height: NSizes.spaceBtwItems,),
        
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: (){
                            

            }, child: const Text(NTexts.createAccount))),
        // ()=> Get.to(const SignupScreen())
        
        ],
                    ),
      ));
  }
}

class NTextFormField extends StatelessWidget {
  const NTextFormField({
    super.key, 
    this.prefixIcon, 
    this.labelText, 
    this.suffixIcon,  
    this.controller, 
    this.validator, 
     this.obscureText=false, 
     this.onPressedSuffixIcon,
  });
 final IconData? prefixIcon;
final  String? labelText;
final IconButton? suffixIcon;
final VoidCallback? onPressedSuffixIcon;
final TextEditingController? controller;
final  String? Function(String?)?  validator;
final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText,
      controller: controller,
      validator: validator ,
      decoration:  InputDecoration(prefixIcon:Icon(prefixIcon),labelText: labelText,suffixIcon: suffixIcon),
      
    );
  }
}

