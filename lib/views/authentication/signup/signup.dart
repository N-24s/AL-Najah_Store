import 'package:al_najah_store/common/widgets/login_signup/form_divider.dart';
import 'package:al_najah_store/common/widgets/login_signup/social_button.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/views/authentication/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(NSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            Text(NTexts.siginTitle,style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: NSizes.spaceBtwSections,),
            //Form
             NSignupForm(),
          const SizedBox(height: NSizes.spaceBtwSections),

            //Divider
            NFormDivider( dividerText: NTexts.orSignUpWith.capitalize!),
          const SizedBox(height: NSizes.spaceBtwSections),

            // Social Button

            const NSocialButtons(),
          ],
        ),),
      ),
    );
  }
}

