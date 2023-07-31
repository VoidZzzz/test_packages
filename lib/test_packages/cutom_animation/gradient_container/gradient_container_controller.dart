import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class GradientController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController gradientAnimationController;
  late Animation<double> gradientAnimation;
  int animatorDuration = 1000;

  @override
  void onInit() {
    gradientAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: animatorDuration));

    gradientAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: gradientAnimationController, curve: Curves.easeInBack))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // gradientAnimationController.forward();
        }
      });

    gradientAnimationController.repeat();
    super.onInit();
  }

  @override
  void onClose() {
    gradientAnimationController.dispose();
    gradientAnimation.removeListener(() { });
    super.onClose();
  }
}
