import 'package:al_najah_store/common/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/image_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';


class NProductIamgeSlider extends StatelessWidget {
   NProductIamgeSlider({
    super.key,
   required this.product,
   
  });

  
  Product product;


  @override
  Widget build(BuildContext context) {
                 final favoritesProvider = Provider.of<FavoritesVM>(context);
   final imageVM = Get.find<ProductImageVM>();


    imageVM.setSelectedImage(product.image);

    final dark =NHelperFunctions.isDarkMode(context);
    return NCurvedEdgeWidget(
      child: Container(
        color: dark? NColors.darkerGrey:NColors.light,
        child:  Stack(
          children: [
            // Main Large Image
             SizedBox(height: 400, child: Padding(
              padding: const EdgeInsets.all(NSizes.productImageRadius*2),
              // Obx(() => Image.network(imageVM.selectedImage.value)), 
              child: Center(child: Obx(()=> Image(image: NetworkImage(imageVM.selectedImage.value)))),
            ),
            ),
    
            //Image Slider 
            Positioned(
              bottom: 30,
              right: 0,
              left: NSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: Row(
                  children: [
                    GestureDetector(
                       onTap: ()=> imageVM.setSelectedImage(product.image),
                      child: NRoundedImage(
                              isNetworkImage: true,
                            
                            width: 80,
                            backgroundColor: dark? NColors.dark:NColors.white,
                            border: Border.all(
                                    color: imageVM.selectedImage.value == product.image 
                                        ? NColors.secondaryOrangeColor
                                        : Colors.transparent,
                                  ),
                            padding: const EdgeInsets.all(NSizes.sm),
                            imageUrl:product.image),
                    ),
                          const SizedBox(width:  NSizes.spaceBtwItems,),
                    ListView.separated(
                      separatorBuilder: (_, __) => const SizedBox( width: NSizes.spaceBtwItems,),
                      itemCount:product.subImages.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (cxt,index){
                      return   GestureDetector(
                        onTap: ()=> imageVM.setSelectedImage(product.subImages[index]),
                        child: Obx(
                          ()=> NRoundedImage(
                            isNetworkImage: true,
                          
                          width: 80,
                          backgroundColor: dark? NColors.dark:NColors.white,
                          border: Border.all(
                                  color: imageVM.selectedImage.value == product.subImages[index] 
                                      ? NColors.primaryColor
                                      : Colors.transparent,
                                ),
                          padding: const EdgeInsets.all(NSizes.sm),
                          imageUrl:product.subImages[index]),
                                              
                                              
                        ),
                      );
                                  
                                  
                    }),
                  ],
                ),
              ),
            ),
            
    
            //AppBar Icon
    
             NAppBar(
              showBackArrow: true,
              
              actions: [

 // Favourite Icon Button
                 GestureDetector(
                      onTap: () {
                        favoritesProvider.toggleFavorite(product!);                       },
                      child:  NCircularIcon(
                          icon: product!.isFavorited ? Iconsax.heart5 : Iconsax.heart, // Change icon based on favorite state
                          color: product!.isFavorited ? Colors.red : Colors.grey,
                  
                      ),
                    ),

                // NCircularIcon(
                //   icon:Iconsax.heart5,
                //   color: Colors.red, 
                //   ),
              ],
            ),
          
          ],
        ),
    
      ),
      );
  }
}

// import 'package:al_najah_store/common/custom_shapes/curved_edges/curved_edges_widget.dart';
// import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
// import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
// import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
// import 'package:al_najah_store/models/shop/product.dart';
// import 'package:al_najah_store/utilis/constants/colors.dart';
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
// import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
// import 'package:al_najah_store/view_model_vm/shop/image_vm.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:get/get.dart';


// class NProductImageSlider extends StatelessWidget {
//   NProductImageSlider({
//     super.key,
//     required this.product,
//   });

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//              final imageVM = Get.find<ProductImageVM>();


//     imageVM.setSelectedImage(product.image);

//     final dark = NHelperFunctions.isDarkMode(context);

//     return NCurvedEdgeWidget(
//       child: Container(
//         color: dark ? NColors.darkerGrey : NColors.light,
//         child: Stack(
//           children: [
//             // Main Large Image
//             SizedBox(
//               height: 400,
//               child: Padding(
//                 padding: const EdgeInsets.all(NSizes.productImageRadius * 2),
//                 child: Center(
//                   child: Obx(() => Image.network(imageVM.selectedImage.value)), 
//                 ),
//               ),
//             ),

//             // Image Slider
//             Positioned(
//               bottom: 30,
//               right: 0,
//               left: NSizes.defaultSpace,
//               child: SizedBox(
//                 height: 80,
//                 child: ListView.separated(
//                   separatorBuilder: (_, __) => const SizedBox(width: NSizes.spaceBtwItems),
//                   itemCount: product.subImages.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   physics: const AlwaysScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         imageVM.setSelectedImage(product.subImages[index]); 
//                       },
//                       child: Obx(() => NRoundedImage(
//                             isNetworkImage: true,
//                             width: 80,
//                             backgroundColor: dark ? NColors.dark : NColors.white,
//                             border: Border.all(
//                               color: imageVM.selectedImage.value == product.subImages[index] 
//                                   ? NColors.primaryColor
//                                   : Colors.transparent,
//                             ),
//                             padding: const EdgeInsets.all(NSizes.sm),
//                             imageUrl: product.subImages[index],
//                           )),
//                     );
//                   },
//                 ),
//               ),
//             ),

//             // AppBar Icon
//             NAppBar(
//               showBackArrow: true,
//               actions: [
//                 // Favourite Icon Button
//                 GestureDetector(
//                   onTap: () {
                    
//                   },
//                   child: NCircularIcon(
//                     icon: product.isFavorited ? Iconsax.heart5 : Iconsax.heart,
//                     color: product.isFavorited ? Colors.red : Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
