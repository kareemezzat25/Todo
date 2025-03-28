import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/providers/userprovider.dart';
import 'package:todo_app/views/loginview.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<ThemeProvider>(context);
    var userprovider = Provider.of<UserProvider>(context);
    String selectedLanguage =
        context.locale.toString() == "en" ? "english" : "arabic";
    String selectedTheme =
        themeprovider.themeMode == ThemeMode.dark ? "dark" : "light";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 160.h,
        backgroundColor: MyThemeData.primarycolorlight,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/birthday.png",
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userprovider.userModel?.userName ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: MyThemeData.secondaryColorLightdark),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    userprovider.userModel?.email ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyThemeData.secondaryColorLightdark),
                  )
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34.r),
                bottomRight: Radius.circular(34.r))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "language".tr(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: themeprovider.themeMode == ThemeMode.dark
                      ? MyThemeData.secondaryColorDark
                      : const Color(0xFF1C1C1C)),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: MyThemeData.primarycolorlight)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    value: selectedLanguage,
                    items: ["arabic", "english"].map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(
                          language.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                        context.setLocale(Locale(
                            selectedLanguage == "english" ? "en" : "ar"));
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down,
                        size: 32, color: MyThemeData.primarycolorlight),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "theme".tr(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: themeprovider.themeMode == ThemeMode.dark
                      ? MyThemeData.secondaryColorDark
                      : const Color(0xFF1C1C1C)),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: MyThemeData.primarycolorlight)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    value: selectedTheme,
                    items: ["light", "dark"].map((String theme) {
                      return DropdownMenuItem<String>(
                        value: theme,
                        child: Text(
                          theme.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTheme = newValue!;
                        themeprovider.changeTheme();
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down,
                        color: MyThemeData.primarycolorlight),
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  FirebaseManager.logOut().then((_) async {
                    const Center(
                      child: CircularProgressIndicator(
                        color: MyThemeData.primarycolorlight,
                      ),
                    );
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginView.routeName, (route) => false);
                  });
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: const Color(0xFFFF5659),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "logout".tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
