import 'dart:io';
import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/common/widgets/text_field/text_field.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart'; 

class EditProfileScreen extends StatelessWidget {
  // final ProfileVM profileVM = Get.put(ProfileVM());
      final profileVM = Get.find<ProfileVM>();


  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  
  File? avatarFile; 

  Future<void> pickAvatar() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      avatarFile = File(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(NTexts.updateProfile),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
      const SizedBox(height: NSizes.spaceBtwSections,),

            //Phone
            NTextField(
              controller: cityController,
              prefixIcon: Iconsax.mobile,
              labelText: NTexts.phoneNumber,
            ),
                  const SizedBox(height: NSizes.spaceBtwInputFieldss,),
//City
            NTextField(
              controller: phoneController,
              prefixIcon: Iconsax.location,
              labelText: NTexts.city,
            ),


                  const SizedBox(height: NSizes.spaceBtwInputFieldss,),
//BIO
            NTextField(
              controller: bioController,
              labelText: NTexts.bio,
              prefixIcon: Iconsax.personalcard,
            ),

            

      const SizedBox(height: NSizes.spaceBtwInputFieldss,),
       // Choice File
                 Row(
                   children: [
                     InkWell(
                               onTap: ()=>pickAvatar(),
                           child:  Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: NColors.grey,),
                        borderRadius: BorderRadius.circular(10),
                        color: NColors.secondaryOrangeColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Center(child: Text(NTexts.choiceFile)),
                      ),
                           
                           
                                     )),
                                      const SizedBox(width: 10,),
               Text(avatarFile?.path.split('/').last??  'لا يوجد مسار'),
                   ],
                 ),
                 const SizedBox(height: NSizes.spaceBtwSections,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (avatarFile != null) {
                    profileVM.updateProfile(
                      city: cityController.text,
                      phone: phoneController.text,
                      bio: bioController.text,
                      avatarFile: avatarFile!, 
                    );
                  } else {
                    NLoaders.errorSnackBar(title: "خطاء", message: "يرجاء اختيار ملف");
                  }
                },
                child: const Text(NTexts.updateProfile),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

