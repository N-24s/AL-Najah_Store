import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/image_strings.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:al_najah_store/views/authentication/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';

class  OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(

        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        
        finishButtonTextStyle: const TextStyle(color: NColors.orangeColor,fontSize: 20),
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: NColors.primaryColor,
           
        ),
        skipTextButton: const Text('Skip'),
        trailing: const Text('Login'),
        trailingFunction: ()=> Get.to(()=> const LoginScreen()),
        background: [
        
          SizedBox(
            height: 400,
            width: 400,
            child: Image.asset(NImages.OnBoardingImage3)),
            SizedBox(
            height: 400,
            width: 400,
            child: Image.asset(NImages.OnBoardingImage2)),
            SizedBox(
            height: 400,
            width: 400,
            child: Image.asset(NImages.OnBoardingImage3)),
        ],
        totalPage: 3,
        hasFloatingButton: true,
        speed: 1.8,
        pageBodies: [
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:  Column(
              children: <Widget>[
                const SizedBox(
                  height: 360,
                ),
                Text(NTexts.OnBoardingTitle1,style: Theme.of(context).textTheme.titleMedium,),
                Text(NTexts.OnBoardingSubTitle1,style: Theme.of(context).textTheme.labelMedium,),
            
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:  Column(
              children: <Widget>[
                const SizedBox(
                  height: 360,
                ),
    Text(NTexts.OnBoardingTitle2,style: Theme.of(context).textTheme.titleMedium,),
                Text(NTexts.OnBoardingSubTitle2,style: Theme.of(context).textTheme.labelMedium,),
                          ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:  Column(
              children: <Widget>[
                const SizedBox(
                  height: 360,
                ),
                Text(NTexts.OnBoardingTitle3,style: Theme.of(context).textTheme.titleMedium,),
                Text(NTexts.OnBoardingSubTitle3,style: Theme.of(context).textTheme.labelMedium,),
                          ],
            ),
          ),
        ],
      ),
    );
  }
}