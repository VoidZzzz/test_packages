import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:test_packages_app/utils/extensions.dart';
import 'package:test_packages_app/widgets/text_view.dart';

import '../confetti/confetti_controller.dart';

class Rive extends StatefulWidget {
  const Rive({Key? key}) : super(key: key);

  @override
  State<Rive> createState() => _RiveState();
}

class _RiveState extends State<Rive> with SingleTickerProviderStateMixin {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  double sliderValue = 0;
  late Timer timer;
  int seconds = 0;
  bool xGrowing = false;

  TestConfettiController confettiController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    inputValue?.change(1);
    confettiController.xCongrats = false;
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestConfettiController>(builder: (confettiController) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          FlutterSuperScaffold(
            backgroundColor: Colors.white,
            isBotSafe: false,
            isTopSafe: false,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    width: Get.width,
                    color: Colors.white,
                    child: RiveAnimation.asset(
                      "assets/rive/tree.riv",
                      onInit: (artBoard) {
                        controller = StateMachineController.fromArtboard(
                            artBoard, "State Machine 1");
                        if (controller != null) {
                          artBoard.addController(controller!);
                          inputValue = controller?.findInput("input");
                          inputValue?.change(1);
                        }
                      },
                    ),
                  ),
                  50.heightBox(),
                  confettiController.xCongrats
                      ? const TextView(
                          text:
                              "Congratulations!!!! You just make the world a better place",
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.green,
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent),
                          onPressed: () {
                            startTimer();
                          },
                          child: TextView(
                            text: xGrowing
                                ? "${60 - seconds} seconds to fully Grow"
                                : "Plant the tree",
                            color: Colors.black,
                          ),
                        )
                ],
              ),
            ),
          ),
          ConfettiWidget(
            confettiController: confettiController.confettiController,
            gravity: 0.01,
            emissionFrequency: 0.2,
            colors: const [
              Colors.deepPurple,
              Colors.amberAccent,
              Colors.greenAccent,
              Colors.deepOrange
            ],
            blastDirection: pi / 2,
          ),
        ],
      );
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      int newSeconds = seconds + 1;
      bool shouldStopTimer = newSeconds >= 61;

      if (shouldStopTimer) {
        confettiController.isPlaying = true;
        confettiController.confettiController.play();
        confettiController.xCongrats = true;
        confettiController.update();
        Future.delayed(const Duration(seconds: 5)).then((value) {
          confettiController.confettiController.stop();
          confettiController.isPlaying = false;
          confettiController.update();
          setState(() {
            xGrowing = false;
            seconds = newSeconds;
            timer.cancel();
          });
        });
      } else {
        setState(() {
          seconds = newSeconds;
          xGrowing = true;
          inputValue?.change(newSeconds.toDouble());
        });
      }
    });

      // setState(() async {
      //   seconds++;
      //   xGrowing = true;
      //   inputValue?.change((seconds.toDouble()));
      //   if (seconds >= 60) {
      //     confettiController.isPlaying = true;
      //     confettiController.confettiController.play();
      //     await Future.delayed(const Duration(seconds: 5))
      //         .then((value) => confettiController.confettiController.stop());
      //     confettiController.isPlaying = false;
      //     confettiController.update();
      //     xGrowing = false;
      //     timer.cancel();
      //   }
      // });
    // });
  }

  Future<void> calculate()async{

  }
}
