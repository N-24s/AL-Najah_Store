
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/home/category_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/home/product_by_category_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NSortableProducts extends StatelessWidget {
  const NSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
                 final categoryVm = Get.find<CategoryVM>(); 
                     final productByCategoryVm = ProductByCategoryVm();


    return Column(
      children: [
        //Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) { 
       productByCategoryVm.fetchProductsByCategory(value!.id.toString());
          },
          items:categoryVm.categories.map((category)=>DropdownMenuItem(value: category,child: Text(category.name))).toList()
          
           ),
    
           const SizedBox(height: NSizes.spaceBtwSections,),
    
           //Products
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
                
    
         
      ],
    );
  }
}