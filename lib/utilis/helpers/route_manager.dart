import 'package:al_najah_store/navigation_menu.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/views/Shop/home/home.dart';
import 'package:al_najah_store/views/authentication/login/login.dart';
import 'package:al_najah_store/views/authentication/splash/splash.dart';
import 'package:al_najah_store/views/personailization/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteManager {
  static List<GetPage<dynamic>>? generateRoute(){
    return [
      GetPage(name: '/splash', page: (){
        // StorageHelper storageHelper=StorageHelper.instance;
        // if(storageHelper.readKey('accessToken')!=null)
        // return const NavigationMenu();
        // else
        // return const SplashScreen();
        return const SplashScreen();
      }),
      GetPage(name: '/login', page: ()=>const LoginScreen()),
      GetPage(name: '/home', page: ()=> HomeScreen()),
      GetPage(name: '/setting', page: ()=>const SettingsScreen()),
      GetPage(name: '/nav', page: ()=>const NavigationMenu()),
      

    ];
      
        
      
        
    



    
  }
}