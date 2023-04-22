import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Info extends StatelessWidget {
  const Info({super.key, required this.title, required this.info});

  final String title, info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(info),
        ],
      ),
    );
  }
}
