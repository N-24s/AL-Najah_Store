
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.put<HomeController>(HomeController()); // استخدم Get.find بدلاً من Get.put هنا

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }
}

