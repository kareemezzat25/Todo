import 'package:flutter/material.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/views/introductionview.dart';
import 'package:todo_app/views/loginview.dart';
import 'package:todo_app/views/onBoardingview.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: IntroductionView.routeName,
      routes: {
        IntroductionView.routeName: (context) => const IntroductionView(),
        OnBoardingView.routeName: (context) => const OnBoardingView(),
        LoginView.routeName: (context) => const LoginView()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
