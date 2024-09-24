import 'package:al_najah_store/common/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class NProductIamgeSlider extends StatelessWidget {
   NProductIamgeSlider({
    super.key,
    required this.images,
   
  });

  List<String> images;


  @override
  Widget build(BuildContext context) {
    final dark =NHelperFunctions.isDarkMode(context);
    return NCurvedEdgeWidget(
      child: Container(
        color: dark? NColors.darkerGrey:NColors.light,
        child:  Stack(
          children: [
            // Main Large Image
             SizedBox(height: 400, child: Padding(
              padding: const EdgeInsets.all(NSizes.productImageRadius*2),
              child: Center(child: Image(image: NetworkImage(images[0]))),
            ),
            ),
    
            //Image Slider 
            Positioned(
              bottom: 30,
              right: 0,
              left: NSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox( width: NSizes.spaceBtwItems,),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (cxt,index){
                  return   NRoundedImage(
                  width: 80,
                  backgroundColor: dark? NColors.dark:NColors.white,
                  border: Border.all(color: NColors.primaryColor),
                  padding: const EdgeInsets.all(NSizes.sm),
                  imageUrl: images[index]);
                              
                              
                }),
              ),
            ),
            
    
            //AppBar Icon
    
            const NAppBar(
              showBackArrow: true,
              actions: [
                NCircularIcon(
                  icon:Iconsax.heart5,
                  color: Colors.red, 
                  ),
              ],
            ),
          
          ],
        ),
    
      ),
      );
  }
}