import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/eventmodel.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/views/homeview.dart';

class EventDetails extends StatelessWidget {
  static const String routeName = "EventDetails";
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var event = ModalRoute.of(context)?.settings.arguments as EventModel;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyThemeData.primarycolorlight),
        title: Text(
          "task_details".tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          const Icon(
            Icons.edit,
            color: MyThemeData.primarycolorlight,
          ),
          SizedBox(
            width: 12.w,
          ),
          Padding(
            padding: context.locale.toString() == "en"
                ? const EdgeInsets.only(right: 8)
                : EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: () async {
                FirebaseManager.deleteEvent(event.id);
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: MyThemeData.primarycolorlight,
                    ),
                  ),
                );
                await Future.delayed(const Duration(seconds: 1));
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeView.routeName, (route) => false);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset("assets/images/${event.category}.png")),
              SizedBox(
                height: 16.h,
              ),
              Text(
                event.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: MyThemeData.primarycolorlight)),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: MyThemeData.primarycolorlight,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? MyThemeData.primaryColordark
                            : MyThemeData.secondaryColorLightdark,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('d MMMM yyyy').format(
                              DateTime.fromMillisecondsSinceEpoch(event.date)),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          event.time,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      themeProvider.themeMode == ThemeMode.dark
                                          ? MyThemeData.secondaryColorLightdark
                                          : MyThemeData.primaryColordark),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              /* Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: MyThemeData.primarycolorlight)),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: MyThemeData.primarycolorlight,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Icon(
                        Icons.gps_fixed,
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? MyThemeData.primaryColordark
                            : MyThemeData.secondaryColorLightdark,
                      ),
                    ),
                    Text(
                      event.location,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: MyThemeData.primarycolorlight,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              SizedBox(
                height: 16.h,
              ),*/
              Text(
                "task_description".tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: themeProvider.themeMode == ThemeMode.dark
                        ? const Color(0xFFF4EBDC)
                        : const Color(0xFF1C1C1C)),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                event.description,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: themeProvider.themeMode == ThemeMode.dark
                        ? const Color(0xFFF4EBDC)
                        : const Color(0xFF1C1C1C)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
