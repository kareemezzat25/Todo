import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui' as ui; // Import dart:ui explicitly
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/cache.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/views/loginview.dart';
import 'package:todo_app/views/onBoardingview.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionView extends StatelessWidget {
  static const String routeName = "Introduction";
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logoAppBar.png",
          width: 159.w,
          height: 50.h,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              "assets/images/introduction.png",
              fit: BoxFit.fill,
              width: 321.w,
              height: 342.h,
            ),
            SizedBox(
              height: 28.h,
            ),
            Text("introduction_title".tr(),
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 16.h,
            ),
            Text("introduction_body".tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: provider.themeMode == ThemeMode.dark
                        ? MyThemeData.secondaryColorDark
                        : Colors.black)),
            SizedBox(
              height: 28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("language".tr(),
                    style: Theme.of(context).textTheme.titleLarge),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: ToggleSwitch(
                    minWidth: 70.0,
                    initialLabelIndex:
                        context.locale.toString() == "en" ? 0 : 1,
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
                    activeBgColors: const [
                      [MyThemeData.primarycolorlight],
                      [Colors.orange]
                    ],
                    onToggle: (index) {
                      if (index == 1) {
                        context.setLocale(const Locale('ar'));
                      } else {
                        context.setLocale(const Locale('en'));
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("theme".tr(),
                    style: Theme.of(context).textTheme.titleLarge),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: ToggleSwitch(
                    minWidth: 70.0,
                    initialLabelIndex:
                        provider.themeMode == ThemeMode.light ? 0 : 1,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: const [
                      FontAwesomeIcons.lightbulb,
                      FontAwesomeIcons.moon,
                    ],
                    activeBgColors: const [
                      [MyThemeData.primarycolorlight],
                      [Colors.orange]
                    ],
                    onToggle: (index) {
                      provider.changeTheme();
                      print('switched to: $index');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 28.h,
            ),
            ElevatedButton(
                onPressed: () {
                  Cache.getEligibilty() == true
                      ? Navigator.pushNamed(context, LoginView.routeName)
                      : Navigator.pushNamed(context, OnBoardingView.routeName);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5669FF),
                    minimumSize: Size(360.w, 55.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Text("let's_start".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white))),
            SizedBox(
              height: 8.h,
            )
          ]),
        ),
      ),
    );
  }
}
