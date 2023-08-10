import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class Rive extends StatefulWidget {
  const Rive({Key? key}) : super(key: key);

  @override
  State<Rive> createState() => _RiveState();
}

class _RiveState extends State<Rive> with SingleTickerProviderStateMixin {
  StateMachineController? controller;
  SMIInput<double>? inputValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      body: Center(
        child: Container(
          height: 400,
          width: Get.width,
          color: Colors.white,
          child: RiveAnimation.asset(
            "assets/rive/tree.riv",
            onInit: (artBoard) {
              controller =
                  StateMachineController.fromArtboard(artBoard, "StateMachine");
              if(controller!=null){
                artBoard.addController(controller!);
                inputValue = controller?.findInput("input");
              }
            },
          ),
        ),
      ),
    );
  }
}
