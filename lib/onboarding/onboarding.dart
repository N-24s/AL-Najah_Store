import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

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
        background: [
        
          SizedBox(
            height: 400,
            width: 400,
            child: Image.asset('assets/images/on_boarding_images/dv.gif')),
            SizedBox(
            height: 400,
            width: 400,
            child: Image.asset('assets/images/on_boarding_images/dv.gif')),
            SizedBox(
            height: 400,
            width: 400,
            child: Image.asset('assets/images/on_boarding_images/dv.gif')),
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