import 'package:al_najah_store/common/custom_shapes/containers/primary_header_container.dart';
import 'package:al_najah_store/common/custom_shapes/containers/search_container.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_popular_vm.dart';
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_card_shimmer.dart';

import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:al_najah_store/views/Shop/all_products/all_products.dart';
import 'package:al_najah_store/views/shop/home/widgets/home_appbar.dart';
import 'package:al_najah_store/views/shop/home/widgets/home_categories.dart';
import 'package:al_najah_store/views/shop/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class HomeScreen extends StatelessWidget {
final ProductVM productVm=Get.find<ProductVM>();

    final productPopularVm = Get.find<ProductPopularVm>();
        final brandVM=BrandVm.instance;
        final  a=AddressVm.instance;
     

    

  @override
  Widget build(BuildContext context) {

   brandVM.fetchFeaturedBrands();
   

    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
                const NPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  NHomeAppBar(),
                  SizedBox( height: NSizes.spaceBtwSections,),

                  //Searchbar
                  Column(
                    children: [
                      
       NSearchContainer(
          text: "Search in Store",
          icon: Iconsax.search_normal,
        
        ),
      
              
                    ],
                  ),
                  
                  SizedBox( height: NSizes.spaceBtwSections,),

                  //Heading

                  Padding(padding: EdgeInsets.only(left: NSizes.defaultSpace),
                  child: Column(
                    children: [
                      NSectionHeading(title: 'Popular Categories',showActionButton: false, textColor: NColors.white,),
                   SizedBox( height: NSizes.spaceBtwItems,),

                  //Categories
                  NHomeCategories(),
                  SizedBox( height: NSizes.spaceBtwSections,),


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

    
         return    const NPromoSlider(banners: [NImages.Banner_1,NImages.Banner_2,NImages.Banner_3],);

          
        
      }),
            
                   const SizedBox( height: NSizes.spaceBtwSections,),
// //Heading
       NSectionHeading(title: "Popular Products",onPressed:()=>Get.to(()=>AllProductsScreen()),buttonTitle: 'View All',),
       const SizedBox( height: NSizes.spaceBtwItems),
   // Popular Products
Obx(() {
        if (productPopularVm.isLoading.value) {
          return  NProductCardShimmer();
                    
               
            }
         if (productPopularVm.errorMessage.isNotEmpty) {
          return Center(child: Text(productVm.errorMessage.value));
        }

       

         return NGridLayout(
          
                        itemCount: productPopularVm.productPopular.length, 
                        itemBuilder: (_ , index ) => 
                                          NProductCardVertical(product: productPopularVm.productPopular[index])
                      
);


      }),

                   ],
                 ),
               ),
       
      ])));
  
}
}

