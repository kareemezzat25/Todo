import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'dart:ui' as ui; // Import dart:ui explicitly
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/views/loginview.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = "SignUP";
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "register".tr(),
          style: provider.themeMode == ThemeMode.dark
              ? null
              : Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Logo.png",
                    height: 182.h,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name Field is required";
                      }
                      return null;
                    },
                    controller: nameController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                        labelText: "name".tr(),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: provider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : Theme.of(context).focusColor),
                        prefixIcon: Icon(
                          Icons.person,
                          color: provider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : Theme.of(context).focusColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor))),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Field is required";
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return "please Enter valid email";
                      }
                      return null;
                    },
                    controller: emailController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                        labelText: "email".tr(),
                        labelStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: provider.themeMode == ThemeMode.dark
                                      ? MyThemeData.secondaryColorDark
                                      : Theme.of(context).focusColor,
                                ),
                        prefixIcon: Icon(Icons.email,
                            color: provider.themeMode == ThemeMode.dark
                                ? MyThemeData.secondaryColorDark
                                : Theme.of(context).focusColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor))),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password Field is required";
                      } else if (value.length < 6) {
                        return "Password is weak should be at least 6 digits";
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: passwordController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                        labelText: "password".tr(),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: provider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : Theme.of(context).focusColor),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: provider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : Theme.of(context).focusColor,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: provider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : Theme.of(context).focusColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor))),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Re-password Field is required";
                      } else if (value != passwordController.text) {
                        return "Re-password is Not Matched";
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: rePasswordController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                        labelText: "re_password".tr(),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: provider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : Theme.of(context).focusColor),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: provider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : Theme.of(context).focusColor,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: provider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : Theme.of(context).focusColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor))),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FirebaseManager.createUser(emailController.text,
                              passwordController.text, nameController.text, () {
                            Navigator.pop(context);
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginView.routeName, (route) => false);
                          }, (messsage) {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        "SomeThing went wrong",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      content: Text(messsage),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.r)),
                                                backgroundColor: MyThemeData
                                                    .primarycolorlight),
                                            child: const Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    ));
                          }, () async {
                            showDialog(
                                context: context,
                                builder: (context) => const Center(
                                      child: CircularProgressIndicator(
                                        color: MyThemeData.primarycolorlight,
                                      ),
                                    ));
                            await Future.delayed(const Duration(seconds: 2));
                          });
                        }
                      },
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
                                  .copyWith(
                                      color:
                                          provider.themeMode == ThemeMode.dark
                                              ? MyThemeData.secondaryColorDark
                                              : Colors.black)),
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
                          context.setLocale(const Locale("ar"));
                        } else {
                          context.setLocale(const Locale("en"));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
