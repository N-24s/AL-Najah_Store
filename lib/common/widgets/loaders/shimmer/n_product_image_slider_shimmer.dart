import 'package:al_najah_store/common/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/icons/n_circular_icon.dart';
import 'package:al_najah_store/common/widgets/images/n_rounded_image.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

class NProductImageSliderShimmer extends StatelessWidget {
  const NProductImageSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = false; 
    return NCurvedEdgeWidget(
      child: Container(
        color: dark ? NColors.darkerGrey : NColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(NSizes.productImageRadius * 2),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 400,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 30,
              right: 0,
              left: NSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: NRoundedImage(
                        isNetworkImage: true,
                        width: 80,
                        backgroundColor: dark ? NColors.dark : NColors.white,
                        border: Border.all(
                          color: NColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(NSizes.sm),
                        imageUrl: '', 
                      ),
                    ),
                    const SizedBox(width: NSizes.spaceBtwItems),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: NRoundedImage(
                        isNetworkImage: true,
                        width: 80,
                        backgroundColor: dark ? NColors.dark : NColors.white,
                        border: Border.all(
                          color: NColors.grey,
                        ),
                        padding: const EdgeInsets.all(NSizes.sm),
                        imageUrl: '', 
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // AppBar Icon
            NAppBar(
              showBackArrow: true,
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: const NCircularIcon(
                    icon: Iconsax.heart, 
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
