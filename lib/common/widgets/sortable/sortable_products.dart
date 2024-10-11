import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_card_shimmer.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/models/shop/prodcuct_by_brand.dart' as c;
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/home/category_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_by_category_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';



class NSortableProducts extends StatelessWidget {
  const NSortableProducts({
    super.key, this.category,
  });
final CategoryModel? category;
  @override
  Widget build(BuildContext context) {
        final categoryVm = Get.find<CategoryVM>(); 
        final productByCategoryVm = ProductByCategoryVm();
        CategoryModel? selectedCategory=category;
        if (selectedCategory!=null){
           productByCategoryVm.fetchProductsByCategory(category!.id.toString());

        }
   





    return Column(
      children: [
        //Dropdown
        
        DropdownButtonFormField(
          
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          
          value: selectedCategory,
          

          onChanged: (value) { 
selectedCategory=value!;
 productByCategoryVm.fetchProductsByCategory(value.id.toString());
                          

          },
                        items:categoryVm.categories.map((category)=>DropdownMenuItem(value: category,child: Text(category.name))).toList(),

         
          
           ),
    
           const SizedBox(height: NSizes.spaceBtwSections,),
    
           //Products
             Obx((){
                          if (productByCategoryVm.isLoading.value) {
          return  NProductCardShimmer();
        }

        if (productByCategoryVm.errorMessage.isNotEmpty) {
          return Center(child: Text("No Products"));
        }
                          
                          
                   return       Column(
                     children: [
                       NGridLayout(
                              
                                itemCount: productByCategoryVm.productByCategory.length, 
                                itemBuilder: (_,index){ 
                                 return NProductCardVertical(product: Product(id:    productByCategoryVm.productByCategory[index]['id'], name: productByCategoryVm.productByCategory[index]["name"], price: productByCategoryVm.productByCategory[index]["price"], image: productByCategoryVm.productByCategory[index]["image"],),
                                );}),
                    
                     ],
                   );

                            
  }),
                
    
         
      ],
    );
  }
}