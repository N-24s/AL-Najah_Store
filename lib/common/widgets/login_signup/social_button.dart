import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';


class NSocialButtons extends StatelessWidget {
  const NSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
           mainAxisAlignment: MainAxisAlignment.center,
     children: [
    Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(border: Border.all(color: NColors.grey), borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: (){}, 
      icon: Image.asset(NImages.google),
    )),
         const SizedBox(width: NSizes.spaceBtwItems,),
         Container(
      decoration: BoxDecoration(border: Border.all(color: NColors.grey), borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: (){}, 
      icon:const Image(
        height: NSizes.iconMd,
        width: NSizes.iconMd,
        image: AssetImage(NImages.facebook))
      ),
    ),
    
    
     ],
                  );
  }
}
