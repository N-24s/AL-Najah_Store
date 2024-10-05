import 'package:al_najah_store/app.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/search/search_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/category_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/home_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_popular_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/image_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main()async{



// Get Storage init
  await GetStorage.init();



  // Get.put(HomeController()); 
    // Get.put(CategoryVM());

  Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
  Get.lazyPut<CartVm>(() => CartVm(),fenix: true);
  Get.lazyPut<CategoryVM>(() => CategoryVM(),fenix: true);
  Get.lazyPut<ProductVM>(() => ProductVM(),fenix: true);

  Get.lazyPut<ProductPopularVm>(() => ProductPopularVm(),fenix: true);
  Get.lazyPut<ProfileVM>(() => ProfileVM(),fenix: true);
  Get.lazyPut<ProductImageVM>(() => ProductImageVM(),fenix: true);
  // Get.put(ProductImageVM());
  Get.lazyPut<CartController>(()=>CartController(),fenix: true);
    Get.lazyPut<AddressVm>(()=>AddressVm(),fenix: true);
      // Get.lazyPut<SearchVM>(()=>SearchVM(),fenix: true);







  runApp( 
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesVM()),
        // ChangeNotifierProvider(create: (_) => CartProvider()),


      ],

    child:  const App() ));
}
