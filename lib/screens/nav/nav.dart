import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/screens/calendar/calendar_screen.dart';
import 'package:trackizer_app/screens/home/home_screen.dart';
import 'dart:math' as math;

import 'package:trackizer_app/screens/spending_budgets/spending_budgets_screen.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  final _pages = [
    const HomeScreen(),
    const SpendingBudgetsScreen(),
    const CalendarScreen(),
    Container(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kAccentP100,
        child: SvgPicture.asset('assets/icons/Add.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipPath(
      clipper: BottomNavClipper(),
      child: Container(
        height: 55.0,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
        decoration: BoxDecoration(
          color: kGrey60.withOpacity(0.75),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/Home.svg',
                    color: _selectedIndex == 0 ? Colors.white : kGrey30,
                  ),
                  onTap: () => _onItemTapped(0),
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/Budgets.svg',
                    color: _selectedIndex == 1 ? Colors.white : kGrey30,
                  ),
                  onTap: () => _onItemTapped(1),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/Calendar.svg',
                    color: _selectedIndex == 2 ? Colors.white : kGrey30,
                  ),
                  onTap: () => _onItemTapped(2),
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/CreditCards.svg',
                    color: _selectedIndex == 3 ? Colors.white : kGrey30,
                  ),
                  onTap: () => _onItemTapped(3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// https://gist.github.com/salimmurshed/882b772ed99e54d60b83e0fb7cd19b3b
class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2 - 36.0, 0.0)
      ..arcToPoint(
        Offset(size.width - (size.width / 2 - 36.0), 0),
        clockwise: false,
        radius: const Radius.circular(4.0),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
