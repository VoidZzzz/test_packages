import 'package:flutter/material.dart';

class LoadingAnimationSeven extends StatefulWidget {
  const LoadingAnimationSeven({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationSeven> createState() => _LoadingAnimationSevenState();
}

class _LoadingAnimationSevenState extends State<LoadingAnimationSeven>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerTwo;
  late AnimationController controllerThree;
  late Animation<double> size;
  late Animation<Color?> color;

  int forwardDuration = 300;
  int waitDuration = 150;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: forwardDuration));

    controllerTwo = AnimationController(
        vsync: this, duration: Duration(milliseconds: forwardDuration));

    size = Tween<double>(begin: 5, end: 20).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1, curve: Curves.bounceOut)));

    size = Tween<double>(begin: 20, end: 5).animate(
        CurvedAnimation(parent: controllerTwo, curve: Interval(0.0, 1, curve: Curves.linearToEaseOut)));

    color = ColorTween(begin: Colors.greenAccent, end: Colors.yellowAccent)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1)));

    color = ColorTween(begin: Colors.tealAccent, end: Colors.redAccent).animate(
        CurvedAnimation(parent: controllerTwo, curve: Interval(0.0, 1)));

    controllerThree = AnimationController(
        vsync: this, duration: Duration(milliseconds: forwardDuration));

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(milliseconds: waitDuration))
            .then((value) => controller.reset());
        controllerTwo.forward();
        // controller.forward();
      }
    });

    controllerTwo.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(milliseconds: waitDuration))
            .then((value) => controllerTwo.reset());
        controller.forward();
      }
    });

    controllerThree.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(milliseconds: waitDuration))
            .then((value) => controllerThree.reset());
        controllerThree.forward();
      }
    });

    controller.forward();
    controllerThree.forward();
  }

  @override
  void dispose() {
    controller.removeStatusListener((status) { });
    controllerTwo.removeStatusListener((status) { });
    controllerThree.removeStatusListener((status) { });
    controller.dispose();
    controllerTwo.dispose();
    controllerThree.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: AnimatedBuilder(
                animation: controllerThree,
                builder: (context, child) {
                  return AnimatedBuilder(
                      animation: controllerTwo,
                      builder: (context, child) {
                        return AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: 3 * (controllerThree.value),
                                child: Transform.rotate(
                                  angle: 90,
                                  child: Container(
                                    height: 20 + (size.value),
                                    width: 20 + (size.value),
                                    decoration: ShapeDecoration(
                                      color: color.value,
                                      shape: BeveledRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      });
                }),
          ),
        ),
      ),
    );
  }
}
