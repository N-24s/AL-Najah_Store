import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class NCouponCode extends StatelessWidget {
  const NCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return NRoundedContainer(
      shawBorder: true,
      backgroundColor: dark? NColors.dark:NColors.white,
      padding: const EdgeInsets.only(top: NSizes.sm,bottom: NSizes.sm,right: NSizes.sm,left: NSizes.md),
      child:  Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                 disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                 errorBorder: InputBorder.none,
                
              ),
            ),
          ),
        //Button
        SizedBox(
          width: 80,
          child: ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              foregroundColor: dark? NColors.white.withOpacity(0.5):NColors.dark.withOpacity(0.5),
              disabledBackgroundColor: Colors.grey.withOpacity(0.1),
              side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              
         ),
            child: const Text("Apply")
            ),
        ),
        ],
      ),
    );
  }
}