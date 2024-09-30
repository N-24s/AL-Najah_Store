import 'package:al_najah_store/common/custom_shapes/containers/primary_header_container.dart';
import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:al_najah_store/common/widgets/list_tile/user_profile_tile.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/test_app/profile.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/views/Shop/cart/cart.dart';
import 'package:al_najah_store/views/authentication/login/login.dart';
import 'package:al_najah_store/views/personailization/address/address.dart';
import 'package:al_najah_store/views/personailization/settings/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utilis/theme/theme.dart';


class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});
     final ProfileVM profileVM = Get.put(ProfileVM());


  @override
  Widget build(BuildContext context) {

                //  ProfileVM profileVM = ProfileVM(); 

    StorageHelper storageHelper=StorageHelper.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header 
            NPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  NAppBar(title: Text("Account",style: Theme.of(context).textTheme.headlineMedium!.apply(color: const Color.fromARGB(172, 255, 255, 255)),),),

                //User Profile card
                 Obx(()=> NUserProfileTile(title: profileVM.userProfile['name']??'null' ,subTitle: profileVM.userProfile['email']??'null',image: storageHelper.readKey("avatar")??NImages.Profile_image,onPressed: (){})),
                     const SizedBox(height: NSizes.spaceBtwSections,),

                ],
              )
              ),
            /// //Body
            /// 
             Padding(
              padding: const EdgeInsets.all(NSizes.defaultSpace),
              child: Column(
                children: [

                  //Account Setting
                  const NSectionHeading(title: "Account Setting",showActionButton: false,),
                 const SizedBox(height: NSizes.spaceBtwItems,),
                 NSettingMenuTile(title: "My Addresses", subTitle: profileVM.userProfile['city'], icon: Iconsax.safe_home,onTap: ()=>Get.to(()=>const UserAddressScreen()),),
                 NSettingMenuTile(title: "My Cart", subTitle: "vnkl;mlk", icon: Iconsax.shopping_cart,onTap: ()=>Get.to(()=> const CartScreen())),
                 NSettingMenuTile(title: "My Orders", subTitle: "vnkl;mlk", icon: Iconsax.bag_tick,onTap: (){},),
                 NSettingMenuTile(title: "Notifiactions", subTitle: "vnkl;mlk", icon: Iconsax.notification,onTap: (){},),

                 //App Settings
                 const SizedBox(height: NSizes.spaceBtwSections,),
                 const NSectionHeading(title: "App Settings", showActionButton: false,),
                 const SizedBox(height: NSizes.spaceBtwItems,),
                 NSettingMenuTile(title: "Dark Mode", subTitle: "vnkl;mlk", icon: Iconsax.security_user,trailing: Switch(value: true, onChanged: (value){ })),

                 //Logout Button
                 const SizedBox(height: NSizes.spaceBtwSections,),

                 SizedBox(
                  
                  width: double.infinity,

                  child:OutlinedButton(onPressed: (){
storageHelper.removeAll();
Get.to(const LoginScreen());

                  }, child: const Text("Logout")) ,
                 ),
                const SizedBox(height: NSizes.spaceBtwSections*2.5),

                 


                ],
              ),)
          ],
        ),
      ),
    );
  }
}

