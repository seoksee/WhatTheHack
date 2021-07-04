import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:budgetsavvy/screens/BudgetScreen.dart';
import 'package:budgetsavvy/screens/DashboardScreen.dart';
import 'package:budgetsavvy/models/ExpenseModel.dart';
// import 'package:shared_expenses/scoped_model/expenseScope.dart';
class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<ExpenseModel>(
        builder: (context, child, model) => PageView(
          controller: controller,
          children: [
            DashboardScreen(),
            BudgetScreen(),
          ],
          onPageChanged: (val) {
            setState(() {
              pageIndex = val;
            });
          },
          physics: ClampingScrollPhysics(),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Color(0xff2b32b2),
        splashColor: Color(0xff1488cc),
        inactiveColor: Colors.black.withOpacity(0.5),
        icons: <IconData>[
          Icons.home,
          Icons.list_alt,
          Icons.wallet_giftcard,
          Icons.insert_chart_outlined,
        ],
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            pageIndex = index;
            controller.animateToPage(
              pageIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
      // floatingActionButton: OpenContainer(
      //   transitionType: ContainerTransitionType.fadeThrough,
      //   openBuilder: (BuildContext context, _) =>
      //       NewEntryLog(callback: callback, context: context),
      //   closedElevation: 5.0,
      //   openElevation: 0,
      //   closedShape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(50),
      //     ),
      //   ),
      //   closedColor: Colors.pink,
      //   closedBuilder: (_, __) => SizedBox(
      //     height: 50,
      //     width: 50,
      //     child: Center(
      //       child: Icon(Icons.add, color: Colors.white),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  callback(int index) {
    setState(() {
      index ??= 2;
      pageIndex = index;
    });
  }
}
