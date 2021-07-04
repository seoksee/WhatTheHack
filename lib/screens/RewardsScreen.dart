import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RewardsScreen extends StatefulWidget {
  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Manager'),
      ),
      body: Text("World"),
    );
  }
}
