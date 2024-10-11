// import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
// import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_card_shimmer.dart';
// import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
// import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';



// class NSortableProductsByBrands extends StatelessWidget {
//   const NSortableProductsByBrands({
//     super.key, this.brandId,
//   });
// final int? brandId;
//   @override
//   Widget build(BuildContext context) {
// final brandVm =BrandVm.instance;
//         final productVm=ProductVM.instance;
//         int? selectedCategory=brandId;
//         if (selectedCategory!=null){

//         }
   





//     return Column(
//       children: [
//         //Dropdown
        
//         DropdownButtonFormField(
          
//               decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          
//           value: selectedCategory,
          

//           onChanged: (value) { 

// selectedCategory!=value;
// //  brandVm.fetchProductByBrands(value.toString() as String);
// // products.value=productVm.products.where((product)=>product.brandId==value).toList();

// // print('SSSSSSSSSSSSSSSSSSSSSSSSSS$products');
                          

//           },
//                         items:brandVm.featuredBrand.map((brand)=>DropdownMenuItem(value: brand['id'],child: Text(brand['name']))).toList(),

         
          
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
                              
//                                 itemCount: products.length, 
                                
//                                 itemBuilder: (_,index)=> NProductCardVertical(product: products[index])),
                    
//                      ],
//                    );

                            
//   }),
                
    
         
//       ],
//     );
//   }
// }