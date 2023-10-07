import 'package:flutter/material.dart';
import 'package:helloflutter/screen/dashboard_screen.dart';

class MainScreen extends StatefulWidget {
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
              padding: const EdgeInsets.only(top: 120),
              child: Image.asset(
                "images/logo_paddy.png",
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("nama"),
                    hintText: "input nama"),
                onChanged: (String value) => setState(() {
                  _name = value;
                }),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashboardScreen(_name)));
              },
              child: const Text("submit"),
            ),
          ],
        ),
      ),
    );
  }
}
