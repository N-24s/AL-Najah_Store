import 'package:al_najah_store/utilis/constants/enums.dart';
import 'package:flutter/material.dart';


class NBrandTitleText extends StatelessWidget {
  const NBrandTitleText({
    super.key, 
    this.color, 
    required this.title, 
    this.maxLines=1, 
    this.textAlign=TextAlign.center, 
    this.brandTextSize=TextSize.small,
  });
  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSize brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title, 
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      //Check which brand size is required and set the style
      style:brandTextSize==TextSize.small
      ? Theme.of(context).textTheme.labelMedium!.apply(color: color,fontWeightDelta: 2)
      :brandTextSize==TextSize.medium
      ?Theme.of(context).textTheme.bodyLarge!.apply(color: color,fontWeightDelta: 2)
       :brandTextSize==TextSize.large
      ?Theme.of(context).textTheme.titleLarge!.apply(color: color,fontWeightDelta: 2)
      :Theme.of(context).textTheme.bodyMedium!.apply(color: color,fontWeightDelta: 2)
      );
  }
}


