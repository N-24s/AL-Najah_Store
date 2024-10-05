import 'package:get/get.dart';

class ProductImageVM extends GetxController {
  var selectedImage = ''.obs;
  void setSelectedImage(String imageUrl) {
    selectedImage.value = imageUrl;
  }
}
