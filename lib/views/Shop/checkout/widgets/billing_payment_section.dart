

import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class NBillingPaymentSection extends StatelessWidget {
  const NBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        NSectionHeading(title: "Payment Method", buttonTitle: "Change",onPressed: (){},),
            const SizedBox(height: NSizes.spaceBtwItems/2),

   
         Row(
          children: [
            NRoundedContainer(
              width: 60,
              height: 60,
              backgroundColor: dark?NColors.light:NColors.white,
              padding: const EdgeInsets.all(NSizes.sm),
              child: const Image(image: AssetImage(NImages.logo),fit: BoxFit.contain),
            ),
                const SizedBox(height: NSizes.spaceBtwItems/2),
                 Text("On Delivery", style: Theme.of(context).textTheme.bodyLarge),

       
            
            ],
        ),
      ],

    );
  }
}