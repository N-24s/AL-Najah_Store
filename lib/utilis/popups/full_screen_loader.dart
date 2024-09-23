import 'package:al_najah_store/common/widgets/loaders/animation_loader_widget.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NFullScreenLoader {

  static void openLoadingDialog(String text, String animation){
    showDialog(
      context: Get.overlayContext!, 
      barrierDismissible: false,
      builder: (_)=> PopScope(
        child: Container(
          color:  NHelperFunctions.isDarkMode(Get.context!)? NColors.dark:NColors.white,
          width:  double.infinity,
          height: double.infinity,
          child: Column(
            children:  [
              const SizedBox(height: 250,),
              NAnimationLoaderWidget(text: text,animation: animation,),
            ],
          ),
        )));

  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}

