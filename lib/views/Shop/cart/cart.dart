import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/loaders/animation_loader_widget.dart';
import 'package:al_najah_store/models/shop/cart/cart_item.dart';
import 'package:al_najah_store/navigation_menu.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/views/Shop/cart/widgets/cart_items.dart';
import 'package:al_najah_store/views/Shop/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
final controller= CartController.instance;

    return  Scaffold(

        appBar: NAppBar(title: Text("Cart",style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true, ),
        body: Obx(
          (){ 
            final emptyWidget=NAnimationLoaderWidget(
              text: "Cart is Empty.",
              animation: NImages.logo,
              showAction: true,
              actionText: " Let\'s to Add",
              onActionPressed: ()=> Get.off(()=> const NavigationMenu()),
              );
            
            return controller.cartItems.isEmpty? emptyWidget: const SingleChildScrollView(
              child: Padding(
              padding:EdgeInsets.all(NSizes.defaultSpace),
              
              child: NCartItems(showAddRemoveButton: true,),
               
                ),
            );}
        ),

//Checkout Button
        bottomNavigationBar:controller.cartItems.isEmpty?const SizedBox(): Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: ElevatedButton(onPressed: ()=>Get.to(()=> CheckoutScreen()), child:  Obx(()=>Text("Checkout \$${controller.totalCartPrice.value}"))),
        ),
    );
  }
}


