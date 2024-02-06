import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../constants/global_variables.dart';

class CustomButton extends StatefulWidget {
  final String? buttonText;
  final Function onTap;

  final Color? buttonColor;
  final Color? buttonTextColor;

  const CustomButton(
      {Key? key,
      this.buttonText,
      required this.onTap,
      this.buttonColor,
      this.buttonTextColor})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              color: widget.buttonColor ?? AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(widget.buttonText.toString(),
                  style: bodyLarge.copyWith(
                      color: widget.buttonTextColor ?? Colors.black,
                      fontWeight: FontWeight.bold)),
            )),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  final String pageTitle;
  final Function onTapLeading;
  final Function? onTapActions;
  final Widget? leadingButton;
  final Widget? actionButton;

  const CustomAppBar(
      {Key? key,
      required this.pageTitle,
      required this.onTapLeading,
      this.onTapActions,
      this.leadingButton,
      this.actionButton})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZoomTapAnimation(
            onTap: () {
              widget.onTapLeading();
            },
            onLongTap: () {},
            enableLongTapRepeatEvent: false,
            longTapRepeatDuration: const Duration(milliseconds: 100),
            begin: 1.0,
            end: 0.93,
            beginDuration: const Duration(milliseconds: 20),
            endDuration: const Duration(milliseconds: 120),
            beginCurve: Curves.decelerate,
            endCurve: Curves.fastOutSlowIn,
            child: Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.only(right: 30),
                child: widget.leadingButton),
          ),
          Text(
            widget.pageTitle,
            style: headingMedium.copyWith(fontSize: 18),
          ),
          widget.actionButton != null
              ? ZoomTapAnimation(
                  onTap: () {
                    widget.onTapActions!();
                  },
                  onLongTap: () {},
                  enableLongTapRepeatEvent: false,
                  longTapRepeatDuration: const Duration(milliseconds: 100),
                  begin: 1.0,
                  end: 0.93,
                  beginDuration: const Duration(milliseconds: 20),
                  endDuration: const Duration(milliseconds: 120),
                  beginCurve: Curves.decelerate,
                  endCurve: Curves.fastOutSlowIn,
                  child: Container(
                      height: 60,
                      width: 60,
                      padding: EdgeInsets.only(left: 10),
                      child: widget.actionButton),
                )
              : SizedBox(
                  width: 60,
                ),
        ],
      ),
    );
  }
}
