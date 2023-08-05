import 'package:flutter/material.dart';
import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
import 'package:test_packages_app/test_packages/staggered_animation/stg_animation.dart';
import 'package:test_packages_app/utils/extensions.dart';
import 'package:test_packages_app/widgets/text_view.dart';
import 'stg_animation.dart';

class StaggeredHomePage extends StatelessWidget {
  const StaggeredHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
        body: Container(
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            TextView(
              text: "STAGGERED ANIMATION", fontSize: 20,
            ),
            30.heightBox(),
            StgAnimation()
          ],
        ),
      ),
    ));
  }
}
