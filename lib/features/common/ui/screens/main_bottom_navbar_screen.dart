import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainBottomNavbarScreen extends StatefulWidget {
  const MainBottomNavbarScreen({super.key});

  static String name = '/main-bottom-navbar';

  @override
  State<MainBottomNavbarScreen> createState() => _MainBottomNavbarScreenState();
}

class _MainBottomNavbarScreenState extends State<MainBottomNavbarScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(
      child: Text('Message Screen'),
    ),
    const Center(
      child: Text('Setting Screen'),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withValues(alpha: .16),
                    blurRadius: 35,
                    offset: const Offset(0, 6))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavIcon(
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home,
                  index: 0),
              _buildNavIcon(
                  icon: Icons.message_outlined,
                  selectedIcon: Icons.message,
                  index: 1),
              _buildNavIcon(
                  icon: Icons.settings_outlined,
                  selectedIcon: Icons.settings,
                  index: 2),
            ],
          ),
        ));
  }

  GestureDetector _buildNavIcon(
      {required IconData icon,
      required IconData selectedIcon,
      required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: _selectedIndex == index
          ? Icon(
              selectedIcon,
              color: AppColors.themeColor,
              size: 30,
            )
          : Icon(
              icon,
              size: 30,
            ),
    );
  }
}
