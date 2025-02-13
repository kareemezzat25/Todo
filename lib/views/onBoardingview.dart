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
      pageColor: Theme.of(context).primaryColor,
    );
    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: Theme.of(context).primaryColor,
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
            activeColor: MyThemeData.secondaryColorLightdark,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            color: Colors.black),
        pages: [
          PageViewModel(
            title: "Find Events That Inspire You",
            body:
                "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
            image: _buildImage('assets/images/onBoarding1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Effortless Event Planning",
            body:
                "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
            image: _buildImage('assets/images/onBoarding2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Connect with Friends & Share Moments",
            body:
                "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
            image: _buildImage('assets/images/onBoarding3.png'),
            decoration: pageDecoration,
          ),
        ],
        showDoneButton: true,
        showNextButton: true,
        showBackButton: true,
        back: const Icon(
          Icons.arrow_circle_left_outlined,
          color: Color(0xFF5669FF),
          size: 38,
        ),
        next: const Icon(
          Icons.arrow_circle_right_outlined,
          color: Color(0xFF5669FF),
          size: 38,
        ),
        onDone: () {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        },
        done: const Icon(
          Icons.arrow_circle_right_outlined,
          size: 38,
          color: MyThemeData.secondaryColorLightdark,
        ),
      ),
    );
  }
}
