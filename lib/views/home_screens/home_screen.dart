import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/bottom_nav_controller/dashboard_controller/dashboard_controller.dart';
import 'package:movie_app/views/pages_bottom_navbar/dashboard/dashboard.dart';
import 'package:movie_app/views/pages_bottom_navbar/media/media.dart';
import 'package:movie_app/views/pages_bottom_navbar/more/more.dart';
import 'package:movie_app/views/pages_bottom_navbar/watch/watch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (dashboardcontroller) {
          return Scaffold(
            drawerEnableOpenDragGesture: false,
            body: SafeArea(
                child: IndexedStack(
              index: dashboardcontroller.tabIndex,
              children: [
                const DashboardPage(),
                WatchPage(),
                const MediaPage(),
                const MorePage(),
              ],
            )),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(27.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: const Color(0Xff2E2739),
                showUnselectedLabels: true,
                unselectedFontSize: 10.0,
                selectedFontSize: 10.0,
                unselectedItemColor: const Color(0Xff827D88),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w400),
                selectedLabelStyle: const TextStyle(
                    height: 2,
                    decorationColor: Color(0XFFFFFFFF),
                    fontWeight: FontWeight.w700),
                type: BottomNavigationBarType.fixed,
                currentIndex: dashboardcontroller.tabIndex,
                selectedItemColor: const Color(0XffFFFFFF),
                iconSize: 20,
                onTap: dashboardcontroller.changeTabIndex,
                elevation: 5,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.dashboard,
                      size: 18,
                    ),
                    icon: Icon(
                      Icons.dashboard,
                      size: 18,
                    ),
                    label: ('Dashboard'),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      CupertinoIcons.play_rectangle_fill,
                      size: 18,
                    ),
                    icon: Icon(
                      CupertinoIcons.play_rectangle_fill,
                    ),
                    label: ('Watch'),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      CupertinoIcons.rectangle_stack,
                      size: 18,
                    ),
                    icon: Icon(
                      CupertinoIcons.rectangle_stack,
                      size: 18,
                    ),
                    label: ('Media Libaray'),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      CupertinoIcons.list_bullet,
                      size: 18,
                    ),
                    icon: Icon(
                      CupertinoIcons.list_bullet,
                      size: 18,
                    ),
                    label: ('More'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
