// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neiramdal_misis/features/home/views/screens/home_screen.dart';
import 'package:neiramdal_misis/features/mission/views/screens/mission_screen.dart';
import 'package:neiramdal_misis/features/profile/views/screens/profile_screen.dart';
import 'package:neiramdal_misis/features/shop/views/screens/shop_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    _buildPlaceholderScreen('Рейтинг'),
    MissionScreen(),
    ShopScreen(),
    ProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Color.fromRGBO(40, 62, 149, 1)),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              icon: 'lib/assets/images/homeIcon.svg',
              activeIcon: 'lib/assets/images/homeActiveIcon.svg',
              label: 'Главная',
            ),
            _buildNavItem(
              index: 1,
              icon: 'lib/assets/images/ratingIcon.svg',
              activeIcon: 'lib/assets/images/ratingActiveIcon.svg',
              label: 'Рейтинг',
            ),
            _buildNavItem(
              index: 2,
              icon: 'lib/assets/images/missionIcon.svg',
              activeIcon: 'lib/assets/images/missionActiveIcon.svg',
              label: 'Миссии',
            ),
            _buildNavItem(
              index: 3,
              icon: 'lib/assets/images/storeIcon.svg',
              activeIcon: 'lib/assets/images/storeActiveIcon.svg',
              label: 'Магазин',
            ),
            _buildNavItem(
              index: 4,
              icon: 'lib/assets/images/profileIcon.svg',
              activeIcon: 'lib/assets/images/profileActiveIcon.svg',
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String activeIcon,
    required String label,
  }) {
    final bool isSelected = _selectedIndex == index;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () => _onItemTapped(index),
          child: Stack(
            children: [
              AnimatedOpacity(
                opacity: isSelected ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: SvgPicture.asset(activeIcon),
              ),
              AnimatedOpacity(
                opacity: isSelected ? 0 : 1,
                duration: Duration(milliseconds: 300),
                child: SvgPicture.asset(icon),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildPlaceholderScreen(String title) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(42, 44, 69, 1),
            Color.fromRGBO(40, 62, 149, 1),
            Color.fromRGBO(52, 48, 73, 1),
          ],
          stops: [0, 0.36, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
