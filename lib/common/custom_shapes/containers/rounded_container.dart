import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';

class NRoundedContainer extends StatelessWidget {
  const NRoundedContainer({
    super.key, 
    this.width, 
    this.height, 
    this.radius=NSizes.cardRadiusLg, 
    this.child, 
    this.shawBorder=false, 
    this.borderColor=NColors.borderPrimary, 
    this.backgroundColor=NColors.white, 
    this.padding, 
    this.margin});
  final double? width,height;
  final double radius;
  final Widget?child;
  final bool shawBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding,margin;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: shawBorder? Border.all(color: borderColor):null,
      ),
      child: child,
    );
  }
}