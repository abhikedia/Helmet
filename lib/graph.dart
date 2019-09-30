import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Helmet"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Container(
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(), // Initialize category axis.
                  series: <LineSeries<SalesData, String>>[ // Initialize line series.
                    LineSeries<SalesData, String>(
                        dataSource: [
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales
                    )
                  ]
              )
          )
      ) ,

    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}