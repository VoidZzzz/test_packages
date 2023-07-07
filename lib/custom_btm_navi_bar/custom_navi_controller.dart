import 'dart:ui';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

enum CashierHomeMainPageTabs { home, voucher, user, noti, profile }

class HomeMainController extends GetxController {
  Rx<CashierHomeMainPageTabs> currentNaviTab = CashierHomeMainPageTabs.home.obs;
  final Color homeTabColor = const Color(0xff3a79f4);
  final Color voucherTabColor = const Color(0xff6EFBA6);
  final Color userTabColor = const Color(0xff26D8FF);
  final Color messageTabColor = const Color(0xffFFB992);
  final Color profileTabColor = const Color(0xff56FFD6);

  Map<CashierHomeMainPageTabs, Map> tabsMetas = {
    CashierHomeMainPageTabs.home: {
      'icon': Iconsax.home_2,
      'icon2': Iconsax.home_25,
    },
    CashierHomeMainPageTabs.voucher: {
      'icon': Iconsax.receipt_search,
      'icon2': Iconsax.receipt_search5,
    },
    CashierHomeMainPageTabs.user: {
      'icon': Iconsax.user_tag,
      'icon2': Iconsax.tag_user5,
    },
    CashierHomeMainPageTabs.noti: {
      'icon': Iconsax.sms_notification,
      'icon2': Iconsax.sms_notification5,
    },
    CashierHomeMainPageTabs.profile: {
      'icon': Iconsax.user_square,
      'icon2': Iconsax.user_square5,
    },
  };
}
