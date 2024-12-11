import 'package:flutter/material.dart';

import '../utils/Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.radius,
  });
  final String text;
  final Function() onPressed;
  final double? width;
  final double? radius;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 15))),
          onPressed: onPressed,
          child: Text(
            text,
          )),
    );
  }
}
