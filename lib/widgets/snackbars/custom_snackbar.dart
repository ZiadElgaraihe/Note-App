import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSnackBar {
  static SnackBar customSnackBar({required String message}) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      behavior: SnackBarBehavior.floating,
      width: 70.w,
      duration: const Duration(seconds: 2),
      content:  Text(message,
          textAlign: TextAlign.center),
    );
  }
}
