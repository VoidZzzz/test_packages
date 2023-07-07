import 'package:flutter/material.dart';
import 'package:test_packages_app/custom_btm_navi_bar/custom_navi_controller.dart';
import 'package:test_packages_app/widgets/text_view.dart';
import 'package:get/get.dart';

class CustomBottomNaviPage extends StatefulWidget {
  const CustomBottomNaviPage({Key? key}) : super(key: key);

  @override
  State<CustomBottomNaviPage> createState() => _CustomBottomNaviPageState();
}

class _CustomBottomNaviPageState extends State<CustomBottomNaviPage>
    with TickerProviderStateMixin {
  late AnimationController iconAnimation;
  late AnimationController indicatorAnimation;
  double containerWidth = 100;

  @override
  void initState() {
    Get.put(HomeMainController());
    iconAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    iconAnimation.forward();

    indicatorAnimation = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0.5);
    iconAnimation.forward();
    super.initState();
  }

  @override
  void dispose() {
    iconAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeMainController homeMainController = Get.find();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (containerWidth == 100) {
                    setState(() {
                      containerWidth = 300;
                    });
                  } else {
                    setState(() {
                      containerWidth = 100;
                    });
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 200,
                  width: containerWidth,
                  color: Colors.red,
                  child: const Center(
                    child: Text("Hello"),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xffE9EBF0), width: 1.3),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Obx(() => Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: CashierHomeMainPageTabs.values.map((e) {
                              var xSelected =
                                  homeMainController.currentNaviTab.value == e;
                              return Stack(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      homeMainController.currentNaviTab.value =
                                          e;
                                      iconAnimation.reset();
                                      iconAnimation.forward();
                                      indicatorAnimation.reset();
                                      indicatorAnimation.forward();
                                    },
                                    icon: Stack(
                                      children: [
                                        if (xSelected)
                                          AnimatedBuilder(
                                              animation: iconAnimation,
                                              builder: (context, child) =>
                                                  Transform.translate(
                                                    offset: Offset(
                                                        iconAnimation.value * 4,
                                                        iconAnimation.value *
                                                            3),
                                                    child: Icon(
                                                      homeMainController
                                                              .tabsMetas[e]![
                                                          "icon2"],
                                                      color: e ==
                                                              CashierHomeMainPageTabs
                                                                  .home
                                                          ? homeMainController
                                                              .homeTabColor
                                                              .withOpacity(0.4)
                                                          : e ==
                                                                  CashierHomeMainPageTabs
                                                                      .voucher
                                                              ? homeMainController
                                                                  .voucherTabColor
                                                              : e ==
                                                                      CashierHomeMainPageTabs
                                                                          .user
                                                                  ? homeMainController
                                                                      .userTabColor
                                                                  : e ==
                                                                          CashierHomeMainPageTabs
                                                                              .noti
                                                                      ? homeMainController
                                                                          .messageTabColor
                                                                      : homeMainController
                                                                          .voucherTabColor,
                                                    ),
                                                  )),
                                        Icon(
                                          homeMainController
                                              .tabsMetas[e]!["icon"],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // if (xSelected)
                                  //   AnimatedBuilder(
                                  //     animation: iconAnimation,
                                  //     builder: (context, child) =>
                                  //         Transform.translate(
                                  //       offset:
                                  //           Offset(15, iconAnimation.value * -6),
                                  //       child: Container(
                                  //         height: iconAnimation.value * 2,
                                  //         width: iconAnimation.value * 15,
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.black,
                                  //           borderRadius: BorderRadius.circular(10),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                ],
                              );
                            }).toList(),
                          ),
                          GetBuilder<HomeMainController>(
                            builder: (hmController) {
                              return Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: checkCurrentTab(hmController.currentNaviTab.value),
                                    height: 2,
                                    // color: Colors.green,
                                  ),
                                  Container(
                                    height: 2,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              );
                            }
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double checkCurrentTab(CashierHomeMainPageTabs tab) {
    if (tab == CashierHomeMainPageTabs.home) {
      return Get.width * 0.11;
    } else if (tab == CashierHomeMainPageTabs.voucher) {
      return Get.width * 0.295;
    } else if (tab == CashierHomeMainPageTabs.user) {
      return Get.width * 0.48;
    } else if (tab == CashierHomeMainPageTabs.noti) {
      return Get.width * 0.67;
    } else {
      return Get.width * 0.86;
    }
  }
}
