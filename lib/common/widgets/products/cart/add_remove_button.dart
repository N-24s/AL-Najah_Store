import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class NProductQuantityWithAddRemoveButtons extends StatelessWidget {
  const NProductQuantityWithAddRemoveButtons({
    super.key, required this.quantity, this.add, this.remove,
  });
  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisSize: MainAxisSize.min,      
      children: [
    //Remove
        NCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: NSizes.md,
          color: NHelperFunctions.isDarkMode(context)? NColors.white:NColors.black,
          backgroundColor: NHelperFunctions.isDarkMode(context)? NColors.darkerGrey:NColors.light,
          onPressed: remove,
          ),
    const SizedBox(width: NSizes.spaceBtwItems,),
    // Quantity
    Text(quantity.toString(),style: Theme.of(context).textTheme.titleSmall,),
    const SizedBox(width: NSizes.spaceBtwItems,),

    //ADD 
      NCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: NSizes.md,
          color:  NColors.white,
          backgroundColor: NColors.primaryColor,
          onPressed: add,
          ),
    
      ],
    );
  }
}

