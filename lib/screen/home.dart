import 'package:flutter/material.dart';
import 'package:loginpage/screen/login.dart';
import 'package:loginpage/screen/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screehome extends StatefulWidget {
  screehome({super.key});

  @override
  State<screehome> createState() => _screehomeState();
}

class _screehomeState extends State<screehome> {
  final List<String> _contactname = [
    "Dq",
    "fahadh faasil",
    "hiptoptamizha",
    "mahesh babu",
    "petrolehunder",
    "sharoon khan",
    "skysins",
    "tovinothomas",
    "vidya profile",
    "vijay devarakonda",
    "vikram"
  ];
  final List<String> _imagepath = [
    'assets/Dq.jpeg',
    'assets/fahadh faasil.jpeg',
    'assets/hiptoptamizha.jpg',
    'assets/mahesh babu.jpeg',
    'assets/petrolehunder.jpg',
    'assets/sharoon khan.jpeg',
    'assets/skysins.webp',
    'assets/tovinothomas.jpeg',
    'assets/vidya_profile.jpg',
    'assets/vijay-devarakonda-880ta0uygyjz4nnx.jpg',
    'assets/vikram.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Chats'),
        leading: const Icon(Icons.person_add_alt),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () {
                showdailoge(context);
              },
              icon: Icon(Icons.exit_to_app_sharp))
        ],
        backgroundColor: Color.fromARGB(255, 77, 94, 114),
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) => ListTile(
                  leading: index % 2 == 0
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(_imagepath[index]),
                        )
                      : Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage(_imagepath[index]))),
                        ),
                  title: Text(_contactname[index],style: const TextStyle(color: Colors.white),),
                  subtitle: const Text(
                    'Available',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    '$index:20',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
            separatorBuilder: (ctx, index) => const Divider(
                  height: 15,
                  color: Color.fromARGB(255, 37, 36, 36),
                ),
            itemCount: 11),
      ),
    );
  }

  showdailoge(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("LOGOUT !"),
            content: const Text("are you sure you need to logout ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("NO")),
              TextButton(
                  onPressed: () async {
                    final sharedpre = await SharedPreferences.getInstance();
                    sharedpre.setBool(loggedIn, false);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => screenlogin()),
                        (route) => false);
                  },
                  child: const Text("YES"))
            ],
          );
        });
  }
}
