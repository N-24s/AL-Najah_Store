import 'dart:convert';

import 'package:al_najah_store/models/shop/brand/brand.dart' as brand;
import 'package:al_najah_store/models/shop/store/store.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BrandVm extends GetxController {

  static BrandVm get instance=>Get.find<BrandVm>();
  
  BrandVm() {
   fetchFeaturedBrands();
   fetchAllBrands();
   fetchProductByBrands('1');

  }
// varibles
  var isLoading = false.obs; 
  var errorMessage = ''.obs;
  var featuredBrand =<brand.Brand> [].obs;
  var brandByCategory = <dynamic>[].obs;
  var productByBrand = <brand.Brand>[].obs;
  var allBrands = <brand.Brand>[].obs;

    
   
    


// All Brands
  Future<void> fetchAllBrands() async {
    try {
      isLoading(true);
      errorMessage('');

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getAllBrands_Url);

      if (response.statusCode == 200) {
        var jsonData = response.data;
      brand.ResponsModel res=brand.ResponsModel.fromJson(jsonData);
       allBrands.value= res.brand;
            
     
    
      }
    } on DioException catch (d) {
      ApiException.handleException(d);
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }



Future<void> fetchFeaturedBrands() async {
    try {
      isLoading(true);
      errorMessage('');
      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getStore_Url);

      if (response.statusCode == 200) {
        var jsonData = response.data;
        ResponsModelStore b=ResponsModelStore.fromJson(jsonData);
            featuredBrand.value=  b.data.featured.map((featured) => brand.Brand.fromFeatured(featured)).toList();


// Editing to create api 
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


  Future<void> fetchProductByBrands(String? id) async {
    try {
      isLoading(true);
      errorMessage('');

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: "${HttpUrls.getProductByBrand_Url}$id");

      if (response.statusCode == 200) {
        var jsonData = response.data;
        print("7777777777777777777777777777777777${jsonData}");
        brand.ResponsModel res=brand.ResponsModel.fromJson(jsonData);
        print("555555555555555555555555555555${res}");
            productByBrand.value= jsonData['data'];
            
     
    
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






