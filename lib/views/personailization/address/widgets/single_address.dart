import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';


class NSingleAddress extends StatelessWidget {
   NSingleAddress({super.key, required this.selectedAddress});
        //  final ProfileVM profileVM = Get.put(ProfileVM());
            final profileVM = Get.find<ProfileVM>();


  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return NRoundedContainer(
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
            Text(
            profileVM.userProfile['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,

              ),
              const SizedBox(height: NSizes.sm/2),
                 Text(
           profileVM.userProfile['phone'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              ),
              const SizedBox(height: NSizes.sm/2),
                    Text(
              "Yemen, Hadrmout, ${profileVM.userProfile['city']}",
              softWrap: true,

              ),
          ],
        )
        ],
      ),
    );
  }
}