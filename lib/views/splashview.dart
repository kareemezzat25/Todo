import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/userprovider.dart';
import 'package:todo_app/views/homeview.dart';
import 'package:todo_app/views/introductionview.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "Splashview";

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var userProvider = Provider.of<UserProvider>(context, listen: false);

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        userProvider.currentUser != null
            ? HomeView.routeName
            : IntroductionView.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
            Image.asset('assets/images/Logo.png', width: 136.w, height: 186.h),
      ),
    );
  }
}
