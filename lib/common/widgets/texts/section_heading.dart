import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:flutter/material.dart';

class NSectionHeading extends StatelessWidget {
  const NSectionHeading({
    super.key, this.textColor,  this.showActionButton=true, required this.title,  this.buttonTitle=NTexts.viewAll, this.onPressed,
  });
final Color? textColor;
final bool showActionButton;
final String title, buttonTitle;
final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),maxLines: 1, overflow: TextOverflow.ellipsis,),
       
        if(showActionButton)  
        TextButton(onPressed: onPressed, child:  Text(buttonTitle))
      ],
    );
  }
}

