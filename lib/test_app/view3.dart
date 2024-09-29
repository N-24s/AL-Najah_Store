import 'package:al_najah_store/test_app/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class View3 extends StatelessWidget {
  const View3({super.key});

  @override
  Widget build(BuildContext context) {
    List name=['dell', 'iphone','LT'];
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 200),
        child: ListView.builder(
         itemCount: name.length,
         itemBuilder:(ctx,index)=>Padding(
           padding: const EdgeInsets.all(20.0),
           child: GestureDetector(
            onTap: (){
              Get.to(viewtest(name: name[index],));
            },
             child: Container(
                     child: Text("${name[index]}"),
                   ),
           ),
         ), ),
      ),
    );
  }
}