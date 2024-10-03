import 'package:al_najah_store/app.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/category_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/home_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_by_category_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_popular_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/image_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main()async{



// Get Storage init
  await GetStorage.init();



  // Get.put(HomeController()); 
    // Get.put(CategoryVM());

  Get.lazyPut<HomeController>(() => HomeController());
  Get.lazyPut<CartVm>(() => CartVm());
  Get.lazyPut<CategoryVM>(() => CategoryVM());
  Get.lazyPut<ProductVM>(() => ProductVM());

  Get.lazyPut<ProductPopularVm>(() => ProductPopularVm());
  Get.lazyPut<ProfileVM>(() => ProfileVM());
  // Get.lazyPut<ProductImageVM>(() => ProductImageVM());
  Get.put(ProductImageVM());
  Get.lazyPut<CartController>(()=>CartController());






  runApp( 
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesVM()),
        // ChangeNotifierProvider(create: (_) => CartProvider()),


      ],

    child:  const App() ));
}
