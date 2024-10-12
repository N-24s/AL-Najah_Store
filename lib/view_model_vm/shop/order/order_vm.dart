import 'dart:convert';
import 'dart:io';

import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/common/widgets/login_signup/social_button.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/personailization/address.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/database_helper.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:al_najah_store/view_model_vm/personailization/profile/profile_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/cart/cart_controller.dart';
import 'package:al_najah_store/views/personailization/address/add_new_address.dart';
import 'package:al_najah_store/views/personailization/address/widgets/single_address.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderVM extends GetxController{
static OrderVM get instance=>Get.find<OrderVM>();

final cartVM=CartVM.instance;
final localStorage=NLocalStorage.instance();
final http=HttpHelpers.instance;
final profileVM=ProfileVM.instance;

final DatabaseHelper dbHelper = DatabaseHelper();
  // final RxList<Map<String, dynamic>> addresses = <Map<String, dynamic>>[].obs;



RxBool refreshData=true.obs;
//  final selectedAddress=<String,dynamic>{}.obs;
final RxList<dynamic> allOrders=<dynamic>[].obs;

  var isLoading = false.obs; 
  var errorMessage = ''.obs;

OrderVM(){
  getAllOrders();
}

 Future<String> getAllOrders()async{
   try{

    isLoading(true); 
    errorMessage('');       
     String? token = localStorage.readData('accessToken');
       if(token!=null){
        
     Response response=await http.getRequest(url: HttpUrls.order_Url,options: Options(
        headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        }
      ), );
      
        if (response.statusCode == 200) {

            var jsonData = response.data;
             allOrders.value= jsonData['data'];
             


        }
        }
        else{
        return "Token not found, please login again.";
        }

           return "Success";

   
   
   
  } on DioException catch (d) {
   return ApiException.handleException(d); 
  } catch (e) {
    return errorMessage('Error: $e'); 
  } finally {
    isLoading(false); 
  }
}


 Future<String> deleteOrder(String id)async{
   try{

       String? token = localStorage.readData('accessToken');


       if(token!=null){

   Response response=  await http.deleteRequest(url: '${HttpUrls.order_Url}/$id',options: Options(
        headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
      ), );
     


    return "Success";


       }
       else{
        return "Token not found, please login again.";


       }

       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Error $e";
   }
  }



 Future<String> addOrder(int userId,List products,int address_id)async{


    
   try{
     HttpHelpers http=HttpHelpers.instance;
   String? token = localStorage.readData('accessToken');
  final Map<String, dynamic> data = {
      "user_id": userId,  
      "products": products, 
      "address_id":address_id
    };


       if(token!=null){
        print("1111111111111111111111111111111111111111111111");
print(data['user_id']);
print(data['products']);
print(data['address_id']);
        print("1111111111111111111111111111111111111111111111");


   try{
      Response res=await http.postRequest(url: HttpUrls.order_Url, data:data,options: Options(
          headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
      ), );
  
            print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR$res");

      
   }catch(e){
    print("ERROR IS ORDERSSSSSS${e}");
   }

      

       return "Success";
       }
        else{
        return 'Token not found, please login again.';


       }
       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Error is : ${e.toString()}";
   }
  }



String? extractDataFromCart(int address_id){
  List<Map<String, dynamic>> extractedProducts = [];

try{

    for (var product in cartVM.cartItems) {
    String id = product.id;
    int quantity = product.quantity;

    extractedProducts.add({
      "id": id,
      "quantity": quantity,
    });
  }


if(extractedProducts.isNotEmpty && address_id !=null && profileVM.userProfile['id']!=null){
  addOrder(profileVM.userProfile['id'], extractedProducts,address_id);
    NLoaders.customToast(message: "تمت عملية الشراء");
  return "Successful!";

}
else {
                        NLoaders.customToast(message: "لا يمكن إرسال الطلب لأنه لا توجد عناصر");

}
}on DioException catch(e){
  return ApiException.handleException(e);
}

catch(e){
  return 'Error is :${e}';

}
return null;

}



}
