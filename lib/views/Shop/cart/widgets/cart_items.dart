import 'package:al_najah_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:al_najah_store/common/widgets/products/cart/cart_item.dart';
import 'package:al_najah_store/common/widgets/texts/n_price_text.dart';
import 'package:al_najah_store/models/shop/cart/cart_item.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NCartItems extends StatelessWidget {
  const NCartItems({
    super.key,  this.showAddRemoveButton=true,
  });
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
        StorageHelper storageHelper =StorageHelper.instance;
        List<dynamic>? items= storageHelper.readKey("cart") ;

    return items!=null?  ListView.separated(
      shrinkWrap: true,
     separatorBuilder: (_,__)=>const SizedBox(height: NSizes.spaceBtwSections,), 
     
     itemCount: items.length,
      itemBuilder:(cxt,index)=>  Column(
        children:  [
 
   NCartItem(item: items[index]),
           
          if(showAddRemoveButton)  const SizedBox(height: NSizes.spaceBtwItems,),
    
    
    //Add Remove Button Row with total price
    if(showAddRemoveButton)
           Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
            children: [
               Row(
                children: [
                    //Extra Space
                  const SizedBox(width: 70,),
                  //Add Remove Buttons
                  NProductQuantityWithAddRemoveButtons(quantity: items[index]['quantity'],),
                ],
              ),
                      NProductPriceText(price: items[index]['price'].toString())
    
            ],
          ),
        ],
    
      ) ,
     ):const Center(child: Text("No Cart"));
  
  }

// getProductById
   Product getProductById(String productId) {

        final ProductVM productVm=Get.put(ProductVM());
            return productVm.products.firstWhere(
      (product) => product.id == int.parse(productId));
       
    
        
  
  }
}

