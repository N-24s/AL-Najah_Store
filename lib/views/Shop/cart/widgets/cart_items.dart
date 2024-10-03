import 'package:al_najah_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:al_najah_store/common/widgets/products/cart/cart_item.dart';
import 'package:al_najah_store/common/widgets/texts/n_price_text.dart';
import 'package:al_najah_store/models/shop/cart/cart_item.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
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

    final cartController=CartController.instance;
        // StorageHelper storageHelper =StorageHelper.instance;
        // List<dynamic>? items= storageHelper.readKey("cart") ;
        

    return  Obx(
      ()=> ListView.separated(
        shrinkWrap: true,
       separatorBuilder: (_,__)=>const SizedBox(height: NSizes.spaceBtwSections,), 
       
       itemCount: cartController.cartItems.length,
        itemBuilder:(cxt,index)=>  Obx(
        (){ 
          final item=cartController.cartItems[index];
          return Column(
            children:  [
                 
           NCartItem(cartItem: item,),
               
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
                      NProductQuantityWithAddRemoveButtons(
                        quantity: item.quantity,
                        add: ()=> cartController.addOneToCart(item),
                        remove: ()=>cartController.removeOneFromCart(item),
                        ),
                    ],
                  ),
                          NProductPriceText(price:(item.price*item.quantity).toStringAsFixed(1)),
                
                ],
              ),
            ],
                
          );}
        ) 
       ),
    );}
  
  }

// getProductById
   Product getProductById(String productId) {

        // final ProductVM productVm=Get.put(ProductVM());
            final productVm = Get.find<ProductVM>();

            return productVm.products.firstWhere(
      (product) => product.id == int.parse(productId));
       
    
        
  
  }


