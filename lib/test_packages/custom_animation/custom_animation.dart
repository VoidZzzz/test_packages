import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:get/get.dart';
import 'package:test_packages_app/utils/extensions.dart';
import 'package:test_packages_app/widgets/home_btn.dart';
import 'package:test_packages_app/widgets/text_view.dart';

import 'custom_animation_controller.dart';

class CustomAnimationPage extends StatelessWidget {
  const CustomAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CustomAnimationController>();
    return FlutterSuperScaffold(isTopSafe: false,
      body: GetBuilder<CustomAnimationController>(
          builder: (customAnimationController) {
        var superStarLists = customAnimationController.superStarLists;
        return Container(
          color: Colors.deepPurple.withOpacity(0.2),
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.heightBox(),
              const HomeBtn(),
              30.heightBox(),
              Expanded(
                child: ListView.builder(
                  itemCount: superStarLists.length,
                  itemBuilder: (context, index) => Container(
                    height: 70,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.network(
                            superStarLists[index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        10.widthBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: superStarLists[index].name!.toUpperCase(),
                              fontWeight: FontWeight.w800,
                            ),
                            5.heightBox(),
                            TextView(
                                text: "${superStarLists[index].rating!} STARS"),
                          ],
                        ),
                        const Spacer(),
                        TextView(text: "${superStarLists[index].goals!} GOALS")
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
