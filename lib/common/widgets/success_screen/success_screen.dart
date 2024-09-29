import 'package:al_najah_store/common/styles/spacing_styles.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});
  final String image,title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         body: SingleChildScrollView(
        child: Padding(
          padding: NSpacingStyle.paddingWithAppBarHeight *2 ,
          child: Column(
            children: [
              //Image

          Image(image:  AssetImage(image),
          width: NHelperFunctions.screenWidth()*0.6,),
          const SizedBox(height: NSizes.spaceBtwSections,),
// Title & SubTitle
        Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),

            const SizedBox(height: NSizes.spaceBtwItems),

          Text(subTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: NSizes.spaceBtwSections),

        //Buttons

        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text("Continue")),),
            const SizedBox(height: NSizes.spaceBtwItems),



            ],
          ),
          ),
      ),
    );
  }
}