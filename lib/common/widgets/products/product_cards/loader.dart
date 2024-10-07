// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class ProductCardLottieLoader extends StatelessWidget {
//   const ProductCardLottieLoader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 180,
//       padding: const EdgeInsets.all(1),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Lottie animation placeholder
//           Container(
//             height: 100,
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Lottie.asset(
//                 'assets/lottie/loading_animation.json', // ضع هنا مسار الملف
//                 width: 80,
//                 height: 80,
//               ),
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           // Placeholder for title
//           Container(width: 100, height: 20, color: Colors.grey[300]),
//           const SizedBox(height: 4.0),
//           // Placeholder for brand
//           Container(width: 60, height: 15, color: Colors.grey[300]),
//           const Spacer(),
//           // Placeholder for price row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Container(width: 60, height: 20, color: Colors.grey[300]),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   color: Colors.grey[300],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
