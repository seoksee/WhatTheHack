import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Manager'),
      ),
      body: Text("Hehe"),
    );
  }
}
