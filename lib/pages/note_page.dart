import 'package:flutter/material.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:note_app/providers/read_only_note_provider.dart';
import 'package:note_app/widgets/appbars/note_appbar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  static String id = '/note page';

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController contentController = TextEditingController();
  FocusNode focusNode = FocusNode();
  //use TextEditingController to controll the appeared text when open the page
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text =
        Provider.of<NoteProvider>(context, listen: false).noteModel?.title ??
            '';
    contentController.text =
        Provider.of<NoteProvider>(context, listen: false).noteModel?.content ??
            '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: NoteAppBar(
            titleController: titleController,
            contentController: contentController,
            focusNode: focusNode),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Selector<ReadOnlyNoteProvider, bool>(
              selector: (context, provider) => provider.readOnly,
              builder: (context, value, child) => Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    focusNode: focusNode,
                    readOnly: value,
                    controller: titleController,
                    maxLength: 100,
                    maxLines: 6,
                    minLines: 1,
                    style:
                        TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 34.sp),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    readOnly: value,
                    controller: contentController,
                    minLines: 20,
                    maxLines: 100000,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something...',
                      hintStyle: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
