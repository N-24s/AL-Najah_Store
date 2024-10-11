import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_by_category_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NCategoryTab extends StatelessWidget {
   NCategoryTab(
    {super.key, 
    required this.categoryId,}){
              productByCategoryVm.fetchProductsByCategory(categoryId.toString());

    }
  final int categoryId;
   final productByCategoryVm = ProductByCategoryVm();



  @override
  Widget build(BuildContext context) {


  var filteredBrands =<dynamic>[].obs;
    final brandVM = BrandVm.instance;

  filteredBrands.value= brandVM.brandByCategory
    .where((category) => category['id'] == categoryId) 
    .expand((category) => category['brands'] as List<dynamic>) 
    .take(2) .toList();




    return const SingleChildScrollView( 
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


        SizedBox(height: NSizes.spaceBtwItems),

            // // Products

            // NSectionHeading(
            //   title: 'Product Popular',
            //   onPressed: () => Get.to(() =>  AllProductsScreen()),
            // ),
            // const SizedBox(height: NSizes.spaceBtwItems),

            // Obx(() {
            //   // if (productByCategoryVm.isLoading.value) {
            //   //                             return Center(child: CircularProgressIndicator(),);

            //   //   // return NProductCardShimmer();
            //   // }

            //   // if (productByCategoryVm.errorMessage.isNotEmpty) {
            //   //   return Center(child: Text(productByCategoryVm.errorMessage.value));
            //   // }

            //   return NGridLayout(
            //     itemCount: productByCategoryVm.productByCategory.length,
            //     itemBuilder: (_, index) => NProductCardVertical(
            //       product: productByCategoryVm.productByCategory[index],
            //     ),
            //   );
            // }),

            // const SizedBox(height: NSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}

