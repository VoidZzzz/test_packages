import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:test_packages_app/test_packages/cutom_animation/loading_animation/loading_animation_controller.dart';

class LoadingAnimation extends StatelessWidget {
  LoadingAnimation({Key? key}) : super(key: key);
  final LoadingAnimationController controller =
      Get.put(LoadingAnimationController());

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      isTopSafe: false,
      body: GetBuilder<LoadingAnimationController>(
        builder: (loadingAnimationController) {
          return Center(
            child: Container(
              color: Colors.transparent,
              child: Stack(
                children: [
                  CustomPaint(
                    size: const Size(280, 280),
                    painter: CirclePainter(),
                  ),
                  AnimatedBuilder(animation: loadingAnimationController.leftArcAnimation, builder: (context, child){
                    superPrint(loadingAnimationController.leftArcAnimation.value);
                    return CustomPaint(
                      size: const Size(280, 280),
                      painter: ArcPainter(
                          startAngle: 0.5 * 3.14,
                          sweepAngle:
                          (3.14 * loadingAnimationController.leftArcAnimation.value)),
                    );
                  }),
                  AnimatedBuilder(animation: loadingAnimationController.leftArcAnimation, builder: (context, child){
                    superPrint(loadingAnimationController.leftArcAnimation.value);
                    return CustomPaint(
                      size: const Size(280, 280),
                      painter: ArcPainter(
                          startAngle: 0.5 * 3.14,
                          sweepAngle:
                          -(3.14 * loadingAnimationController.leftArcAnimation.value)),
                    );
                  }),
                  AnimatedBuilder(animation: loadingAnimationController.loadingAnimationn, builder: (context, child){
                    return Transform.translate(
                      offset: Offset(
                          130,
                          80 +
                              53.5 *
                                  2 *
                                  loadingAnimationController
                                      .loadingAnimationn.value),
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = Colors.grey.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18;

    double radius = size.width / 5;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ArcPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;

  ArcPainter({required this.startAngle, required this.sweepAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint arcPainter = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18;

    double radius = size.width / 5;
    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(rect, startAngle, sweepAngle, false, arcPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
