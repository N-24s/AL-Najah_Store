import 'package:al_najah_store/common/widgets/brands/brand_show_case.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NCategoryTab extends StatelessWidget {
  const NCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
ProductVM productVM=ProductVM();
    return    ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: [
        Padding(
                  padding: EdgeInsets.all(NSizes.defaultSpace),
                  child: Column(
                    children: [
                       // --Brand 
                         for(int i=0; i<2;i++)
                      NBrandShowcase(images: [
                        for(int i=0; i<3;i++)
                        NImages.logo
                      ],),
                        const SizedBox(height: NSizes.spaceBtwItems),
        
                      // Products
                      NSectionHeading(title: 'You might like', onPressed: (){},),
                        const SizedBox(height: NSizes.spaceBtwItems),
                        NGridLayout(
                          itemCount: productVM.products.length, 
                          itemBuilder: (_,index)=> NProductCardVertical(product: productVM.products[index],)),
                  const SizedBox(height: NSizes.spaceBtwSections),

        
                    ],
                  ),
                ),
      ],
    );
  }
}