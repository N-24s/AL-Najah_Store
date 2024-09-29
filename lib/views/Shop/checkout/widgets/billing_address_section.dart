import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NBillingAddressSection extends StatelessWidget {
  const NBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      NSectionHeading(title: "Shipping Address" ,buttonTitle:"Change",onPressed: (){},),
       Text("Nooh Saeed",style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: NSizes.spaceBtwItems/2),

        Row(
        children: [
          const Icon(Icons.phone,color: Colors.grey ,size: 16),
          const SizedBox(width: NSizes.spaceBtwItems,),
          Text("770 496 167",style: Theme.of(context).textTheme.bodyMedium),

        ],
       ),
                 const SizedBox(height: NSizes.spaceBtwItems/2),


        Row(
        children: [
          const Icon(Icons.location_history,color: Colors.grey ,size: 16),
          const SizedBox(width: NSizes.spaceBtwItems,),
          Text("Yemen, Hadrmout, AL-Mukalla",style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          const SizedBox(height: NSizes.spaceBtwItems,),

        ],
       ),
    ],
        );
  }
}