import 'package:al_najah_store/common/widgets/brands/brand_show_case.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_by_category_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NCategoryTab extends StatelessWidget {
  const NCategoryTab({super.key, required this.categoryId,});
  final int categoryId;

  
 

  @override
  Widget build(BuildContext context) {
  //  final productByCategoryVm = Get.find<ProductByCategoryVm>(); 
       final productByCategoryVm = ProductByCategoryVm.getinstance(categoryId.toString());

  

    return    ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: [
        Padding(
                  padding: EdgeInsets.all(NSizes.defaultSpace),
                  child: Column(
                    children: [
                       // --Brand 
                         for(int i=0; i<2;i++)
                      NBrandShowcase(images: [
                        for(int i=0; i<3;i++)
                        NImages.logo
                      ],),
                        const SizedBox(height: NSizes.spaceBtwItems),
        
                      // Products
                      NSectionHeading(title: 'You might like', onPressed: (){},),
                        const SizedBox(height: NSizes.spaceBtwItems),
                        Obx((){
                          if (productByCategoryVm.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productByCategoryVm.errorMessage.isNotEmpty) {
          return Center(child: Text(productByCategoryVm.errorMessage.value));
        }
                          
                          
                   return       NGridLayout(
                          
                            itemCount: productByCategoryVm.productByCategory.length, 
                            itemBuilder: (_,index)=> NProductCardVertical(product: productByCategoryVm.productByCategory[index],));
  }),
                  const SizedBox(height: NSizes.spaceBtwSections),

        
                    ],
                  ),
                ),
      ],
    );
  }
}