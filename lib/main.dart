import 'package:al_najah_store/app.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/home/category_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/home_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_popular_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/image_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main()async{



// Get Storage init
  await GetStorage.init();


// Home
  Get.lazyPut<HomeController>(() => HomeController(),fenix: true);

  //Cart
  Get.lazyPut<CartVM>(() => CartVM(),fenix: true);
  Get.lazyPut<CategoryVM>(() => CategoryVM(),fenix: true);

  //Products
  Get.lazyPut<ProductVM>(() => ProductVM(),fenix: true);
  Get.lazyPut<ProductPopularVm>(() => ProductPopularVm(),fenix: true);
  // Get.lazyPut<ProductImageVM>(() => ProductImageVM(),fenix: true);

  // Profile
  Get.lazyPut<ProfileVM>(() => ProfileVM(),fenix: true);

  // Address
  Get.lazyPut<AddressVm>(()=>AddressVm(),fenix: true);

  //Favourtie
  Get.lazyPut<FavoritesVM>(()=>FavoritesVM(),fenix: true);

 // Brands
  Get.lazyPut<BrandVm>(()=>BrandVm(),fenix: true);








  runApp( 

    //  MultiProvider(
    //   providers: [
    //     // ChangeNotifierProvider(create: (_) => FavoritesVM()),
    //     // ChangeNotifierProvider(create: (_) => CartProvider()),


    //   ],

      const App() );
}
