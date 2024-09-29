import 'package:al_najah_store/common/custom_shapes/containers/search_container.dart';
import 'package:al_najah_store/common/widgets/appbar/tabbar.dart';
import 'package:al_najah_store/common/widgets/brands/brand_card.dart';
import 'package:al_najah_store/common/widgets/layouts/grid_layout.dart';
import 'package:al_najah_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/home/category_vm.dart';
import 'package:al_najah_store/views/Shop/store/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StoreScreen extends StatelessWidget {
  
     final List<Tab> myTabs = List.generate(3, (index) {
    return Tab(text: 'Tab ${index + 1}');
  });
   StoreScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
             final categoryVm = Get.find<CategoryVM>(); 
             return Scaffold(
              body: 
 Obx(() {
        if (categoryVm.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
    return DefaultTabController(
      length: categoryVm.categories.length,
      child: Scaffold(
      
        //AppBar
        appBar: AppBar(
          title:   Text("Store",style: Theme.of(context).textTheme.headlineMedium,),
      
          actions: [
            NCartCounterIcon(onPressed: (){})
          ],
        ),
      
        //Header
        body: NestedScrollView(headerSliverBuilder: (_,innerBoxIsScrolled){
          return[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: NHelperFunctions.isDarkMode(context)?NColors.black:NColors.white,
              expandedHeight: 440,
      
              flexibleSpace:  Padding(
                padding:const EdgeInsets.all(NSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search bar 
                     const SizedBox(height: NSizes.spaceBtwItems,),
                    const NSearchContainer(text: '', showBorder:  true,showBackground: false, padding: EdgeInsets.zero,),
                     const SizedBox(height: NSizes.spaceBtwSections,),
      
                     //Featured Brands
                     NSectionHeading(
                      title: 'Featured Brands', 
                      onPressed: (){}),
                      const SizedBox(height: NSizes.spaceBtwItems/1.5,),
      // Brand Grid
                    NGridLayout(
                      itemCount: 1,
                      mainAxisExtent: 80, 
                      itemBuilder: (_,index){
                      return  NBrandCard(
                        image:NImages.logo,
                        showBorder: false,);
                    })
      
      
      
                  ],
                ),
                 ),
      
                 //Tab
                 bottom:  NTabBar( 
                   tabs: categoryVm.categories.map((category) => Tab(text: category.name)).toList(),
                 )
            ),
      
          ];
        },
        //Body
         body:  TabBarView(
          children:  categoryVm.categories.map((category) {
                return NCategoryTab(categoryId: category.id);
              }).toList(),
          
       
            
        


         )),
      ),
    );
  }),
             );
             

  }
  }