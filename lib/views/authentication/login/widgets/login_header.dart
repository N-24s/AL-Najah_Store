

import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class NLoginHeader extends StatelessWidget {
  const NLoginHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
        final dark=NHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Image.asset(NImages.logo, height: 100,),
          Text(NTexts.loginTitle,style: Theme.of(context).textTheme.headlineMedium,),
           Text(NTexts.loginSubTitle,style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}