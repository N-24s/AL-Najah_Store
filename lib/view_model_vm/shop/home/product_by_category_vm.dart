import 'dart:convert';

import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/models/shop/product_by_categories.dart' as product;
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class ProductByCategoryVm extends GetxController {
    // static ProductByCategoryVm getinstance(String categoryId) => Get.put<ProductByCategoryVm>(ProductByCategoryVm()); 
        
        
         var productByCategory = <dynamic>[].obs;
                  // var productByBrand = <Product>[].obs;

          var isLoading = false.obs; 
        var errorMessage = ''.obs;
          
       




  

  @override
  void onInit() {
    super.onInit();
    // fetchProductsByCategory(categoryId.value.toString()); 
  }  





    Future<void> fetchProductsByCategory(String categoryId) async {
    try {
      isLoading(true); 
      errorMessage(''); 

      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url: HttpUrls.getProductByCategory+categoryId);

      if (response.statusCode == 200) {
        
        var jsonData = response.data;

       productByCategory.value=jsonData["data"];
       print("::::::::::::::::::::::::::::::::${productByCategory}");
                   

      }
    } on DioException catch (d) {
      ApiException.handleException(d); 
    } catch (e) {
      errorMessage('Error: $e'); 
    } finally {
      isLoading(false); 
    }
  }
 


// BY Brand


    Future<void> fetchProductsByBrand(String brandId) async {
    try {
      isLoading(true); 
      errorMessage(''); 
      HttpHelpers http = HttpHelpers.instance;
      final response = await http.getRequest(url:"https://store.actnow-ye.com/api/products_by_brand/2");

      if (response.statusCode == 200) {

        Map<String, dynamic> jsonData = response.data;
        print("jsonData.runtimeType : ${jsonData.runtimeType}");
        // ResponsModel r=ResponsModel.fromJson(jsonData);
        // print(r.products[0].name);
      //              List<Map<String,dynamic>> productData = r.products;

      // List<Product1> f=  r.products;
      // List<Product1>.from(r.p.map((x) => Product1.fromJson(x))).toList()
          //  List<Map<String,dynamic>> productData = jsonData['data'];
// print("LLLLLLLLLLLLLL${f[0].name}");

        // productByBrand.value = f.map((categoryJson) => Product1.fromJson(categoryJson)).toList();

      //  print("Product BY Brnad 0 : ${ productByBrand[0]}");
                        //  print(jsonData['data']);


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

