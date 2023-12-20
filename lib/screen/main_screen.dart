import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helloflutter/screen/dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/inputUser";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 120, left: 70, right: 70, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 8,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset(
                  "images/logo_eateuy.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("masukin nama kamu dulu yuk!"),
                    hintText: "input nama"),
                onChanged: (String value) => setState(() {
                  _name = value;
                }),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_name.isNotEmpty) {
                  Navigator.pushNamed(context, DashboardScreen.routeName,
                      arguments: _name);
                } else {
                  Fluttertoast.showToast(
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                      msg: 'Please put your name');
                }
              },
              child: const Text("submit"),
            ),
          ],
        ),
      ),
    );
  }
}
