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
    with SingleTickerProviderStateMixin {
  late AnimationController iconAnimation;

  @override
  void initState() {
    Get.put(HomeMainController());
    iconAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
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
          const Expanded(
            child: Center(
              child: Text("Hello"),
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
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: HomeMainPageTabs.values.map((e) {
                          var xSelected =
                              homeMainController.currentNaviTab.value == e;
                          return Stack(
                            children: [
                              IconButton(
                                onPressed: () {
                                  homeMainController.currentNaviTab.value = e;
                                  iconAnimation.reset();
                                  iconAnimation.forward();
                                  print(
                                      "CURRENT TABB ________> ${homeMainController.currentNaviTab.value}");
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
                                                    iconAnimation.value * 3),
                                                child: Icon(
                                                  homeMainController
                                                      .tabsMetas[e]!["icon2"],
                                                  color: e ==
                                                          HomeMainPageTabs.home
                                                      ? homeMainController
                                                          .homeTabColor
                                                          .withOpacity(0.4)
                                                      : e ==
                                                              HomeMainPageTabs
                                                                  .voucher
                                                          ? homeMainController
                                                              .voucherTabColor
                                                          : e ==
                                                                  HomeMainPageTabs
                                                                      .user
                                                              ? homeMainController
                                                                  .userTabColor
                                                              : e ==
                                                                      HomeMainPageTabs
                                                                          .noti
                                                                  ? homeMainController
                                                                      .messageTabColor
                                                                  : homeMainController
                                                                      .voucherTabColor,
                                                ),
                                              )),
                                    Icon(
                                      homeMainController.tabsMetas[e]!["icon"],
                                    ),
                                  ],
                                ),
                              ),
                              if (xSelected)
                                AnimatedBuilder(
                                  animation: iconAnimation,
                                  builder: (context, child) =>
                                      Transform.translate(
                                    offset:
                                        Offset(15, iconAnimation.value * -6),
                                    child: Container(
                                      height: iconAnimation.value * 2,
                                      width: iconAnimation.value * 15,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
