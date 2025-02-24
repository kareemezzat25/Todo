import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/theme.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  "assets/images/sports.png",
                  height: 203.h,
                  width: 360.w,
                ),
              ),
              Container(
                width: 345.w,
                height: 40.h,
                margin: const EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "This is a Birthday Party ",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 12.w, top: 8.h),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: MyThemeData.secondaryColorLightdark),
            child: Column(
              children: [
                Text(
                  "21",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Nov",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 14.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
