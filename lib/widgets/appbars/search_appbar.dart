import 'package:flutter/material.dart';
import 'package:note_app/functions/search_page_functions.dart';
import 'package:sizer/sizer.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController searchController = TextEditingController();
  SearchPageFunctions searchPageFunctions = SearchPageFunctions();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 1.h),
        decoration: BoxDecoration(
            color: const Color(0xFF3B3B3B),
            borderRadius: BorderRadius.circular(50)),
        child: TextFormField(
          onChanged: (value) {
            searchPageFunctions.onTextFieldValueChanged(
                context: context, value: value);
          },
          controller: searchController,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            suffixIcon: Material(
              color: Colors.transparent,
              child: IconButton(
                  onPressed: () {
                    searchPageFunctions.onClosePressed(
                      context: context,
                      searchText: searchController.text,
                    );
                    searchController.text = '';
                  },
                  splashRadius: 15,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.grey.shade300,
                  )),
            ),
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 7.5.w),
          ),
        ),
      ),
    );
  }
}
