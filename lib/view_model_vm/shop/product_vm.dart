import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/models/shop/search_suggestion.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/models/shop/product_dateils.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductVM extends GetxController {
  static ProductVM get instance=>Get.find<ProductVM>();
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
  var currentPage = 1.obs;

  var isLoading = false.obs; 
  var errorMessage = ''.obs;
   var filteredProducts = <ProductSuggestion>[].obs;

  var searchQuery = ''.obs; 

//   Future<void> fetchProducts({String? page}) async {
//     try {
//       isLoading(true); 
//       errorMessage(''); 
// String p=page??'1';
//       HttpHelpers http = HttpHelpers.instance;
//       final response = await http.getRequest(url: HttpUrls.getAllProduct+'?page=$p');

//       if (response.statusCode == 200) {
//         var jsonData = response.data;

 
//         Products productData = Products.fromJson(jsonData);

//         products.value = productData.data.data; 
//                 print("DDDDDDDDDDDDDDDDDD${products[9].name}");

//       }
//     } on DioException catch (d) {
//       ApiException.handleException(d); 
//     } catch (e) {
//       errorMessage('Error: $e'); 
//     } finally {
//       isLoading(false); 
//     }
//   }

 
 
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


String? nextPageUrl;
String? prevPageUrl;

Future<void> fetchProducts({int? page}) async {
  try {
    isLoading(true); 
    errorMessage(''); 
    
    int p = page ?? currentPage.value; 

    HttpHelpers http = HttpHelpers.instance;
    final response = await http.getRequest(url: HttpUrls.getAllProduct + '?page=${p.toString()}');

    if (response.statusCode == 200) {
      var jsonData = response.data;

      Products productData = Products.fromJson(jsonData);
      products.value = productData.data.data; 

      nextPageUrl = productData.data.nextPageUrl;
      prevPageUrl = productData.data.prevPageUrl;
      
      print(" FFFFFFFFFFFFFFFFFFFFFFFfff${products[9].name}");

      currentPage.value = p;
    }
  } on DioException catch (d) {
    ApiException.handleException(d); 
  } catch (e) {
    errorMessage('Error: $e'); 
  } finally {
    isLoading(false); 
  }
}

void fetchNextPage() {
  if (nextPageUrl != null && currentPage.value<3 ) {
    fetchProducts(page: currentPage.value + 1); 
  } else {
    NLoaders.customToast(message: "NO Next Page");
  }
}

void fetchPreviousPage() {
  if (prevPageUrl != null && currentPage.value > 1) {
    fetchProducts(page: currentPage.value - 1); 
  } else {
NLoaders.customToast(message: "NO Previous Page") ;
 }
}

 
}