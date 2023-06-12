import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_packages_app/test_packages/sync_fusion/chart_three.dart';
import 'package:test_packages_app/test_packages/sync_fusion/sync_fusion_page.dart';
import 'package:test_packages_app/widgets/custom_elevated_btn.dart';
import 'package:test_packages_app/widgets/text_view.dart';
import 'package:get/get.dart';

class ChartTwoPage extends StatelessWidget {
  const ChartTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(
          text: "Chart Two".toUpperCase(),
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCircularChart(
              title: ChartTitle(text: "Mont Sarrrr Ml"),
              legend: Legend(
                  // shouldAlwaysShowScrollbar: true,
                  orientation: LegendItemOrientation.horizontal,
                  alignment: ChartAlignment.near,
                  isVisible: true),
              series: <PieSeries<_PieData, String>>[
                PieSeries<_PieData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: getPieData(),
                  xValueMapper: (_PieData data, _) => data.x,
                  yValueMapper: (_PieData data, _) => data.y,
                  // dataLabelMapper: (_PieData data, _) => data.x,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                text: "Previous Chart",
                onTap: () => Get.to(
                  () => const SyncFusionPage(),
                ),
              ),
              CustomElevatedButton(
                text: "Next Chart",
                onTap: () => Get.to(
                  () => const ChartThreePage(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
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
    _PieData("Bubble", 20),
    _PieData("Jelly", 30),
    _PieData("Donuts", 10),
    _PieData("Popsicles", 50),
    _PieData("Donuts", 10),
    _PieData("Juggernaut", 50),
  ];

  return columnData;
}
