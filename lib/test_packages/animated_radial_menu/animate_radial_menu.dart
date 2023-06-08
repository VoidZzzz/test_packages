import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:flutter/material.dart';
import 'package:test_packages_app/widgets/icon_view.dart';
import 'package:test_packages_app/widgets/text_view.dart';

class AnimatedRadialMenu extends StatelessWidget {
  const AnimatedRadialMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          text: "Animated Radial Menu",
          fontSize: 18,
        ),
      ),
      body: Stack(
        children: [
          RadialMenu(
            centerButtonAlignment: Alignment.center,
            centerButtonSize: 0.5,
            children: [
              RadialButton(
                buttonColor: Colors.deepPurple,
                icon: const Icon(Icons.ac_unit),
                onPress: () {
                  print("AC unit tapped");
                },
              ),
              RadialButton(
                buttonColor: Colors.blueGrey,
                icon: const Icon(Icons.fire_hydrant),
                onPress: () {
                  print("AC unit tapped");
                },
              ),
              RadialButton(
                buttonColor: Colors.red,
                icon: const Icon(Icons.close),
                onPress: () {
                  print("AC unit tapped");
                },
              ),
              RadialButton(
                buttonColor: Colors.grey,
                icon: const Icon(Icons.keyboard_arrow_left),
                onPress: () {
                  print("AC unit tapped");
                },
              ),
              RadialButton(
                buttonColor: Colors.amber,
                icon: const Icon(Icons.punch_clock),
                onPress: () {
                  print("AC unit tapped");
                },
              ),
            ],
          ),
          // Center(
          //   child: TextButton(
          //     onPressed: () {},
          //     child: const Text(
          //       "Tap if you dare",
          //       style: TextStyle(
          //           fontSize: 16,
          //           color: Colors.blue,
          //           decoration: TextDecoration.underline,
          //           fontWeight: FontWeight.w600),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
