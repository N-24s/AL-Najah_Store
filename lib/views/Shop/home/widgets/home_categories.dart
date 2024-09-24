import 'package:al_najah_store/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NHomeCategories extends StatelessWidget {
  List<String> image;
   NHomeCategories({
    required this.image,
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection:Axis.horizontal ,
        shrinkWrap: true,
        itemCount: image.length,
        itemBuilder: (_,index)
      {
      return  NVerticalImageText(
        image: image[index], 
        title: 'Shoes',onTap: ()=>(){},);
      }                    ),
    );
  }
}

