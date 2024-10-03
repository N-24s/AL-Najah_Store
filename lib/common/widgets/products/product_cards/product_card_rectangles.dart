import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:flutter/material.dart';

class NProductCardRectangle extends StatelessWidget {
  const NProductCardRectangle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NRoundedContainer(
      backgroundColor: NColors.primaryBackground,
      radius: 5,
      height: 100,
      width: 200,
      child: Row(
        children: [
        
        const SizedBox(
          height: 80,
          width: 80,
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: NRoundedImage(
            borderRadius: 10,
              imageUrl: NImages.logo),
          ),
        ),
       SizedBox(
        width: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text("Name of Product", overflow: TextOverflow.ellipsis, maxLines: 1,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15,fontWeight: FontWeight.bold,color: NColors.secondaryOrangeColor),),
              const SizedBox(height: 8),
              Text("\$6000", overflow: TextOverflow.ellipsis, maxLines: 1,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15,fontWeight: FontWeight.bold,color: NColors.dark),),
              ],
          ),
        ),
       ),
        ],
      ),
    
    );
  }
}

