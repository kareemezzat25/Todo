import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/eventmodel.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/views/edit_task.dart';
import 'package:todo_app/views/eventdetails.dart';

class TaskItem extends StatefulWidget {
  EventModel event;

  TaskItem({super.key, required this.event});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(widget.event.date);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EventDetails.routeName,
            arguments: widget.event);
      },
      child: Card(
        elevation: 3,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                          color: MyThemeData.primarycolorlight, width: 2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      "assets/images/${widget.event.category}.png",
                      height: 203.h,
                      width: 360.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 345.w,
                  height: 40.h,
                  margin: const EdgeInsets.all(8),
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.event.title,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, EditTask.routeName,
                                    arguments: widget.event);
                              },
                              child: Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: InkWell(
                              onTap: () {
                                FirebaseManager.deleteEvent(widget.event.id);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              widget.event.isDone = !widget.event.isDone;
                              FirebaseManager.updateEvent(widget.event);
                              setState(() {});
                            },
                            child: Icon(
                              widget.event.isDone
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
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
                    DateFormat('d').format(date),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    DateFormat('MMM').format(date),
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
      ),
    );
    ;
  }
}
