import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:student_getx_project/utils/navbar_item.dart';
import 'package:student_getx_project/utils/screens.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController persistentTabController = PersistentTabController();
    return Scaffold(
        bottomNavigationBar: PersistentTabView(
          
      context,
      backgroundColor: const Color.fromARGB(255, 48, 62, 69),
      items: navBarItem,
      screens: screens,
      screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true, duration: Duration(milliseconds: 700)),
      controller: persistentTabController,
      hideNavigationBarWhenKeyboardShows: true,
      navBarStyle: NavBarStyle.style9,
    ));
  }
}
