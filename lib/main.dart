import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test_packages_app/custom_btm_navi_bar/custom_navi_controller.dart';
import 'package:test_packages_app/home_page.dart';
import 'package:test_packages_app/test_packages/confetti/confetti_controller.dart';
import 'package:test_packages_app/test_packages/pie_menu/pie_menu_controller.dart';
import 'package:test_packages_app/test_packages/test/test_page.dart';
import 'package:test_packages_app/utils/extensions.dart';
import 'package:test_packages_app/widgets/text_view.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails detail) =>
      CustomErrorWidget(errorDetails: detail, oneTwoThree: 3);
  Get.put(TestConfettiController());
  Get.put(PieMenuController());
  Get.put(HomeMainController());
  await Future.delayed(const Duration(seconds: 1));
  runApp(const MyApp());
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {Key? key, required this.errorDetails, required this.oneTwoThree})
      : super(key: key);

  final FlutterErrorDetails errorDetails;
  final int oneTwoThree;

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      isTopSafe: false,
      isBotSafe: false,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => const HomePage());
              },
              child: Positioned.fill(
                child: (oneTwoThree == 1)
                    ? Image.asset(
                        "assets/images/crying_memes.gif",
                        fit: BoxFit.cover,
                      )
                    : (oneTwoThree == 2)
                        ? Image.asset(
                            "assets/images/crying_girl.gif",
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/images/dangin_girl.gif",
                            fit: BoxFit.cover,
                          ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextView(
                text: errorDetails.exceptionAsString(),
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Packages',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Inter',
        fontFamilyFallback: const ['Pyidaungsu'],
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HiHIHi extends StatelessWidget {
  const HiHIHi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
        body: Column(
      children: [
        Container(
          color: Colors.green.withOpacity(0.1),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.redAccent,
              ),
              10.widthBox(),
              Column(
                children: [
                  TextView(text: "Header"),
                  TextView(
                    text: "SubTitle",
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ],
              ),
              Container(
                child: Icon(Iconsax.trash),
              )
            ],
          ),
        ),
        10.heightBox(),
        Container(
          color: Colors.blue.withOpacity(0.1),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.redAccent,
              ),
              10.widthBox(),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextView(text: "Header"),
                  TextView(
                    text: "SubTitle",
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ],
              ),
              Spacer(),
              Container(height: 50, width: 30,
                child: Center(child: Icon(Iconsax.trash)),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
