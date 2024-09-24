import 'package:al_najah_store/common/custom_shapes/containers/circular_container.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class NChoiceChip extends StatelessWidget {
  const NChoiceChip({
    super.key, 
    required this.text, 
    required this.selected, 
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final iconColor=NHelperFunctions.getColor(text)!=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: iconColor?const SizedBox(): Text(text), 
        selected: selected,
        onSelected:onSelected,
        labelStyle:   TextStyle(color: selected?NColors.white:null),
        avatar: iconColor? NCircularContainer(
          width: 50,height: 50,backgroundColor:NHelperFunctions.getColor(text)!):null,
          
      labelPadding: iconColor? const EdgeInsets.all(0):null,
       shape:  iconColor  ? const CircleBorder():null ,
       padding: iconColor ? const EdgeInsets.all(0):null,
      //  selectedColor: Colors.green,
       backgroundColor:iconColor
       ?NHelperFunctions.getColor(text)!:null,
        ),
    );
  }
}