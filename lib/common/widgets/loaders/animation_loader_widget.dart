import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class NAnimationLoaderWidget extends StatelessWidget {
  const NAnimationLoaderWidget({super.key, 
  required this.text, 
  required this.animation, 
  this.showAction=false,
  this.actionText, 
  this.onActionPressed}); 

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;


  @override
  Widget build(BuildContext context) {
    return Center(child:  Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        
        const SizedBox(height: NSizes.defaultSpace,),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
          ),
        const SizedBox(height: NSizes.defaultSpace,),
        showAction? SizedBox(
          width: 250,
          child: OutlinedButton(
            onPressed: onActionPressed,
            style: OutlinedButton.styleFrom(backgroundColor: NColors.dark),
             child: Text(
              actionText!,
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: NColors.light),
              )),
        ):const SizedBox()
      ],
    ));
  }
}