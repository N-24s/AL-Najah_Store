import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/sortable/sortable_products.dart';
import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/navigation_menu.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllProductsByCategoryScreen extends StatelessWidget {
  const AllProductsByCategoryScreen({super.key, this.category});
  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: NAppBar(title: const Text(NTexts.product_by_category),showBackArrow: true,leadingOnPressed:()=> Get.off(()=>NavigationMenu()),),

      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(NSizes.defaultSpace),
          child: NSortableProducts(category: category,),
           ),
     
      ),
    );
  }
}
