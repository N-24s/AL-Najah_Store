import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/text_field/text_form_field.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/validators/validation.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:flutter/material.dart';
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
                  controller: addressVm.nameController,
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
                  controller: addressVm.addressController,
                              validator: (value) => NValidator.validateEmptyText('address',value),

                  prefixIcon: Iconsax.building_31,
                  labelText: 'address'
                ),
                const SizedBox(width: NSizes.spaceBtwInputFieldss),
                  
                 SizedBox(width: double.infinity,child: ElevatedButton(
                  onPressed: (){
                      if(!addressVm.addressFormKey.currentState!.validate()) return;
                      addressVm.addAddress();

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