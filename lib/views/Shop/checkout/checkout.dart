import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/utilis/helpers/pricing_calculator.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/view_model_vm/shop/order/order_vm.dart';
import 'package:al_najah_store/views/Shop/cart/widgets/cart_items.dart';
import 'package:al_najah_store/views/Shop/checkout/widgets/billing_address_section.dart';
import 'package:al_najah_store/views/Shop/checkout/widgets/billing_amount_section.dart';
import 'package:al_najah_store/views/Shop/checkout/widgets/billing_payment_section.dart';
import 'package:flutter/material.dart';


class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // final addressVM=AddressVm.instance;
        final cartController=CartVM.instance;
    final subTotal=cartController.totalCartPrice.value;

    final orderVM=OrderVM.instance;
    final addressVM=AddressVm.instance;


    final dark=NHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: NAppBar(
        showBackArrow: true,
        title: Text(NTexts.orderReview,style: Theme.of(context).textTheme.headlineSmall),
      ),
  body:   SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(NSizes.defaultSpace),
      child: Column(
        children: [
          //Items in Cart
          const NCartItems(showAddRemoveButton: false),
          const SizedBox(height: NSizes.spaceBtwSections),

        
          const SizedBox(height: NSizes.spaceBtwSections),

          //Billing Section
          NRoundedContainer(
            shawBorder: true,
            padding: const EdgeInsets.all(NSizes.md),
            backgroundColor:dark? NColors.black:NColors.white ,
            child: Column(
              children: [
                //Pricing
                const NBillingAmountSection(),
                const SizedBox(height: NSizes.spaceBtwItems),

                //Divider
                const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),

                //Payment Methods
                const NBillingPaymentSection(),
                const SizedBox(height: NSizes.spaceBtwItems),
                //Address
         

                      NBillingAddressSection(),
                  
              
        
         



              ],
            ),

          ),
          const SizedBox(height: NSizes.spaceBtwSections),


        ],
      ),
    ),
  ),
   //Checkout Button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: ()async{
if(addressVM.selectedAddress.isNotEmpty){
              await orderVM.extractDataFromCart(addressVM.selectedAddress['id']);

}             
else{
  NLoaders.errorSnackBar(title: "مطلوب اضافة العنوان");
}

            },
              // SuccessScreen(
              //   image: NImages.OnBoardingImage3,
              //   title: 'Payment Success!',
              //   subTitle: "Your item will be shipping soon!",
              //   onPressed: ()=>Get.offAll(()=>const NavigationMenu()),
              // )), 
              child:  Text("${NTexts.checkout}${NPricingCalculator.calculateTotalPrice(subTotal, "US")}\ر.ي")),
        ),
    );
  }
}

