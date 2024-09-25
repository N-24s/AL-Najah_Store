import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class NSingleAddress extends StatelessWidget {
  const NSingleAddress({super.key, required this.selectedAddress});
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
      margin: EdgeInsets.only(bottom: NSizes.spaceBtwItems),
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
              "Nooh Saeed",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,

              ),
              const SizedBox(height: NSizes.sm/2),
                const Text(
              "770 496 167",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              ),
              const SizedBox(height: NSizes.sm/2),
                   const Text(
              "8997 yemen, hadrmout, mukalla ,Fuah   ",
              softWrap: true,

              ),
          ],
        )
        ],
      ),
    );
  }
}