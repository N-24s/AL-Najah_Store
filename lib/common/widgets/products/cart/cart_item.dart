import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:al_najah_store/common/widgets/texts/product_title_text.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class NCartItem extends StatelessWidget {
  const NCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        NRoundedImage(
          imageUrl: NImages.logo,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(NSizes.sm),
          backgroundColor: NHelperFunctions.isDarkMode(context)? NColors.darkerGrey:NColors.light,
          ),
    
          const SizedBox(width: NSizes.spaceBtwItems,),
    
          //Title ,Price & Size
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NBrandTitleWithVerifiedIcon(title: "Nike",),
                const Flexible(child: NProductTitleText(title: "Black Sports Shoes",maxLines: 1,)),
            
                //Attributes 
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Color",style: Theme.of(context).textTheme.bodySmall),
                       TextSpan(text: "Green",style: Theme.of(context).textTheme.bodyLarge),                   
                      TextSpan(text: "Size",style: Theme.of(context).textTheme.bodySmall),
                       TextSpan(text: "UK 08",style: Theme.of(context).textTheme.bodyLarge),
                    ]
                  )
                ),
              ],
            ),
          )
      ],
    );
  }
}