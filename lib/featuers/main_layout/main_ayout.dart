import 'package:flutter/material.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/fav_tap/fav_screen.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/home_tap/home_screen.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/map_tap/map_screen.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/person_tap/person_screen.dart';

class Main_Ayout extends StatefulWidget {
  Main_Ayout({super.key});

  @override
  State<Main_Ayout> createState() => _Main_AyoutState();
}

class _Main_AyoutState extends State<Main_Ayout> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    FavScreen(),
    PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.Crate_Event);
        },
        child: Icon(Icons.add, color: ColorsManager.white),
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.blue,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? Icon(Icons.home, color: ColorsManager.white)
                : Icon(Icons.home_outlined, color: ColorsManager.white),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? Icon(Icons.map, color: ColorsManager.white)
                : Icon(Icons.location_on_outlined, color: ColorsManager.white),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? Icon(Icons.favorite, color: ColorsManager.white)
                : Icon(
                    Icons.favorite_border_outlined,
                    color: ColorsManager.white,
                  ),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? Icon(Icons.person, color: ColorsManager.white)
                : Icon(Icons.person_2_outlined, color: ColorsManager.white),
            label: "Person",
          ),
        ],
        selectedLabelStyle: TextStyle(color: ColorsManager.white),
        unselectedLabelStyle: TextStyle(color: ColorsManager.white),
      ),
    );
  }
}
