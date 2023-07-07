import 'package:flutter/material.dart';
import 'package:test_packages_app/test_packages/animated_radial_menu/animate_radial_menu.dart';
import 'package:test_packages_app/test_packages/confetti/confetti.dart';
import 'package:test_packages_app/test_packages/custom_animation/custom_animation.dart';
import 'package:test_packages_app/test_packages/num_date_picker/num_date_picker.dart';
import 'package:test_packages_app/test_packages/pie_menu/pie_menu.dart';
import 'package:test_packages_app/test_packages/sync_fusion/sync_fusion_page.dart';
import 'package:test_packages_app/widgets/custom_elevated_btn.dart';
import 'package:test_packages_app/widgets/text_view.dart';
import 'package:get/get.dart';

import 'custom_btm_navi_bar/custom_btm_navi_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          text: "Pick your destination",
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      body: Column(
        children: [
          // Text(int.parse("source").toString()),
          // SizedBox(
          //   height: 300,
          //   width: Get.width,
          //   child: Image.network(
          //       "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExZDg0NmlnbzFmcXluemgyaDJyN2I2ZjdheWd6emZ2c2NhbWl0aXlvbyZlcD12MV9naWZzX3NlYXJjaCZjdD1n/euMGM3uD3NHva/giphy.gif"),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 40,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2),
                children: [
                  CustomElevatedButton(
                    text: "Confetti",
                    onTap: () {
                      Get.to(
                        () => const Confetti(),
                      );
                    },
                  ),
                  CustomElevatedButton(
                    text: "NumDatePicker",
                    onTap: () {
                      Get.to(
                        () => const NumDatePicker(),
                      );
                    },
                  ),
                  CustomElevatedButton(
                    text: "Animated Radial Menu",
                    onTap: () {
                      Get.to(
                        () => const AnimatedRadialMenu(),
                      );
                    },
                  ),
                  CustomElevatedButton(
                    text: "Pie Menu",
                    onTap: () {
                      Get.to(
                        () => const PieMenuPage(),
                      );
                    },
                  ),
                  CustomElevatedButton(
                    text: "Charts",
                    onTap: () {
                      Get.to(
                        () => const SyncFusionPage(),
                      );
                    },
                  ),
                  CustomElevatedButton(
                    text: "Custom Btm Navi",
                    onTap: () {
                      Get.to(
                        () => const CustomBottomNaviPage(),
                      );
                    },
                  ),
                  CustomElevatedButton(
                    text: "Custom Animation",
                    onTap: () {
                      Get.to(
                        () => const CustomAnimationPage(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
