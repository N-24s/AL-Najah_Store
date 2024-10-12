import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/common/widgets/texts/n_brand_title_text.dart';
import 'package:al_najah_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:al_najah_store/common/widgets/texts/n_price_text.dart';
import 'package:al_najah_store/common/widgets/texts/product_title_text.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/models/shop/product_dateils.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:al_najah_store/views/Shop/product_details/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NProductCardHorizontal extends StatelessWidget {
   NProductCardHorizontal({super.key, required this.similarProduct,});
  final SimilarProduct similarProduct;
          final productVm = Get.find<ProductVM>();
              final favoritesVM = FavoritesVM.instance;


  @override
  Widget build(BuildContext context) {
    
    final dark=NHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){
        
productVm.getProductDetails(similarProduct.id.toString());

Get.to(()=> const ProductDetail());
      },
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          // boxShadow: [NShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(NSizes.productImageRadius),
          color:  dark?NColors.darkerGrey:NColors.lightContainer
        ),
        child: Row(
          children: [
            //Thumbnail
            NRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(NSizes.sm),
              backgroundColor: dark?NColors.dark:NColors.light,
              child:  const Stack(
                children: [
                 //Thumbnail image
                   SizedBox(
                    height: 100,
                    width: 100,
                    child: NRoundedImage(
                      imageUrl: '',
                      applyImageRadius: true,
                      ),
                  ),
            //       Sale Tag
          // Positioned(
          //   top: 12,
          //   child: NRoundedContainer(
          //     radius: NSizes.sm,
          //     backgroundColor:Colors.yellow.withOpacity(0.8),
          //     padding: const EdgeInsets.symmetric(horizontal: NSizes.sm, vertical: NSizes.xs),
          //     child: Text('', style: Theme.of(context).textTheme.labelLarge!.apply(color: NColors.black),),
          //   ),
          // ),




  //            // Favourite Icon Button
  //                 Positioned(
  //                   top: 0,
  //                   right: 0,
  //                   child: Obx(
  //                     (){
  //                       productVm.getProductDetails(similarProduct.id.toString());
  //                               final isFavorited = favoritesVM.isProductFavorited(productVm.producDetails.value);
  //                       return GestureDetector(
  //                       onTap: () {
  //                         favoritesVM.toggleFavorite(productVm.producDetails.value);           
  //                                     },
  //                       child:  NCircularIcon(
  //                           icon: isFavorited ? Iconsax.heart5 : Iconsax.heart, // Change icon based on favorite state
  //                           color:isFavorited ? Colors.red : Colors.grey,
                                        
  //                       ),
  //                     );
  //  } ),
  //                 )
      
   
   
                ],
              ),
            ),
          
          // //Details
          SizedBox(
            width: 132,
            child: Padding(
                  padding: const EdgeInsets.only(top:NSizes.sm,left:NSizes.sm,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: NSizes.xs,),
                   NProductTitleText(maxLines: 1,title:similarProduct.name , ),
                   const SizedBox(height: NSizes.sm),
                  //  Text(similarProduct.price, style: Theme.of(context).textTheme.bodyMedium,),
                  NProductPriceText(price: similarProduct.price,)

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     //Pricing
                //     //  Flexible(child: NProductPriceText(price: similarProduct.price)),
              
                //     // //Add to Cart
                //     //      Container(
                     
                //     //   decoration: const BoxDecoration(
                //     //      color: NColors.dark,
                //     //     borderRadius: BorderRadius.only(
                //     //       topLeft: Radius.circular(NSizes.cardRadiusMd),
                //     //       bottomRight: Radius.circular(NSizes.productImageRadius))
                //     //   ),
                //     //   child:  const SizedBox(
                //     //     width: NSizes.iconLg*1.2,
                //     //     height: NSizes.iconLg*1.2,
                //     //     child: Center(child: Icon(Iconsax.add,color: NColors.white,))),
                //     // ),
               
                //   ],
                // )
              
              
                ],
              ),
            ),
          ),
         
         
          ],
        ),
      ),
    );
  }
}