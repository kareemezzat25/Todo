import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/views/onBoardingview.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionView extends StatelessWidget {
  static const String routeName = "Introduction";
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logoAppBar.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              "assets/images/introduction.png",
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            SizedBox(
              height: 28,
            ),
            Text("introduction_title".tr(),
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 16,
            ),
            Text("introduction_body".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black)),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("language".tr(),
                    style: Theme.of(context).textTheme.titleLarge),
                ToggleSwitch(
                  minWidth: 70.0,
                  initialLabelIndex: context.locale.toString() == "en" ? 0 : 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  animate: true,
                  curve: Curves.bounceInOut,
                  icons: [
                    FontAwesomeIcons.flagUsa,
                    MdiIcons.abjadArabic,
                  ],
                  activeBgColors: [
                    [MyThemeData.primarycolorlight],
                    [Colors.orange]
                  ],
                  onToggle: (index) {
                    if (index == 1) {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("theme".tr(),
                    style: Theme.of(context).textTheme.titleLarge),
                ToggleSwitch(
                  minWidth: 70.0,
                  initialLabelIndex: 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [
                    FontAwesomeIcons.moon,
                    FontAwesomeIcons.lightbulb,
                  ],
                  activeBgColors: [
                    [MyThemeData.primarycolorlight],
                    [Colors.black]
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OnBoardingView.routeName);
                },
                child: Text("let's_start".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5669FF),
                    minimumSize: Size(360, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)))),
            SizedBox(
              height: 8,
            )
          ]),
        ),
      ),
    );
  }
}
