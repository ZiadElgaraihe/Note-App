import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//custom alert dialog that update or remove notes
class ServiceAlertDialog extends StatelessWidget {
  const ServiceAlertDialog({
    super.key,
    required this.title,
    required this.onServicePressed,
    required this.buttonTitle,
  });

  final String title, buttonTitle;
  final Function onServicePressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(vertical: 3.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
      actionsPadding: EdgeInsets.symmetric(vertical: 3.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: const Color(0xFF252525),
      title: Icon(
        Icons.info_rounded,
        size: 24.sp,
        color: Colors.grey,
      ),
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
      ),
      actions: [
        Row(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(25.w, 5.h)),
                backgroundColor: const MaterialStatePropertyAll(
                  Color(0xFFFF0000),
                ),
              ),
              child: Text('Close', style: TextStyle(fontSize: 12.sp)),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                onServicePressed();
              },
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(25.w, 5.h)),
                backgroundColor: const MaterialStatePropertyAll(
                  Color(0xFF30BE71),
                ),
              ),
              child: Text(buttonTitle, style: TextStyle(fontSize: 12.sp)),
            ),
            const Spacer(),
          ],
        )
      ],
    );
  }
}
