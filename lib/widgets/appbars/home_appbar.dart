import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/functions/home_page_functions.dart';
import 'package:note_app/widgets/buttons/appbar_icon_button.dart';
import 'package:sizer/sizer.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.valueNotifier});

  //use ValueNotifier to dis/appear the delete icon
  final ValueNotifier<bool> valueNotifier;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}

class _HomeAppBarState extends State<HomeAppBar> {
  HomePageFuncs homePageFuncs = HomePageFuncs();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Notes',
        style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w400),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent),
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: widget.valueNotifier,
          builder: (context, value, child) => Padding(
            padding: EdgeInsets.only(bottom: 1.h, top: 1.h, right: 1.5.w),
            child: value
                ? AppBarIconButton(
                    icon: Icons.delete,
                    heroTag: 'delete all',
                    onPressed: () {
                      homePageFuncs.onDeleteAllNotesPressed(
                        context: context,
                        valueNotifier: widget.valueNotifier,
                      );
                    },
                  )
                : AppBarIconButton(
                    icon: Icons.search,
                    heroTag: 'search',
                    onPressed: () {
                      homePageFuncs.onSearchPressed(context);
                    }),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: 1.h, top: 1.h, left: 1.5.w, right: 4.w),
          child: AppBarIconButton(
            icon: Icons.info_outline,
            heroTag: 'info',
            onPressed: () {
              homePageFuncs.onInfoButtonPressed(context);
            },
          ),
        ),
      ],
    );
  }
}
