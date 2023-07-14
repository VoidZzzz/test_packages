import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';

class LoadingAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController loadingAnimationController;
  late Animation<double> loadingAnimationn;

  late AnimationController leftArcAnimationController;
  late Animation<double> leftArcAnimation;

  int kAnimateTime = 1000;

  @override
  void onInit() {
    super.onInit();
    loadingAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: kAnimateTime));

    leftArcAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: kAnimateTime));

    leftArcAnimation =
        Tween<double>(begin: 0, end: 1).animate(leftArcAnimationController)
          ..addStatusListener((status) async {
            if (status == AnimationStatus.completed) {
              superPrint("ARC COMPLETE");
              leftArcAnimationController.reset();
              await Future.delayed(Duration(milliseconds: kAnimateTime));
              leftArcAnimationController.forward();
            }
          });

    loadingAnimationn =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: loadingAnimationController, curve: Curves.easeInBack))
          ..addStatusListener((status) async {
            if (status == AnimationStatus.completed) {
              await Future.delayed(Duration(milliseconds: kAnimateTime));
              loadingAnimationController.reset();
              loadingAnimationController.forward();
            }
          });
    loadingAnimationController.forward();
    Future.delayed(Duration(milliseconds: kAnimateTime))
        .then((value) => leftArcAnimationController.forward());
  }

  // void initLoad()async{
  //   startCircle();
  //   await Future.delayed(const Duration(seconds: 4)).then((value) => resetCircle());
  // }

  void resetArc() {
    leftArcAnimationController.reset();
  }

  void startArc() {
    leftArcAnimationController.forward();
  }

  // void resetCircle(){
  //   loadingAnimationController.reset();
  // }
  //
  // void startCircle(){
  //   loadingAnimationController.forward();
  // }

  @override
  void onClose() {
    super.onClose();
    leftArcAnimationController.dispose();
    // loadingAnimationController.dispose();
  }
}
