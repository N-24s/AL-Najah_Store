
import 'package:al_najah_store/common/widgets/brands/brand_show_case.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_card_shimmer.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_by_category_vm.dart';
import 'package:al_najah_store/views/Shop/all_products/all_products_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NCategoryTab extends StatelessWidget {
  const NCategoryTab({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    print(categoryId);

    final productByCategoryVm = ProductByCategoryVm();
    final brandVM = BrandVm.instance;

  var filteredBrands = brandVM.brandByCategory
    .where((category) => category['id'] == categoryId) 
    .expand((category) => category['brands'] as List<dynamic>) 
    .take(2) .toList();
  //                List<dynamic> products = filteredBrands
  //   .map((brand) => brand['products'] as List<dynamic>)
  //   .expand((products) => products)
  //   .toList();


// var filteredBrands = brandVM.brandByCategory
//     .where((category) => category['id'] == categoryId) 
//     .expand((category) => category['brands'] as List<dynamic>) 
//     .toList();






    productByCategoryVm.fetchProductsByCategory(categoryId.toString());

    return SingleChildScrollView( 
      child: Padding(
        padding: const EdgeInsets.all(NSizes.defaultSpace),
        child: Column(
          children: [
            // // --Brand 
            Obx(() {
              if (brandVM.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (brandVM.errorMessage.isNotEmpty) {
                return Center(child: Text(brandVM.errorMessage.value));
              }

              return Column( 
                children: List.generate(
                  filteredBrands.length,
                  (index) => NBrandShowcase(
                  
                    brand:filteredBrands[index],
                  
                  ),
                ),
              );
            }),


        const SizedBox(height: NSizes.spaceBtwItems),

            // Products
            NSectionHeading(
              title: 'Product Popular',
              onPressed: () => Get.to(() => const AllProductsByCategoryScreen()),
            ),
            const SizedBox(height: NSizes.spaceBtwItems),

            Obx(() {
              if (productByCategoryVm.isLoading.value) {
                return NProductCardShimmer();
              }

              // if (productByCategoryVm.errorMessage.isNotEmpty) {
              //   return Center(child: Text(productByCategoryVm.errorMessage.value));
              // }

              return NGridLayout(
                itemCount: productByCategoryVm.productByCategory.length,
                itemBuilder: (_, index) => NProductCardVertical(
                  product: productByCategoryVm.productByCategory[index],
                ),
              );
            }),

            const SizedBox(height: NSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}

