import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/views/loginview.dart';

class OnBoardingView extends StatelessWidget {
  static const String routeName = "OnBoarding";
  const OnBoardingView({super.key});
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle =
        Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black);

    var pageDecoration = PageDecoration(
      titleTextStyle: Theme.of(context).textTheme.titleLarge!,
      bodyTextStyle: bodyStyle,
      imagePadding: const EdgeInsets.only(top: 82),
      bodyPadding: const EdgeInsets.only(top: 12),
      pageColor: MyThemeData.secondaryColorLightdark,
    );
    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: MyThemeData.secondaryColorLightdark,
        globalHeader: Align(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: _buildImage('assets/images/logoAppBar.png', 120),
            ),
          ),
        ),
        dotsDecorator: DotsDecorator(
            activeSize: const Size(20, 8),
            activeColor: Theme.of(context).primaryColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            color: Colors.black),
        pages: [
          PageViewModel(
            title: "onboarding1_title".tr(),
            body: "onboarding1_body".tr(),
            image: _buildImage('assets/images/onBoarding1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "onboarding2_title".tr(),
            body: "onboarding2_body".tr(),
            image: _buildImage('assets/images/onBoarding2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "onboarding3_title".tr(),
            body: "onboarding3_body".tr(),
            image: _buildImage('assets/images/onBoarding3.png'),
            decoration: pageDecoration,
          ),
        ],
        showDoneButton: true,
        showNextButton: true,
        showBackButton: true,
        back: context.locale.toString() == "en"
            ? const Icon(
                Icons.arrow_circle_left_outlined,
                color: Color(0xFF5669FF),
                size: 38,
              )
            : Icon(
                Icons.arrow_circle_right_outlined,
                color: Color(0xFF5669FF),
                size: 38,
              ),
        next: context.locale.toString() == "en"
            ? const Icon(
                Icons.arrow_circle_right_outlined,
                color: Color(0xFF5669FF),
                size: 38,
              )
            : Icon(
                Icons.arrow_circle_left_outlined,
                color: Color(0xFF5669FF),
                size: 38,
              ),
        onDone: () {
          Navigator.pushNamed(context, LoginView.routeName);
        },
        done: context.locale.toString() == "en"
            ? const Icon(
                Icons.arrow_circle_right_outlined,
                color: Color(0xFF5669FF),
                size: 38,
              )
            : Icon(
                Icons.arrow_circle_left_outlined,
                color: Color(0xFF5669FF),
                size: 38,
              ),
      ),
    );
  }
}
