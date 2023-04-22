import 'package:flutter/material.dart';
import 'package:note_app/providers/services_provider.dart';
import 'package:note_app/widgets/appbars/search_appbar.dart';
import 'package:note_app/widgets/content/empty_home.dart';
import 'package:note_app/widgets/content/not_empty_home.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static String id = '/search page';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: const SearchAppBar(),
        body: Consumer<ServicesProvider>(
          builder: (context, value, child) =>
              (value.getSearchedNotes().isNotEmpty)
                  ? NotEmptyHome(
                      notes: value.getSearchedNotes(),
                    )
                  : const EmptyPage(
                      imageName: 'not_founded.png',
                      text: 'File not found. Try searching again.'),
        ),
      ),
    );
  }
}
