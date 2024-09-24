import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/brands/brand_card.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class NBrandShowcase extends StatelessWidget {
  const NBrandShowcase({
    super.key, required this.images,
  });
final List<String> images;
  @override
  Widget build(BuildContext context) {
    return NRoundedContainer(
      shawBorder: true,
      borderColor: NColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
      padding: const EdgeInsets.all(NSizes.md),
    
      child: Column(
        children: [
          //Brand with Product count
           NBrandCard(image: NImages.logo,showBorder: false,),
       const SizedBox(height: NSizes.spaceBtwItems),

          //Brand Top 3 Product Images
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
            ),
        ],
      ),
    );
  }
}

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
              child: NRoundedContainer(
                height: 100,
                backgroundColor: NHelperFunctions.isDarkMode(context)?NColors.darkerGrey:NColors.light,
                margin: const EdgeInsets.only(right: NSizes.sm),
                padding: const EdgeInsets.all(NSizes.md),
                child:  Image(
                  
                  image:AssetImage(image) ,
                  fit: BoxFit.cover,),
              ),
            );
  }


