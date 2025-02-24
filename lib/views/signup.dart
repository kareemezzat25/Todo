import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui' as ui; // Import dart:ui explicitly
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/views/loginview.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = "SignUP";
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              "register".tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Logo.png",
                  height: 182.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "name".tr(),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Theme.of(context).focusColor),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).focusColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide:
                            BorderSide(color: Theme.of(context).focusColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor))),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "email".tr(),
                      labelStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Theme.of(context).focusColor,
                              ),
                      prefixIcon: Icon(Icons.email,
                          color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor))),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "password".tr(),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Theme.of(context).focusColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).focusColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor))),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextField(
                  controller: rePasswordController,
                  decoration: InputDecoration(
                      labelText: "re_password".tr(),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Theme.of(context).focusColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).focusColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor))),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "create_account".tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(360.w, 56.h),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: MyThemeData.primarycolorlight,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r)))),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
                  child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        TextSpan(
                            text: "already_have_account".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black)),
                        TextSpan(
                            text: "login".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        MyThemeData.primarycolorlight))
                      ])),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: ToggleSwitch(
                    minWidth: 70.0.w,
                    initialLabelIndex:
                        context.locale.toString() == "en" ? 0 : 1,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: [FontAwesomeIcons.flagUsa, MdiIcons.abjadArabic],
                    activeBgColors: const [
                      const [MyThemeData.primarycolorlight],
                      [Colors.orange]
                    ],
                    onToggle: (index) {
                      if (index == 1) {
                        context.setLocale(Locale("ar"));
                      } else {
                        context.setLocale(Locale("en"));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
