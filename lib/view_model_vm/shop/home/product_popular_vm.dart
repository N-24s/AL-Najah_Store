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
      HttpHelpers http = HttpHelpers.instance;

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

      final response = await http.getRequest(url: HttpUrls.getProductPopular);

      if (response.statusCode == 200) {
        
        var jsonData = response.data;
           List<dynamic> productData =  jsonData['data'];

        productPopular.value = productData
            .map((productJson) => Product.fromJson(productJson))
            .toList();
                    print("ERRRRRRRRRRRRRRor${errorMessage.value}");


            print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP${productPopular[0].name}");
          
  


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

