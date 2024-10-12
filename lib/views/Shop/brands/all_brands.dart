import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/brands/brand_card.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/view_model_vm/shop/brand/brand_vm.dart';
import 'package:al_najah_store/views/Shop/brands/all_products_brands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final brandVM=BrandVm.instance;


    return  Scaffold(
      appBar: const NAppBar(title: Text(NTexts.brands), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              //Heading ,
              const NSectionHeading(title: NTexts.brands,showActionButton: false),
              const SizedBox(height: NSizes.spaceBtwItems),


              //Brands
              Obx(
               (){
                if(brandVM.isLoading.value){
                  return const Center(child:  CircularProgressIndicator(

                  ),);
                }
                
                return  NGridLayout(
                  itemCount: brandVM.allBrands.length, 
                  mainAxisExtent: 80,
                  
                  
                  itemBuilder: (cxt,index)=>NBrandCard(
                     
                    showBorder: true,
                   onTap: (){Get.to(()=> AllProductsByBrandScreen(brandId:brandVM.allBrands[index].id));
                      brandVM.fetchProductByBrands(brandVM.allBrands[index].id.toString());

                   },
                    brand: brandVM.allBrands[index])
                    );
  }),

            ],
          ), 
          ),
      ),
    );
  }
}