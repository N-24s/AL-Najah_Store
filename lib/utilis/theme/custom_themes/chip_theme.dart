import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

class NChipTheme {
  NChipTheme._();
  static ChipThemeData lightChipTheme=ChipThemeData(
    disabledColor: NColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: NColors.black),
    selectedColor: NColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    checkmarkColor: NColors.white
  );

    static ChipThemeData darkChipTheme=ChipThemeData(
    disabledColor: NColors.grey,
    labelStyle: const TextStyle(color: NColors.white),
    selectedColor: NColors.primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 12),
    checkmarkColor: NColors.white
  );
}