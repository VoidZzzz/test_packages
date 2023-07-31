// import 'package:flutter/material.dart';
// import 'package:flutter_super_scaffold/flutter_super_scaffold.dart';
// import 'package:get/get.dart';
// import 'package:test_packages_app/test_packages/custom_animation/models/profile_model.dart';
// import 'package:test_packages_app/widgets/icon_view.dart';
// import 'package:test_packages_app/widgets/text_view.dart';
//
// class CustomAnimationDetail extends StatelessWidget {
//   const CustomAnimationDetail({Key? key, required this.model})
//       : super(key: key);
//
//   final ProfileModel model;
//
//   @override
//   Widget build(BuildContext context) {
//     return FlutterSuperScaffold(
//         body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: Get.height * 0.5,
//           width: Get.width,
//           child: Image.network(
//             image,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Container(
//           height: Get.height * 0.4,
//           width: Get.width,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       TextView(text: name),
//                       TextView(text: rating.toString()),
//                     ],
//                   ),
//                   Spacer(),
//                   IconView(icon: Icons.heart_broken_outlined)
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     ));
//   }
// }
