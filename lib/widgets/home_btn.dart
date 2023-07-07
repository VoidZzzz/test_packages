import 'package:flutter/material.dart';
import 'package:test_packages_app/home_page.dart';
import 'package:test_packages_app/widgets/icon_view.dart';
import 'package:get/get.dart';

class HomeBtn extends StatelessWidget {
  const HomeBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.offAll(
              () => HomePage(),
            ),
        child: Row(
          children: [
            const Spacer(),
            IconView(
              icon: Icons.home,
              color: Colors.deepPurple.withOpacity(0.4),
            ),
            SizedBox(width: 20,)
          ],
        ));
  }
}
