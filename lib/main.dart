import 'package:flutter/material.dart';
import 'package:note_app/pages/home_page.dart';
import 'package:note_app/pages/note_page.dart';
import 'package:note_app/pages/search_page.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:note_app/providers/services_provider.dart';
import 'package:note_app/providers/read_only_note_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ServicesProvider>(
          create: (context) => ServicesProvider(),
        ),
        ChangeNotifierProvider<ReadOnlyNoteProvider>(
          create: (context) => ReadOnlyNoteProvider(),
        ),
        Provider<NoteProvider>(
          create: (context) => NoteProvider(),
        )
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          title: 'Note App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routes: {
            HomePage.id: (context) => const HomePage(),
            NotePage.id: (context) => const NotePage(),
            SearchPage.id: (context) => const SearchPage(),
          },
          initialRoute: HomePage.id,
        ),
      ),
    );
  }
}
