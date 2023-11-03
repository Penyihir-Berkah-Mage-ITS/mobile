import 'package:asa/app/controller/home_controller.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeHeader extends SliverPersistentHeaderDelegate {
  HomeController controller = HomeController.i;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    final invertProgress = 1 - progress;
    return Material(
      borderRadius: BorderRadius.circular(20.w),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      color: Colors.white.withOpacity(.3),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: 1,
            child: ColoredBox(color: Colors.white),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: invertProgress * .9,
            child: Center(
              child: SvgPicture.asset(
                "assets/logo/logo.svg",
                width: 28.w,
                height: 28.w,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.lerp(
              Alignment.bottomLeft,
              Alignment.bottomCenter,
              progress,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.current.value != 0) {
                      controller.homePageController.animateTo(
                        20,
                        duration: Duration(milliseconds: 350),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Text(
                          "Trending",
                          style: body4BTextStyle(
                            color: Color.lerp(
                              ColorConstants.primary[600],
                              ColorConstants.slate[300],
                              controller.current.value == 0 ? 0 : 1,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => AnimatedContainer(
                          curve: Curves.easeOut,
                          duration: Duration(milliseconds: 500),
                          width: controller.current.value == 0 ? 50.w : 0,
                          height: controller.current.value == 0 ? 2.h : 0,
                          margin: EdgeInsets.only(top: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: ColorConstants.primary[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.current.value != 1) {
                      controller.homePageController.animateTo(
                        420,
                        duration: Duration(milliseconds: 350),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Text(
                          "Terdekat",
                          style: body4BTextStyle(
                            color: Color.lerp(
                              ColorConstants.primary[600],
                              ColorConstants.slate[300],
                              controller.current.value == 1 ? 0 : 1,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => AnimatedContainer(
                          curve: Curves.easeOut,
                          duration: Duration(milliseconds: 500),
                          width: controller.current.value == 1 ? 50.w : 0,
                          height: controller.current.value == 1 ? 2.h : 0,
                          margin: EdgeInsets.only(top: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: ColorConstants.primary[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.current.value != 2) {
                      controller.homePageController.animateTo(
                        800,
                        duration: Duration(milliseconds: 350),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Text(
                          "Terbaru",
                          style: body4BTextStyle(
                            color: Color.lerp(
                              ColorConstants.primary[600],
                              ColorConstants.slate[300],
                              controller.current.value == 2 ? 0 : 1,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => AnimatedContainer(
                          curve: Curves.easeOut,
                          duration: Duration(milliseconds: 500),
                          width: controller.current.value == 2 ? 50.w : 0,
                          height: controller.current.value == 2 ? 2.h : 0,
                          margin: EdgeInsets.only(top: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: ColorConstants.primary[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 160.h;

  @override
  double get minExtent => 95.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
