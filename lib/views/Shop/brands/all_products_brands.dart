import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/sortable/sortable_brands.dart';
import 'package:al_najah_store/navigation_menu.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllProductsByBrandScreen extends StatelessWidget {
   AllProductsByBrandScreen({super.key, this.brandId});
  final int? brandId;
  final brandVm =BrandVm.instance;


  @override
  Widget build(BuildContext context) {

    return    Scaffold(
      appBar: NAppBar(title: const Text("Products By Brand"),showBackArrow: true,leadingOnPressed: ()=>Get.off(()=>const NavigationMenu()),),

      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(NSizes.defaultSpace),
          child: NSortableProductsByBrands(brand: brandVm.allBrands[brandId!],),
           ),
     
      ),
    );
  }
}
