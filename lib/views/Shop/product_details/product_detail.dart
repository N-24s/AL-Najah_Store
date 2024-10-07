import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_rectangles.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:al_najah_store/views/Shop/checkout/checkout.dart';
import 'package:al_najah_store/views/Shop/product_details/widgets/bottom_add_cart_widget.dart';
import 'package:al_najah_store/views/Shop/product_details/widgets/product_attributes.dart';
import 'package:al_najah_store/views/Shop/product_details/widgets/product_detail_image_slider.dart';
import 'package:al_najah_store/views/Shop/product_details/widgets/product_meta_data.dart';
import 'package:al_najah_store/views/Shop/product_details/widgets/rating_share_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';


class ProductDetail extends StatelessWidget {
   const ProductDetail({super.key});


  @override
  Widget build(BuildContext context) {
        // Product product=ModalRoute.of(context)!.settings.arguments as Product;

        final productVm = ProductVM.instance;
      
  


  


    final dark=NHelperFunctions.isDarkMode(context);
   
    return Scaffold(
      
      bottomNavigationBar:       Obx(
          (){
          if (productVm.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (productVm.errorMessage.isNotEmpty) {
          
            return Center(child: Text(productVm.errorMessage.value));
          }
           return        NBottomAddCart(product: productVm.producDetails.value,);

          
                }
                 
                   
        ),
      body:      Obx(
          (){
          if (productVm.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (productVm.errorMessage.isNotEmpty) {
          
            return Center(child: Text(productVm.errorMessage.value));
          } return SingleChildScrollView(
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
                    child: ElevatedButton(onPressed: ()=>Get.to(()=>CheckoutScreen()), child: const Text("Checkout"))),
                  
                  const SizedBox(height: NSizes.spaceBtwSections),
                  
                  //Description
                  const NSectionHeading(title: "Description",showActionButton: false,),
                   const SizedBox(height: NSizes.spaceBtwItems),

       
               ReadMoreText(
              productVm.producDetails.value.description,
                    trimLines: 1,
                    trimCollapsedText: 'Show more',
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight:  FontWeight.w800),
                    lessStyle: TextStyle(fontSize:14,fontWeight:  FontWeight.w800),
                    ),
              
                       //Like Products
                  Divider(),
                    const SizedBox(height: NSizes.spaceBtwItems),
                    NSectionHeading(title: "Similar Products",showActionButton: true,onPressed:(){} ,),
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
            );}
        



        ),
        
        );
      
    
  }
}

