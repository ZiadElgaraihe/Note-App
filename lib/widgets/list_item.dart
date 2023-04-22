import 'package:flutter/material.dart';
import 'package:note_app/functions/list_item_functions.dart';
import 'package:note_app/models/note_model.dart';
import 'package:sizer/sizer.dart';

class ListItem extends StatefulWidget {
  const ListItem(
      {super.key,
      required this.noteModel,
      required this.valueNotifier,
      required this.length});

  final int length;
  final NoteModel noteModel;
  final ValueNotifier<bool>? valueNotifier;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  ListItemFunctions listItemFunctions = ListItemFunctions();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
        color: Color(widget.noteModel.backgroundColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: widget.valueNotifier ?? ValueNotifier<bool>(false),
        builder: (context, value, child) => ListTile(
          trailing: Transform.translate(
            offset: Offset(1.w, 0),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: value ? 10.w : 0.0,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    listItemFunctions.onDeleteNotePressed(
                      context: context,
                      valueNotifier: widget.valueNotifier,
                      id: widget.noteModel.id,
                      length: widget.length,
                    );
                  },
                  splashRadius: 20,
                  icon: Icon(
                    Icons.delete,
                    color: (value) ? Colors.black : const Color(0xFF2E312E),
                  ),
                ),
              ),
            ),
          ),
          title: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent.withOpacity(0.1),
              onLongPress: () {
                listItemFunctions.onListItemLongPressed(
                    valueNotifier: widget.valueNotifier);
              },
              onTap: () {
                listItemFunctions.onListItemPressed(
                  context: context,
                  value: value,
                  valueNotifier: widget.valueNotifier,
                  noteModel: widget.noteModel,
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 6.w),
                child: Text(
                  '${widget.noteModel.title.split(' ').take(14).join(' ')} '
                  '${(widget.noteModel.title.split(' ').length > 14) ? '...' : ''}',
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
