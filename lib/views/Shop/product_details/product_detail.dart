
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_details_shimmer.dart';
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_image_slider_shimmer.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_horizontal.dart';

import 'package:al_najah_store/common/widgets/texts/section_heading.dart';

import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:al_najah_store/views/Shop/checkout/checkout.dart';
import 'package:al_najah_store/views/Shop/product_details/widgets/bottom_add_cart_widget.dart';
import 'package:al_najah_store/views/Shop/product_details/widgets/product_detail_image_slider.dart';
import 'package:al_najah_store/views/Shop/product_details/widgets/product_meta_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:readmore/readmore.dart';


class ProductDetail extends StatelessWidget {
   const ProductDetail({super.key});


  @override
  Widget build(BuildContext context) {
        // Product product=ModalRoute.of(context)!.settings.arguments as Product;

        final productVm = ProductVM.instance;
      
  


  


    final dark=NHelperFunctions.isDarkMode(context);
   
    return     Obx(
          (){
          if (productVm.isLoading.value) {
            return const NProductDetailsShimmer();
          }
          
          if (productVm.errorMessage.isNotEmpty) {
          
            return Center(child: Text(productVm.errorMessage.value));
          } return Scaffold(
      
      bottomNavigationBar:    NBottomAddCart(product: productVm.producDetails.value,),

          
                
                 
                   
        
      body:      SingleChildScrollView(
        child: Column(
          //Product Images Silder
        children: [

               NProductImageSlider(product: productVm.producDetails.value),

          
              
                 
                   
        

          // Produtc Details
          Padding(
            padding: const EdgeInsets.only(
              right: NSizes.defaultSpace,
              bottom: NSizes.defaultSpace,
              left: NSizes.defaultSpace),
              child: Column(
                children: [
          
         
           NProductMetaData(product: productVm.producDetails.value,),
          
   
              
                
                  const SizedBox(height: NSizes.spaceBtwSections),

                  //Checkout Button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: ()=>Get.to(()=>CheckoutScreen()), child: const Text(NTexts.checkout))),
                  
                  const SizedBox(height: NSizes.spaceBtwSections),
                  
                  //Description
                  const NSectionHeading(title: NTexts.description,showActionButton: false,),
                   const SizedBox(height: NSizes.spaceBtwItems),

       
               ReadMoreText(
              productVm.producDetails.value.description!,
                    trimLines: 1,
                    trimCollapsedText: 'المزيد',
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'أقل',
                    moreStyle: const TextStyle(fontSize: 14,fontWeight:  FontWeight.w800),
                    lessStyle: const TextStyle(fontSize:14,fontWeight:  FontWeight.w800),
                    ),
              
                       //Like Products
                  const Divider(),
                    const SizedBox(height: NSizes.spaceBtwItems),
                    NSectionHeading(title: NTexts.similar_products,showActionButton: true,onPressed:(){} ,),
                          SizedBox(
        height: 100,
        child: 
    
           ListView.separated(
          
                separatorBuilder: (context, index) => const SizedBox(width: NSizes.spaceBtwItems,),  
          scrollDirection:Axis.horizontal ,
            shrinkWrap: true,
            itemCount:productVm.similarProduct.length,
            itemBuilder: (_,index)
          {
            
      
           return 
            NProductCardHorizontal(similarProduct: productVm.similarProduct[index]);
                        
          
          
                }
                 
                   ),
        ),
    
        
          ]  ),),
 

                    const SizedBox(height: NSizes.spaceBtwSections),

                ],
              ),
            )
        



        );}
        
        );
      
    
  }
}

