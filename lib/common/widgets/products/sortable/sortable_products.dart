
// import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';


// class NSortableProducts extends StatelessWidget {
//   const NSortableProducts({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         //Dropdown
//         DropdownButtonFormField(
//           decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
//           onChanged: (value) { },
//           items:['Name','Higher Price','Sale','Newest','Popularity']
//           .map((option)=>DropdownMenuItem(value: option,child: Text(option))).toList()
          
//            ),
    
//            const SizedBox(height: NSizes.spaceBtwSections,),
    
//            //Products
    
//            NGridLayout(
//             itemCount: products.length, 
//            itemBuilder: (cxt,index)=>NProductCardVertical(product:products[index],))
        
//       ],
//     );
//   }
// }