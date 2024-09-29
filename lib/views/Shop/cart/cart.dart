import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/models/shop/cart/cart_item.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/views/Shop/cart/widgets/cart_items.dart';
import 'package:al_najah_store/views/Shop/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: NAppBar(title: Text("Cart",style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true, ),
        body: const Padding(
          padding:EdgeInsets.all(NSizes.defaultSpace),
          
          child: NCartItems(),
           
            ),

//Checkout Button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckoutScreen()), child: const Text("Checkout \$256.0")),
        ),
    );
  }
}


