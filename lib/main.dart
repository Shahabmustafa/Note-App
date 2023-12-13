import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/note_paid.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ColorScheme lightThemeColors(context) {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF202020),
      onPrimary: Color(0xFF505050),
      secondary: Color(0xFFBBBBBB),
      onSecondary: Color(0xFFEAEAEA),
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: Color(0xFFF1F2F3),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFF54B435),
      onSurface: Color(0xFF54B435),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotePaid(),
    );
  }
}

