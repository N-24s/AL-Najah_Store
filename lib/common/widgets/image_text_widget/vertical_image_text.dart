import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/utilis/helpers/images_helpers.dart';
import 'package:flutter/material.dart';


class NVerticalImageText extends StatelessWidget {
  const NVerticalImageText({
    super.key, 
 
    this.textColor=NColors.white, 
    this.backgroundColor, 
    this.onTap, 
    required this.category,
  });

final CategoryModel category;
final Color textColor;
final Color? backgroundColor;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
   final dark= NHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: NSizes.spaceBtwItems),
        child: Column(
             children: [
              //Circular Icon
              Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(NSizes.sm),
                decoration: BoxDecoration(
                  color:backgroundColor?? (dark?NColors.black:NColors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: ImageHandler(imageSource: category.image,fit: BoxFit.cover,)
                  
                  // Image.asset(
                  //  category.image!,fit: BoxFit.cover,
                  //   //  color:dark?NColors.light:NColors.dark 
                  //   ),
                ),
              ),
                  const SizedBox( height: NSizes.spaceBtwItems/2,),
        
              SizedBox(
                width: 55,
                child: Text(category.name, style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                ),
              ),
        
             ],
          ),
      ),
    );
  }
}

