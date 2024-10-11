import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_card_shimmer.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/models/shop/brand/brand.dart' as b;
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../models/shop/product.dart';

class NSortableProductsByBrands extends StatelessWidget {
  const NSortableProductsByBrands({
    super.key, this.brand,
  });

  final b.Brand? brand;

  @override
  Widget build(BuildContext context) {
    final brandVm = BrandVm.instance; 
    b.Brand? selectedCategory = brand;
    
    // Only fetch products if a category is already selected
    if (selectedCategory != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        brandVm.fetchProductByBrands(selectedCategory!.id.toString());
      });
    }

    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField<b.Brand>(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: selectedCategory,
          onChanged: (value)async {
            if (value != null) {
              selectedCategory = value;

              // Use a delayed callback to avoid calling during build
              WidgetsBinding.instance.addPostFrameCallback((_) async{
            await    brandVm.fetchProductByBrands(selectedCategory!.id.toString());
              });
            }
          },
          items: brandVm.allBrands
              .map((brand) => DropdownMenuItem(
                  value: brand, child: Text(brand.name!)))
              .toList(),
        ),
        
        const SizedBox(height: NSizes.spaceBtwSections),

        // Products
        Obx(() {
          if (brandVm.isLoading.value) {
            return NProductCardShimmer();
          }

          if (brandVm.errorMessage.isNotEmpty  || brandVm.productByBrand.isEmpty) {
            return const Center(child: Text("No Products"));
          }

          return NGridLayout(
            itemCount: brandVm.productByBrand.length,
            itemBuilder: (_, index) {
              final product = brandVm.productByBrand[index];
              return NProductCardVertical(
                product: Product(
                  id: product.id,
                  name: product.name,
                  price: product.price,
                  image: product.image,
                ),
              );
            },
          );
        }),
      ],
    );
  }
}


// import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
// import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_card_shimmer.dart';
// import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
// import 'package:al_najah_store/models/shop/brand/brand.dart' as b;
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
// import 'package:al_najah_store/view_model_vm/shop/home/category_vm.dart';
// import 'package:al_najah_store/view_model_vm/shop/home/product_by_category_vm.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// import '../../../models/shop/product.dart';



// class NSortableProductsByBrands extends StatelessWidget {
//   const NSortableProductsByBrands({
//     super.key, this.brand,
//   });
// final b.Brand? brand;
//   @override
//   Widget build(BuildContext context) {
//         final brandVm =BrandVm.instance; 
//         b.Brand? selectedCategory=brand;
//         if (selectedCategory!=null){
//           print("IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII${brand!.id}");
//            brandVm.fetchProductByBrands(brand!.id.toString());

//         }
   





//     return Column(
//       children: [
//         //Dropdown
        
//         DropdownButtonFormField(
          
//               decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          
//           value: selectedCategory,
          

//           onChanged: (value) { 
//             print("VVVVVVVVVVVVVVVVVVVVVVVVVVVvvv${value!.id}");
//             print("Befor ${selectedCategory!.id}");
// selectedCategory=value;
//             print("After ${selectedCategory!.id}");

//  brandVm.fetchProductByBrands(selectedCategory!.id.toString());
                          

//           },
//                         items:brandVm.allBrands.map((brand)=>DropdownMenuItem(value: brand,child: Text(brand.name!))).toList(),

         
          
//            ),
    
//            const SizedBox(height: NSizes.spaceBtwSections,),
    
//            //Products
//              Obx((){
//                           if (brandVm.isLoading.value) {
//           return  NProductCardShimmer();
//         }

//         if (brandVm.errorMessage.isNotEmpty) {
//           return Center(child: Text("No Products"));
//         }
                          
                          
//                    return       Column(
//                      children: [
//                        NGridLayout(
                              
//                                 itemCount: brandVm.productByBrand.length, 
//                                 itemBuilder: (_,index){ 
//                                  return NProductCardVertical(product: Product(id:    brandVm.productByBrand[index].id, name: brandVm.productByBrand[index].name, price: brandVm.productByBrand[index].price, image: brandVm.productByBrand[index].image,),
//                                 );}),
                    
//                      ],
//                    );

                            
//   }),
                
    
         
//       ],
//     );
//   }
// }



// // import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
// // import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_card_shimmer.dart';
// // import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
// // import 'package:al_najah_store/utilis/constants/size.dart';
// // import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
// // import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:iconsax/iconsax.dart';

// // import '../../../models/shop/product.dart';



// // class NSortableProductsByBrands extends StatelessWidget {
// //    NSortableProductsByBrands({
// //     super.key, this.brandId,
// //   });
// // final int? brandId;
// // final brandVm =BrandVm.instance;
// // final product=ProductVM.instance;

// //   @override
// //   Widget build(BuildContext context) {


// //         int? selectedCategory=brandId;
// //         if (selectedCategory!=null){

// //         }
   





// //     return Column(
// //       children: [
// //         //Dropdown
        
// //         DropdownButtonFormField(
          
// //               decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          
// //           value: selectedCategory,
          

// //           onChanged: (value) { 

// // selectedCategory!=value;
// // //  brandVm.fetchProductByBrands(value.toString() as String);
// // // products.value=productVm.products.where((product)=>product.brandId==value).toList();

// // // print('SSSSSSSSSSSSSSSSSSSSSSSSSS$products');
                          

// //           },
// //                         items:brandVm.allBrands.map((brand)=>DropdownMenuItem(value: brand.id,child: Text(brand.name!))).toList(),

         
          
// //            ),
    
// //            const SizedBox(height: NSizes.spaceBtwSections,),
    
// //            //Products
// //              Obx((){
// //                           if (product.isLoading.value) {
// //           return  NProductCardShimmer();
// //         }

// //         if (product.errorMessage.isNotEmpty) {
// //           return Center(child: Text("No Products"));
// //         }
                          
                          
// //                    return       Column(
// //                      children: [
// //                        NGridLayout(
                              
// //                                 itemCount: brandVm.productByBrand.length, 
// //                                 itemBuilder: (_,index){ 
// //                                  return NProductCardVertical(product:Prod);}),
                    
// //                      ],
// //                    );

                            
// //   }),
                
    
         
// //       ],
// //     );
// //   }
// // }