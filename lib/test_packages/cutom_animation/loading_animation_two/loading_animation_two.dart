import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:test_packages_app/widgets/text_view.dart';

class LoadingAnimationTwo extends StatefulWidget {
  const LoadingAnimationTwo({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationTwo> createState() => _LoadingAnimationTwoState();
}

class _LoadingAnimationTwoState extends State<LoadingAnimationTwo>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerTwo;
  late AnimationController controllerThree;
  late AnimationController controllerFour;
  late AnimationController controllerFive;

  late Animation<double> loadingAnimation;
  late Animation<double> loadingAnimationTwo;
  late Animation<double> loadingAnimationThree;

  // late Animation<double> loadingAnimationFour;
  // late Animation<double> loadingAnimationFive;

  int duration = 1500;
  int durationTwo = 1500;
  int durationThree = 1000;
  int durationFour = 800;
  int durationFive = 800;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration))
      ..repeat();
    controllerTwo = AnimationController(
        vsync: this, duration: Duration(milliseconds: durationTwo));
    controllerThree = AnimationController(
        vsync: this, duration: Duration(milliseconds: durationThree));

    controllerFour = AnimationController(
        vsync: this, duration: Duration(milliseconds: durationFour));
    controllerFive = AnimationController(
        vsync: this, duration: Duration(milliseconds: durationFive));

    loadingAnimation = Tween<double>(begin: 0, end: 1).animate(controller
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // controller.reverse().then((value) => controller.forward(
          // ));
        }
      }));

    loadingAnimationTwo = Tween<double>(begin: 0, end: 1).animate(controllerTwo
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      }));
    loadingAnimationThree =
        Tween<double>(begin: 0, end: 1).animate(controllerThree
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {}
          }));
    // controller.forward();
    Future.delayed(Duration(milliseconds: 400))
        .then((value) => controllerTwo.repeat());
    Future.delayed(Duration(milliseconds: 400))
        .then((value) => controllerFive.repeat());
    controllerThree.repeat();
    controllerFour.repeat();
  }

  @override
  void dispose() {
    controllerThree.dispose();
    controllerTwo.dispose();
    controller.dispose();
    controllerFive.dispose();
    controllerFour.dispose();
    loadingAnimation.removeStatusListener((status) {});
    loadingAnimationTwo.removeStatusListener((status) {});
    loadingAnimationThree.removeStatusListener((status) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: (loadingAnimation),
        builder: (context, child) {
          return Stack(
            children: [
              Container(decoration: BoxDecoration(
                color: Colors.white,borderRadius: BorderRadius.circular(10)),
                height: 200,
                width: 200,
                child: CustomPaint(
                  painter: CirclePaint(
                      startAngle: 2 * math.pi * loadingAnimation.value,
                      sweepAngle: 2,
                      circleColor: Colors.greenAccent),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 200,
                width: 200,
                child: CustomPaint(
                  painter: CirclePaint(
                      startAngle: 2 * math.pi * loadingAnimationTwo.value,
                      sweepAngle: 1,
                      circleColor: Colors.purpleAccent),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 200,
                width: 200,
                child: CustomPaint(
                  painter: CirclePaintTwo(
                      startAngle: -(2 * math.pi * loadingAnimationThree.value),
                      sweepAngle: 3,
                      circleColor: Colors.black),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 200,
                width: 200,
                child: CustomPaint(
                  painter: CirclePaintThree(
                      startAngle: -(math.pi * controllerFour.value),
                      sweepAngle: 1.5,
                      circleColor: Colors.pinkAccent),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 200,
                width: 200,
                child: CustomPaint(
                  painter: CirclePaintThree(
                      startAngle: -(2 * math.pi * controllerFive.value),
                      sweepAngle: 2.2,
                      circleColor: Colors.blueAccent),
                ),
              ),
              const SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(
                      child: TextView(
                    text: "Loading..",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  )))
            ],
          );
        });
  }
}

class CirclePaint extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final Color circleColor;
  final double circleWidth;

  CirclePaint(
      {required this.sweepAngle,
      this.circleWidth = 2,
      required this.circleColor,
      required this.startAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..color = circleColor;
    var center = Offset(size.width * 0.5, size.width * 0.5);
    var radius = size.width * 0.3;
    Rect rect = Rect.fromCircle(center: center, radius: radius);
    // canvas.drawCircle(center, radius, circlePainter);
    canvas.drawArc(rect, startAngle, sweepAngle, false, circlePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePaintTwo extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final Color circleColor;
  final double circleWidth;

  CirclePaintTwo(
      {required this.sweepAngle,
      this.circleWidth = 2,
      required this.circleColor,
      required this.startAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..color = circleColor;
    var center = Offset(size.width * 0.5, size.width * 0.5);
    var radius = size.width * 0.33;
    Rect rect = Rect.fromCircle(center: center, radius: radius);
    // canvas.drawCircle(center, radius, circlePainter);
    canvas.drawArc(rect, startAngle, sweepAngle, false, circlePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePaintThree extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final Color circleColor;
  final double circleWidth;

  CirclePaintThree(
      {required this.sweepAngle,
      this.circleWidth = 2,
      required this.circleColor,
      required this.startAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..color = circleColor;
    var center = Offset(size.width * 0.5, size.width * 0.5);
    var radius = size.width * 0.27;
    Rect rect = Rect.fromCircle(center: center, radius: radius);
    // canvas.drawCircle(center, radius, circlePainter);
    canvas.drawArc(rect, startAngle, sweepAngle, false, circlePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
