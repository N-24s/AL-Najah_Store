import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NCartCounterIcon extends StatelessWidget {
  StorageHelper storageHelper=StorageHelper.instance;
  CartController cartController=CartController();

  
   NCartCounterIcon({
    super.key, this.iconColor=NColors.dark, required this.onPressed,
  });

final Color iconColor;
final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // List<dynamic> itemCart= storageHelper.readKey('cart');
    // cartController.itemCount.value=itemCart.length;

    print("${storageHelper.readKey('cart')}");
    
    return  Padding(
      padding: EdgeInsets.all(10),
      child: Badge(child: Icon(Iconsax.shopping_bag),label: Text('3'),
      
      backgroundColor: NColors.secondaryOrangeColor,
      offset: Offset(10, -8),
      ),
    );
  }
}

