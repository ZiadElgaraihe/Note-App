import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home_page.dart';
import '../providers/services_provider.dart';

class SearchPageFunctions {
  onClosePressed({
    required BuildContext context,
    required String searchText,
  }) {
    if (searchText != '') {
      context.read<ServicesProvider>().searchForNotes('');
    } else {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }
  }

  onTextFieldValueChanged({
    required BuildContext context,
    required String value,
  }) {
    context.read<ServicesProvider>().searchForNotes(value);
  }
}
