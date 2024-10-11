import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';


class AllProductsByBrandScreen extends StatelessWidget {
  const AllProductsByBrandScreen({super.key, this.brandId});
  final int? brandId;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const NAppBar(title: Text("Products By Brand"),showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(NSizes.defaultSpace),
          // child: NSortableProductsByBrands(brandId:brandId),
           ),
     
      ),
    );
  }
}
