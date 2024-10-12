import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/dailogs/show_dailogs.dart';
import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/views/personailization/address/update_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';


class NSingleAddress extends StatelessWidget {
   NSingleAddress({super.key, required this.address, this.onTap});

final Map<String,dynamic> address;
  // final bool selectedAddress;
  final VoidCallback? onTap;
  final a=AddressVm.instance;

  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Obx(
     ()   { 

      if(a.isLoading.value){
        return const Center(child: CircularProgressIndicator(),);
      }
          return NRoundedContainer(
          padding: const EdgeInsets.all(NSizes.md),
          width: double.infinity,
          shawBorder: true,
          backgroundColor: Colors.transparent,
          borderColor:dark?NColors.darkerGrey:NColors.primaryColor,
          margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
          child: Stack(
            children: [
            // Positioned(
            //   right: 5,]
            //   top: 0,
            //   child: Icon(
            //    Iconsax.tick_circle5,
            //       color: dark?NColors.light:NColors.dark,
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                    address["title"]??'null',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                          
                      ),
                      Spacer(),
                      IconButton(onPressed: (){
                        Get.defaultDialog(
                      title: "حذف ",
                      middleText: "هل انت متاكد من حذف العنوان ?",
                      onConfirm: (){
                        a.deleteAddress(address['id'].toString());
                        Get.back();
                        NLoaders.errorSnackBar(title:"تم الحذف بنجاح");
                      
  },
  
  onCancel: () { 
    ()=>Get.back();},
);
                        // ShowDailogs.removeFromCartDialog(, "Address");
                        
                      }, icon: const Icon(Icons.delete)),
                        IconButton(onPressed: (){
                   Get.to(()=>UpdateAddressScreen(addressId: address['id']));
                      }, icon: const Icon(Iconsax.edit)),
                  ],
                ),
                  const SizedBox(height: NSizes.sm/2),
                     Text(
               address["phone"]??'null',
                  maxLines: 1,
        
                  ),
                  const SizedBox(height: NSizes.sm/2),
                        Text(
                   overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,

                  "${address["description"]??'null'}",
        
                  ),
              ],
            )
            ],
          ),
    );}),
      
    );
  }
}