import 'package:al_najah_store/common/custom_shapes/containers/primary_header_container.dart';
import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:al_najah_store/common/widgets/list_tile/user_profile_tile.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/views/authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  NAppBar(title: Text("Account",style: Theme.of(context).textTheme.headlineMedium!.apply(color: NColors.white),),),

                //User Profile card
                 NUserProfileTile(title: storageHelper.readKey('f_name')+" " +storageHelper.readKey("l_name"),subTitle: storageHelper.readKey('email'),image: NImages.logo,onPressed: (){}),
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
                 NSettingMenuTile(title: "My Addresses", subTitle: "vnkl;mlk", icon: Iconsax.safe_home,onTap: (){},),
                 NSettingMenuTile(title: "My Cart", subTitle: "vnkl;mlk", icon: Iconsax.shopping_cart,onTap: (){},),
                 NSettingMenuTile(title: "My Orders", subTitle: "vnkl;mlk", icon: Iconsax.bag_tick,onTap: (){},),
                 NSettingMenuTile(title: "Notifiactions", subTitle: "vnkl;mlk", icon: Iconsax.notification,onTap: (){},),

                 //App Settings
                 const SizedBox(height: NSizes.spaceBtwSections,),
                 const NSectionHeading(title: "App Settings", showActionButton: false,),
                 const SizedBox(height: NSizes.spaceBtwItems,),
                 NSettingMenuTile(title: "Dark Mode", subTitle: "vnkl;mlk", icon: Iconsax.security_user,trailing: Switch(value: false, onChanged: (value){})),

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

