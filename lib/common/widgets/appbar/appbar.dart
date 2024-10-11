import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/device/device_utility.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NAppBar({super.key, this.title,  this.showBackArrow=true, this.leadingIcon, this.actions, this.leadingOnPressed});
final Widget? title;
final bool showBackArrow;
final IconData? leadingIcon;
final List<Widget>? actions;
final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: NSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading:showBackArrow 
        ? IconButton(onPressed: leadingOnPressed??()=>Get.back(), 
        icon: Icon(Iconsax.arrow_left,color: dark?NColors.white:NColors.dark,))
        :leadingIcon !=null
        ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)):null ,
        title: title,
        actions: actions,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(NDeviceUtils.getAppBarHeight());
}