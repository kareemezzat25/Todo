import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/eventmodel.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/create_event_provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

class CreateEvent extends StatelessWidget {
  static const String routeName = "createEvent";
  static const Color color = Color(0xFF1C1C1C);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        var themeProvider = Provider.of<ThemeProvider>(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text("Create Event"),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(
                        "assets/images/${provider.eventCategories[provider.selectedIndex]}.png",
                        height: 203.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                provider.changeCategory(index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                    color: provider.selectedIndex == index
                                        ? MyThemeData.primarycolorlight
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(36.r),
                                    border: Border.all(
                                        color: MyThemeData.primarycolorlight)),
                                child: Text(
                                  provider.eventCategories[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: provider.selectedIndex == index
                                              ? MyThemeData.secondaryColorDark
                                              : MyThemeData.primarycolorlight),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10.w,
                            );
                          },
                          itemCount: provider.eventCategories.length),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text("Title",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : color)),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      controller: titleController,
                      style: Theme.of(context).textTheme.titleMedium,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.edit,
                            color: themeProvider.themeMode == ThemeMode.dark
                                ? MyThemeData.secondaryColorDark
                                : Theme.of(context).focusColor,
                          ),
                          labelText: "Event Title",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      themeProvider.themeMode == ThemeMode.dark
                                          ? MyThemeData.secondaryColorDark
                                          : Theme.of(context).focusColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: Theme.of(context).focusColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: Theme.of(context).focusColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: Theme.of(context).focusColor))),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: themeProvider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : color),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      maxLines: 4,
                      controller: descriptionController,
                      style: Theme.of(context).textTheme.titleMedium,
                      decoration: InputDecoration(
                          labelText: "Event Description",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      themeProvider.themeMode == ThemeMode.dark
                                          ? MyThemeData.secondaryColorDark
                                          : Theme.of(context).focusColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: Theme.of(context).focusColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: Theme.of(context).focusColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: Theme.of(context).focusColor))),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: themeProvider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : color,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "Event Date",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      themeProvider.themeMode == ThemeMode.dark
                                          ? MyThemeData.secondaryColorDark
                                          : color),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now()
                                    .subtract(Duration(days: 365)),
                                initialDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)));

                            if (date != null) {
                              provider.changeDate(date);
                            }
                          },
                          child: Text(
                            provider.selectedDate.toString().substring(0, 10),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: themeProvider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : color,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "Event Time",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      themeProvider.themeMode == ThemeMode.dark
                                          ? MyThemeData.secondaryColorDark
                                          : color),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            var time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(hour: 0, minute: 0));

                            if (time != null) {
                              provider.changeTime(time);
                            }
                          },
                          child: Text(
                            provider.selectedTime.toString().substring(10, 15),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Location",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: themeProvider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : color),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          side: const BorderSide(
                              color: MyThemeData.primarycolorlight)),
                      leading: Container(
                        width: 46.w,
                        height: 46.h,
                        child: const Icon(Icons.pin_drop, color: Colors.white),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: MyThemeData.primarycolorlight),
                      ),
                      title: Text(
                        "Choose Event Location",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: MyThemeData.primarycolorlight,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String formattedTime =
                              "${provider.selectedTime.hour}:${provider.selectedTime.minute}";
                          FirebaseManager.addEvent(EventModel(
                              title: titleController.text,
                              category: provider
                                  .eventCategories[provider.selectedIndex],
                              date:
                                  provider.selectedDate.millisecondsSinceEpoch,
                              time: formattedTime,
                              description: descriptionController.text));
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(361.w, 55.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r)),
                            backgroundColor: MyThemeData.primarycolorlight),
                        child: Text(
                          "Add Event",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyThemeData.secondaryColorDark),
                        ))
                  ],
                ),
              ),
            ));
      },
    );
  }
}
