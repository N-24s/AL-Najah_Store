import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/views/personailization/address/add_new_address.dart';
import 'package:al_najah_store/views/personailization/address/widgets/single_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Get.to(()=>const AddNewAddressScreen()),
        backgroundColor: NColors.primaryColor,
        child: const Icon(Iconsax.add,color: NColors.white,),
        ),
        appBar: NAppBar(
          title: Text("Addresses",style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true,
          ),
          body:  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(NSizes.defaultSpace),
              child: Column(
                children: [

       NSingleAddress(selectedAddress: true),
              ],
              ),
              ),
          ),
    );
  }
}