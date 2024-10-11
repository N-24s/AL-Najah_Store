import 'package:al_najah_store/common/widgets/loaders/shimmer/n_product_image_slider_shimmer.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NProductDetailsShimmer extends StatelessWidget {
  const NProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildShimmerBottomWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildShimmerProductImageSlider(),
            _buildShimmerProductDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerBottomWidget() {
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 100,
            height: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerProductImageSlider() {
    return const NProductImageSliderShimmer(); 
  }

  Widget _buildShimmerProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(NSizes.defaultSpace),
      child: Column(
        children: [
          _buildShimmerMetaData(),
          const SizedBox(height: NSizes.spaceBtwSections),
          _buildShimmerDescription(),
          const SizedBox(height: NSizes.spaceBtwSections),
          _buildShimmerSimilarProducts(),
        ],
      ),
    );
  }

  Widget _buildShimmerMetaData() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            color: Colors.white,
            width: double.infinity,
          ),
          const SizedBox(height: 8),
          Container(
            height: 20,
            color: Colors.white,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerDescription() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NSectionHeading(title: "Description", showActionButton: false),
          const SizedBox(height: NSizes.spaceBtwItems),
          Container(
            height: 60,
            color: Colors.white,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerSimilarProducts() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          const NSectionHeading(title: "Similar Products", showActionButton: true),
          SizedBox(
            height: 100,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: NSizes.spaceBtwItems),
              scrollDirection: Axis.horizontal,
              itemCount: 3, 
              itemBuilder: (_, index) {
                return Container(
                  width: 80,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
