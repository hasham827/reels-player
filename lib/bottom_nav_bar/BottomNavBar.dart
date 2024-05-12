import 'package:assignment/constants/app_icons.dart';
import 'package:assignment/screens/deals/deal.dart';
import 'package:assignment/screens/discover/discover.dart';
import 'package:assignment/screens/home/home.dart';
import 'package:assignment/screens/profile/profile.dart';
import 'package:flutter/material.dart';

import '../constants/app_text_styles.dart';
import 'components/custom_bottom_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        bottomIcons: const [
          {
            "title": "Home",
            "icon": AppIcons.home,
          },
          {
            "title": "Discover",
            "icon": AppIcons.search,
          },
          {
            "title": "",
            "icon": AppIcons.add,
          },
          {
            "title": "Deal",
            "icon": AppIcons.deal,
          },
          {
            "title": "Profile",
            "icon": AppIcons.profileIcon,
          }
        ],
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
      ),
      body: SafeArea(
        child: _currentIndex == 0
            ? const HomePage()
            : _currentIndex == 1
                ? const DiscoverPage()
                : _currentIndex == 3
                    ? const DealPage()
                    : const ProfilePage(),
      ),
    );
  }
}
