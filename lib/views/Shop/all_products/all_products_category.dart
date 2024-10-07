import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/sortable/sortable_products.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class AllProductsByCategoryScreen extends StatelessWidget {
  const AllProductsByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: NAppBar(title: Text("All Products"),showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(NSizes.defaultSpace),
          child: NSortableProducts(),
           ),
     
      ),
    );
  }
}
