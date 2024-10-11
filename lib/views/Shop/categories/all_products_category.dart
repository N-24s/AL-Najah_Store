import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/sortable/sortable_products.dart';
import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';


class AllProductsByCategoryScreen extends StatelessWidget {
  const AllProductsByCategoryScreen({super.key, this.category});
  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const NAppBar(title: Text("Products By Categories"),showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(NSizes.defaultSpace),
          child: NSortableProducts(category: category,),
           ),
     
      ),
    );
  }
}
