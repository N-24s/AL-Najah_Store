import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/utilis/helpers/images_helpers.dart';
import 'package:flutter/material.dart';


class NCircularImage extends StatelessWidget {
  const NCircularImage({
    super.key, 
     this.width=56, 
    this.height=56, 
    this.padding=NSizes.sm,
     required this.imageUrl, 
     this.overlayColor, 
     this.backgroundColor, 
     this.fit, 
     this.isNetworkImage=false,
  });
    final double width,height,padding;
   final String? imageUrl;
    // final bool applyImageRadius;
    final Color? overlayColor;
    //  final BoxBorder? border;
      final Color? backgroundColor;
       final BoxFit? fit;
       final bool isNetworkImage;
    //  final VoidCallback? onPressed;
    //  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:backgroundColor?? (NHelperFunctions.isDarkMode(context)?NColors.black:NColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child:  Center(
        child:ImageHandler(imageSource: imageUrl,fit: fit),
        //  Image(
        //   fit: fit,
        //   image:isNetworkImage? NetworkImage(imageUrl):AssetImage(imageUrl) as ImageProvider,
        //   // color: overlayColor
        //   ),
      ),
    );
  }
}