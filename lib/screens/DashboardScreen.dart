import 'package:budgetsavvy/data/data.dart';
import 'package:budgetsavvy/models/CategoryModel.dart';
import 'package:budgetsavvy/models/ExpenseModel.dart';
import 'package:budgetsavvy/screens/CategoryScreen.dart';
import 'package:budgetsavvy/utils/Colorshelper.dart';
import 'package:budgetsavvy/widgets/BarChart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:budgetsavvy/widgets/placeholder_widget.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TooltipBehavior _tooltipBehavior;
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.lightBlue)
  ];
  List<_PieData> pieData = [
    _PieData('', 350, 'Bills'),
    _PieData('', 340, 'Grocery'),
    _PieData('', 84, 'Gift'),
    _PieData('', 1000, 'Household'),
    _PieData('', 580, 'Food'),
    _PieData('', 360, 'Transport'),
    _PieData('', 100, 'Others'),
    _PieData('', 80, 'Social')
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        // Formatting the tooltip text
        format: 'RM point.y');
    super.initState();
  }

final topIconList = DefaultTextStyle.merge(
    // style: descTextStyle,
    child: Container(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                'Transport',
                style: TextStyle(
                  color: Color.fromRGBO(0, 168, 181, 1),
                ),
              ),
              Icon(Icons.directions_car,
                  color: Color.fromRGBO(0, 168, 181, 1), size: 30.0),
              Text(
                'RM 360',
                style: TextStyle(
                  color: Color.fromRGBO(0, 168, 181, 1),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Others',
                style: TextStyle(
                  color: Color.fromRGBO(73, 76, 162, 1),
                ),
              ),
              Icon(Icons.more,
                  color: Color.fromRGBO(73, 76, 162, 1), size: 30.0),
              Text(
                'RM 100',
                style: TextStyle(
                  color: Color.fromRGBO(73, 76, 162, 1),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Social',
                style: TextStyle(
                  color: Color.fromRGBO(255, 205, 96, 1),
                ),
              ),
              Icon(Icons.local_movies,
                  color: Color.fromRGBO(255, 205, 96, 1), size: 30.0),
              Text(
                'RM 80',
                style: TextStyle(
                  color: Color.fromRGBO(255, 205, 96, 1),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text('Bills',
              style: TextStyle(color: Color.fromRGBO(75, 135, 185, 1),
                ),),
              Icon(
                Icons.phone,color: Color.fromRGBO(75, 135, 185, 1),size: 30.0),
              Text('RM 350',
              style: TextStyle(color: Color.fromRGBO(75, 135, 185, 1),),),
            ],
          ),
        ],
      ),
    ),
  );

  final bottomIconList = DefaultTextStyle.merge(
    // style: descTextStyle,
    child: Container(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                'Food',
                style: TextStyle(
                  color: Color.fromRGBO(116, 180, 155, 1),
                ),
              ),
              Icon(Icons.fastfood,
                  color: Color.fromRGBO(116, 180, 155, 1), size: 30.0),
              Text(
                'RM 580',
                style: TextStyle(
                  color: Color.fromRGBO(116, 180, 155, 1),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Household',
                style: TextStyle(
                  color: Color.fromRGBO(248, 177, 149, 1),
                ),
              ),
              Icon(Icons.home,
                  color: Color.fromRGBO(248, 177, 149, 1), size: 30.0),
              Text(
                'RM 1,000',
                style: TextStyle(
                  color: Color.fromRGBO(248, 177, 149, 1),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Gift',
                style: TextStyle(
                  color: Color.fromRGBO(246, 114, 128, 1),
                ),
              ),
              Icon(Icons.card_giftcard,
                  color: Color.fromRGBO(246, 114, 128, 1), size: 30.0),
              Text(
                'RM 84',
                style: TextStyle(
                  color: Color.fromRGBO(246, 114, 128, 1),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Grocery',
                style: TextStyle(
                  color: Color.fromRGBO(192, 108, 132, 1),
                ),
              ),
              Icon(Icons.local_grocery_store,
                  color: Color.fromRGBO(192, 108, 132, 1), size: 30.0),
              Text(
                'RM 340',
                style: TextStyle(
                  color: Color.fromRGBO(192, 108, 132, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

final suggestionsList = DefaultTextStyle.merge(
    // style: descTextStyle,
    child: Container(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Suggestions: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Image(image: AssetImage('row/unifi-logo.png'),
            height: 40,
            width: 40,),
          Image(image: AssetImage('row/go-plus-logo.png'),height: 40,width: 40,),
          Column(
            children: [
              Icon(Icons.person, size: 30.0),
              Text(
                'Dad'
              ),
            ],
          ),
          Column(
            children: [
              Icon(Icons.person, size: 30.0),
              Text(
                'Mom',
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: const Text('Go Manager'),),
        bottom: PreferredSize(child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
            child: Text("<                   Jun 2021                   >",
            style: TextStyle(
            fontSize: 18,
            color: Color(0xffffffff)),),), 
        preferredSize: Size(0.0,20.0),)
      ),
        body: Column(
          children: [
            topIconList,
            
            Center(
              child: SfCircularChart(
                 annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                        height:
                            '80%', // Setting height and width for the circular chart annotation
                        width: '80%',
                        widget: Container(
                            child: PhysicalModel(
                                child: Container(),
                                shape: BoxShape.circle,
                                elevation: 10,
                                shadowColor: Colors.black,
                                color:
                                    const Color.fromRGBO(230, 230, 230, 1)))),
                    CircularChartAnnotation(
                        widget: Container(
                          child: 
                          Text("+ RM 3,520.00\n- RM 2,834.00\n= RM 686.00",
                          textAlign: TextAlign.center,
                          style: 
                          TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              )),)
                        // Column(
                        //     children:  [
                        //       Text("RM 2,834.00"),
                        //       Text("RM 3,520.00"),
                        //       Text("RM 686.00")
                        //     ],))
                                    )
                  ],
                tooltipBehavior: _tooltipBehavior,
                // legend: Legend(isVisible: true),
                series: <DoughnutSeries<_PieData, String>>[
                  DoughnutSeries<_PieData, String>(
                    explode: true,
                    enableTooltip: true,
                    dataSource: pieData,  
                    xValueMapper: (_PieData data, _) => data.xData,
                    yValueMapper: (_PieData data, _) => data.yData,
                    dataLabelMapper: (_PieData data, _) => (data.text),
                    dataLabelSettings: DataLabelSettings(isVisible: true)
                  ),
                ])),
            // ), 
          bottomIconList,
          suggestionsList
            ],
        ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}
