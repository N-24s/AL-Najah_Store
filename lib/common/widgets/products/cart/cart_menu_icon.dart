import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NCartCounterIcon extends StatelessWidget {
  StorageHelper storageHelper=StorageHelper.instance;
    // final cartController = Get.find<CartVm>();
        final cartController = Get.find<CartController>();



  
   NCartCounterIcon({
    super.key, 
    this.iconColor, 
     required this.onPressed, 
     this.counterBgColor, 
     this.counterTextColor,
  });

final Color? iconColor, counterBgColor, counterTextColor;
final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
   

    final dark=NHelperFunctions.isDarkMode(context);

    
    return   Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: onPressed,
        child: Badge(
          
          child: Icon(Iconsax.shopping_bag),
        label: Obx(
          ()=> Text(
            cartController.cartItems.length.toString(),
            style: Theme.of(context).textTheme.labelLarge!.apply(
              color: counterBgColor?? (dark?NColors.light:NColors.white),
              fontSizeFactor: 0.8,
              
            ),
            ),
        ),
        
        backgroundColor: counterBgColor?? (dark? NColors.light:NColors.secondaryOrangeColor),
        offset: const Offset(10, -8),
        ),
      ),
    );
  }
}

