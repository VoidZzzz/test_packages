import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoadingAnimationThree extends StatefulWidget {
  const LoadingAnimationThree({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationThree> createState() => _LoadingAnimationThreeState();
}

class _LoadingAnimationThreeState extends State<LoadingAnimationThree>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  int duration = 1500;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));

    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticInOut))
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(const Duration(milliseconds: 300)).then((value) => controller.reset());
          controller.forward();
        }
      });
    super.initState();

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    animation.removeStatusListener((status) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            height: 200,
            width: 200,decoration: BoxDecoration(
            color: Colors.white,borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Transform.rotate(
                angle: 3.14 * animation.value,
                child: const Icon(
                  Iconsax.weight_1,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
            ),
          );
        });
  }
}
