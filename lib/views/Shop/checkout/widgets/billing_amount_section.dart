

import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/pricing_calculator.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:flutter/material.dart';

class NBillingAmountSection extends StatelessWidget {
  const NBillingAmountSection({super.key});


  @override
  Widget build(BuildContext context) {
    final cartController=CartController.instance;
    final subTotal=cartController.totalCartPrice.value;
    return  Column(
      children: [
        // SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium),
               Text("\$$subTotal",style: Theme.of(context).textTheme.bodyMedium)
            ],
        ),
        const SizedBox(height: NSizes.spaceBtwItems/2),

        // Shipping Fee
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium),
               Text("\$${NPricingCalculator.calculateShippingCost(subTotal, 'US')}",style: Theme.of(context).textTheme.labelLarge)
            ],
        ),
            const SizedBox(height: NSizes.spaceBtwItems/2),

        // Tax Fee
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyMedium),
               Text("\$${NPricingCalculator.calculateTax(subTotal,'US')}",style: Theme.of(context).textTheme.labelLarge)
            ],
        ),
            const SizedBox(height: NSizes.spaceBtwItems/2),

        // Order Total 
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodyMedium),
               Text("\$${NPricingCalculator.calculateTotalPrice(subTotal, 'US')}",style: Theme.of(context).textTheme.titleMedium)
            ],
        ),
      ],
    );
  }
}