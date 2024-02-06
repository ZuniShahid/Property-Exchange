import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../constants/global_variables.dart';
import '../generated/assets.dart';
import 'create_deal.dart';
import 'home_screen.dart';
import 'setting_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;

  final AuthController _authController = Get.find<AuthController>();

  final List<Widget> _pages = [
    HomeScreen(),
    SettingScreen(),
  ]; // Add your pages here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        selectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 10),
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 10),
        backgroundColor: AppColors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF676767),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.iconsHomeIc,
              fit: BoxFit.fill,
              height: 24,
              width: 24,
              color: currentIndex == 0 ? Colors.white : Color(0xFF676767),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.iconsSettings,
              fit: BoxFit.fill,
              height: 24,
              width: 24,
              color: currentIndex == 1 ? Colors.white : Color(0xFF676767),
            ),
            label: "Setting",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateDeal());
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
