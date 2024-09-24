import 'package:al_najah_store/common/widgets/texts/n_brand_title_text.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/enums.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';





class NBrandTitleWithVerifiedIcon extends StatelessWidget {
  const NBrandTitleWithVerifiedIcon({
    super.key, 
    this.iconColor=NColors.primaryColor, 
    this.textColor, 
    required this.title, 
    this.maxLines=1, 
    this.textAlign=TextAlign.center, 
   this.brandTextSize=TextSize.small,
  });
  final Color? iconColor,textColor;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSize brandTextSize;

  @override
  Widget build(BuildContext context) {
    return  Row(
mainAxisSize: MainAxisSize.min,      children: [
        Flexible(
          child: NBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          
            ),
        ),
          const SizedBox(width:  NSizes.xs,),
          const Icon(Iconsax.verify5, color: NColors.primaryColor,size:  NSizes.iconXs,)
      ],
    );
  }
}

