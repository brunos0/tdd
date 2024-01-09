import 'package:flutter/material.dart';
import 'package:resocoder/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:resocoder/injection_container.dart' as di;
//import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade600)),
            ),
            appBarTheme: AppBarTheme(
                //shadowColor: Colors.red,
                color: Colors.green.shade800,
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            primaryColor: Colors.green.shade800,
            colorScheme: ColorScheme.fromSwatch(
                accentColor: Colors.green.shade600,
                backgroundColor: Colors.white)),
        home: const NumberTriviaPage());
  }
}
