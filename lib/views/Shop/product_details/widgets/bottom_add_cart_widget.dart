import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_vm.dart'; // Cart Provider
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class NBottomAddCart extends StatelessWidget {
  const NBottomAddCart({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller= CartController.instance;
  
    controller.updateAlreadyAddedProductCount(product);
    print(controller.productQuantityInCart.value.toString());
    final dark = NHelperFunctions.isDarkMode(context);
    
  


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: NSizes.defaultSpace, vertical: NSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? NColors.darkerGrey : NColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(NSizes.cardRadiusLg),
            topRight: Radius.circular(NSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            ()=> Row(
                children: [
                  // Decrement Quantity
                  NCircularIcon(
                    icon: Iconsax.minus,
                    backgroundColor: NColors.darkGrey,
                    height: 40,
                    width: 40,
                    color: const Color(0xFFFFFFFF),
                    onPressed:controller.productQuantityInCart.value > 0 
      ? () => controller.productQuantityInCart.value -= 1
      : null,
                  
                  ),
                  const SizedBox(width: NSizes.spaceBtwItems),
              
                       Text('${controller.productQuantityInCart.value}',style: Theme.of(context).textTheme.titleSmall),
                    
                        
                  
                  const SizedBox(width: NSizes.spaceBtwItems),
                  // Increment Quantity
                  NCircularIcon(   
                    icon: Iconsax.add,
                    backgroundColor: NColors.black,
                    height: 40,
                    width: 40,
                    color: NColors.white,
                    onPressed: () => controller.productQuantityInCart.value +=1,
                  ),
                ],
              ),
          ),
          
          // Add to Cart Button
          Obx(
            ()=> ElevatedButton(
               onPressed: controller.productQuantityInCart.value > 0
                  ? () => controller.addToCart(product)
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(NSizes.md),
                backgroundColor: NColors.black,
                side: const BorderSide(color: NColors.black),
              ),
              child: const Text("Add to Cart"),
            ),
          )
        ],
      ),
    );
  }
}



// import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
// import 'package:al_najah_store/models/shop/product.dart';
// import 'package:al_najah_store/utilis/constants/colors.dart';
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
// import 'package:al_najah_store/view_model_vm/shop/cart/cart_vm.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:provider/provider.dart';


// class NBottomAddCart extends StatelessWidget {
//   const NBottomAddCart({super.key, required this.product});

// final Product product;
//   @override
//   Widget build(BuildContext context) {

//     final dark=NHelperFunctions.isDarkMode(context);
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: NSizes.defaultSpace,vertical:  NSizes.defaultSpace/2),
//       decoration: BoxDecoration(
//         color: dark? NColors.darkerGrey:NColors.light,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(NSizes.cardRadiusLg),
//             topRight: Radius.circular(NSizes.cardRadiusLg),
//         )
//       ),
//       child:   Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//                NCircularIcon(
//                 icon: Iconsax.minus,
//                 backgroundColor: NColors.darkGrey,
//                 height: 40,
//                 width: 40,
//                 color: NColors.white,
//                   onPressed: (){
//                     // dicrement

//                 },
                
//                 ),
//                 const SizedBox(width:NSizes.spaceBtwItems,),
//                 Text("quantity",style: Theme.of(context).textTheme.titleSmall),

//                   const SizedBox(width:NSizes.spaceBtwItems,),

//                         NCircularIcon(
//                 icon: Iconsax.add,
//                 backgroundColor: NColors.black,
//                 height: 40,
//                 width: 40,
//                 color: NColors.white,
//                 onPressed: (){
// //increment
//                 },
                
//                 ),
//             ],
//           ),
//           ElevatedButton(
//             onPressed: (){
// // add to cart
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Added to cart!'),
//                     duration: Duration(seconds: 2),
//                   ),
//                 );
//             }, 
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.all(NSizes.md),
//               backgroundColor: NColors.black,
//               side: const BorderSide(color: NColors.black),
//             ),
//             child: const Text("Add to Cart"))
//         ],
//       ),
//     );
//   }
// }