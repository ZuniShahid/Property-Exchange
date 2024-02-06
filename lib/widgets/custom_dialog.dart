import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../constants/global_variables.dart';
import 'custom_widgets.dart';

///Custom Dialog Single Button

Future<void> showCustomDialog(
  BuildContext context,
  String image,
  String title,
  String desc,
  String buttonText,
  final Function onTap,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: AppColors.grey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
              ),
              image == ""
                  ? SizedBox.shrink()
                  : Image.asset(
                      image,
                      height: 120,
                      width: 120,
                    ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Text(
                  title,
                  style: headingLarge.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36.0,
                  vertical: 10,
                ),
                child: Text(
                  desc,
                  style: bodyNormal.copyWith(
                      color: Colors.white.withOpacity(0.50)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                child: CustomButton(
                  onTap: onTap,
                  buttonText: buttonText,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
    },
  );
}

class CustomDialogBox {
  static Future<dynamic> confirmationDialog(
      {required BuildContext context,
      required String title,
      required VoidCallback? btnYesPressed,
      required VoidCallback? btnNoPressed}) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: SizedBox(
                height: 25.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        color: AppColors.primaryColor,
                      ),
                      height: 5.h,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                title,
                                // 'Are you sure you want to apply this class',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 2,
                                      fixedSize: Size(100.w, 5.h),
                                    ),
                                    onPressed: btnYesPressed,
                                    child: const Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.primaryColor,
                                      elevation: 2,
                                      backgroundColor: Colors.white,
                                      side: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.5),
                                      fixedSize: Size(100.w, 5.h),
                                    ),
                                    onPressed: btnNoPressed,
                                    child: const Center(
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
        });
  }

  static Future<dynamic> requiredPasswordDialog({
    required BuildContext context,
    required VoidCallback? btnYesPressed,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            final TextEditingController requiredPasswordController =
                TextEditingController();

            return AlertDialog(
              content: SizedBox(
                height: 25.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        color: AppColors.primaryColor,
                      ),
                      height: 5.h,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                'Please enter your password',
                                // 'Are you sure you want to apply this class',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 5.h,
                            width: 64.w,
                            decoration: const BoxDecoration(),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 5, top: 3, bottom: 3),
                                child: TextField(
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                  controller: requiredPasswordController,
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.grey.withOpacity(0.3))),
                                    contentPadding: const EdgeInsets.only(
                                        left: 8.0, bottom: 12.0, top: 5.0),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 2,
                                      fixedSize: Size(100.w, 5.h),
                                    ),
                                    onPressed: btnYesPressed,
                                    child: const Center(
                                      child: Text(
                                        'oK',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
        });
  }

  // TODO: show success dialog

  static Future<dynamic> showErrorDialog({
    String title = 'Error',
    String? description = 'Something went wrong',
  }) {
    return Get.dialog(
      Dialog(
        child: SizedBox(
          height: 30.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0)),
                    color: AppColors.primaryColor,
                  ),
                  height: 13.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 11.h,
                        child: Center(
                          child: Lottie.asset('assets/animations/error.json'),
                        ),
                      )
                    ],
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        title,
                        // 'Are you sure you want to apply this class',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          description!,
                          // 'Are you sure you want to apply this class',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          elevation: 2,
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              color: AppColors.primaryColor, width: 1.5),
                          fixedSize: const Size(80, 13),
                        ),
                        onPressed: () {
                          if (Get.isDialogOpen!) Get.back();
                        },
                        child: const Center(
                          child: Text(
                            'Ok',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<dynamic> showSuccessDialog({description = ''}) {
    return Get.dialog(
      Dialog(
        child: SizedBox(
          height: 30.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0)),
                    color: AppColors.primaryColor,
                  ),
                  height: 15.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                        child: Center(
                          child: Lottie.asset(
                              'assets/animations/congratulations.json'),
                        ),
                      )
                    ],
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        description,
                        // 'Are you sure you want to apply this class',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          elevation: 2,
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              color: AppColors.primaryColor, width: 1.5),
                          fixedSize: const Size(80, 13),
                        ),
                        onPressed: () {
                          if (Get.isDialogOpen!) {
                            Get.back();
                          }
                        },
                        child: const Center(
                          child: Text(
                            'Ok',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void loginDialog() {
    Get.dialog(
      Dialog(
        child: SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              if (Get.isDialogOpen!) Get.back();
                            },
                            child: const Icon(
                              Icons.cancel_outlined,
                              size: 20,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        'Please sign In',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          elevation: 2,
                          backgroundColor: AppColors.primaryColor,
                          side: const BorderSide(
                              color: AppColors.primaryColor, width: 1.5),
                          fixedSize: const Size(80, 12),
                        ),
                        onPressed: () {
                          if (Get.isDialogOpen!) Get.back();
                        },
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator.adaptive(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
