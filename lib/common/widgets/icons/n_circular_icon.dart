
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class NCircularIcon extends StatelessWidget {
  const NCircularIcon({
    super.key, 
    this.width, 
    this.height, 
    this.size=NSizes.lg, 
    required this.icon, 
    this.color, 
    this.backgroundColor, 
    this.onPressed,
  });
  final double? width,height, size;
  final IconData icon;
  final Color? color,backgroundColor;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:backgroundColor!=null?backgroundColor!: dark? NColors.black.withOpacity(0.9): NColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed, icon:  Icon(icon,color: color,size: size,)),
    );
  }
}