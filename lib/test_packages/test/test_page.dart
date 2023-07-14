import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:test_packages_app/widgets/text_view.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      isTopSafe: false,
      isBotSafe: false,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.deepOrange.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      height: null,
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: Get.width,
                            height: 50,
                            color: Colors.red.withOpacity(0.2),
                          ),
                          Container(
                            width: Get.width,
                            height: 50,
                            color: Colors.deepOrangeAccent.withOpacity(0.2),
                          ),
                          Container(
                            width: Get.width,
                            height: 50,
                            color: Colors.deepPurple.withOpacity(0.2),
                          ),
                          Container(
                            width: Get.width,
                            height: 50,
                            color: Colors.blueAccent.withOpacity(0.2),
                          ),
                          Container(
                            width: Get.width,
                            height: 50,
                            color: Colors.green.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: TextView(text: "BTN ONE")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
                child: TextView(text: "BTN TWO")),
          ],
        ),
      ),
    );
  }
}
