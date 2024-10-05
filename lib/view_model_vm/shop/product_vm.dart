import 'package:al_najah_store/models/shop/search_suggestion.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/models/shop/product_dateils.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductVM extends GetxController {
  ProductVM() {
    fetchProducts();
  }
// varibles
//All Products
  var products = <Product>[].obs;

  // Similar Product By ID
  var similarProduct=<SimilarProduct>[].obs ;
  //Product By Id
  var producDetails=Product.empty().obs;

  var isLoading = false.obs; 
  var errorMessage = ''.obs;

  // Future<void> fetchProducts() async {
  //   try {
  //     isLoading(true); 
  //     errorMessage(''); 

  //     HttpHelpers http = HttpHelpers.instance;
  //     final response = await http.getRequest(url: HttpUrls.getAllProduct);

  //     if (response.statusCode == 200) {
  //       var jsonData = response.data;

 
  //       Products productData = Products.fromJson(jsonData);

  //       products.value = productData.data.data; 
  //     }
  //   } on DioException catch (d) {
  //     ApiException.handleException(d); 
  //   } catch (e) {
  //     errorMessage('Error: $e'); 
  //   } finally {
  //     isLoading(false); 
  //   }
  // }

 
 
  Future<void> getProductDetails(String product_id) async {
    try {
    
      isLoading(true); 
      errorMessage(''); 

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getProductDetails+product_id);

      if (response.statusCode == 200) {
        var jsonData = response.data;
                 Product product = Product.fromJson(jsonData['data']);
                 List<SimilarProduct> similarProducts = (jsonData['data']['similar_products'] as List)
    .map((item) => SimilarProduct.fromJson(item))
    .toList();
                 producDetails.value = product; 
                  similarProduct.value = similarProducts; 
       

      }
    } on DioException catch (d) {
      ApiException.handleException(d); 
    } catch (e) {
      errorMessage('Error: $e'); 
    } finally {
      isLoading(false); 
    }
  }





  var filteredProducts = <ProductSuggestion>[].obs;

  var searchQuery = ''.obs; 

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
      //   filteredProducts.value =   products .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
      // .map((product) {
      //   // Assuming ProductSuggestion has an id property that corresponds to the product's id
      //   return ProductSuggestion(id: product.id.toString(), name: product.name);
      // }).toList();; 
      }
    } on DioException catch (d) {
      ApiException.handleException(d);
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchProducts(String query) {
    searchQuery.value = query; 
    if (query.isEmpty) {
      filteredProducts.value = []; 
    } else {
      // filteredProducts.value = products.where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
      // .map((product) {
      //   // Assuming ProductSuggestion has an id property that corresponds to the product's id
      //   return ProductSuggestion(id: product.id.toString(), name: product.name);
      // }).toList();
    }
  }
}






