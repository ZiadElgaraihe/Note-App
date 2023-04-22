import 'package:flutter/material.dart';
import 'package:note_app/functions/home_page_functions.dart';
import 'package:note_app/providers/services_provider.dart';
import 'package:note_app/widgets/appbars/home_appbar.dart';
import 'package:note_app/widgets/content/empty_home.dart';
import 'package:note_app/widgets/content/not_empty_home.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = '/home page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //valueNotifier used to rebuild ui to dis/appear delete icon
  ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(valueNotifier: valueNotifier),
      body: Consumer<ServicesProvider>(
        builder: (context, value, child) => (value.getNotes().isEmpty)
            ? const EmptyPage(
                imageName: 'empty_note_list.png',
                text: 'Create your first note !',
              )
            : NotEmptyHome(
                notes: value.getNotes(), valueNotifier: valueNotifier),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await HomePageFuncs().onFloatingButtonPressed(
            context: context,
            valueNotifier: valueNotifier,
          );
        },
        backgroundColor: const Color(0xFF252525),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 5.h,
        ),
      ),
    );
  }
}
