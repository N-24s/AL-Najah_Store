import 'package:al_najah_store/app.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main()async{

  await GetStorage.init();
  Get.put(HomeController()); 
  runApp( 
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],

    child:  App() ));
}
