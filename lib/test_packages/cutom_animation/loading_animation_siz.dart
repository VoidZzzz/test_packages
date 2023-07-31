import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class LoadingAnimationSiz extends StatefulWidget {
  const LoadingAnimationSiz({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationSiz> createState() => _LoadingAnimationSizState();
}

class _LoadingAnimationSizState extends State<LoadingAnimationSiz>
    with TickerProviderStateMixin {
  late AnimationController squareAnimationController;
  late Animation<double> squareAnimation;
  final Color animationColor = Colors.green;

  final double circleBorderRadius = 20;

  /// Square
  double squareBotPosition = 50;
  double squareHeight = 20;

  final int squareDuration = 2000;
  final int circleDuration = 500;

  @override
  void initState() {
    super.initState();
    initLoad();
  }

  Future<void> initLoad() async {
    squareAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: squareDuration));

    squareAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: squareAnimationController, curve: Curves.decelerate));
  }

  @override
  void dispose() {
    squareAnimationController.dispose();
    squareAnimation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: AnimatedBuilder(
            animation: squareAnimation,
            builder: (child, context) {
              return SizedBox(
                height: 200,
                width: 200,
                child: CustomPaint(
                  painter: CustomCirclePainterTwo(
                      startAngle: 0.1,
                      sweepAngle: 5,
                      circleColor: Colors.redAccent,
                      circleWidth: 8),
                ),
              );
            }),
      ),
    );
  }
}

class CustomCirclePainterTwo extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final Color circleColor;
  final double circleWidth;

  CustomCirclePainterTwo(
      {required this.sweepAngle,
      this.circleWidth = 2,
      required this.circleColor,
      required this.startAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.miter
      ..strokeMiterLimit = 10
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
              colors: [Colors.redAccent, Colors.grey, Colors.greenAccent],
              startAngle: 1,
              endAngle: 180 * math.pi / 180)
          .createShader(Offset.zero & size)
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
