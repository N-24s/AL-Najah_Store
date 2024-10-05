import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/views/personailization/address/add_new_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NBillingAddressSection extends StatelessWidget {
   NBillingAddressSection({super.key});



  @override
  Widget build(BuildContext context) {
    final profileVM= ProfileVM.instance;
          final addressVM=AddressVm.instance;

          // final addressSelect=SelecteAddresses.instance;


    // addressVM.loadAddresses();
      // Map<dynamic,dynamic> userAddress=   profileVM.userProfile();
   
     
    return  Column(
      children: [
             NSectionHeading(title: "Shipping Address" ,buttonTitle:"Change",onPressed: (){ 
            addressVM.selectedNewAddressPopup(context);}),
        Obx((){
          if(addressVM.selectedAddress.value.selectedAddress==false)
          return Text("Select Address");
          return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                               Row(
                                children: [
                                  const Icon(Icons.person,color: Colors.grey ,size: 16),
                    const SizedBox(width: NSizes.spaceBtwItems),

               Text(addressVM.selectedAddress.value.name??'Null',overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyLarge),
              
                                ],
                               ),
                                  const SizedBox(width: NSizes.spaceBtwItems/2),

                  Row(
                  
                  children: [
                    const Icon(Icons.phone,color: Colors.grey ,size: 16),
                    const SizedBox(width: NSizes.spaceBtwItems,),
              Text(addressVM.selectedAddress.value.phone??'Null',overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium)
             
              
                  ],
                 ),
                           const SizedBox(height: NSizes.spaceBtwItems/2),
              
              
                  Row(
                  children: [
                    const Icon(Icons.location_on,color: Colors.grey ,size: 16),
                    const SizedBox(width: NSizes.spaceBtwItems,),
           
          Text("${addressVM.selectedAddress.value.address+'x,jfnc,sv'?? 'Null'}",style: Theme.of(context).textTheme.bodyMedium, softWrap: true,overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: NSizes.spaceBtwItems,),
              
                  ],
                 ),
              ],
                  
          );
        })]);
  
  
}
        
}