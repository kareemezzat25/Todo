import 'package:flutter/material.dart';
import 'package:todo_app/views/create_event.dart';
import 'package:todo_app/views/tabs/favourite_tab.dart';
import 'package:todo_app/views/tabs/home_tab.dart';
import 'package:todo_app/views/tabs/map/map_tab.dart';
import 'package:todo_app/views/tabs/profile_tab.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "Home";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> tabs = [HomeTab(), MapTab(), FavouriteTab(), const ProfileTab()];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateEvent.routeName);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? selectedIconImage(selectedIndex)
                  : const ImageIcon(AssetImage("assets/images/HomeIcon.png")),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? selectedIconImage(selectedIndex)
                    : const ImageIcon(AssetImage("assets/images/Map_Pin.png")),
                label: "Map"),
            BottomNavigationBarItem(
                icon: selectedIndex == 2
                    ? selectedIconImage(selectedIndex)
                    : const ImageIcon(AssetImage("assets/images/Heart.png")),
                label: "Love"),
            BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? selectedIconImage(selectedIndex)
                    : const ImageIcon(
                        AssetImage("assets/images/User_profile.png")),
                label: "Profile")
          ],
        ));
  }

  selectedIconImage(int index) {
    switch (index) {
      case 0:
        return const ImageIcon(
            AssetImage("assets/images/selectedHomeicon.png"));
      case 1:
        return const ImageIcon(AssetImage("assets/images/SelectedMapIcon.png"));
      case 2:
        return const ImageIcon(
            AssetImage("assets/images/SelectedFavouriteIcon.png"));
      case 3:
        return const ImageIcon(
            AssetImage("assets/images/selectedProfileIcon.png"));
    }
  }
}
