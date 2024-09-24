import 'package:al_najah_store/common/custom_shapes/containers/primary_header_container.dart';
import 'package:al_najah_store/common/custom_shapes/containers/search_container.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:al_najah_store/views/shop/home/widgets/home_appbar.dart';
import 'package:al_najah_store/views/shop/home/widgets/home_categories.dart';
import 'package:al_najah_store/views/shop/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class HomeScreen extends StatelessWidget {
final ProductVM productVm=Get.put(ProductVM());
  @override
  Widget build(BuildContext context) {
 
   

    return Scaffold(

// appBar: NAppBar(
//   title: const Text("Home"),
//   actions: [
//     IconButton(icon:Icon(Iconsax.shopping_cart), onPressed: () {
//       Get.to(const CartScreen());
//     },)
//   ],
// ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
               NPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  const NHomeAppBar(),
                  const SizedBox( height: NSizes.spaceBtwSections,),

                  //Searchbar
                  const NSearchContainer(text: "Search in Store",icon: Iconsax.search_normal,),
                  const SizedBox( height: NSizes.spaceBtwSections,),

                  //Heading

                  Padding(padding: const EdgeInsets.only(left: NSizes.defaultSpace),
                  child: Column(
                    children: [
                      const NSectionHeading(title: 'Popular Categories',showActionButton: false, textColor: NColors.white,),
                   const SizedBox( height: NSizes.spaceBtwItems,),

                  //Categories
                  NHomeCategories(image:[NImages.logo,NImages.logo,NImages.logo]),
                  const SizedBox( height: NSizes.spaceBtwSections,),


                    ],
                  ),
                  )
                ],
              ),
              ),
            //Body
               Padding(
                 padding: const EdgeInsets.all(NSizes.defaultSpace),

                 child: Column(
                   children: [
                    //Promo Slider
                    Obx(() {
        if (productVm.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productVm.errorMessage.isNotEmpty) {
          return Center(child: Text(productVm.errorMessage.value));
        }

         return   NPromoSlider(banners: [productVm.products[1].images[0]],);

          
        
      }),
            
                   const SizedBox( height: NSizes.spaceBtwSections,),
// //Heading
       NSectionHeading(title: "Popular Products",onPressed:(){} ,buttonTitle: 'View All',),
       const SizedBox( height: NSizes.spaceBtwItems),
//                      // Popular Products

Obx(() {
        if (productVm.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productVm.errorMessage.isNotEmpty) {
          return Center(child: Text(productVm.errorMessage.value));
        }

         return NGridLayout(
                        itemCount: productVm.products.length, 
                        itemBuilder: (_ , index ) => NProductCardVertical(product: productVm.products[index]));
                    
            
          
        
      }),

                    
                  
                    
                  
                   ],
                 ),
               ),
       
      ])));
  
}
}

