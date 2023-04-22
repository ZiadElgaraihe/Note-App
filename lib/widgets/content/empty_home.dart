import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key, required this.imageName, required this.text});

  final String imageName, text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/$imageName',
            height: 35.h,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
