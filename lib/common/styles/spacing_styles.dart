import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';

class NSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight=EdgeInsets.only(
      top: NSizes.appBarHeight,
          left: NSizes.defaultSpace,
          bottom: NSizes.defaultSpace,
          right: NSizes.defaultSpace,
  );
}