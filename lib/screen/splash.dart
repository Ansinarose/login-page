import 'package:flutter/material.dart';
import 'package:loginpage/screen/home.dart';
import 'package:loginpage/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screensplash extends StatefulWidget {
  const screensplash({super.key});

  @override
  State<screensplash> createState() => _screensplashState();
}

String loggedIn = 'loggedin';
bool? alreadylogged;

class _screensplashState extends State<screensplash> {
  @override
  void initState() {
    gotologin();
    super.initState();
  }

  decide() async {
    final shr = await SharedPreferences.getInstance();
    alreadylogged = shr.getBool(loggedIn);
  }

  Future<void> gotologin() async {
    await Future.delayed(Duration(seconds: 3));
    await decide();
    Navigator.of(context).push(MaterialPageRoute(
        builder: alreadylogged == true
            ? (ctx) => screehome()
            : (ctx) => screenlogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/wallpapperlogo.jpeg'), fit: BoxFit.cover),
      ),
    ));
  }
}
