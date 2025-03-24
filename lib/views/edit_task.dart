import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/eventmodel.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/create_event_provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

class EditTask extends StatelessWidget {
  static const String routeName = "EditTask";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    EventModel taskItem =
        ModalRoute.of(context)?.settings.arguments as EventModel;
    titleController.text = taskItem.title;
    descriptionController.text = taskItem.description;
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var taskprovider = Provider.of<CreateEventProvider>(context);
        var themeProvider = Provider.of<ThemeProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("edit_task".tr()),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
            iconTheme: IconThemeData(color: MyThemeData.primarycolorlight),
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
                          "assets/images/${taskprovider.eventCategories[taskprovider.selectedIndex]}.png")),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            decoration: BoxDecoration(
                                color: taskprovider.selectedIndex == index
                                    ? MyThemeData.primarycolorlight
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(37.r),
                                border: Border.all(
                                    color: MyThemeData.primarycolorlight)),
                            child: Text(
                              taskprovider.eventCategories[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: themeProvider.themeMode ==
                                              ThemeMode.dark
                                          ? taskprovider.selectedIndex == index
                                              ? MyThemeData.primaryColordark
                                              : MyThemeData.primarycolorlight
                                          : taskprovider.selectedIndex == index
                                              ? MyThemeData
                                                  .secondaryColorLightdark
                                              : null),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 10.w,
                          );
                        },
                        itemCount: taskprovider.eventCategories.length),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "task_title".tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? MyThemeData.secondaryColorDark
                            : Color(0xFF1C1C1C)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextField(
                    controller: titleController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : Theme.of(context).focusColor),
                        labelText: "task_title_label".tr(),
                        prefixIcon: Icon(
                          Icons.edit,
                          color: themeProvider.themeMode == ThemeMode.dark
                              ? MyThemeData.secondaryColorDark
                              : Theme.of(context).focusColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: Theme.of(context).focusColor))),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "task_description".tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? MyThemeData.secondaryColorDark
                            : Color(0xFF1C1C1C)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextField(
                    controller: descriptionController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : Theme.of(context).focusColor),
                        labelText: "task_description_label".tr(),
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
                        Icons.calendar_month_outlined,
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? MyThemeData.secondaryColorDark
                            : Color(0xFF1C1C1C),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "task_date".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : Color(0xFF1C1C1C)),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () async {
                            var selectedDate = await showDatePicker(
                                context: context,
                                initialDate: taskprovider.selectedDate,
                                firstDate: DateTime.now()
                                    .subtract(Duration(days: 365)),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)));
                            if (selectedDate != null) {
                              taskprovider.changeDate(selectedDate);
                            }
                          },
                          child: Text(
                            "choose_date".tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? MyThemeData.secondaryColorDark
                            : Color(0xFF1C1C1C),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "task_time".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? MyThemeData.secondaryColorDark
                                    : Color(0xFF1C1C1C)),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {},
                          child: Text(
                            "choose_time".tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "task_location".tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? MyThemeData.secondaryColorDark
                            : Color(0xFF1C1C1C)),
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: MyThemeData.primarycolorlight),
                      child: Icon(
                        Icons.gps_fixed,
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? MyThemeData.primaryColordark
                            : MyThemeData.secondaryColorLightdark,
                      ),
                    ),
                    title: Text(
                      "choose_location".tr(),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(361.w, 56.h),
                          backgroundColor: MyThemeData.primarycolorlight,
                          padding: EdgeInsets.symmetric(vertical: 16.h)),
                      child: Text(
                        "edit_task".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
