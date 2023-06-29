import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trips/auth/signin.dart';
import 'package:firebase_core/firebase_core.dart';

import 'homepage.dart';

bool? loggedin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences sharedprefs = await SharedPreferences.getInstance();

  loggedin = sharedprefs.getBool("Loggedin");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(bodySmall: TextStyle(fontSize: 17))),
      home: (loggedin == null || loggedin == false)
          ? const SignIn()
          : const HomePage(),
    );
  }
}
