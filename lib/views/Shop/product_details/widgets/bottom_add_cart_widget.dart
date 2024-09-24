import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class NBottomAddCart extends StatelessWidget {
  const NBottomAddCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: NSizes.defaultSpace,vertical:  NSizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark? NColors.darkerGrey:NColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(NSizes.cardRadiusLg),
            topRight: Radius.circular(NSizes.cardRadiusLg),
        )
      ),
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const NCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: NColors.darkGrey,
                height: 40,
                width: 40,
                color: NColors.white,
                
                ),
                const SizedBox(width:NSizes.spaceBtwItems,),
                Text("2",style: Theme.of(context).textTheme.titleSmall),

                  const SizedBox(width:NSizes.spaceBtwItems,),

                       const NCircularIcon(
                icon: Iconsax.add,
                backgroundColor: NColors.black,
                height: 40,
                width: 40,
                color: NColors.white,
                
                ),
            ],
          ),
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(NSizes.md),
              backgroundColor: NColors.black,
              side: const BorderSide(color: NColors.black),
            ),
            child: const Text("Add to Cart"))
        ],
      ),
    );
  }
}