import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_card_shimmer.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/models/shop/product_by_categories.dart' as productbycate;
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_by_category_vm.dart';
import 'package:al_najah_store/views/Shop/all_products/all_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NCategoryTab extends StatelessWidget {
   final int categoryId;
   final productByCategoryVm = ProductByCategoryVm();
   NCategoryTab(
    {super.key, 
    required this.categoryId,}){
    

    }
 



  @override
  Widget build(BuildContext context) {
                  productByCategoryVm.fetchProductsByCategory(categoryId.toString());
                    print("OOOOOOOOOOOOOOOOOOOOOOOO${categoryId}");
              print("${productByCategoryVm.productByCategory}");



  var filteredBrands =<dynamic>[].obs;
    final brandVM = BrandVm.instance;

  filteredBrands.value= brandVM.brandByCategory
    .where((category) => category['id'] == categoryId) 
    .expand((category) => category['brands'] as List<dynamic>) 
    .take(2) .toList();




    return  SingleChildScrollView( 
      child: Padding(
        padding: EdgeInsets.all(NSizes.defaultSpace),
        child: Column(
          children: [
            // // --Brand 
            // Obx(() {
            //   if (brandVM.isLoading.value) {
            //                               return Center(child: CircularProgressIndicator(),);

            //     // return const NBrandShowcaseShimmer();
              
            //   }

            //   if (brandVM.errorMessage.isNotEmpty) {
            //     return Center(child: Text(brandVM.errorMessage.value));
            //   }

            //   return Column( 
            //     children: List.generate(
            //       filteredBrands.length,
            //       (index) => NBrandShowcase(
                  
            //         brand:filteredBrands[index],
                  
            //       ),
            //     ),
            //   );
            // }),


        const SizedBox(height: NSizes.spaceBtwItems),

            // // Products

            NSectionHeading(
              title: 'Product Popular',
              onPressed: () => Get.to(() =>  AllProductsScreen()),
            ),
            const SizedBox(height: NSizes.spaceBtwItems),

            Obx(() {
              if (productByCategoryVm.isLoading.value) {
                                          // return Center(child: CircularProgressIndicator(),);

                return NProductCardShimmer();
              }

              if (productByCategoryVm.errorMessage.isNotEmpty) {
                return Center(child: Text(productByCategoryVm.errorMessage.value));
              }

              return NGridLayout(
                itemCount: productByCategoryVm.productByCategory.length,
                itemBuilder: (_, index) {return  NProductCardVertical(
product: Product(id:  productByCategoryVm.productByCategory[index].id, name:  productByCategoryVm.productByCategory[index].name, price:  productByCategoryVm.productByCategory[index].price.toString(), image:  productByCategoryVm.productByCategory[index].image),
                );}
              );
            }),

            const SizedBox(height: NSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}

