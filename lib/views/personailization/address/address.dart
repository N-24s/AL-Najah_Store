
import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/models/personailization/address.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
import 'package:al_najah_store/views/personailization/address/add_new_address.dart';
import 'package:al_najah_store/views/personailization/address/widgets/single_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  UserAddressScreen({super.key});
  final  addressVM = AddressVm.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        backgroundColor: NColors.primaryColor,
        child: const Icon(Iconsax.add, color: NColors.white),
      ),
      appBar: NAppBar(
        title: Text("Addresses", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Obx(
        () {
          if (addressVM.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // if (addressVM.allAddress.isNotEmpty) {
          //   return const Center(child: Text("No addresses found"));
          // }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(NSizes.defaultSpace),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(), 
                shrinkWrap: true, 
                itemCount: addressVM.allAddress.length,
              
                itemBuilder: (context, index) {
                  return NSingleAddress(
                    // selectedAddress: false,
                    address: addressVM.allAddress[index],
                    onTap: () {
                      Map<String,dynamic> address = addressVM.allAddress[index];
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


// import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
// import 'package:al_najah_store/utilis/constants/colors.dart';
// import 'package:al_najah_store/utilis/constants/size.dart';
// import 'package:al_najah_store/view_model_vm/personailization/address_vm.dart';
// import 'package:al_najah_store/views/personailization/address/add_new_address.dart';
// import 'package:al_najah_store/views/personailization/address/widgets/single_address.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';


// class UserAddressScreen extends StatelessWidget {
//    UserAddressScreen({super.key});
//     final addressVM =AddressVm.instance;


//   @override
//   Widget build(BuildContext context) {
//     addressVM.loadAddresses();
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: ()=>Get.to(()=> AddNewAddressScreen()),
//         backgroundColor: NColors.primaryColor,
//         child: const Icon(Iconsax.add,color: NColors.white,),
//         ),
//         appBar: NAppBar(
//           title: Text("Addresses",style: Theme.of(context).textTheme.headlineSmall),
//           showBackArrow: true,
//           ),
//           body:  SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(NSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   Obx(
//                     (){
//                       if(addressVM.addresses.value.isEmpty)
//                       return CircularProgressIndicator();

//                       return ListView.builder(
//                       itemCount: addressVM.addresses.length,
//                       itemBuilder: (context, index) =>  NSingleAddress(selectedAddress: false, address: addressVM.addresses[index]));
                     
 
//   })

//               ],
//               ),
//               ),
//           ),
//     );
//   }
// }