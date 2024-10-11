import 'package:al_najah_store/common/styles/spacing_styles.dart';
import 'package:al_najah_store/common/widgets/login_signup/form_divider.dart';
import 'package:al_najah_store/common/widgets/login_signup/social_button.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/views/authentication/login/widgets/login_form.dart';
import 'package:al_najah_store/views/authentication/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: NSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
                                const SizedBox(height: NSizes.spaceBtwSections,),

            // Logo, Title & Sub-Title
            const NLoginHeader(),
            //Form
            const NLoginForm(),
              //Divider
              NFormDivider(dividerText: NTexts.orSignInWith.capitalize!,),

                    const SizedBox(width: NSizes.spaceBtwSections,),

              //Footer
               const NSocialButtons(),
          ],
        ),
        ),
      ),
    );
  }
}
