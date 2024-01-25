import 'package:flutter/material.dart';
import 'package:loginpage/screen/home.dart';
import 'package:loginpage/screen/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenlogin extends StatefulWidget {
  screenlogin({super.key});

  @override
  State<screenlogin> createState() => _screenloginState();
}

class _screenloginState extends State<screenlogin> {
  final _usernamecontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();
  bool _isdatamatched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/loginimage.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 90),
            child: Center(
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernamecontroller,
                     style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'UserName',
                    hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(Icons.person),
                        labelStyle: TextStyle(color: Colors.white),
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        suffix: Icon(Icons.key),
                        hintStyle: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: !_isdatamatched,
                        child: const Text(
                          '   username or password not matched',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        checklogin(context);
                      },
                      child: Text("Login"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext ctx) async {
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;
    String name = 'ansina';
    String pass = '123';
    if (name == _username && _password == pass) {
      final shr = await SharedPreferences.getInstance();

      shr.setBool(loggedIn, true); //goto home
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (context) => screehome()));
    } else {
      setState(() {
        _isdatamatched = false;
      });
    }
  }
}
