// import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
// import 'package:al_najah_store/common/widgets/images/n_circular_image.dart';
// import 'package:al_najah_store/utilis/constants/colors.dart';
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';


// class NBrandCard extends StatelessWidget {
//   const NBrandCard(  {
//     super.key, 
//     required this.showBorder, 
//     this.onTap,
//      required this.image,
//   });
//   final bool showBorder;
//   final void Function()? onTap;
//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//     onTap: onTap,
//      child: NRoundedContainer(
//       padding: const EdgeInsets.all(NSizes.sm),
//       shawBorder: showBorder,
//       backgroundColor: Colors.transparent,
//       child: Row(
//         children: [
//           //Icon
     
//                     //here replace NImages.facebook to NImages.clothIcon
//           Flexible(
//             child: NCircularImage(
//               imageUrl: image,
//               isNetworkImage: false,
//               backgroundColor: Colors.transparent,
//               overlayColor: NHelperFunctions.isDarkMode(context)?NColors.white:NColors.black,
//               ),
//           ),
//      const SizedBox(height: NSizes.spaceBtwItems/2),
     
//      //Text 
//      Expanded(
//        child: Column(
//         mainAxisSize: MainAxisSize.min ,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
          
//           NBrandTitleWithVerifiedIcon(title: 'Mi', brandTextSize: TextSize.large,),
//           Text(
//             '256 Produtcs',
//             overflow: TextOverflow.ellipsis,
//             style: Theme.of(context).textTheme.labelMedium,
//           ),
//         ],
//        ),
//      ),
     
//         ],
//       ),
//      ),
                 
//                        );
//   }
// }

