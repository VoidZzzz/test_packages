import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';

class LoadingAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController loadingAnimationController;
  late Animation<double> loadingAnimationn;

  late AnimationController leftArcAnimationController;
  late Animation<double> leftArcAnimation;

  int kAnimateTime = 300;
  int kAnimateTimeTwo = 800;

  @override
  void onInit() {
    super.onInit();
    loadingAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: kAnimateTimeTwo));

    leftArcAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: kAnimateTime));

    leftArcAnimation =
        Tween<double>(begin: 0, end: 1).animate(leftArcAnimationController)
          ..addStatusListener((status) async {
            if (status == AnimationStatus.completed) {
              leftArcAnimationController.reset();
              loadingAnimationController.reset();
              loadingAnimationController.forward();
            }
          });

    loadingAnimationn =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: loadingAnimationController, curve: Curves.easeInBack))
          ..addStatusListener((status) async {
            if (status == AnimationStatus.completed) {
              leftArcAnimationController.forward();
            }
          });

    loadingAnimationController.forward();
  }
  @override
  void onClose() {
    super.onClose();
    leftArcAnimationController.dispose();
    loadingAnimationController.dispose();
  }
}
