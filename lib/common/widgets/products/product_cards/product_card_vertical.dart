import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/styles/shadows.dart';
import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/common/widgets/texts/n_brand_title_text.dart';
import 'package:al_najah_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:al_najah_store/common/widgets/texts/n_price_text.dart';
import 'package:al_najah_store/common/widgets/texts/product_title_text.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
import 'package:al_najah_store/views/Shop/product_details/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';


class NProductCardVertical extends StatelessWidget {
  final Product product;
  const NProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    final String image= product.image;
    final String name=product.name;
    final String? brand=product.brand.name;
    final String price=product.price.toString();
     final String discountPercentage=product.discountPercentage.toString();
         final favoritesProvider = Provider.of<FavoritesVM>(context);


    


    
        //Container with side paddings, color, radius and shados
    return GestureDetector(
      
      onTap: ()=>Get.to(()=> const ProductDetail(),arguments: product),
      child: Container(
        
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration:  BoxDecoration(
        boxShadow: [NShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(NSizes.productImageRadius),
       color: dark?NColors.darkerGrey:NColors.white,),
       child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      // Thumbnail, Wishlist Button(favourite) ,Discount Tag
      NRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(NSizes.sm),
        backgroundColor: dark? NColors.dark:NColors.light,
        child: Stack(
      children: [
        
      
        SizedBox(
          width: 130,
           child: SizedBox(
            
            child: NRoundedImage(imageUrl: image,applyImageRadius: true, isNetworkImage: true,)),
         ),  
      // Sale Tag
        Positioned(
          top: 12,
          child: NRoundedContainer(
            radius: NSizes.sm,
            backgroundColor:Colors.yellow.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: NSizes.sm, vertical: NSizes.xs),
            child: Text('$discountPercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: NColors.black),),
          ),
        ),

          // Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        favoritesProvider.toggleFavorite(product);                       },
                      child:  NCircularIcon(
                          icon: product.isFavorited ? Iconsax.heart5 : Iconsax.heart, // Change icon based on favorite state
                          color: product.isFavorited ? Colors.red : Colors.grey,
                  
                      ),
                    ),
                  )
      ],
        ),
      ),
      const SizedBox(height: NSizes.spaceBtwItems/2),
      
      // Details
       Padding(padding: const EdgeInsets.only(left: NSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
          NProductTitleText(title:  name ,smallSize: true),
          const SizedBox(height: NSizes.spaceBtwItems/2),
         brand!=null? NBrandTitleWithVerifiedIcon(title:brand!):Text(""),
                
          ],
      ),
      ),

      const Spacer(),
          // Price Row 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
               Expanded(
                flex: 3,
                 child: Padding(
                  padding: const EdgeInsets.only(left: NSizes.sm),
                  child: NProductPriceText(price: price),
                               ),
               ),
              //Add to Cart Button
                Expanded(
                  flex: 1,
                  child: Container(
                   
                    decoration: const BoxDecoration(
                       color: NColors.secondaryOrangeColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(NSizes.cardRadiusMd),
                        bottomRight: Radius.circular(NSizes.productImageRadius))
                    ),
                    child: const SizedBox(
                      width: NSizes.iconLg*1.2,
                      height: NSizes.iconLg*1.2,
                      child: Center(child: Icon(Iconsax.add,color: NColors.dark,))),
                  ),
                ),
           
            ],
          ),

        ],
      ),
      ),
    );
  }
}

