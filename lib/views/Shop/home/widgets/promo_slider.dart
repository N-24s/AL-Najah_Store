

import 'package:al_najah_store/common/custom_shapes/containers/circular_container.dart';
import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/shop/home/home_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class NPromoSlider extends StatelessWidget {
  const NPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>(); 
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => NRoundedImage(imageUrl: url, isNetworkImage: false)).toList(),
        ),
        
        const SizedBox(height: NSizes.spaceBtwItems,),
        
        Obx(
          () =>   Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i <banners.length; i++)
                NCircularContainer(
                  margin: EdgeInsets.only(right: 10,),
                  width: 20,
                  height: 4,
                  backgroundColor: controller.carouselCurrentIndex.value == i ? NColors.primaryColor : NColors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

