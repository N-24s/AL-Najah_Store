import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NRatingAndShare extends StatelessWidget {
   NRatingAndShare({
    super.key,
    required this.rating,required this.reviews
  });
  String rating,reviews;

  @override
  Widget build(BuildContext context) {
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
            //Rating 
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24,),
            const SizedBox(width: NSizes.spaceBtwItems/2),
            Text.rich(
          TextSpan(
            children: [
            TextSpan(text: rating,style: Theme.of(context).textTheme.bodyLarge),
             TextSpan(text: reviews)
            ]
          ),                       
            ),
          ],
        ),
        //Share Button
        IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: NSizes.iconMd,))
    
      ],
    );
  }
}

