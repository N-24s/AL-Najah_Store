import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

class NCircularContainer extends StatelessWidget {
  const NCircularContainer({
    super.key, this.width=400, this.height=400,  this.radius=400,  this.padding=0, this.child,  this.backgroundColor=NColors.white, this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
    final double padding;
      final EdgeInsets? margin;

  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:backgroundColor,
      ),
      child: child,
    );
  }
}