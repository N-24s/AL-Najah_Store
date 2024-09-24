import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductVM extends GetxController {
  ProductVM(){
    fetchProducts();
  }
  var products = <Product>[].obs;
  var top3Product=<Product>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;


  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');

     HttpHelpers http=HttpHelpers.instance;
     final response=await http.getRequest(url: HttpUrls.getProduct);

      if (response.statusCode == 200) {
        var jsonData = response.data;
        Products productData = Products.fromJson(jsonData);
        products.value=productData.products;
        top3Products();  
        
      } 
    } on DioException catch(d){
      ApiException.handleException(d);
    }

    catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
   
  }

  top3Products(){
   top3Product.value= products.take(3).toList();
  }

}



// import 'package:al_najah_store/models/shop/product.dart';
// import 'package:al_najah_store/utilis/constants/http_url.dart';
// import 'package:al_najah_store/utilis/helpers/api_exception.dart';
// import 'package:al_najah_store/utilis/helpers/http_helper.dart';
// import 'package:dio/dio.dart';
// import 'package:get/state_manager.dart';

// class ProductVm  extends GetxController{
//   List<Product> allproducts=<Product>[].obs;

// // @override
// void onInit()async{
// super.onInit();
// print("Start Loading data...");
// await getpro();
// }

// Future<List<Map<String,dynamic>>> getpro()async{
//   Dio dio =Dio();
//   Response response=await dio.get('https://dummyjson.com/products');
//   return response.data!.Map<Product>((e)=>Products.fromJson(e).products);

//     //  HttpHelpers http=HttpHelpers.instance;
//    // Response res=await http.getRequest(url: HttpUrls.getProduct);
//   //    allproducts =res.data!.Map<Product>((e)=>Products.fromJson(e).products);

//   //      return "Success";
// }
//   //  Future<String> getAllProducts()async{
//   //  try{
//   //    HttpHelpers http=HttpHelpers.instance;

//   //    Response res=await http.getRequest(url: HttpUrls.getProduct);
//   //    allproducts =res.data!.Map<Product>((e)=>Products.fromJson(e).products);

//   //      return "Success";
       
    
   
//   //  }on DioException catch(x){
//   // return ApiException.handleException(x);
 
//   //  }
//   //  catch(e){
//   //    return "Admin for support";
//   //  };
//   // }
   
// }