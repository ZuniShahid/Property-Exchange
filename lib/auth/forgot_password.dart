import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/custom_validators.dart';
import '../../constants/global_variables.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/text_form_fields.dart';
import '../controllers/auth_controller.dart';
import '../generated/assets.dart';
import 'forgot_verify_email.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

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
          "Forgot Password?",
          style: headingLarge,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Form(
              key: key,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter your email address, we will send you code to reset your password.",
                      style: authSubHeading,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AuthTextField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => CustomValidator.email(value),
                        hintText: "Email Address",
                        prefixIcon: Assets.iconsEmail,
                        controller: emailController,
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomButton(
                          buttonText: "Send Code",
                          onTap: () async {
                            if (!key.currentState!.validate()) {
                              return;
                            }
                            Get.to(() => ForgotVerifyEmail(
                                  otpCode: '123456',
                                  email: emailController.text,
                                ));
                            // var body = {'email': emailController.text};
                            // var res =
                            //     await _authController.forgotPassword(body);
                            // if (res['success']) {
                            //   Get.to(() => ForgotVerifyEmail(
                            //         otpCode: res['email_verification'],
                            //         email: emailController.text,
                            //       ));
                            // } else {}
                          },
                        ),
                      ),
                    ],
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
