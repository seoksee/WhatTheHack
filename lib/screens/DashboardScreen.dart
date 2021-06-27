import 'package:budgetsavvy/data/data.dart';
import 'package:budgetsavvy/models/CategoryModel.dart';
import 'package:budgetsavvy/models/ExpenseModel.dart';
import 'package:budgetsavvy/screens/CategoryScreen.dart';
import 'package:budgetsavvy/utils/Colorshelper.dart';
import 'package:budgetsavvy/widgets/BarChart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<_PieData> pieData = [
    _PieData('Jan', 35, 'a'),
    _PieData('Feb', 28, 'b'),
    _PieData('Mar', 34, 'c'),
    _PieData('Apr', 32, 'd'),
    _PieData('May', 40, 'e')
  ];
  _buildCategory(Category category, double totalAmountSpend) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CategoryScreen(category: category),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
        padding: EdgeInsets.all(20.0),
        height: 100.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${(category.maxAmount - totalAmountSpend).toStringAsFixed(2)} / \$${category.maxAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            LayoutBuilder(
              builder: (BuildContext contex, BoxConstraints constraints) {
                final double maxBarWidth = constraints.maxWidth;
                final double percent = (category.maxAmount - totalAmountSpend) /
                    category.maxAmount;
                double barWidth = percent * maxBarWidth;
                if (barWidth < 0) {
                  barWidth = 0;
                }
                return Stack(
                  children: [
                    Container(
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    Container(
                      height: 20.0,
                      width: barWidth,
                      decoration: BoxDecoration(
                        color: getColor(context, percent),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: CustomScrollView(
  //       slivers: <Widget>[
  //         SliverAppBar(
  //           expandedHeight: 100.0,
  //           forceElevated: true,
  //           floating: true,
  //           leading: IconButton(
  //             icon: Icon(Icons.settings),
  //             iconSize: 30.0,
  //             onPressed: () {},
  //           ),
  //           flexibleSpace: FlexibleSpaceBar(
  //             title: Text('Budget Savvy'),
  //             centerTitle: true,
  //           ),
  //           actions: [
  //             IconButton(
  //               icon: Icon(Icons.add),
  //               iconSize: 30.0,
  //               onPressed: () {},
  //             ),
  //           ],
  //         ),
  //         SliverList(
  //           delegate: SliverChildBuilderDelegate(
  //             (BuildContext context, int index) {
  //               if (index == 0) {
  //                 return Container(
  //                   margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
  //                   decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.black12,
  //                         offset: Offset(0, 2),
  //                         blurRadius: 6.0,
  //                       ),
  //                     ],
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                   child: BarChart(expenses: weeklySpending),
  //                 );
  //               } else {
  //                 final Category category = categories[index - 1];
  //                 double totalAmountSpend = 0;
  //                 category.expenses.forEach((Expense expense) {
  //                   totalAmountSpend += expense.cost;
  //                 });
  //                 return _buildCategory(category, totalAmountSpend);
  //               }
  //             },
  //             childCount: 1 + categories.length,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Center(
        child: SfCircularChart(
            title: ChartTitle(text: 'Sales by sales person'),
            legend: Legend(isVisible: true),
            series: <DoughnutSeries<_PieData, String>>[
          DoughnutSeries<_PieData, String>(
              explode: true,
              explodeIndex: 0,
              dataSource: pieData,
              xValueMapper: (_PieData data, _) => data.xData,
              yValueMapper: (_PieData data, _) => data.yData,
              dataLabelMapper: (_PieData data, _) => data.text,
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ]));
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}
