import 'dart:convert';
import 'dart:io';

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
import 'package:al_najah_store/views/personailization/address/add_new_address.dart';
import 'package:al_najah_store/views/personailization/address/widgets/single_address.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddressVm extends GetxController{
static AddressVm get instance=>Get.find<AddressVm>();


final localStorage=NLocalStorage.instance();
final http=HttpHelpers.instance;

final DatabaseHelper dbHelper = DatabaseHelper();
  final RxList<Map<String, dynamic>> addresses = <Map<String, dynamic>>[].obs;
  final titleController = TextEditingController();
  final desController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();

GlobalKey<FormState> addressFormKey=GlobalKey<FormState>();

RxBool refreshData=true.obs;
// final RxList<Address> selectedAddress=false.obs;
final RxList<Address> allAddress=<Address>[].obs;

  var isLoading = false.obs; 
  var errorMessage = ''.obs;

AddressVm(){
  // loadAddresses();
  getAllAddress();
}

 Future<String> getAllAddress()async{
   try{

       String? token = localStorage.readData('accessToken');
       if(token!=null){
        
     Response response=await http.getRequest(url: HttpUrls.rootAddress,options: Options(
        headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
        
        
      ), );

      var jsonData = response.data;

      print("GET ALL Address: ${jsonData}");
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


 Future<String> deleteAddress(String id)async{
   try{

       String? token = localStorage.readData('accessToken');


       if(token!=null){
        
     Response response=await http.deleteRequest(url: '${HttpUrls.rootAddress}/$id',options: Options(
        headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
        
        
      ), );

      var jsonData = response.data;

      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa${jsonData}");
         print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDd${jsonData}");
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



 Future<String> addAddress(Data address)async{


    
   try{
     HttpHelpers http=HttpHelpers.instance;
   String? token = localStorage.readData('accessToken');
   print("$token");
   


       if(token!=null){
        

     Response res=await http.postRequest(url: HttpUrls.rootAddress, data:address.addressData(),options: Options(
          headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
      ), );
      //  Address u=Address.fromJson(res.data['data']);
       print("ADD Address : ${res.data}");

       return "Success";
       }
        else{
        print("Token not found, please login again.");
        return 'Token not found, please login again.';


       }
       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Admin for support${e.toString()}";
   }
  }


 Future<String> updateddress(Data address,String id)async{


    
   try{
     HttpHelpers http=HttpHelpers.instance;
   String? token = localStorage.readData('accessToken');
   print("$token");
   


       if(token!=null){
        

     Response res=await http.putRequest(url: '${HttpUrls.rootAddress}/$id', data:address.updateAddressData(),options: Options(
          headers: {
          'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
      ), );
       print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE4${res.data}");

       return "Success";
       }
        else{
        print("Token not found, please login again.");
        return 'Token not found, please login again.';


       }
       
    
   
   }on DioException catch(x){
  return ApiException.handleException(x);
 
   }
  
   catch(e){
     return "Admin for support${e.toString()}";
   }
  }










// Sqflite
//   Future<void> loadAddresses() async {

//     try{

//       isLoading(true); 
//       errorMessage(''); 
//       final addresse = await dbHelper.getAddresses();
   
//       addresses.clear();
//       addresses.addAll(addresse);
//     }on DioException catch(e){
//       ApiException.handleException(e);
//     }catch (e){
//       errorMessage('$e');
//     }finally{
//       isLoading(false);
//     }
    

//   }


//   Future<void> addAddressf() async {
//     await dbHelper.insertAddress({
//       'name': nameController.text,
//       'address': addressController.text,
//       'phone': phoneController.text,
//     });
//     loadAddresses();
//     clearControllers();
//   }


//   // Future<void> updateAddress(int id) async {
//   //   await dbHelper.updateAddress({
//   //     'id': id,
//   //     'name': nameController.text,
//   //     'address': addressController.text,
//   //     'phone': phoneController.text,
//   //   });
//   //   loadAddresses();
//   //   clearControllers();
//   // }

//   // Future<void> deleteAddress(int id) async {
//   //   await dbHelper.deleteAddress(id);
//   //   loadAddresses();
//   // }

//   void clearControllers() {
//     nameController.clear();
//     addressController.clear();
//     phoneController.clear();
//   }


// //   Future<dynamic> selectAddress(Address newSelectedAddress)async{
// //   try{
// //     Get.defaultDialog(
// //       title: '',
// //       onWillPop: ()async {return false;},
// //       barrierDismissible: false,
// //       backgroundColor: Colors.transparent,content: CircularProgressIndicator(),
// //     );
// //     newSelectedAddress.selectedAddress=true;
// //     selectedAddress.value=newSelectedAddress;

// //       await newSelectedAddress;
// //       Get.back();
  
// //   }catch (e){
// //     print("ADddressssssssssss$e");
// //   }

// // }


Future<dynamic> selectedNewAddressPopup(BuildContext context) {
final dark =NHelperFunctions.isDarkMode(context);

  return showModalBottomSheet(
    context: context,
    builder: (ctx) => Container(
      padding: const EdgeInsets.all(NSizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NSectionHeading(title: "Select Address", showActionButton: false),
          Expanded( 
            child: ListView.builder(
              itemCount:addresses.length,
              itemBuilder: (context, index) {
                return NSingleAddress(
                  address:addresses[index],
                  onTap: () async{
                    
                    Address address = Address.fromJson(addresses[index]);
                    // await selectAddress(address);
                    Get.back();
                  },
                 selectedAddress: false, 

                );
              },
            ),
          ),
          InkWell(
            onTap: () => Get.to(()=>AddNewAddressScreen()),
            child: Container(
              height: 35,
              
              decoration: BoxDecoration(
                color: NColors.primaryColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: NColors.grey ,width: 1 ),
            
            
            
              ),
                child: Center(child:  Text("Add New",style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? NColors.dark:NColors.white),)),
              ),
          ),
        
        ],
      ),
    ),
  );
}







}