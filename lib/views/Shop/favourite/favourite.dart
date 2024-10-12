import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/navigation_menu.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
import 'package:al_najah_store/views/Shop/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
             final favoriteVM = FavoritesVM.instance;

    return Scaffold(
      appBar: NAppBar(
        showBackArrow: false,
        title: Text(NTexts.favourite,style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          NCircularIcon(icon: Iconsax.add,onPressed: () => Get.offAll(()=>const NavigationMenu())),

        ],
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                ()=> NGridLayout(
                  itemCount: favoriteVM.favoriteProducts.length, 
                  itemBuilder:(_,index)=> NProductCardVertical(product: favoriteVM.favoriteProducts[index],) ),
              )
            ],
          ),) ,
      ),
    );
  }
}