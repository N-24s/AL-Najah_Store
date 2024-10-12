import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NProfileMenu extends StatelessWidget {
  const NProfileMenu({
    super.key, 
    required this.title, 
    required this.value, 
    required this.onPressed, 
    this.icon=Iconsax.arrow_left_2,
  });
final String title,value;
final VoidCallback onPressed;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: NSizes.spaceBtwItems/1.5),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,)),
          Expanded(flex: 5, child: Text(value,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,)),
           Expanded(child: Icon(icon,size: 18,)),
          ],
        ),
      ),
    );
  }
}