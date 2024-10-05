import 'package:al_najah_store/common/widgets/login_signup/social_button.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/personailization/address.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/database_helper.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:al_najah_store/views/personailization/address/add_new_address.dart';
import 'package:al_najah_store/views/personailization/address/widgets/single_address.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddressVm extends GetxController{
static AddressVm get instance=>Get.find<AddressVm>();


final localsStorage=NLocalStorage.instance();

final DatabaseHelper dbHelper = DatabaseHelper();
  final RxList<Map<String, dynamic>> addresses = <Map<String, dynamic>>[].obs;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

GlobalKey<FormState> addressFormKey=GlobalKey<FormState>();

RxBool refreshData=true.obs;
final Rx<Address> selectedAddress=Address.empty().obs;
  var isLoading = false.obs; 
  var errorMessage = ''.obs;

AddressVm(){
  loadAddresses();
}



  Future<void> loadAddresses() async {

    try{

      isLoading(true); 
      errorMessage(''); 
      final addresse = await dbHelper.getAddresses();
   
      addresses.clear();
      addresses.addAll(addresse);
    }on DioException catch(e){
      ApiException.handleException(e);
    }catch (e){
      errorMessage('$e');
    }finally{
      isLoading(false);
    }
    

  }

  Future<void> addAddress() async {
    await dbHelper.insertAddress({
      'name': nameController.text,
      'address': addressController.text,
      'phone': phoneController.text,
    });
    loadAddresses();
    clearControllers();
  }


  Future<void> updateAddress(int id) async {
    await dbHelper.updateAddress({
      'id': id,
      'name': nameController.text,
      'address': addressController.text,
      'phone': phoneController.text,
    });
    loadAddresses();
    clearControllers();
  }

  Future<void> deleteAddress(int id) async {
    await dbHelper.deleteAddress(id);
    loadAddresses();
  }

  void clearControllers() {
    nameController.clear();
    addressController.clear();
    phoneController.clear();
  }


  Future<dynamic> selectAddress(Address newSelectedAddress)async{
  try{
    Get.defaultDialog(
      title: '',
      onWillPop: ()async {return false;},
      barrierDismissible: false,
      backgroundColor: Colors.transparent,content: CircularProgressIndicator(),
    );
    newSelectedAddress.selectedAddress=true;
    selectedAddress.value=newSelectedAddress;

      await newSelectedAddress;
      Get.back();
  
  }catch (e){
    print("ADddressssssssssss$e");
  }

}

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
                    await selectAddress(address);
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