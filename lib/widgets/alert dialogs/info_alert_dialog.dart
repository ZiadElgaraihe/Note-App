import 'package:flutter/material.dart';
import 'package:note_app/widgets/texts/app_info.dart';
import 'package:sizer/sizer.dart';

//custom alert dialog that that show the main info about the app
class InfoAlertDialog extends StatelessWidget {
  const InfoAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: const Color(0xFF252525),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 42.0, horizontal: 26.0),
      content: SizedBox(
        width: 100.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Info(title: 'Designer - ', info: 'Divya Kelaskar'),
            const Info(title: 'Developer - ', info: 'Ziad Elgaraihe'),
            const Info(title: 'Icons - ', info: 'Default flutter icons'),
            const Info(title: 'Fonts - ', info: 'Default flutter fonts'),
            Container(
              margin: EdgeInsets.only(top: 2.h),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: const Text(
                      'Dev email',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text('ziadelgaraihe301@gmail.com'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
