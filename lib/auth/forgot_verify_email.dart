import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/global_variables.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/text_form_fields.dart';
import '../controllers/auth_controller.dart';
import 'reset_password.dart';

class ForgotVerifyEmail extends StatefulWidget {
  final String otpCode;
  final String email;

  const ForgotVerifyEmail(
      {Key? key, required this.otpCode, required this.email})
      : super(key: key);

  @override
  State<ForgotVerifyEmail> createState() => _ForgotVerifyEmailState();
}

class _ForgotVerifyEmailState extends State<ForgotVerifyEmail> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _otpController = TextEditingController();
  late String currentOtpCode;

  @override
  void initState() {
    // TODO: implement initState
    currentOtpCode = widget.otpCode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: BackButton(color: Colors.white),
        title: Text(
          "OTP Verification",
          style: headingLarge,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 90.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter the verification OTP we just sent you on your email Address.",
                      style: authSubHeading,
                    ),
                  ),
                  Expanded(child: const SizedBox()),
                  OtpField(otpController: _otpController),
                  Expanded(child: const SizedBox()),
                  CustomButton(
                      buttonText: "Verify Code",
                      onTap: () {
                        Get.to(() => ResetPassword(email: "widget.email"));

                        // if (_otpController.text.isEmpty) {
                        //   CustomToast.errorToast(message: "Enter OTP");
                        //   _otpController.clear();
                        // } else if (_otpController.text.length < 4 ||
                        //     _otpController.text != currentOtpCode) {
                        //   CustomToast.errorToast(
                        //       message:
                        //           "Invalid OTP. Please enter a valid OTP.");
                        //   _otpController.clear();
                        // } else if (_otpController.text == currentOtpCode) {
                        //   Get.to(() => ResetPassword(email: widget.email));
                        // }
                      }),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Re-send code in  0:20",
                          style: bodyNormal,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // InkWell(
                        //   onTap: () async {
                        //     var body = {'email': widget.email};
                        //
                        //     var res =
                        //         await _authController.forgotPassword(body);
                        //     if (res['success']) {
                        //       currentOtpCode = res['email_verification'];
                        //     } else {}
                        //     setState(() {});
                        //   },
                        //   child: Text(
                        //     "Resend",
                        //     style: bodyNormal.copyWith(
                        //         fontFamily: "PoppinsSemiBold",
                        //         color: AppColors.primaryColor,
                        //         decoration: TextDecoration.underline),
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
