
// import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
// import 'package:al_najah_store/common/widgets/brands/brand_card.dart';
// import 'package:al_najah_store/models/shop/brand/brand.dart';
// import 'package:al_najah_store/utilis/constants/colors.dart';
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
// import 'package:al_najah_store/utilis/helpers/images_helpers.dart';
// import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
// import 'package:al_najah_store/views/Shop/brands/all_products_brands.dart';
// import 'package:al_najah_store/views/Shop/product_details/product_detail.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NBrandShowcase extends StatelessWidget {
//   const NBrandShowcase({
//     super.key, required this.brand,
//   });

//   final Brand brand;

//   @override
//   Widget build(BuildContext context) {

//     return NRoundedContainer(
//       shawBorder: true,
//       borderColor: NColors.darkGrey,
//       backgroundColor: Colors.transparent,
//       margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
//       padding: const EdgeInsets.all(NSizes.md),
    
//       child: Column(
//         children: [
//            NBrandCard(brand: brand, showBorder: false,onTap: ()=>Get.to(()=> AllProductsByBrandScreen(brandId:brand['id'])),
// ),
//           const SizedBox(height: NSizes.spaceBtwItems),

//           // Brand Top 3 Product Images
//           Row(
//             children: (brand.id as List<dynamic>)
//     .map((product) => brandTopProductImageWidget(product, context)).take(3)
//     .toList(),

//             // children: brand['products'].map((image) => brandTopProductImageWidget(image, context)).toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget brandTopProductImageWidget(Map<String,dynamic> product, context) {
//           final productVm=ProductVM.instance;

   
//     return Expanded(
//       child: InkWell(
//          onTap: () {  
        
//         productVm.getProductDetails(product['id'].toString());
//         Get.to(()=> const ProductDetail());
//         },
//         child: NRoundedContainer(
//           height: 100,
//           backgroundColor: NHelperFunctions.isDarkMode(context) ? NColors.darkerGrey : NColors.light,
//           margin: const EdgeInsets.only(right: NSizes.sm),
//           padding: const EdgeInsets.all(NSizes.md),
//           child: ImageHandler(imageSource: product['image'],fit: BoxFit.cover,height: 0,width: 10,)
//           // Image.network(product['image'])??Image.asset(NImages.logo)
//           // Image(
//           //   image: NetworkImage(uri)??AssetImage(NImages.logo), 
//           //   fit: BoxFit.cover,
//           //   height: 10,
//           //   width: 10,
//           // ),
//         ),
//       ),
//     );
//   }
// }
