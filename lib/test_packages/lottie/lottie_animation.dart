import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      isTopSafe: false,
      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.4),
      body: Center(
        child: Row(
          children: [
            Transform.flip(
                flipX: true,
                child:
                    Lottie.asset("assets/json/car3.json", width: Get.width)),
            // Transform.flip(
            //     flipX: false,
            //     child:
            //         Lottie.asset("assets/json/car2.json", width: Get.width / 2)),
          ],
        ),
      ),
    );
  }
}
