import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/models/theme.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String routeName = "forgetPassword";
  var emailController = TextEditingController();
  ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("forget_password_title".tr()),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/forgetPassword.png",
                width: 343.w,
                height: 335.h,
              ),
              SizedBox(
                height: 32.h,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "email".tr(),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).focusColor),
                    prefixIcon:
                        Icon(Icons.email, color: Theme.of(context).focusColor),
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
                height: 24.h,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "reset_password".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(362.w, 56.h),
                    backgroundColor: MyThemeData.primarycolorlight,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    )),
              )
            ],
          ),
        ));
  }
}
