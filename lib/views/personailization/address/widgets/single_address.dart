import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/views/personailization/address/update_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';


class NSingleAddress extends StatelessWidget {
   NSingleAddress({super.key, required this.selectedAddress, required this.address, this.onTap});

final Map<String,dynamic> address;
  final bool selectedAddress;
  final VoidCallback? onTap;
  final a=AddressVm.instance;

  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: NRoundedContainer(
        padding: const EdgeInsets.all(NSizes.md),
        width: double.infinity,
        shawBorder: true,
        backgroundColor: selectedAddress?NColors.primaryColor.withOpacity(0.5):Colors.transparent,
        borderColor: selectedAddress?Colors.transparent:dark?NColors.darkerGrey:NColors.grey,
        margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
        child: Stack(
          children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
                selectedAddress?Iconsax.tick_circle5:null,
                color: selectedAddress?dark?NColors.light:NColors.dark:null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                  address['name']??'null',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                        
                    ),
                    IconButton(onPressed: ()async{
                 await     a.deleteAddress('7');
                    }, icon: Icon(Icons.delete)),
                      IconButton(onPressed: (){
                 Get.to(()=>UpdateAddressScreen());
                    }, icon: Icon(Icons.edit)),
                ],
              ),
                const SizedBox(height: NSizes.sm/2),
                   Text(
             address['phone']??'null',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
      
                ),
                const SizedBox(height: NSizes.sm/2),
                      Text(
                
                "${address['city']??'null'}",
                softWrap: true,
      
                ),
            ],
          )
          ],
        ),
      ),
    );
  }
}