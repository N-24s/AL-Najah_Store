import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

class NElevatedButtonTheme {
  NElevatedButtonTheme._();

  static final lightElevatedButtonTheme=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
elevation: 0,
foregroundColor: NColors.white,
backgroundColor: NColors.primaryColor,
disabledForegroundColor: NColors.grey,
disabledBackgroundColor: NColors.grey,
side: const BorderSide(color: NColors.primaryColor),
padding: const EdgeInsets.symmetric(vertical: 18),
textStyle: const TextStyle(fontSize: 16, color: NColors.white, fontWeight: FontWeight.w600),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),




    )
  );


    static final darkElevatedButtonTheme=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
elevation: 0,
foregroundColor: NColors.white,
backgroundColor: NColors.primaryColor,
disabledForegroundColor: NColors.grey,
disabledBackgroundColor: NColors.grey,
side: const BorderSide(color: NColors.primaryColor),
padding: const EdgeInsets.symmetric(vertical: 18),
textStyle: const TextStyle(fontSize: 16, color: NColors.white, fontWeight: FontWeight.w600),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),




    )
  );
}