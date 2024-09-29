import 'dart:convert';
import 'package:al_najah_store/main.dart';
import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class ProductByCategoryVm extends GetxController {
    static ProductByCategoryVm getinstance(String categoryId) => Get.put<ProductByCategoryVm>(ProductByCategoryVm(categoryId)); 
         var productByCategory = <Product>[].obs;
          var isLoading = false.obs; 
        var errorMessage = ''.obs;
                    final String categoryId; 


  ProductByCategoryVm(this.categoryId);


  

  @override
  void onInit() {
    super.onInit();
    fetchProductsByCategory(categoryId); 
  }





    Future<void> fetchProductsByCategory(String categoryId) async {
    try {
      isLoading(true); 
      errorMessage(''); 

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getProductByCategory+categoryId);

      if (response.statusCode == 200) {
        
        var jsonData = response.data;
           List<dynamic> productData = jsonData['data'];
           print("LISSSSSSSSSSSSSSSSSS${productData}");
        productByCategory.value = productData.map((categoryJson) => Product.fromJson(categoryJson)).toList();
       
print(productByCategory.length);

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

