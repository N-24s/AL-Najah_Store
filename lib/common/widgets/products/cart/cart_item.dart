import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:al_najah_store/common/widgets/texts/product_title_text.dart';
import 'package:al_najah_store/models/shop/cart/cart_item.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NCartItem extends StatelessWidget {
  const NCartItem({
    super.key, required this.cartItem,
  });

final CartItem cartItem; 
 
 
  @override
  Widget build(BuildContext context) {
    final cartVM=CartController.instance;
   
   


    return Row(
      children: [
        //Image
        NRoundedImage(
          isNetworkImage: true,
          imageUrl: cartItem.imageUrl?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(NSizes.sm),
          backgroundColor: NHelperFunctions.isDarkMode(context)? NColors.darkerGrey:NColors.light,
          ),
    
          const SizedBox(width: NSizes.spaceBtwItems,),
    
          //Title ,Price & Size
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  NBrandTitleWithVerifiedIcon(title: product.brand!,),
                 Flexible(child: NProductTitleText(title:cartItem.name?? '',maxLines: 1,)),
               Flexible(child: IconButton(onPressed: ()=>cartVM.removeOneFromCart(cartItem),icon: Icon
               (Icons.delete,color: Colors.redAccent,),)),

          
              ],
            ),
          )
      ],
    );
  }
}