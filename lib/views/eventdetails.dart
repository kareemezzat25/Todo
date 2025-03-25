import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/eventmodel.dart';
import 'package:todo_app/models/theme.dart';
import 'dart:ui' as ui; // Import dart:ui explicitly

import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/views/edit_task.dart';
import 'package:todo_app/views/homeview.dart';

class EventDetails extends StatefulWidget {
  static const String routeName = "EventDetails";
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late EventModel event;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    event = ModalRoute.of(context)?.settings.arguments as EventModel;
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyThemeData.primarycolorlight),
        title: Text(
          "task_details".tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          InkWell(
            onTap: () async {
              final updatedEvent = await Navigator.pushNamed(
                context,
                EditTask.routeName,
                arguments: event,
              );

              if (updatedEvent != null && updatedEvent is EventModel) {
                event = updatedEvent;
                print(event.description);
                setState(() {});
              }
            },
            child: const Icon(
              Icons.edit,
              color: MyThemeData.primarycolorlight,
            ),
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
      body: StreamBuilder<QuerySnapshot<EventModel>>(
        stream: FirebaseManager.getTaskWithId(event.id),
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
                "message_went_wrong".tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text(
              "No Data Found",
              style: Theme.of(context).textTheme.titleLarge,
            ));
          }
          EventModel task = snapshot.data!.docs.first.data();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset("assets/images/${task.category}.png")),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border:
                            Border.all(color: MyThemeData.primarycolorlight)),
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
                            Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: Text(
                                DateFormat('d MMMM yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        task.date)),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Text(
                              formatTime(task.time),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: themeProvider.themeMode ==
                                              ThemeMode.dark
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
                    task.description,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? const Color(0xFFF4EBDC)
                            : const Color(0xFF1C1C1C)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String formatTime(String time) {
    List<String> parts = time.split(':');
    if (parts.length == 2) {
      String hours = parts[0].padLeft(2, '0');
      String minutes = parts[1].padLeft(2, '0');
      return "$hours:$minutes";
    }
    return time;
  }
}
