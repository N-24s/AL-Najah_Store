import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/images/n_circular_image.dart';
import 'package:al_najah_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:al_najah_store/common/widgets/texts/n_price_text.dart';
import 'package:al_najah_store/common/widgets/texts/product_title_text.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/enums.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class NProductMetaData extends StatelessWidget {
   NProductMetaData({super.key,required this.product});
Product product;
  @override
  Widget build(BuildContext context) {
    final String discountPercentage=product.discountPercentage.toString();
    final String name=product.name;
    // final String discountedPrice=product..toString();
    final String price=product.price.toString();
    final String? brand=product.brand.name;
    final darkMode=NHelperFunctions.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price & Sale Price
        Row(
          children: [
            // Sale Tag
            NRoundedContainer(
              radius: NSizes.sm,
              backgroundColor: const Color.fromARGB(255, 246, 250, 28).withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: NSizes.sm,vertical: NSizes.xs),
              child:  Text(
                '$discountPercentage%',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: NColors.black),),
          
            ),
            const SizedBox(width: NSizes.spaceBtwItems),
            

            // Price
           
             NProductPriceText(price: '$price',isLarge: true,),

          ],
        ),
        const SizedBox(height: NSizes.spaceBtwItems/1.5),
        // Title & Brand
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
                //Title
                Expanded(
                  flex: 2,
                  child: NProductTitleText(title: "$name")),
            
                //Brand
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      //replace image to icon casmeticsIcon
                      
                      Expanded(
                        flex: 1,
                        child: NCircularImage(
                          isNetworkImage: false,
                          imageUrl: NImages.logo,
                          height: 32,
                          width: 32,
                          overlayColor: darkMode? NColors.white:NColors.black,
                          
                          ),
                      ),
                      Expanded(
                        flex: 2,
                        child: NBrandTitleWithVerifiedIcon(title: "$brand",brandTextSize: TextSize.medium)),
                    
                    ],
                  ),
                )
                
          ],
        )
          
      ],
    );
  }
}