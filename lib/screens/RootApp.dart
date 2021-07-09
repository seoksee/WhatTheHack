/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:budgetsavvy/screens/CategoryScreen.dart';
import 'package:budgetsavvy/screens/DashboardScreen.dart';
import 'package:budgetsavvy/screens/BudgetScreen.dart';
import 'package:budgetsavvy/screens/HomeScreen.dart';
import 'package:budgetsavvy/screens/RewardsScreen.dart';
import 'package:budgetsavvy/screens/StatisticsScreen.dart';
import 'package:flutter/material.dart';

/// This is the main application widget.
// class RootApp extends StatelessWidget {
//   const RootApp({Key? key}) : super(key: key);

//   static const String _title = 'Wallet Manager';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

/// This is the stateful widget that the main application instantiates.
class RootApp extends StatefulWidget {
  const RootApp({Key key}) : super(key: key);
  
  @override
  _RootAppState createState() => _RootAppState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RootAppState extends State<RootApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    BudgetScreen(),
    RewardsScreen(),
    // HomeScreen(),
    StatisticsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Wallet Manager'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined),
            label: 'Financial Advisor',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
