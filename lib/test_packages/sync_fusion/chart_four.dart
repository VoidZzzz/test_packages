import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_packages_app/test_packages/sync_fusion/chart_three.dart';
import 'package:test_packages_app/test_packages/sync_fusion/chart_two.dart';
import 'package:test_packages_app/widgets/text_view.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_btn.dart';

class ChartFourPage extends StatelessWidget {
  const ChartFourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(
          text: "Chart Four".toUpperCase(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                text: "Previous Chart",
                onTap: () => Get.to(
                  () => const ChartThreePage(),
                ),
              ),
              CustomElevatedButton(
                text: "Next Chart",
                onTap: () => Get.to(
                  () => const ChartTwoPage(),
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


