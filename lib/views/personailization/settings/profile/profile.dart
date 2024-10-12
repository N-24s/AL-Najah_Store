import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/images/n_circular_image.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/views/personailization/settings/profile/edit_profile.dart';
import 'package:al_najah_store/views/personailization/settings/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
          final profileVM = Get.find<ProfileVM>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NAppBar(
        showBackArrow: true,
        title: Text(NTexts.profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          
          padding:EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const NCircularImage(imageUrl: NImages.logo,width: 80,height: 80),
                    TextButton(onPressed: ()=>Get.to(()=>EditProfileScreen()), child: const Text("تعديل الملف الشخصي"))
                  ],
                ),
              ),
              // Details
              const SizedBox(height: NSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),

              //Heading Profile Information
              const NSectionHeading(title: NTexts.profileInformation, showActionButton: false),
                const SizedBox(height: NSizes.spaceBtwItems),

               NProfileMenu(title: NTexts.name,value: profileVM.userProfile['name']??'null',onPressed: (){},),
                // NProfileMenu(title: "Username",value: "N_24s",onPressed: (){},),

              const SizedBox(height: NSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),
             
           //Heading Personal Info
                const NSectionHeading(title:NTexts.presonalInformation, showActionButton: false),
                const SizedBox(height: NSizes.spaceBtwItems),

              //  NProfileMenu(title: NTexts.userId,value: profileVM.userProfile['id'].toString()??'null',onPressed: (){},icon: Iconsax.copy,),
                NProfileMenu(title: NTexts.e_Mail,value: profileVM.userProfile['email']??'null',onPressed: (){},),
               NProfileMenu(title: NTexts.phoneNumber,value: profileVM.userProfile['phone']??'null',onPressed: (){},),
                NProfileMenu(title: NTexts.city,value: profileVM.userProfile['city']??'null',onPressed: (){},),

                const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),
              // Center(
              //   child: TextButton(
              //     onPressed: (){}, 
              //     child: const Text(Nt,style: TextStyle(color: Colors.red),),
              //     ),
              // ),



            ],
          ),
           ),
      ),
    );
  }
}

