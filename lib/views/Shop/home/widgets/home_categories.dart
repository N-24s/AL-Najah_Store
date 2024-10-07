import 'package:al_najah_store/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_vertical_image_text_shimmer.dart';
import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/view_model_vm/shop/home/category_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NHomeCategories extends StatelessWidget {
  const NHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
   
         final categoryVm = Get.find<CategoryVM>(); 

    return Obx(
      (){
          if (categoryVm.isLoading.value) {
          return SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection:Axis.horizontal ,
          shrinkWrap: true,
          itemCount:6,
          itemBuilder: (_,index)
        {
        return NVerticalImageTextShimmer();
        }                    ),
      ); ;
        }

        if (categoryVm.errorMessage.isNotEmpty) {
          return Center(child: Text(categoryVm.errorMessage.value));
        }
      
      return  SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection:Axis.horizontal ,
          shrinkWrap: true,
          itemCount:categoryVm.categories.length,
          itemBuilder: (_,index)
        {
        return  NVerticalImageText(
          image:"${categoryVm.categories[index].image?? NImages.logo}", 
          title: "${categoryVm.categories[index].name}",onTap: ()=>(){},);
        }                    ),
      );
      }
    );

  }
}  




