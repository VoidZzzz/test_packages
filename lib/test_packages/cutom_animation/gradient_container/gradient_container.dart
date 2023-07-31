import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' as math;
import 'package:test_packages_app/test_packages/cutom_animation/gradient_container/gradient_container_controller.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({Key? key}) : super(key: key);

  final GradientController gradientController = Get.put(GradientController());

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      body: AnimatedBuilder(
          animation: gradientController.gradientAnimation,
          builder: (context, child) {
            return Center(
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      gradient: SweepGradient(stops: [0,0.1,0.2],
                        startAngle: gradientController.gradientAnimation.value,
                        endAngle: 3.14 *
                            2 *
                            gradientController.gradientAnimation.value,
                        colors: const [
                            Colors.greenAccent,
                          Colors.pinkAccent,
                          Colors.yellowAccent,
                          Colors.redAccent
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 280,
                    width: 280,
                    color: Colors.black,
                  )
                ],
              ),
            );
          }),
    );
  }
}

// class GradientContainerPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
