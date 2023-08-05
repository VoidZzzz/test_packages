import 'package:flutter/material.dart';
import 'package:test_packages_app/utils/extensions.dart';

class StgAnimation extends StatefulWidget {
  const StgAnimation({Key? key}) : super(key: key);

  @override
  State<StgAnimation> createState() => _StgAnimationState();
}

class _StgAnimationState extends State<StgAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> width;
  late AnimationController controller;
  late Animation<double> height;
  late Animation<double> opacity;
  late Animation<BorderRadius?> borderRadius;
  late Animation<Color?> color;

  late Animation<double> left;
  late Animation<double> leftTwo;
  late Animation<double> leftThree;

  final Curve curve = Curves.easeInCubic;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    width = Tween<double>(begin: 10, end: 150).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.6, curve: Curves.linear)));

    height = Tween<double>(begin: 10, end: 150).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.3, curve: Curves.linear)));

    opacity = Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.1, curve: Curves.linear)));

    left = Tween<double>(begin: 40, end: 150)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1)));

    leftTwo = Tween<double>(begin: 90, end: 40).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1, curve: curve)));

    leftThree = Tween<double>(begin: 150, end: 90)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1)));

    borderRadius = BorderRadiusTween(
            begin: BorderRadius.circular(2), end: BorderRadius.circular(80))
        .animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 1, curve: Curves.bounceOut)));

    color = ColorTween(begin: Colors.redAccent, end: Colors.greenAccent)
        .animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 1, curve: Curves.ease)));

    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Container(
                  height: height.value,
                  width: width.value,
                  decoration: BoxDecoration(
                      borderRadius: borderRadius.value, color: color.value),
                );
              },
            ),
          ),
        ),
        15.heightBox(),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(5),
          ),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    Positioned(
                      left: left.value,
                      top: 100,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      left: leftTwo.value,
                      top: 100,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      left: leftThree.value,
                      top: 100,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }
}
