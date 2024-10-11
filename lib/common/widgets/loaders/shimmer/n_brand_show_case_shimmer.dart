import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; 

class NBrandShowcaseShimmer extends StatelessWidget {
  const NBrandShowcaseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          // Shimmer for the brand card (icon + text)
          _buildShimmerBrandCard(),

          const SizedBox(height: 16.0),

          // Shimmer for the product images (3 placeholders)
          Row(
            children: List.generate(3, (index) => _buildShimmerProductImage(context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerBrandCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          // Shimmer for the brand logo (circular placeholder)
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.grey[300]!,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),

          // Shimmer for the brand name and product count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand name shimmer placeholder
                Container(
                  height: 20,
                  width: 120,
                  color: Colors.grey[300]!,
                ),
                const SizedBox(height: 8),

                // Product count shimmer placeholder
                Container(
                  height: 16,
                  width: 80,
                  color: Colors.grey[300]!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerProductImage(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 100,
          margin: const EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[300]!,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
