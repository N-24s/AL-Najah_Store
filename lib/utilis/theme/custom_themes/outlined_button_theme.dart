import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

class NOutlinedButtonTheme {
  NOutlinedButtonTheme._();
  static final lightOutlinedButtonTheme=OutlinedButtonThemeData(

    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: NColors.black,
      side: const BorderSide(color: NColors.primaryColor),
      textStyle: const TextStyle(fontSize: 16, color: NColors.black,fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );


    static final darkOutlinedButtonTheme=OutlinedButtonThemeData(

    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: NColors.white,
      side: const BorderSide(color: Colors.greenAccent),
      textStyle: const TextStyle(fontSize: 16, color: NColors.white,fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}