import 'package:al_najah_store/app.dart';
import 'package:al_najah_store/view_model_vm/shop/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main()async{

  await GetStorage.init();
  Get.put(HomeController()); 
  runApp( const App());  
}
