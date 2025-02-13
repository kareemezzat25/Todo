import 'package:flutter/material.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/views/introductionview.dart';
import 'package:todo_app/views/loginview.dart';
import 'package:todo_app/views/onBoardingview.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: "assets/translations",
    fallbackLocale: Locale('en'),
    child: const TodoApp(),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: IntroductionView.routeName,
      routes: {
        IntroductionView.routeName: (context) => const IntroductionView(),
        OnBoardingView.routeName: (context) => const OnBoardingView(),
        LoginView.routeName: (context) => LoginView()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
