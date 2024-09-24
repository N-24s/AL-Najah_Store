import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class NGridLayout extends StatelessWidget {
  const NGridLayout({
    super.key, 
    required this.itemCount, 
    this.mainAxisExtent=210, 
    required this.itemBuilder, 
    
  });

  final int itemCount;

  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int ) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
     itemCount: itemCount,
     shrinkWrap: true,
     padding: EdgeInsets.zero,
     physics: const NeverScrollableScrollPhysics(),
     gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
     crossAxisCount: 2,
     mainAxisSpacing: NSizes.gridViewSpacing,
     crossAxisSpacing: NSizes.gridViewSpacing,
     mainAxisExtent: mainAxisExtent,
     
     ), itemBuilder:itemBuilder);
  }
}

