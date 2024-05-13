import 'package:flutter/material.dart';
import 'package:loginui/auth/main_page.dart';
import 'package:loginui/theme.dart';
// ignore: unused_import
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
