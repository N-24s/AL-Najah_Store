import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_controller.dart';
import 'package:al_najah_store/views/Shop/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
             final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite",style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          NCircularIcon(icon: Iconsax.add,onPressed: () => Get.to(HomeScreen())),

        ],
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              NGridLayout(
                itemCount: favoritesProvider.favoriteProducts.length, 
                itemBuilder:(_,index)=> NProductCardVertical(product: favoritesProvider.favoriteProducts[index],) )
            ],
          ),) ,
      ),
    );
  }
}