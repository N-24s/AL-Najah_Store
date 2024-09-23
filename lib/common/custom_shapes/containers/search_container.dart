import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/device/device_utility.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class NSearchContainer extends StatelessWidget {
  const NSearchContainer({
    super.key, 
    required this.text,  
    this.icon,  
    this.showBackground=true,  
    this.showBorder=true, 
    this.onTap, 
    this.padding=const EdgeInsets.symmetric(horizontal: NSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder; 
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:padding,
        child: Container(
          width: NDeviceUtils.getScreenwidth(context),
          padding: const EdgeInsets.all(NSizes.md),
          decoration: BoxDecoration(
            color: showBackground?dark?NColors.dark:NColors.light:Colors.transparent,
            borderRadius: BorderRadius.circular(NSizes.cardRadiusLg),
            border:showBorder? Border.all(color: NColors.grey):null,
          ),
          child:  const TextField(
            
            decoration: InputDecoration(
              labelText:"Search", 
              
            
            ),
          //  Row(
          //     children: [
          //        Icon(icon,color:dark? NColors.darkerGrey: NColors.grey,),
          //         const SizedBox( height: NSizes.spaceBtwItems,),
          //         Text(text, style:  Theme.of(context).textTheme.bodySmall,)
          //     ],
          //   ),
          ),
        ),
      ),
    );
  }
}

