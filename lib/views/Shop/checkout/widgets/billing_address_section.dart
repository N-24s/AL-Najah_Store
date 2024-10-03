import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/views/personailization/address/add_new_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NBillingAddressSection extends StatelessWidget {
  const NBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profileVM= ProfileVM.instance;
  Map<dynamic,dynamic> userAddress=   profileVM.userProfile();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      NSectionHeading(title: "Shipping Address" ,buttonTitle:"Change",onPressed: ()=>Get.to(()=> AddNewAddressScreen()),),
       Text(userAddress['name'],style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: NSizes.spaceBtwItems/2),

        Row(
        children: [
          const Icon(Icons.phone,color: Colors.grey ,size: 16),
          const SizedBox(width: NSizes.spaceBtwItems,),
          Text(userAddress['phone']??'7777777Null',style: Theme.of(context).textTheme.bodyMedium),

        ],
       ),
                 const SizedBox(height: NSizes.spaceBtwItems/2),


        Row(
        children: [
          const Icon(Icons.location_history,color: Colors.grey ,size: 16),
          const SizedBox(width: NSizes.spaceBtwItems,),
          Text("Yemen, Hadrmout, ${userAddress['city']?? 'Mukalla'}",style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          const SizedBox(height: NSizes.spaceBtwItems,),

        ],
       ),
    ],
        );
  }
}