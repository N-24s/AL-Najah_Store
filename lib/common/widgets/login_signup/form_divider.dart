

import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NFormDivider extends StatelessWidget {
  const NFormDivider({
    super.key,
  required this.dividerText,
  });


  final String dividerText;
  

  @override
  Widget build(BuildContext context) {
        final dark=NHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color:dark? NColors.darkGrey:NColors.grey, thickness: 0.5,indent: 60,endIndent: 5,)),
    Text(NTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color:dark? NColors.darkGrey:NColors.grey, thickness: 0.5,indent: 5,endIndent: 60,))
    
      ],
    );
  }
}
