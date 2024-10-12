import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/authentication/auth_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NTermsAndConditionsCheckbox extends StatelessWidget {
   NTermsAndConditionsCheckbox({
    super.key,
  });

final authValidation =AuthValidation.instance;
  @override
  Widget build(BuildContext context) {


        final dark=NHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(height: 24,width: 24,  child: 
              Obx(()=> Checkbox(value: authValidation.privacyPolicy.value, onChanged: (value)=>authValidation.privacyPolicy.value=!authValidation.privacyPolicy.value)),),     
                const SizedBox(height: NSizes.spaceBtwItems),
        Text.rich(TextSpan(
        children: [
          TextSpan(text: NTexts.iAgreeTO,style: Theme.of(context).textTheme.bodySmall),
          TextSpan(text: NTexts.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(
            color: dark?NColors.white:NColors.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: dark?NColors.white:NColors.primaryColor,
          )),
        
          TextSpan(text: ' و ',style: Theme.of(context).textTheme.bodySmall),
          TextSpan(text:NTexts.termsOfUse,style: Theme.of(context).textTheme.bodyMedium!.apply(
            color: dark?NColors.white:NColors.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: dark?NColors.white:NColors.primaryColor,
          )),
        ]))
      ],
    );
  }
}