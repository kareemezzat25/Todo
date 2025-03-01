import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/widgets/taskitem.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
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
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back ✨",
                  style: Theme.of(context).textTheme.bodySmall),
              Text(
                "Kareem elfeky",
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
            icon: Icon(Icons.sunny),
            color: Colors.white,
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            margin: EdgeInsets.only(right: 16.w),
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
                height: 8.h,
              ),
              Container(
                height: 60.h,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return TaskItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
            itemCount: 4),
      ),
    );
  }
}
