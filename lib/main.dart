import 'package:flutter/material.dart';
import 'package:budgetsavvy/screens/HomeScreen.dart';
import 'package:budgetsavvy/screens/DashboardScreen.dart';
import 'package:budgetsavvy/screens/RootApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet Manager',
      // theme: ThemeData(
      //   primaryColor: Colors.blue,
      // ),
      home: RootApp(),
    );
  }
}
