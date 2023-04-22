import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/providers/read_only_note_provider.dart';
import 'package:note_app/widgets/buttons/appbar_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../functions/note_page_functions.dart';

class NoteAppBar extends StatefulWidget implements PreferredSizeWidget {
  const NoteAppBar({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.focusNode,
  });

  final TextEditingController contentController;
  final FocusNode focusNode;
  final TextEditingController titleController;

  @override
  State<NoteAppBar> createState() => _NoteAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}

class _NoteAppBarState extends State<NoteAppBar> {
  FocusManager focusManager = FocusManager();
  NotePageFunctions notePageFunctions = NotePageFunctions();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const SizedBox(),
      systemOverlayStyle: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent),
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.h, top: 1.h, left: 4.w),
          child: AppBarIconButton(
              icon: Icons.arrow_back_ios_new,
              heroTag: 'back',
              onPressed: () {
                notePageFunctions.onBackPressed(context);
              }),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: 1.h, top: 1.h, right: 4.w),
          child: Selector<ReadOnlyNoteProvider, bool>(
            selector: (context, provider) => provider.readOnly,
            builder: (context, value, child) => value == false
                ? AppBarIconButton(
                    icon: Icons.save_outlined,
                    heroTag: 'save',
                    onPressed: () {
                      notePageFunctions.onSavePressed(
                        context: context,
                        title: widget.titleController.text,
                        content: widget.contentController.text,
                      );
                    },
                  )
                : AppBarIconButton(
                    icon: Icons.edit,
                    heroTag: 'edit',
                    onPressed: () {
                      notePageFunctions.onEditPressed(
                        context: context,
                        focusNode: widget.focusNode,
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
