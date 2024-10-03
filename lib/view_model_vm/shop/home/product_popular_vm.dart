import 'dart:convert';
import 'package:al_najah_store/main.dart';
import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class ProductPopularVm extends GetxController {
    // static ProductPopularVm get instance => Get.put<ProductPopularVm>(ProductPopularVm()); 

ProductPopularVm(){
fetchProductsPopular();

}

 var productPopular = <Product>[].obs;
    var isLoading = false.obs; 
  var errorMessage = ''.obs;


    Future<void> fetchProductsPopular() async {
    try {
      isLoading(true); 
      errorMessage(''); 

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getProductPopular);

      if (response.statusCode == 200) {
        
        var jsonData = response.data;
           List<dynamic> productData = jsonData['Product'];
        productPopular.value = productData
            .map((categoryJson) => Product.fromJson(categoryJson))
            .toList();
          
  


      }
    } on DioException catch (d) {
      ApiException.handleException(d); 
    } catch (e) {
      errorMessage('Error: $e'); 
    } finally {
      isLoading(false); 
    }
  }
 
}

