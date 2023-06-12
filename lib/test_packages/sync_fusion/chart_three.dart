import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_packages_app/test_packages/sync_fusion/chart_two.dart';
import 'package:test_packages_app/widgets/text_view.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_btn.dart';
import 'chart_four.dart';

class ChartThreePage extends StatelessWidget {
  const ChartThreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(
          text: "Chart Three".toUpperCase(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCircularChart(
              legend: Legend(
                isVisible: true,
                title: LegendTitle(
                  text: "Montsss I ate in a year",
                  textStyle:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              series: <RadialBarSeries<_PieData, String>>[
                RadialBarSeries(
                    dataSource: getPieData(),
                    xValueMapper: (_PieData data, _) => data.x,
                    yValueMapper: (_PieData data, _) => data.y,
                    dataLabelMapper: (_PieData data, _) => data.x,
                    maximumValue: 200,
                    radius: "150",
                    innerRadius: "70")
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                text: "Previous Chart",
                onTap: () => Get.to(
                      () => const ChartTwoPage(),
                ),
              ),
              CustomElevatedButton(
                text: "Next Chart",
                onTap: () => Get.to(
                      () => const ChartFourPage(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}

class _PieData {
  _PieData(this.x, this.y);

  final String x;
  final num y;
}

dynamic getPieData() {
  List<_PieData> columnData = [
    _PieData("Bubble", 180),
    _PieData("Jelly", 160),
    _PieData("Donuts", 100),
    _PieData("Popsicles", 150),
    _PieData("Donuts", 100),
    _PieData("Juggernaut", 50),
  ];

  return columnData;
}
