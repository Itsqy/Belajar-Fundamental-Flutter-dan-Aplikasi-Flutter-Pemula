import 'package:flutter/material.dart';
import 'package:helloflutter/screen/dashboard_screen.dart';
import 'package:helloflutter/screen/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
        home: const MainScreen());
  }
}
