import 'package:al_najah_store/test_app/view2.dart';
import 'package:al_najah_store/test_app/vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class viewtest extends StatelessWidget {
  const viewtest({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    GetStorage storage=GetStorage();
                  final v =Provider.of<vmPro>(context);
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: 
        Column(
           children: [

            Text("${name}"),
             Row(
                children: [
                  IconButton(onPressed: (){
                    v.addProductToCart(name);
                  }, icon: Icon(Icons.add)),
                  Text("${v.items.length}"),
                  IconButton(onPressed: (){
                    v.decrementProductQuantity(name);
                  }, icon: Icon(Icons.remove)),
              
                ],
              ),
   ElevatedButton(onPressed: (){
    print(name);
    v.addProductToCart(name);
   }, child: Text("Add")),
   SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                print(storage.read("cart"));
                
              }, child: Text("View2"))
           ],
         ),
        ),
      );
    
  }
}