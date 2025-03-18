import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/eventmodel.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/providers/userprovider.dart';
import 'package:todo_app/widgets/taskitem.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> eventCategories = [
    "All",
    "sports",
    "birthday",
    "BookClub",
    "eating",
    "exhibition",
    "gaming",
    "holiday",
    "meeting",
    "workshop"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        centerTitle: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18.r),
          bottomRight: Radius.circular(18.r),
        )),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("welcome_back".tr(),
                  style: Theme.of(context).textTheme.bodySmall),
              Text(
                userprovider.userModel?.userName ?? "",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              provider.changeTheme();
            },
            icon: const Icon(Icons.sunny),
            color: Colors.white,
          ),
          SizedBox(
            width: 10.w,
          ),
          InkWell(
            onTap: () {
              context.setLocale(
                  Locale(context.locale.toString() == "en" ? "ar" : "en"));
            },
            child: Container(
              margin: context.locale.toString() == "en"
                  ? EdgeInsets.only(right: 16.w)
                  : EdgeInsets.only(left: 16.w),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Text(
                "EN",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14.sp),
              ),
            ),
          )
        ],
        bottom: AppBar(
          centerTitle: false,
          toolbarHeight: 100.h,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.pin_drop,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Cairo , Egypt",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 50.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? provider.themeMode == ThemeMode.dark
                                      ? MyThemeData.primarycolorlight
                                      : MyThemeData.secondaryColorLightdark
                                  : null,
                              borderRadius: BorderRadius.circular(46.r),
                              border: Border.all(
                                  color: provider.themeMode == ThemeMode.dark
                                      ? MyThemeData.primarycolorlight
                                      : MyThemeData.secondaryColorLightdark)),
                          child: Text(
                            eventCategories[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: provider.themeMode == ThemeMode.dark
                                        ? MyThemeData.secondaryColorLightdark
                                        : selectedIndex == index
                                            ? MyThemeData.primarycolorlight
                                            : MyThemeData
                                                .secondaryColorLightdark),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                    itemCount: eventCategories.length),
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<EventModel>>(
        stream: FirebaseManager.getEvents(eventCategories[selectedIndex]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyThemeData.primarycolorlight,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "SomeThing Went Wrong",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return TaskItem(
                    event: snapshot.data!.docs[index].data(),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
                itemCount: snapshot.data?.docs.length ?? 0),
          );
        },
      ),
    );
  }
}
