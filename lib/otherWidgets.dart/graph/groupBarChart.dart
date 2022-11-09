// /// Bar chart example
// import 'package:dorcashub/general/allExports.dart';
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:intl/intl.dart';

// class GroupedBarChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   GroupedBarChart(this.seriesList, {this.animate});

//   factory GroupedBarChart.withSampleData() {
//     return new GroupedBarChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//       barGroupingType: charts.BarGroupingType.grouped,
//     );
//   }

//   /// Create series list with multiple series
//   static List<charts.Series<OrdinalSales, String>> _createSampleData() {
//     final desktopSalesData = [
//       new OrdinalSales(DateFormat('MMM d').format(DateTime.now().subtract(Duration(days: 0))), 5),
//       new OrdinalSales(DateFormat('MMM d').format(DateTime.now().subtract(Duration(days: 1))), 25),
//       new OrdinalSales(DateFormat('MMM d').format(DateTime.now().subtract(Duration(days: 2))), 100),
//       new OrdinalSales(DateFormat('MMM d').format(DateTime.now().subtract(Duration(days: 3))), 75),
//     ];

//     final tableSalesData = [
//       new OrdinalSales(DateFormat('MMM d').format(DateTime.now().subtract(Duration(days: 0))), 25),
//       new OrdinalSales(DateFormat('MMM d').format(DateTime.now().subtract(Duration(days: 1))), 50),
//       new OrdinalSales(DateFormat('MMM d').format(DateTime.now().subtract(Duration(days: 2))), 10),
//       new OrdinalSales(DateFormat('MMM d').format(DateTime.now().subtract(Duration(days: 3))), 20),
//     ];


//     return [
//       new charts.Series<OrdinalSales, String>(
//         id: 'Orders',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (OrdinalSales sales, _) => charts.ColorUtil.fromDartColor(AppColors().blueAcc),
//         data: desktopSalesData,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Sales',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (OrdinalSales sales, _) => charts.ColorUtil.fromDartColor(AppColors().greenAcc),
//         data: tableSalesData,
//       ),
//     ];
//   }
// }

// /// Sample ordinal data type.
// class OrdinalSales {
//   final String year;
//   final int sales;

//   OrdinalSales(this.year, this.sales);
// }