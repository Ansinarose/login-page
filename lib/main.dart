import 'package:flutter/material.dart';
import 'package:loginpage/screen/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.getInstance();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login sample',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      home: screensplash(),
    );
  }
}
