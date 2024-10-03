import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/personailization/address.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/database_helper.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddressVm extends GetxController{
static AddressVm get instance=>Get.find();

final localsStorage=NLocalStorage.instance();

final DatabaseHelper dbHelper = DatabaseHelper();
  final RxList<Map<String, dynamic>> addresses = <Map<String, dynamic>>[].obs;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

GlobalKey<FormState> addressFormKey=GlobalKey<FormState>();

RxBool refreshData=true.obs;
final Rx<Address> selectedAddress=Address.empty().obs;





  Future<void> loadAddresses() async {
    final addresse = await dbHelper.getAddresses();
   
      addresses.clear();
      addresses.addAll(addresse);

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
//Fetch all user specific addresses
// Future<List<Address>> getAllUserAdresses()async{
//   try{
//     final addresses=await addressRepository.
//   }
// }


Future<dynamic> selectedNewAddressPopup(BuildContext context){
  return showModalBottomSheet(
    context: context, 
    builder: (ctx)=>Container(
      padding: const EdgeInsets.all(NSizes.lg),
child: const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    NSectionHeading(title: "Select Address" ,showActionButton: false,),
    // FutureBuilder(
    //   future: future, 
    //   builder: builder)
  ],
),
    ));
}


}