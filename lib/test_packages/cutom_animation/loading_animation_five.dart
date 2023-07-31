import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_packages_app/widgets/text_view.dart';

class LoadingAnimationFive extends StatefulWidget {
  const LoadingAnimationFive({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationFive> createState() => _LoadingAnimationFiveState();
}

class _LoadingAnimationFiveState extends State<LoadingAnimationFive>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  int duration = 1500;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));

    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      });

    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animation.removeStatusListener((status) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Center(
              child: Stack(
                alignment: Alignment(0, 0),
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                      gradient: LinearGradient(
                          begin: Alignment(cos(2 * pi * animation.value),
                              sin(2 * pi * animation.value)),
                          end: Alignment(cos(2 * pi * (animation.value + 0.5)),
                              sin(2 * pi * (animation.value + 0.5))),
                          colors: const [
                            Colors.green,
                            Colors.amber,
                            Colors.redAccent,
                            Colors.blue,
                          ]),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: const Center(
                      child: TextView(
                        text: "UwU",
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
