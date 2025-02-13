import 'package:flutter/material.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/views/introductionview.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: IntroductionView.routeName,
      routes: {IntroductionView.routeName: (context) => IntroductionView()},
      debugShowCheckedModeBanner: false,
    );
  }
}
