import 'dart:convert';
import 'package:al_najah_store/models/shop/category.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class CategoryVM extends GetxController {
    static CategoryVM get instance => Get.put<CategoryVM>(CategoryVM()); 

CategoryVM(){
fetchCategories();

}

  var categories = <CategoryModel>[].obs;
    var isLoading = false.obs; 
  var errorMessage = ''.obs;


    Future<void> fetchCategories() async {
    try {
      isLoading(true); 
      errorMessage(''); 

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getAllCategories);

      if (response.statusCode == 200) {
        
        var jsonData = response.data;
           List<dynamic> categoryData = jsonData['data'];
        categories.value = categoryData
            .map((categoryJson) => CategoryModel.fromJson(categoryJson))
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

