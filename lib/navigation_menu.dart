import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/views/Shop/favourite/favourite.dart';
import 'package:al_najah_store/views/Shop/home/home.dart';
import 'package:al_najah_store/views/Shop/store/store.dart';
import 'package:al_najah_store/views/authentication/login/login.dart';
import 'package:al_najah_store/views/authentication/onboarding/onboarding.dart';
import 'package:al_najah_store/views/personailization/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(NavigationController());
    final darkMode=NHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=>controller.selectedIndex.value=index,
          backgroundColor: darkMode?NColors.black: NColors.white,
          indicatorColor:darkMode?NColors.white.withOpacity(0.1): NColors.black.withOpacity(0.1),
          destinations:const [
        NavigationDestination(icon: Icon(Iconsax.home), label: "Home",)  ,
        NavigationDestination(icon: Icon(Iconsax.shop), label: "Store")  ,
        NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist")  ,
        NavigationDestination(icon: Icon(Iconsax.user), label: "Profile")  ,
        
        
        
          ]),
      ),

        body:Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController  extends GetxController{
  final Rx<int> selectedIndex=0.obs;
  final screens=[ HomeScreen(),  StoreScreen(),const FavouriteScreen(), SettingsScreen()];
}