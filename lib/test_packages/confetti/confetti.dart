import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:test_packages_app/widgets/text_view.dart';
import 'package:get/get.dart';

import 'confetti_controller.dart';

class Confetti extends StatelessWidget {
  const Confetti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TestConfettiController>();
    return GetBuilder<TestConfettiController>(builder: (controller) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            appBar: AppBar(
              title: TextView(
                text: "Confetti".toUpperCase(),
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            body: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade300),
                onPressed: () {
                  controller.onTap();
                },
                child: TextView(
                  text: !controller.isPlaying ? "Stop" : "Party Time",
                  fontSize: 13,
                ),
              ),
            ),
          ),
          ConfettiWidget(
            confettiController: controller.confettiController,
            gravity: 0.01,
            emissionFrequency: 0.2,
            colors: const [Colors.deepPurple, Colors.amber],
            blastDirection: pi / 2,
          )
        ],
      );
    });
  }
}
