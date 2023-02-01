import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(HomePage());

@override
Widget build (BuildContext context){
  return MaterialApp(
    home:HomePage(),
  );
}

class HomePage extends StatelessWidget{
  List<SalesData> data = [
    SalesData("Jan" , 35),
    SalesData("Feb" , 28),
    SalesData("Mar" , 34),
    SalesData("Apr" , 32),
    SalesData("May" , 48),
  ];
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("line chart"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        brightness: Brightness.dark,
      ),
      body: Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: "half yearly sales analysis"),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries <SalesData, String>>[
              LineSeries(dataSource: data,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: "Sales",
                dataLabelSettings: DataLabelSettings(isVisible: true),
              )
            ]

        ),

      )
    );



  }
}


class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
