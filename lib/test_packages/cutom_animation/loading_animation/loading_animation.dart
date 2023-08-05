import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:test_packages_app/test_packages/cutom_animation/loading_animation/loading_animation_controller.dart';
import 'package:test_packages_app/test_packages/cutom_animation/loading_animation_four.dart';
import 'package:test_packages_app/test_packages/cutom_animation/loading_animation_siz.dart';
import 'package:test_packages_app/test_packages/cutom_animation/loading_animation_three.dart';
import 'package:test_packages_app/test_packages/cutom_animation/loading_animation_two/loading_animation_two.dart';
import 'package:test_packages_app/test_packages/staggered_animation/stg_animation.dart';

import '../loading_animation_five.dart';

class LoadingAnimation extends StatelessWidget {
  LoadingAnimation({Key? key}) : super(key: key);
  final LoadingAnimationController controller =
      Get.put(LoadingAnimationController());

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      backgroundColor: Colors.blueGrey,
      isTopSafe: false,
      body: GetBuilder<LoadingAnimationController>(
          builder: (loadingAnimationController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    CustomPaint(
                      size: const Size(280, 280),
                      painter: CirclePainter(),
                    ),
                    AnimatedBuilder(
                        animation: loadingAnimationController.leftArcAnimation,
                        builder: (context, child) {
                          return CustomPaint(
                            size: const Size(280, 280),
                            painter: ArcPainter(
                                startAngle: 0.5 * 3.14,
                                sweepAngle: (3.14 *
                                    loadingAnimationController
                                        .leftArcAnimation.value)),
                          );
                        }),
                    AnimatedBuilder(
                        animation: loadingAnimationController.leftArcAnimation,
                        builder: (context, child) {
                          return CustomPaint(
                            size: const Size(280, 280),
                            painter: ArcPainter(
                                startAngle: 0.5 * 3.14,
                                sweepAngle: -(3.14 *
                                    loadingAnimationController
                                        .leftArcAnimation.value)),
                          );
                        }),
                    AnimatedBuilder(
                        animation: loadingAnimationController.loadingAnimationn,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(
                                75,
                                46 +
                                    60.5 *
                                        loadingAnimationController
                                            .loadingAnimationn.value),
                            child: Container(
                              height: 13,
                              width: 13,
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
              LoadingAnimationTwo(),
              LoadingAnimationThree(),
              LoadingAnimationFour(),
              LoadingAnimationFive(),
              // LoadingAnimationSiz(),
              StgAnimation()
            ],
          ),
        );
      }),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = Colors.grey.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;

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
      // ..shader = SweepGradient(
      //         colors: [Colors.greenAccent, Colors.redAccent], startAngle: 2)
      //     .createShader(Offset.zero & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;

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
