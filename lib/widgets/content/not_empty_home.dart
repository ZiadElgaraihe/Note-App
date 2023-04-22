import 'package:flutter/material.dart';
import 'package:note_app/widgets/list_item.dart';
import 'package:sizer/sizer.dart';

class NotEmptyHome extends StatelessWidget {
  const NotEmptyHome({super.key, required this.notes, this.valueNotifier});

  final List<dynamic> notes;
  final ValueNotifier<bool>? valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListItem(
                  length: notes.length,
                  noteModel: notes[index],
                  valueNotifier: valueNotifier,
                );
              },
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
