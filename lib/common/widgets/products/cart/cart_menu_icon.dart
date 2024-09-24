import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NCartCounterIcon extends StatelessWidget {
  const NCartCounterIcon({
    super.key, this.iconColor=NColors.dark, required this.onPressed,
  });

final Color iconColor;
final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
 IconButton(onPressed: onPressed, icon:  Icon(Iconsax.shopping_bag , color: iconColor,)),
    Positioned(
      right: 0,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: NColors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        child: 
        Center(
          child: 
          Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: NColors.white, fontSizeFactor: 0.8),),
        ),
      ),
    ),
      ],
    );
  }
}

