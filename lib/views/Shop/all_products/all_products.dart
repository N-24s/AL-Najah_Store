
import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/common/widgets/sortable/sortable_products.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AllProductsScreen extends StatelessWidget {
  final  productController = ProductVM.instance;

  AllProductsScreen({super.key}) {
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NAppBar(title: Text("All Products"), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (productController.errorMessage.isNotEmpty) {
                  return Center(child: Text(productController.errorMessage.value));
                }

                return Column(
                  children: [
                    NGridLayout(
                      itemCount: productController.products.length,
                      itemBuilder: (_, index) => NProductCardVertical(
                        product: productController.products[index],
                      ),
                    ),
                    const SizedBox(height: NSizes.defaultSpace),
                    if (!productController.isLoading.value && productController.products.isNotEmpty) 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                           ElevatedButton(
                            
                                  onPressed:productController.currentPage<=1?null :() {
                                    productController.fetchPreviousPage(); 
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(100, 20), 
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5), 
                                    ),
                                  ),
                                  child: const Text(
                                    'Previous',
                                    style: TextStyle(
                                      fontSize: 18, 
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                   ElevatedButton(
                                  onPressed:productController.currentPage<3? () {
                                    productController.fetchNextPage(); 
                                  }:null,
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(100, 20), 
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5), 
                                    ),
                                  ),
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 18, 
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )

                          
                     
                     

                          
                     
                     
                           
                           
                     
                        ],
                      ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
// import 'package:al_najah_store/common/widgets/sortable/sortable_products.dart';
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';


// class AllProductsScreen extends StatelessWidget {
//   const AllProductsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return   Scaffold(
//       appBar: NAppBar(title: Text("All Products"),showBackArrow: true,),

//       body: SingleChildScrollView(
//         child: Padding(
//           padding:EdgeInsets.all(NSizes.defaultSpace),
//           child: Column(
//             children: [
//                    Products
//              Obx((){
//                           if (productByCategoryVm.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (productByCategoryVm.errorMessage.isNotEmpty) {
//           return Center(child: Text(productByCategoryVm.errorMessage.value));
//         }
                          
                          
//                    return       NGridLayout(
                          
//                             itemCount: productByCategoryVm.productByCategory.length, 
//                             itemBuilder: (_,index)=> NProductCardVertical(product: productByCategoryVm.productByCategory[index],));
//   }),
                
    
        
//             ],
//           ),
//            ),
     
//       ),
//     );
//   }
// }
