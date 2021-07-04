import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.withOpacity(0.05),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 56,
          child: getBody(),
        ));
  }

  Widget getBody() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
              ),
            ],
            gradient: LinearGradient(
                colors: [Color(0xff5E65DE), Color(0xff1488cc)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 2.0],
                tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 25),
            child: Row(
              children: <Widget>[],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff5E65DE),
              ),
            ),
          ],
        )
      ],
    );
  }
}
