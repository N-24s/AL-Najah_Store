import 'package:flutter/material.dart';

class NTextFormField extends StatelessWidget {
  const NTextFormField({
    super.key, 
    this.prefixIcon, 
    this.labelText, 
    this.suffixIcon,  
    this.controller, 
    this.validator, 
     this.obscureText=false, 
     this.onPressedSuffixIcon,
  });
 final IconData? prefixIcon;
final  String? labelText;
final IconButton? suffixIcon;
final VoidCallback? onPressedSuffixIcon;
final TextEditingController? controller;
final  String? Function(String?)?  validator;
final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText,
      controller: controller,
      validator: validator ,
      decoration:  InputDecoration(prefixIcon:Icon(prefixIcon),labelText: labelText,suffixIcon: suffixIcon),
      
    );
  }
}

