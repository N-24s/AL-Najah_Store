import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NBrandCardShimmer extends StatelessWidget {
  const NBrandCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NGridLayout(
      itemCount: 4,
      mainAxisExtent: 80,
      itemBuilder: (_, index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              // Shimmer for the brand logo
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 16), // Update to horizontal space
              
              // Shimmer for the text
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand name shimmer placeholder
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 20,
                      width: 50,
                      color: Colors.grey[300]!,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Shimmer for the product count
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 16,
                      width: 50,
                      color: Colors.grey[300]!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}


// import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart'; 

// class NBrandCardShimmer extends StatelessWidget {
//   const NBrandCardShimmer({
//     super.key,
//   });


//   @override
//   Widget build(BuildContext context) {

//      return  NGridLayout(
//        itemCount: 4,
//          mainAxisExtent: 80, 
//          itemBuilder: (_,index){
//          return  Container(
//           padding: const EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//         border:  Border.all(color: Colors.grey[300]!) ,
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.transparent,
//       ),
//       child: Row(
//         children: [
//           // Shimmer for the brand logo 
//           Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: Container(
//               height: 46,
//               width: 46,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300]!,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
    
//           // Shimmer for the text
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Brand name shimmer placeholder
//                 Shimmer.fromColors(
//                   baseColor: Colors.grey[300]!,
//                   highlightColor: Colors.grey[100]!,
//                   child: Container(
//                     height: 20,
//                     width: 120,
//                     color: Colors.grey[300]!,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
    
//                 // Shimmer for the product count
//                 Shimmer.fromColors(
//                   baseColor: Colors.grey[300]!,
//                   highlightColor: Colors.grey[100]!,
//                   child: Container(
//                     height: 16,
//                     width: 80,
//                     color: Colors.grey[300]!,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//      );});
//   }
// }
