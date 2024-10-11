import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NVerticalImageTextShimmer extends StatelessWidget {
  const NVerticalImageTextShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = NHelperFunctions.isDarkMode(context);
    
   
     return SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection:Axis.horizontal ,
          shrinkWrap: true,
          itemCount:6,
          itemBuilder: (_,index)
        {return Padding(
      padding: const EdgeInsets.only(right: NSizes.spaceBtwItems),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: dark ? NColors.black : NColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: NSizes.spaceBtwItems / 2),

          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 55,
              height: 12, 
              color: Colors.grey,
            ),
          ),
        
         
        ],
        ));
  }));
  }
}

