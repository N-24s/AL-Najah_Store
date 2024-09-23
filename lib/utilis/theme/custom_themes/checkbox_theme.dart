import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

class NCheckboxTheme {
NCheckboxTheme._();

static CheckboxThemeData lightCheckboxThemeData= CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  checkColor: MaterialStateProperty.resolveWith((states){
    if(states.contains(MaterialState.selected)){
      return Colors.black;
    }
    return Colors.transparent;
  }),
  fillColor: MaterialStateProperty.resolveWith((states){
    if(states.contains(MaterialState.selected)){
      return NColors.primaryColor;
    }
    return Colors.transparent;
  })
);


static CheckboxThemeData darkCheckboxThemeData= CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  checkColor: MaterialStateProperty.resolveWith((states){
    if(states.contains(MaterialState.selected)){
      return Colors.white;
    }
    return Colors.black;
  }),
  fillColor: MaterialStateProperty.resolveWith((states){
    if(states.contains(MaterialState.selected)){
      return NColors.primaryColor;
    }
    return Colors.transparent;
  })
);



}