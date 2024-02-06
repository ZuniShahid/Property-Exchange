import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/custom_validators.dart';
import '../../constants/global_variables.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/text_form_fields.dart';
import '../generated/assets.dart';
import '../home/bottom_nav_bar.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 90.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    Assets.imagesAppIcon,
                    height: 73,
                    width: 110,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: 60),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Log In",
                      style: headingLarge,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign in to your account",
                      style: authSubHeading,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        AuthTextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => CustomValidator.email(value),
                          hintText: "Email Address",
                          prefixIcon: Assets.iconsEmail,
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          controller: _passwordController,
                          validator: (value) => CustomValidator.password(value),
                          hintText: "Password",
                          isObscure: _obscureText,
                          prefixIcon: Assets.iconsLock,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 22.0),
                              child: Icon(
                                !_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.greyIcon,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ForgotPassword());
                        },
                        child: Text(
                          "Forgot Password?",
                          style: bodyNormal.copyWith(
                              fontFamily: "PoppinsSemiBold"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomButton(
                      buttonText: "Sign In",
                      onTap: () {
                        if (!key.currentState!.validate()) {
                          return;
                        }
                        var body = {
                          'email': _emailController.text,
                          'password': _passwordController.text,
                        };
                        Get.offAll(() => CustomBottomNavBar());

                        ///TODO: I changed
                        // _authController.userLogin(body);
                        ///TODO: I changed
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 20,
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
