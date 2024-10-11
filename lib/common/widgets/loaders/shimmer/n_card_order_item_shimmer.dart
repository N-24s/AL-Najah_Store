import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

class NOrderItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = NHelperFunctions.isDarkMode(context);

    return NRoundedContainer(
      shawBorder: true,
      padding: const EdgeInsets.all(NSizes.md),
      backgroundColor: dark ? NColors.dark : NColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1 (Status & Date)
          Row(
            children: [
              // Shimmer for Icon
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const Icon(Iconsax.ship, size: NSizes.iconSm),
              ),
              const SizedBox(width: NSizes.spaceBtwItems / 2),

              // Shimmer for Status & Date
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status shimmer
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 16,
                        width: 100,
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Date shimmer
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 14,
                        width: 80,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),

              // Shimmer for right icon
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const Icon(Iconsax.arrow_right_34, size: NSizes.iconSm),
              ),
            ],
          ),
          const SizedBox(height: NSizes.spaceBtwItems),

          // Row 2 (Order and Shipping Date)
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    // Icon shimmer
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: const Icon(Iconsax.tag, size: NSizes.iconSm),
                    ),
                    const SizedBox(width: NSizes.spaceBtwItems / 2),

                    // Order ID shimmer
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // "Order" label shimmer
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 14,
                              width: 50,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // ID shimmer
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 14,
                              width: 40,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    // Shipping date icon shimmer
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: const Icon(Iconsax.calendar, size: NSizes.iconSm),
                    ),
                    const SizedBox(width: NSizes.spaceBtwItems / 2),

                    // Shipping date shimmer
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // "Shipping Date" label shimmer
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 14,
                              width: 90,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Date shimmer
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 14,
                              width: 70,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
