// Dailog 
import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ShowDailogs {
  
static removeFromCartDialog(var objects, String title){
Get.defaultDialog(
  title: "حذف $title",
  middleText: "هل انت متاكد من حذف  $title ?",
  onConfirm: (){
    objects;
     Get.back();
    NLoaders.errorSnackBar(title:"تم الحذف بنجاح");
  
  },
  
  onCancel: () { 
    ()=>Get.back();},
);
}


  
}

