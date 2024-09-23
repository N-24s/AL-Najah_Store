import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/theme/custom_themes/appbar_theme.dart';
import 'package:al_najah_store/utilis/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:al_najah_store/utilis/theme/custom_themes/checkbox_theme.dart';
import 'package:al_najah_store/utilis/theme/custom_themes/chip_theme.dart';
import 'package:al_najah_store/utilis/theme/custom_themes/elevated_button_theme.dart';
import 'package:al_najah_store/utilis/theme/custom_themes/outlined_button_theme.dart';
import 'package:al_najah_store/utilis/theme/custom_themes/text_filed_theme.dart';
import 'package:al_najah_store/utilis/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';


class NAppTheme {
NAppTheme._();

static ThemeData lightTheme=ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: NColors.primaryColor,
  chipTheme: NChipTheme.lightChipTheme,
  appBarTheme: NAppbarTheme.lightAppbarTheme,
  checkboxTheme: NCheckboxTheme.lightCheckboxThemeData,
  bottomSheetTheme: NBottomSheetTheme.lightBottomSheetTheme,
  outlinedButtonTheme: NOutlinedButtonTheme.lightOutlinedButtonTheme,
  inputDecorationTheme: NTextFormFiledTheme.lightInputDecorationTheme,
  scaffoldBackgroundColor: Colors.white,
  textTheme: NTextTheme.lightTextTheme,
  elevatedButtonTheme: NElevatedButtonTheme.lightElevatedButtonTheme,

);
static ThemeData darkTheme=ThemeData(
    useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  primaryColor: NColors.primaryColor,
  scaffoldBackgroundColor: Colors.black,
  textTheme: NTextTheme.darkTextTheme,
    elevatedButtonTheme: NElevatedButtonTheme.darkElevatedButtonTheme,
     chipTheme: NChipTheme.darkChipTheme,
  appBarTheme: NAppbarTheme.darkAppbarTheme,
  checkboxTheme: NCheckboxTheme.darkCheckboxThemeData,
  bottomSheetTheme: NBottomSheetTheme.darkBottomSheetTheme,
  outlinedButtonTheme: NOutlinedButtonTheme.darkOutlinedButtonTheme,
  inputDecorationTheme: NTextFormFiledTheme.darkInputDecorationTheme,

);

}