import 'package:al_najah_store/common/custom_shapes/containers/circular_container.dart';
import 'package:al_najah_store/common/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

class NPrimaryHeaderContainer extends StatelessWidget {
  const NPrimaryHeaderContainer({
    super.key, required this.child,
  });
final Widget child;
  @override
  Widget build(BuildContext context) {
    return NCurvedEdgeWidget(
      child: Container(
        // height: 400,
            color: NColors.primaryColor,
            padding: const EdgeInsets.all(0),
            child:  SizedBox(
// if[size.infinite : is not true in stack] error ouccured -> Read README.md file at[]
              child: Stack(
    children: [

      //Background  custom shapes
      Positioned(top: -150,right: -250 ,child: NCircularContainer(backgroundColor: NColors.textWhite.withOpacity(0.1),)),
      Positioned( top: 100,right: -300,child: NCircularContainer(backgroundColor: NColors.textWhite.withOpacity(0.1),)),
     child,          
    ],
              ),
            ),
          ) ,);
  }
}

