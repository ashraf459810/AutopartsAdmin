import 'package:admin/models/chartModel.dart' ;


import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:pie_chart/pie_chart.dart';

class Charts extends StatefulWidget {
  Charts({Key key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {

  Map<dynamic, dynamic> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  final List<ChartModel> list = [
    ChartModel("dec", 122321),
    ChartModel("nov", 112321),
    ChartModel("jan", 12211),
    ChartModel("may", 12215),
    ChartModel("jun", 125551),
    ChartModel("july", 12156),
    ChartModel("octo", 12116),
  ];

  @override
  Widget build(BuildContext context) {
 

    var size = MediaQuery.of(context).size;
    List<chart.Series<ChartModel, String>> timeline = [
      chart.Series(
        colorFn: (_, __) => chart.MaterialPalette.deepOrange.shadeDefault,
        id: "Vendor Sales",
        data: list,
        domainFn: (ChartModel timeline, _) => timeline.month,
        measureFn: (ChartModel timeline, _) => timeline.number,
        
      )
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            Row(
              children: [
                Container(
                    width: size.width * 0.7,
                    child: Center(
                        child: Text(
                      "Vendor Sales",
                      style: TextStyle(fontSize: 30),
                    ))),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(
                              "https://static01.nyt.com/images/2020/11/17/business/17techhearing-facebookpreview/17techhearing-facebookpreview-mediumSquareAt3X.jpg")),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmad ali",
                      style: TextStyle(fontSize: 10, color: Colors.black87),
                    ),
                    // Text(
                    //   "Mitchell Williamson",
                    //   style: TextStyle(
                    //       fontSize: 10,
                    //       color: Colors.black87),
                    // ),
                    Text(
                      "User ID#01223",
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Text(
                  "2021 statistics",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              // height: size.height -  size.height *0.02 ,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "",
                      ),
                      Container(
                        height: size.height * 0.4,
                        child: chart.BarChart(timeline, animate: true),
                      ),
                      Text(""),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height *0.02,),
            Container(
              width: size.width *0.9,
              height: size.height *0.3,
              child:Center(
                child: PieChart
                (initialAngleInDegree: 20,
                  centerText: "Vendor Cars Brand Sales",
                  chartLegendSpacing: 40  ,
              
                  chartRadius: 150,
                chartType: ChartType.ring,
                ringStrokeWidth: 10,

              legendOptions: LegendOptions(legendPosition: LegendPosition.right),
                chartValuesOptions: ChartValuesOptions(showChartValuesInPercentage: true,showChartValuesOutside: true,decimalPlaces: 2,showChartValueBackground: true ,showChartValues: true ),
                animationDuration: Duration(milliseconds: 700),
                  colorList: [Colors.blue, Colors.red, Colors.green, Colors.orange],
                  dataMap: {"BMW" :2, "Audi":3 , "Kia":6},),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Sample linear data type.
class LinearSales {
  final String brand;
  final int sales;

  LinearSales(this.brand, this.sales);
}

