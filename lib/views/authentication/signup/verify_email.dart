import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/views/authentication/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions:[
          IconButton(onPressed: ()=>Get.offAll(()=> const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ]
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(NSizes.defaultSpace),
        child: Column(
          children: [
//Image

Image(image: const AssetImage(NImages.OnBoardingImage3),width: NHelperFunctions.screenWidth()*0.6,),
const SizedBox(height: NSizes.spaceBtwSections,),
// Title & SubTitle
     Text("Verify your email address",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height: NSizes.spaceBtwSections,),
            const SizedBox(height: NSizes.spaceBtwItems),

   Text('support@email.com',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
            const SizedBox(height: NSizes.spaceBtwItems),
   Text('subTitle address',style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
    const SizedBox(height: NSizes.spaceBtwItems),

//Buttons

SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Continue")),),
    const SizedBox(height: NSizes.spaceBtwItems),

SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text("Resend Email")),),

          ],
        ),
        ),

      ),
    );
  }
}