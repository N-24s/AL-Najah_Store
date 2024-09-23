import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/device/device_utility.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class NTabBar extends StatelessWidget implements PreferredSizeWidget {
  const NTabBar({super.key, required this.tabs});
final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark =NHelperFunctions.isDarkMode(context);
    return Material(
      color: dark? NColors.black:NColors.white,
      child: TabBar(
        tabs:tabs, 
        isScrollable: true,
                  indicatorColor: NColors.primaryColor,
                  unselectedLabelColor: NColors.darkGrey,
                  labelColor: dark?NColors.white:NColors.primaryColor,
                
        ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(NDeviceUtils.getAppBarHeight());
}