// import 'package:al_najah_store/test_app/vm.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// class View2 extends StatelessWidget {
//   const View2({super.key});

//   @override
//   Widget build(BuildContext context) {
// final v=Provider.of<vmPro>(context);
//     return  Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child:  ListView.builder(
//           itemCount: v.cartName.length,
//           itemBuilder: (context,index) {
//             return Row(
//               children: [
//                 Text("${v.cartName[index].keys}"),
//                Text("${v.cartName[index].values}"),

//               ],
//             );
//           }
//         ),
//       ),
//     );
//   }
// }