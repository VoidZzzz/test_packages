import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:test_packages_app/custom_btm_navi_bar/custom_navi_controller.dart';
import 'package:test_packages_app/home_page.dart';
import 'package:test_packages_app/test_packages/confetti/confetti_controller.dart';
import 'package:test_packages_app/test_packages/custom_animation/custom_animation_controller.dart';
import 'package:test_packages_app/test_packages/pie_menu/pie_menu_controller.dart';
import 'package:test_packages_app/test_packages/test/test_page.dart';
import 'package:test_packages_app/widgets/text_view.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => FlutterSuperScaffold(
        isTopSafe: false,
        isBotSafe: false,
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.deepPurple,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  "https://media.tenor.com/do8q_eYrsW4AAAAM/crying-black-guy-meme.gif",
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextView(
                  text: details.exceptionAsString(),
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      );
  Get.put(TestConfettiController());
  Get.put(PieMenuController());
  Get.put(CustomAnimationController());
  Get.put(HomeMainController());
  await Future.delayed(const Duration(seconds: 1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test Packages',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Inter',
        fontFamilyFallback: const ['Pyidaungsu'],
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
