import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_packages_app/test_packages/sync_fusion/chart_two.dart';
import 'package:test_packages_app/widgets/custom_elevated_btn.dart';
import 'package:test_packages_app/widgets/text_view.dart';
import 'package:get/get.dart';

class SyncFusionPage extends StatelessWidget {
  const SyncFusionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          text: "SyncFusion",
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              title: ChartTitle(
                text: "Car Sales",
                textStyle: const TextStyle(fontWeight: FontWeight.w700),
              ),
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              series: [
                ColumnSeries(
                  dataSource: getColumnData(),
                  xValueMapper: (SalesData sales, _) => sales.x,
                  yValueMapper: (SalesData sales, _) => sales.y,
                )
              ],
            ),
          ),
          CustomElevatedButton(
            text: "Next Chart",
            onTap: () => Get.to(
              () => const ChartTwoPage(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String x;
  final double y;

  SalesData(this.x, this.y);
}

dynamic getColumnData() {
  List<SalesData> columnData = [
    SalesData("Chevrolet", 20),
    SalesData("Honda", 2),
    SalesData("Ferrari", 30),
    SalesData("Bugatti", 34),
    SalesData("Suzuki", 4),
  ];

  return columnData;
}
