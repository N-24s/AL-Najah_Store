import 'dart:io';

import 'package:al_najah_store/common/widgets/text_field/text_form_field.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/utilis/validators/validation.dart';
import 'package:al_najah_store/view_model_vm/authentication/auth_vm.dart';
import 'package:al_najah_store/view_model_vm/authentication/auth_validation.dart';
import 'package:al_najah_store/views/authentication/login/widgets/login_form.dart';
import 'package:al_najah_store/views/authentication/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class NSignupForm extends StatelessWidget {
  final auth=AuthVm.instance;
  final authValidation=AuthValidation();

   NSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Form(
      key: authValidation.signUpFormKey,
      child: Column(
      children: [
     
        
        // Name
        NTextFormField(
          controller: authValidation.name,
          validator: (value) => NValidator.validateEmptyText("Name", value),
          prefixIcon: Iconsax.user,
          labelText: NTexts.Name,   
             
        ),
        const SizedBox(height: NSizes.spaceBtwInputFieldss,),
  
    
      //Email
     NTextFormField(
      validator: (value) => NValidator.validateEmail(value),
      controller: authValidation.email,
      labelText:  NTexts.email,
      prefixIcon: Iconsax.direct,
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
                      onPressed: () =>authValidation.hidePassword.value= !authValidation.hidePassword.value, 
                      icon: Icon(authValidation.hidePassword.value? Iconsax.eye_slash:Iconsax.eye)),
               
                  
            )   ),
           const SizedBox(height: NSizes.spaceBtwInputFieldss,),

 //  Password Confirmation
        Obx(
      () =>  NTextFormField(
             validator: (value) => NValidator.validatePassword(value),
                 controller: authValidation.password_confirmation,
                 obscureText: authValidation.hidePasswordConfirmation.value, 
            prefixIcon: Iconsax.password_check,
            labelText: NTexts.password_confirmation,   
              suffixIcon:IconButton(
                      onPressed: () => authValidation.hidePasswordConfirmation.value= !authValidation.hidePasswordConfirmation.value, 
                      icon: Icon(authValidation.hidePasswordConfirmation.value? Iconsax.eye_slash:Iconsax.eye)),
               
                  
              )),

      const SizedBox(height: NSizes.spaceBtwInputFieldss,),
       // Choice File
                 Row(
                   children: [
                     InkWell(
                               onTap: ()=>_pickImage(ImageSource.gallery),
                           child:  Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: NColors.grey,),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Center(child: Text("Choice File")),
                      ),
                           
                           
                                     )),
                                      const SizedBox(width: 10,),
                 Obx(()=> Text(authValidation.imagePath.value.split('/').last)),
                   ],
                 ),
               
   
        
          const SizedBox(height: NSizes.spaceBtwSections),
    
    
          //terms&Conditions Checkbox
           NTermsAndConditionsCheckbox() ,
              const SizedBox(height: NSizes.spaceBtwSections),
    
          // Sing Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  authValidation.register();},
               child: const Text(NTexts.createAccount)),
            )
      ],
    ));
  }

     Future<void> _pickImage(ImageSource source) async {
    await authValidation.pickImage(source);
    // Get.back();  
  }
}

