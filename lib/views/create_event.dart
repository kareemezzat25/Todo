import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/providers/create_event_provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

class CreateEvent extends StatelessWidget {
  static const String routeName = "createEvent";
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        var themeProvider = Provider.of<ThemeProvider>(context);
        return Scaffold(
            appBar: AppBar(
              title: Text("Create Event"),
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
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.edit,
                            color: Theme.of(context).focusColor,
                          ),
                          labelText: "Event Title",
                          labelStyle: Theme.of(context).textTheme.titleMedium,
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
                                  color: Theme.of(context).primaryColor))),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Event Description",
                          labelStyle: Theme.of(context).textTheme.titleMedium,
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
                                  color: Theme.of(context).primaryColor))),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "Event Date",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Spacer(),
                        Text(
                          "Choose Date",
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "Event Time",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Spacer(),
                        Text(
                          "Choose Time",
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Location",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      leading: Container(
                        width: 46.w,
                        height: 46.h,
                        child: Icon(Icons.pin_drop, color: Colors.white),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Theme.of(context).primaryColor),
                      ),
                      title: Text(
                        "Choose Event Location",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(361.w, 55.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r)),
                            backgroundColor: Theme.of(context).primaryColor),
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
