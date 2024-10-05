import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/device/device_utility.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/search/search_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NSearchContainer extends StatelessWidget {
  const NSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: NSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = NHelperFunctions.isDarkMode(context);
    
    return Padding(
      padding: padding,
      child: Container(
        height: 70,
        width: NDeviceUtils.getScreenwidth(context),
        padding: const EdgeInsets.all(NSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? (dark ? NColors.dark : NColors.light) : Colors.transparent,
          borderRadius: BorderRadius.circular(NSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: NColors.grey) : null,
        ),
        child: TextField(
          onTap: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          decoration: InputDecoration(
            labelText: text,
            prefixIcon: Icon(icon),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

