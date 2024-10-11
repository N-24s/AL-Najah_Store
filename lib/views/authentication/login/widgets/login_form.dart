

import 'package:al_najah_store/common/widgets/text_field/text_form_field.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/utilis/validators/validation.dart';
import 'package:al_najah_store/view_model_vm/authentication/auth_validation.dart';
import 'package:al_najah_store/views/authentication/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NLoginForm extends StatelessWidget {
  const NLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


final authValidation =AuthValidation.instance;
    return Form(
      key: authValidation.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: NSizes.spaceBtwSections),
        child: Column(
        children: [
          // Email
           NTextFormField(
            controller: authValidation.email,
            validator: (value) => NValidator.validateEmail(value),
            labelText: NTexts.email,
            prefixIcon: Iconsax.direct_right,
            ),

          const SizedBox(height: NSizes.spaceBtwInputFieldss,),
        //Password
         Obx(
      () =>  NTextFormField(
             validator: (value) => NValidator.validatePassword(value),
                 controller: authValidation.password,
                 obscureText: authValidation.hidePassword.value, 
            prefixIcon: Iconsax.password_check,
            labelText: NTexts.password,   
              suffixIcon:IconButton(
                      onPressed: () => authValidation.hidePassword.value= !authValidation.hidePassword.value, 
                      icon: Icon(authValidation.hidePassword.value? Iconsax.eye_slash:Iconsax.eye)),
               
                  
              ),
         ),
          
          const SizedBox(height: NSizes.spaceBtwInputFieldss /2,),
          
        //Remember Me & Forget PassWord
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Remember Me
            Row(children: [
              Obx(()=> Checkbox(value: authValidation.rememberMe.value, onChanged: (value)=>authValidation.rememberMe.value=!authValidation.rememberMe.value)),
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
                onPressed: (){
                  authValidation.login();},
                  
               child:authValidation.isLoading.value?const CircularProgressIndicator():const Text(NTexts.signIn)
               ),
            ),
          
           const SizedBox(height: NSizes.spaceBtwItems,),
        
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> Get.to(const SignupScreen()), 
            child: const Text(NTexts.createAccount))),
        
        ],
                    ),
      ));
  }
}

