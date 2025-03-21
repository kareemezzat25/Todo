import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'dart:ui' as ui; // Import dart:ui explicitly
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/models/usermodel.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/providers/userprovider.dart';
import 'package:todo_app/views/forgetPassword.dart';
import 'package:todo_app/views/homeview.dart';
import 'package:todo_app/views/signup.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginView extends StatelessWidget {
  static const String routeName = "Login";

  LoginView({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        return "Email Field is required";
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return "Enter valid Email";
                      }
                      return null;
                    },
                    controller: emailController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                        labelText: "email".tr(),
                        prefixIcon: Icon(
                          Icons.email,
                          color: provider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : Theme.of(context).focusColor,
                        ),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: provider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : Theme.of(context).focusColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                width: 2, color: Theme.of(context).focusColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                width: 1, color: Theme.of(context).focusColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                width: 1,
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
                        return "Password should be atleast 6 digits";
                      }
                      return null;
                    },
                    controller: passwordController,
                    style: Theme.of(context).textTheme.titleMedium,
                    obscureText: true,
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
                        suffix: Icon(
                          Icons.visibility_off,
                          color: provider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : Theme.of(context).focusColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              width: 2, color: Theme.of(context).focusColor),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ForgetPasswordView.routeName);
                    },
                    child: Text(
                      "forget_password".tr(),
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: MyThemeData.primarycolorlight),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          FirebaseManager.login(
                              emailController.text, passwordController.text,
                              () {
                            Navigator.pop(context);
                            userprovider.initUser();
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomeView.routeName, (route) => false);
                          }, (message) {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("SomeThing went Wrong",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    content: Text(message),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: MyThemeData
                                                  .primarycolorlight),
                                          child: const Text(
                                            "OK",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  );
                                });
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
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(361.w, 56.h),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: MyThemeData.primarycolorlight,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r))),
                      child: Text(
                        "login".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpView.routeName);
                    },
                    child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(children: [
                          TextSpan(
                              text: "don't_have_account".tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    // change in dark mode
                                    color: provider.themeMode == ThemeMode.dark
                                        ? MyThemeData.secondaryColorDark
                                        : MyThemeData.primaryColordark,
                                  )),
                          TextSpan(
                              text: "create_account".tr(),
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
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: MyThemeData.primarycolorlight,
                          indent: 26,
                          endIndent: 16,
                        ),
                      ),
                      Text(
                        "or".tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: MyThemeData.primarycolorlight,
                          indent: 16,
                          endIndent: 26,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        final UserCredential userCredential =
                            await FirebaseManager.signInWithGoogle();
                        final User? user = userCredential.user;
                        UserModel? userExist =
                            await FirebaseManager.readUserData(user!.uid);
                        if (user == null) {
                          throw Exception("user-Signin failed");
                        }
                        if (user != null && userExist?.id == null) {
                          UserModel userModel = UserModel(
                              id: user.uid,
                              userName: user.displayName,
                              email: user.email,
                              createdAt: DateTime.now().millisecondsSinceEpoch);

                          FirebaseManager.addUser(userModel);
                        }
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: MyThemeData.primarycolorlight,
                                ),
                              );
                            });
                        await Future.delayed(const Duration(seconds: 2));

                        userprovider.initUser();
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeView.routeName, (route) => false);
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "SomeThing is went Wrong",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                content: Text("$e"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              MyThemeData.primarycolorlight,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.r))),
                                      child: Text(
                                        "Ok",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.white),
                                      ))
                                ],
                              );
                            });
                      }
                    },
                    child: Container(
                      width: 361.w,
                      height: 58.h,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF5669FF)),
                          borderRadius: BorderRadius.circular(16.r),
                          color: provider.themeMode == ThemeMode.dark
                              ? Colors.transparent
                              : const Color(0xFFF2FEFF)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google_logo.png",
                            width: 45,
                            height: 45,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            "login_with_google".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Center(
                    child: Directionality(
                      textDirection: ui.TextDirection
                          .ltr, // Force LTR to keep layout consistent
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
                          [MyThemeData.primarycolorlight],
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
                  ),
                  SizedBox(
                    height: 12.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
