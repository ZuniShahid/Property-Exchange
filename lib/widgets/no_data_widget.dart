import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  const NoDataWidget({
    super.key,
    this.text = 'No Data Found!',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(Assets.imagesLogo, height: 130),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
