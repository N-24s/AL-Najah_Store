import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/text_field/text_form_field.dart';
import 'package:al_najah_store/models/personailization/address.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/validators/validation.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class AddNewAddressScreen extends StatelessWidget {
   AddNewAddressScreen({super.key});
  final addressVm=AddressVm.instance;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const NAppBar(title: Text("Add New Address"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: Form(
            key: addressVm.addressFormKey,
            child: Column(
              children: [
                NTextFormField(
            validator: (value) => NValidator.validateEmptyText('name',value),
                  labelText: 'Name',
                  controller: addressVm.titleController,
                  prefixIcon: Iconsax.user,
                ),
                const SizedBox(height: NSizes.spaceBtwInputFieldss),
                NTextFormField(
                  controller: addressVm.phoneController,
                 validator: (value) => NValidator.validatePhoneNumber(value),

                  prefixIcon: Iconsax.mobile,
                  labelText: 'Phone Number'
                ),
                const SizedBox(height: NSizes.spaceBtwInputFieldss),   
                NTextFormField(
                  controller: addressVm.desController,
                              validator: (value) => NValidator.validateEmptyText('address',value),

                  prefixIcon: Iconsax.building_31,
                  labelText: 'address'
                ),
                const SizedBox(height: NSizes.spaceBtwSections),
                  
                 SizedBox(width: double.infinity,child: ElevatedButton(
                  onPressed: ()async{
                      if(!addressVm.addressFormKey.currentState!.validate()) return;
                      Data a=Data(title: addressVm.titleController.text,phone: addressVm.phoneController.text,description: addressVm.desController.text,isActive: true,createdAt:DateTime.now(),updatedAt: DateTime.now(),id: 1,latitude: '',longitude: '');
                     await addressVm.addAddress(a);
                     print("//////////////////////////////////////////////////////////////////////////////////////////////////");
                    await addressVm.getAllAddress();


                  }, 
                  child: const Text("Save")),)

             
              ],
            ),
          ),
        ),
      ),
    );
  }
}