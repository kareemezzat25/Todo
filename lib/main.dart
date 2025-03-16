import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/models/cache.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/providers/userprovider.dart';
import 'package:todo_app/views/create_event.dart';
import 'package:todo_app/views/forgetPassword.dart';
import 'package:todo_app/views/homeview.dart';
import 'package:todo_app/views/introductionview.dart';
import 'package:todo_app/views/loginview.dart';
import 'package:todo_app/views/onBoardingview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/views/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider())
    ],
    child: EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: "assets/translations",
      fallbackLocale: Locale('en'),
      child: const TodoApp(),
    ),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var userprovider = Provider.of<UserProvider>(context);
    return ScreenUtilInit(
      designSize:
          const Size(393, 841), // Set your base design size (e.g., iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,
          themeMode: provider.themeMode,
          initialRoute: userprovider.currentUser != null
              ? HomeView.routeName
              : IntroductionView.routeName,
          routes: {
            IntroductionView.routeName: (context) => const IntroductionView(),
            OnBoardingView.routeName: (context) => const OnBoardingView(),
            LoginView.routeName: (context) => LoginView(),
            SignUpView.routeName: (context) => SignUpView(),
            HomeView.routeName: (context) => HomeView(),
            ForgetPasswordView.routeName: (context) => ForgetPasswordView(),
            CreateEvent.routeName: (context) => CreateEvent(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
