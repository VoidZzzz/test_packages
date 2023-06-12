import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_packages_app/test_packages/confetti/confetti_controller.dart';
import 'package:test_packages_app/test_packages/pie_menu/pie_menu.dart';
import 'package:test_packages_app/test_packages/pie_menu/pie_menu_controller.dart';
import 'package:test_packages_app/test_packages/sync_fusion/sync_fusion_page.dart';

void main() async{
  Get.put(TestConfettiController());
  Get.put(PieMenuController());
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
        fontFamily: 'Inter', fontFamilyFallback: const ['Pyidaungsu'],
        useMaterial3: true,
      ),
      home: const SyncFusionPage(),
    );
  }
}
