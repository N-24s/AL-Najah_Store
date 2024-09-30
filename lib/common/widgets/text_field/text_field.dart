import 'package:flutter/material.dart';

class NTextField extends StatelessWidget {
  const NTextField({
    super.key, 
    this.prefixIcon, 
    this.labelText, 
    this.suffixIcon,  
    this.controller, 
     this.obscureText=false, 
     this.onPressedSuffixIcon,
  });
 final IconData? prefixIcon;
final  String? labelText;
final IconButton? suffixIcon;
final VoidCallback? onPressedSuffixIcon;
final TextEditingController? controller;
final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:obscureText,
      controller: controller,
      decoration:  InputDecoration(prefixIcon:Icon(prefixIcon),labelText: labelText,suffixIcon: suffixIcon),
      
    );
  }
}

