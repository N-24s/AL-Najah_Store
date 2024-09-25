import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/home/favorite_controller.dart';
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
    Product product=ModalRoute.of(context)!.settings.arguments as Product;

    final dark=NHelperFunctions.isDarkMode(context);
    final  String description= product.description;
    final  String reviews= product.reviews.length.toString();
    return  Scaffold(
      bottomNavigationBar: NBottomAddCart(),
      body: SingleChildScrollView(
        child: Column(
          //Product Images Silder
        children: [
           NProductIamgeSlider(product: product),

          // Produtc Details
          Padding(
            padding: const EdgeInsets.only(
              right: NSizes.defaultSpace,
              bottom: NSizes.defaultSpace,
              left: NSizes.defaultSpace),
              child: Column(
                children: [
              //Rating & Share Button
                   NRatingAndShare(rating: product.rating.toString(),reviews: product.reviews.length.toString(),),
              // Price Title, Brand
               NProductMetaData(product: product,),
                
                  const SizedBox(height: NSizes.spaceBtwSections),

                  //Checkout Button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),
                  
                  const SizedBox(height: NSizes.spaceBtwSections),
                  
                  //Description

 const NSectionHeading(title: "Description",showActionButton: false,),
                   const SizedBox(height: NSizes.spaceBtwItems),
            ReadMoreText(
              description,
                    trimLines: 1,
                    trimCollapsedText: 'Show more',
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight:  FontWeight.w800),
                    lessStyle: TextStyle(fontSize:14,fontWeight:  FontWeight.w800),
                    ),

                  //Reviews
                  Divider(),
                    const SizedBox(height: NSizes.spaceBtwItems),
                     NSectionHeading(title: "Reviews($reviews)",showActionButton: true,onPressed:(){} ,),

                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     //  IconButton(onPressed: ()=>Get.to(()=>const ProductReviewsScreen()), icon:  Icon(Iconsax.arrow_right3, size: 58,color: Colors.blue,))
                    //   ],
                    // ),

                    const SizedBox(height: NSizes.spaceBtwSections),

                ],
              ),
            ),
        ],



        ),
      ),
    );
  }
}

