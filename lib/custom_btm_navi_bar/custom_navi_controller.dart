import 'dart:ui';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

enum HomeMainPageTabs { home, voucher, user, noti, profile }

class HomeMainController extends GetxController {
  Rx<HomeMainPageTabs> currentNaviTab = HomeMainPageTabs.home.obs;
  final Color homeTabColor = const Color(0xff3a79f4);
  final Color voucherTabColor = const Color(0xff6EFBA6);
  final Color userTabColor = const Color(0xff26D8FF);
  final Color messageTabColor = const Color(0xffFFB992);
  final Color profileTabColor = const Color(0xff56FFD6);

  Map<HomeMainPageTabs, Map> tabsMetas = {
    HomeMainPageTabs.home: {
      'icon': Iconsax.home_2,
      'icon2': Iconsax.home_25,
    },
    HomeMainPageTabs.voucher: {
      'icon': Iconsax.receipt_search,
      'icon2': Iconsax.receipt_search5,
    },
    HomeMainPageTabs.user: {
      'icon': Iconsax.user_tag,
      'icon2': Iconsax.tag_user5,
    },
    HomeMainPageTabs.noti: {
      'icon': Iconsax.sms_notification,
      'icon2': Iconsax.sms_notification5,
    },
    HomeMainPageTabs.profile: {
      'icon': Iconsax.user_square,
      'icon2': Iconsax.user_square5,
    },
  };
}
