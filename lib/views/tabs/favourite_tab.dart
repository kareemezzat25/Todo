import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/eventmodel.dart';
import 'package:todo_app/models/theme.dart';
import 'package:todo_app/widgets/taskitem.dart';

class FavouriteTab extends StatefulWidget {
  FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  var searchController = TextEditingController();
  var searchQuery = "";

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            TextField(
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14),
              controller: searchController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: MyThemeData.primarycolorlight,
                  ),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 14),
                  labelText: "Search for Event",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide:
                          BorderSide(color: MyThemeData.primarycolorlight)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide:
                          BorderSide(color: MyThemeData.primarycolorlight)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide:
                          BorderSide(color: MyThemeData.primarycolorlight))),
            ),
            SizedBox(
              height: 16.h,
            ),
            StreamBuilder<QuerySnapshot<EventModel>>(
                stream: FirebaseManager.getFavouriteEvents(searchQuery),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: MyThemeData.primarycolorlight,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(
                      textAlign: TextAlign.center,
                      "SomeThing Went Wrong",
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  }
                  var length = snapshot.data?.docs.length ?? 0;
                  if (length == 0) {
                    return Text(
                      textAlign: TextAlign.center,
                      "There is No Task in Favourite",
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return TaskItem(
                              event: snapshot.data!.docs[index].data());
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 16.h,
                          );
                        },
                        itemCount: snapshot.data!.docs.length),
                  );
                })
          ],
        ),
      ),
    );
  }
}
