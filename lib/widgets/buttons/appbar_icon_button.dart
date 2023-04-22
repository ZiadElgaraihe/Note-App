import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton(
      {super.key, this.onPressed, required this.icon, required this.heroTag});

  final String heroTag;
  final IconData icon;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12.w,
      child: FloatingActionButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        heroTag: heroTag,
        backgroundColor: Colors.grey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
