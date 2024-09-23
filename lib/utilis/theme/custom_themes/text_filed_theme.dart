import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

class NTextFormFiledTheme {
  NTextFormFiledTheme._();
  static InputDecorationTheme lightInputDecorationTheme=InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: NColors.grey,
    suffixIconColor: NColors.grey,


    labelStyle: const TextStyle().copyWith(fontSize: 14, color: NColors.black),
        hintStyle: const TextStyle().copyWith(fontSize: 14,color: NColors.black),
    errorStyle: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal),
    floatingLabelStyle: const TextStyle().copyWith( color: NColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: NColors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: NColors.grey)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: NColors.black)
    ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.red)
    ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: NColors.warning)
    ),

  );




   static InputDecorationTheme darkInputDecorationTheme=InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: NColors.grey,
    suffixIconColor: NColors.grey,


    labelStyle: const TextStyle().copyWith(fontSize: 14, color: NColors.white),
        hintStyle: const TextStyle().copyWith(fontSize: 14,color: NColors.white),
    errorStyle: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal),
    floatingLabelStyle: const TextStyle().copyWith( color: NColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: NColors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: NColors.grey)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: NColors.white)
    ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.red)
    ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: NColors.warning)
    ),

  );
}