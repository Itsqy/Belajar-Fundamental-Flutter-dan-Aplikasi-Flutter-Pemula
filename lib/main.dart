import 'package:flutter/material.dart';
import 'package:helloflutter/model/restaurant.dart';
import 'package:helloflutter/screen/dashboard_screen.dart';
import 'package:helloflutter/screen/detail_screen.dart';
import 'package:helloflutter/screen/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
        initialRoute: MainScreen.routeName,
        routes: {
          MainScreen.routeName: (context) => const MainScreen(),
          DashboardScreen.routeName: (context) => DashboardScreen(
              ModalRoute.of(context)?.settings.arguments as String),
          DetailScreen.routeName: (context) => DetailScreen(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant),
        });
  }
}
