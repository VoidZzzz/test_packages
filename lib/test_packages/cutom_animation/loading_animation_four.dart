import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';

class LoadingAnimationFour extends StatefulWidget {
  const LoadingAnimationFour({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationFour> createState() => _LoadingAnimationFourState();
}

class _LoadingAnimationFourState extends State<LoadingAnimationFour>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerTwo;
  late AnimationController controllerThree;
  late Animation<double> animation;
  late Animation<double> animationTwo;
  late Animation<double> animationThree;
  int duration = 1000;
  int durationTwo = 100;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));
    controllerTwo = AnimationController(
        vsync: this, duration: Duration(milliseconds: durationTwo));
    controllerThree = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeInToLinear))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
          controllerTwo.forward();
        }
      });
    animationTwo = Tween<double>(begin: 0, end: 1).animate(controllerTwo)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controllerTwo.reset();
        }
      });
    animationThree = Tween<double>(begin: 0, end: 1).animate(controllerThree)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      });
    super.initState();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return CustomPaint(
                  painter: CustomCirclePainter(
                      height: 200,
                      width: 200,
                      circleSize: 140 * animation.value,
                      strokeWidth: 10 * animation.value),
                );
              }),
          AnimatedBuilder(
              animation: animationTwo,
              builder: (context, child) {
                superPrint(animationTwo.value);
                return CustomPaint(
                  painter: CustomCirclePainter(
                      height: 200,
                      width: 200,
                      circleSize: 140 + 20 * animationTwo.value,
                      strokeWidth: 10),
                );
              }),
        ],
      ),
    );
  }
}

class CustomCirclePainter extends CustomPainter {
  final double width;
  final double height;
  final double circleSize;
  final double strokeWidth;

  CustomCirclePainter(
      {required this.circleSize,
      required this.width,
      required this.strokeWidth,
      required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePainter = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.pinkAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2 , size.height / 2),
        radius: size.width / 3);

    canvas.drawCircle(Offset((width * 0.5)-16.5, (height * 0.5)-16.5), this.circleSize * 0.3,
        circlePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
