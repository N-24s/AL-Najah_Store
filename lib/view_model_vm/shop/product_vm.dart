import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductVM extends GetxController {
  ProductVM() {
    fetchProducts();
  }

  var products = <Product>[].obs;
  var top3Product = <Product>[].obs; 
  List<Map<String,dynamic>>? productDetails;
  var isLoading = false.obs; 
  var errorMessage = ''.obs;

  Future<void> fetchProducts() async {
    try {
      isLoading(true); 
      errorMessage(''); 

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getAllProduct);

      if (response.statusCode == 200) {
        var jsonData = response.data;

 
        Products productData = Products.fromJson(jsonData);

        products.value = productData.data.data; 
        top3Products(); 
      }
    } on DioException catch (d) {
      ApiException.handleException(d); 
    } catch (e) {
      errorMessage('Error: $e'); 
    } finally {
      isLoading(false); 
    }
  }

  Future<void> getProductDetails(String product_id) async {
    try {
    
      isLoading(true); 
      errorMessage(''); 

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getProductDetails+'1');

      if (response.statusCode == 200) {
        var jsonData = response.data;
 
        dynamic productData = Product.fromJson(jsonData['data']['similar_products']);
        productDetails = productData; 
        print("$productDetails");
      }
    } on DioException catch (d) {
      ApiException.handleException(d); 
    } catch (e) {
      errorMessage('Error: $e'); 
    } finally {
      isLoading(false); 
    }
  }



  void top3Products() {
    top3Product.value = products.take(3).toList(); 
  }
}

