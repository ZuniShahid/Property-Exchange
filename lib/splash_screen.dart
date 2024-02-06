import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'auth/login_screen.dart';
import 'generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  _navigate() async {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.offAll(() => const LoginScreen());
    });
    // bool isLoggedIn = await AuthPreference.instance.getUserLoggedIn();
    // print("isLoggedIn");
    // print(isLoggedIn);
    // if (isLoggedIn) {
    //   _authController.getFCMToken();
    //
    //   Future.delayed(const Duration(milliseconds: 4000), () {
    //     Get.find<GeneralController>().onBottomBarTapped(0);
    //     Get.offAll(() => CustomBottomNavBar());
    //   });
    // } else {
    //   Future.delayed(const Duration(milliseconds: 4000), () {
    //     Get.offAll(() => const WelcomeScreen());
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(Assets.imagesLogo),
            ),
            // Spacer(),
            Expanded(
              flex: 1,
              child: SpinKitCircle(
                color: Color(0xFF747474),
                size: 60.0,
              ),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
