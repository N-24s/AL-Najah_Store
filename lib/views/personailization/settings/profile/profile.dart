import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/images/n_circular_image.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/views/personailization/settings/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          
          padding:EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    NCircularImage(imageUrl: NImages.logo,width: 80,height: 80),
                    TextButton(onPressed: (){}, child: Text("Change Profile Picture"))
                  ],
                ),
              ),
              // Details
              const SizedBox(height: NSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),

              //Heading Profile Information
              const NSectionHeading(title: "Profile Information", showActionButton: false),
                const SizedBox(height: NSizes.spaceBtwItems),

               NProfileMenu(title: "Name",value: "Nooh Saeed",onPressed: (){},),
                NProfileMenu(title: "Username",value: "N_24s",onPressed: (){},),

              const SizedBox(height: NSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),
             
           //Heading Personal Info
                const NSectionHeading(title: "Personal Information", showActionButton: false),
                const SizedBox(height: NSizes.spaceBtwItems),

               NProfileMenu(title: "User ID",value: "12345",onPressed: (){},icon: Iconsax.copy,),
                NProfileMenu(title: "E-Mail",value: "noohsaeed240@gmail.com",onPressed: (){},),
               NProfileMenu(title: "Phone Number",value: "770-496-167",onPressed: (){},),
                NProfileMenu(title: "Gender",value: "Male",onPressed: (){},),
               NProfileMenu(title: "Date of Birth",value: "10 Oct, 2001",onPressed: (){},),

                const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: (){}, 
                  child: const Text("Close Account",style: TextStyle(color: Colors.red),),
                  ),
              ),



            ],
          ),
           ),
      ),
    );
  }
}

