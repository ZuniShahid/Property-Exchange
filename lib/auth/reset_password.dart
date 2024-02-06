import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/custom_validators.dart';
import '../../constants/global_variables.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/text_form_fields.dart';
import '../controllers/auth_controller.dart';
import '../generated/assets.dart';
import 'login_screen.dart';

class ResetPassword extends StatefulWidget {
  final String? email;

  const ResetPassword({Key? key, this.email}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureText = true;
  bool _oldObscureText = true;
  bool _obscureTextConfirm = true;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

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
          "Reset Password",
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
              child: Form(
                key: key,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Set your new password to login into your account!",
                        style: authSubHeading,
                      ),
                    ),
                    Expanded(
                      child: const SizedBox(),
                    ),
                    widget.email != ''
                        ? SizedBox.shrink()
                        : AuthTextField(
                            controller: _oldPasswordController,
                            validator: (value) =>
                                CustomValidator.password(value),
                            hintText: "Old Password",
                            isObscure: _oldObscureText,
                            prefixIcon: Assets.iconsLock,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _oldObscureText = !_oldObscureText;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 22.0),
                                child: Icon(
                                  !_oldObscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.greyIcon,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      controller: _passwordController,
                      validator: (value) => CustomValidator.password(value),
                      hintText: "New Password",
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
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextField(
                      controller: _confirmPasswordController,
                      validator: (value) => CustomValidator.confirmPassword(
                          value, _passwordController.text),
                      hintText: "Confirm Password",
                      isObscure: _obscureTextConfirm,
                      prefixIcon: Assets.iconsLock,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureTextConfirm = !_obscureTextConfirm;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: Icon(
                            !_obscureTextConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.greyIcon,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: const SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomButton(
                        buttonText: "Confirm",
                        onTap: () async {
                          Get.offAll(() => LoginScreen());

                          // if (!key.currentState!.validate()) {
                          //   return;
                          // }
                          // var body = {
                          //   'email': widget.email!,
                          //   'password': _passwordController.text,
                          //   'password_confirmation':
                          //       _confirmPasswordController.text,
                          // };
                          // var res = await _authController.resetPassword(body);
                          // if (res['success']) {
                          //   Get.offAll(() => LoginScreen());
                          // }
                        },
                      ),
                    ),
                    Expanded(
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
