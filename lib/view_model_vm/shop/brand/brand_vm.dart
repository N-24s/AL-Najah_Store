import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/models/shop/product_dateils.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BrandVm extends GetxController {

  static BrandVm get instance=>Get.find<BrandVm>();
  
  BrandVm() {
fetchFeaturedBrands();
  }
// varibles
  var isLoading = false.obs; 
  var errorMessage = ''.obs;
  var featuredBrand = [].obs;
  var brandByCategory = <dynamic>[].obs;
  var productByBrand = <Product>[].obs;
    



  Future<void> fetchFeaturedBrands() async {
    try {
      isLoading(true);
      errorMessage('');

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getStore);

      if (response.statusCode == 200) {
        var jsonData = response.data;
            featuredBrand.value= jsonData['data']['featured'];
            brandByCategory.value= jsonData['data']['categories'];
     
    
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






