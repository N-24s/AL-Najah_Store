import 'package:get/get.dart';

class ProductImageVM extends GetxController {
  var selectedImage = ''.obs;

  // تعيين الصورة الرئيسية المختارة
  void setSelectedImage(String imageUrl) {
    selectedImage.value = imageUrl;
  }
}
