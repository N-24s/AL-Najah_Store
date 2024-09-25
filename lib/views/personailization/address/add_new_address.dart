import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const NAppBar(title: Text("Add New Address"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration:  const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),
                ),
                const SizedBox(height: NSizes.spaceBtwInputFieldss),
                TextFormField(
                  decoration:  const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),
                ),
                const SizedBox(height: NSizes.spaceBtwInputFieldss),   
                Row(
                  children: [
                Expanded(
                  child: TextFormField(
                    decoration:  const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),
                  ),
                ),
                const SizedBox(width: NSizes.spaceBtwInputFieldss),
                Expanded(
                  child: TextFormField(
                    decoration:  const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'),
                  ),
                ),
                  ],
                ),
                   const SizedBox(height: NSizes.spaceBtwInputFieldss),  
               Row(
                  children: [
                Expanded(
                  child: TextFormField(
                    decoration:  const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'),
                  ),
                ),
                const SizedBox(width: NSizes.spaceBtwInputFieldss),
                Expanded(
                  child: TextFormField(
                    decoration:  const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),
                  ),
                ),
                  ],
                ), 
                 const SizedBox(height: NSizes.spaceBtwInputFieldss),
                TextFormField(
                  decoration:  const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),
                ),
                 const SizedBox(height: NSizes.defaultSpace),

                 SizedBox(width: double.infinity,child: ElevatedButton(
                  onPressed: (){}, 
                  child: const Text("Save")),)

             
              ],
            ),
          ),
        ),
      ),
    );
  }
}