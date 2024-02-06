import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/global_variables.dart';

class LabeledTextField extends StatelessWidget {
  final String heading;
  final Widget child;

  const LabeledTextField({
    Key? key,
    required this.heading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        right: 0,
        top: 10,
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(heading, style: headingMedium),
          ),
          const SizedBox(height: 10),
          Container(
              width: 100.w,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.secondaryColor,
                border: Border.all(color: AppColors.borderColor, width: 0.7),
              ),
              child: child),
        ],
      ),
    );
  }
}
