import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login_screen.dart';
import '../auth/reset_password.dart';
import '../constants/global_variables.dart';
import '../generated/assets.dart';
import '../widgets/custom_widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  void _showLogoutConfirmation(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.grey,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 45,
              height: 5,
            ),
            Container(
              width: 45,
              height: 3,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Log out',
                    style: headingLarge.copyWith(color: AppColors.primaryColor),
                  ),
                  Divider(
                    color: Color(0xFFFFFFFF).withOpacity(0.1),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Are you sure you want to log out?',
                    style: bodyNormal,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Cancel',
                          style: headingSmall.copyWith(
                            color: Color(0xFFD8812F),
                          ),
                        ),
                      ),
                      SizedBox(width: 80),
                      Expanded(
                        flex: 3,
                        child: CustomButton(
                          onTap: () {
                            Get.offAll(LoginScreen());
                          },
                          buttonText: 'Yes, Log Out',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Settings',
          style: headingSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {
                  Get.to(() => ResetPassword(email: ''));
                },
                leading: Image.asset(
                  Assets.iconsLockBorder,
                  color: AppColors.primaryColor,
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  'Change Password',
                  style: bodyNormal,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {
                  _showLogoutConfirmation(
                      context); // Show logout confirmation bottom sheet
                },
                leading: Image.asset(
                  'assets/icons/logout.png',
                  color: AppColors.primaryColor,
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  'Log out',
                  style: bodyNormal,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
