import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../constants/global_variables.dart';

/// Text Field Auth Screens Only
class AuthTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;
  final String? prefixIcon; // Changed the type to Widget?
  final bool? isObscure;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  const AuthTextField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.isObscure,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.grey,
      ),
      child: Center(
        child: TextFormField(
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          obscureText: widget.isObscure ?? false,
          controller: widget.controller,
          // Use the provided controller
          cursorColor: Colors.white,
          style: bodyNormal.copyWith(fontFamily: "PoppinsSemiBold"),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: bodyNormal.copyWith(
                color: Colors.white54, fontFamily: "PoppinsSemiBold"),
            suffixIcon: widget.suffixIcon,
            suffixIconColor: AppColors.greyIcon,
            prefixIcon: widget.prefixIcon == null
                ? Padding(
                    padding: EdgeInsets.only(left: 26.0),
                    child: SizedBox(),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 26.0, right: 10),
                    child: SizedBox(
                      width: 16,
                      child: Image.asset(
                        widget.prefixIcon!,
                        color: AppColors.greyIcon,
                      ),
                    ),
                  ),
            prefixIconColor: AppColors.greyIcon,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 30,
              minHeight: 30,
            ),
          ),
        ),
      ),
    );
  }
}

/// Text Field
class CustomTextField extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final String? prefixIcon;
  final bool? isObscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final onChanged;
  final String? suffixText;
  final String? prefixText;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.isObscure,
      this.prefixIcon,
      this.validator,
      this.keyboardType,
      this.suffixText,
      this.prefixText,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryColor,
          border: Border.all(color: AppColors.borderColor, width: 0.7)),
      child: Center(
        child: TextFormField(
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          obscureText: widget.isObscure ?? false,
          controller: widget.controller ?? null,
          cursorColor: Colors.white,
          onChanged: widget.onChanged ?? null,
          style: bodyNormal,
          decoration: InputDecoration(
              suffixText: widget.suffixText ?? '',
              prefixText: widget.prefixText ?? '',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: bodyNormal.copyWith(
                  color: Colors.white54, fontFamily: "PoppinsSemiBold"),
              suffixIcon: widget.suffixIcon,
              suffixIconColor: Colors.black,
              prefixIcon: widget.prefixIcon == null
                  ? Padding(
                      padding: EdgeInsets.only(left: 26.0),
                      child: SizedBox(),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 26.0, right: 10),
                      child: SizedBox(
                        width: 16,
                        child: Image.asset(
                          widget.prefixIcon!,
                        ),
                      ),
                    ),
              prefixIconColor: Colors.white,
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 30,
                minHeight: 30,
              )),
        ),
      ),
    );
  }
}

///Search Text Field
class SearchTextField extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final String? prefixIcon;
  final bool? isObscure;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChanged; // New property for onChanged function

  const SearchTextField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.isObscure,
    this.prefixIcon,
    this.validator,
    this.textEditingController,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(14),
          color: Colors.transparent),
      child: Center(
        child: TextFormField(
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: widget.isObscure ?? false,
          controller: widget.textEditingController ?? searchController,
          cursorColor: Colors.white,
          style: bodyNormal.copyWith(fontFamily: "PoppinsSemiBold"),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: bodyNormal.copyWith(
                  color: Colors.white54, fontFamily: "PoppinsSemiBold"),
              suffixIcon: widget.suffixIcon,
              suffixIconColor: AppColors.orangeColor,
              prefixIcon: widget.prefixIcon == null
                  ? Padding(
                      padding: EdgeInsets.only(left: 26.0),
                      child: SizedBox(),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 26.0, right: 10),
                      child: SizedBox(
                        width: 16,
                        child: Image.asset(
                          widget.prefixIcon!,
                          color: Colors.white,
                        ),
                      ),
                    ),
              prefixIconColor: AppColors.orangeColor,
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 30,
                minHeight: 30,
              )),
        ),
      ),
    );
  }
}

///Otp Fields
class OtpField extends StatefulWidget {
  TextEditingController otpController;

  OtpField({
    required this.otpController,
    Key? key,
  }) : super(key: key);

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: widget.otpController,
      appContext: context,
      textStyle: TextStyle(color: AppColors.primaryColor, fontSize: 30),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      length: 4,
      obscureText: false,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        return null;
      },
      pinTheme: PinTheme(
        borderWidth: 1.0,
        borderRadius: BorderRadius.circular(15),
        selectedColor: AppColors.borderColor,
        selectedFillColor: Colors.transparent,
        activeColor: AppColors.borderColor,
        activeFillColor: Colors.transparent,
        shape: PinCodeFieldShape.box,
        errorBorderColor: Colors.red,
        errorBorderWidth: 1.0,
        activeBorderWidth: 1.0,
        selectedBorderWidth: 1.0,
        inactiveColor: AppColors.borderColor,
        inactiveFillColor: Colors.transparent,
        fieldHeight: 55,
        fieldWidth: 50,
      ),
      cursorColor: AppColors.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      keyboardType: TextInputType.number,
      onCompleted: (v) {},
      onChanged: (value) {
        if (value.isNotEmpty) {
          // setState(() {
          //   currentText = value;
          //   error = "";
          //   hasError = false;
          // });
        }
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        return true;
      },
    );
  }
}
