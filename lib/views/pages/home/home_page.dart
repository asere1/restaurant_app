import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:restaurant_app/views/pages/home/main_food_page.dart';

import '../../../utilites/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _bottomNavbarController =
      PersistentTabController();

  List<Widget> pages = [
    const MainFoodPage(),
    Container(
      child: Center(child: Text('nextPage1')),
    ),
    Container(
      child: Center(child: Text('nextPage2')),
    ),
    Container(
      child: Center(child: Text('nextPage3')),
    ),
  ];
  List<PersistentBottomNavBarItem> navbarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_outlined),
      title: 'home',
      activeColorPrimary: AppColors.mainColor,
      inactiveColorPrimary: Colors.amberAccent,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.archive),
      title: 'history',
      activeColorPrimary: AppColors.mainColor,
      inactiveColorPrimary: Colors.amberAccent,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_cart),
      title: 'cart',
      activeColorPrimary: AppColors.mainColor,
      inactiveColorPrimary: Colors.amberAccent,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: 'me',
      activeColorPrimary: AppColors.mainColor,
      inactiveColorPrimary: Colors.amberAccent,
    ),
  ];

  @override
  void dispose() {
    _bottomNavbarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _bottomNavbarController,
        screens: pages,
        items: navbarItems,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
