import 'package:asa/app/controller/home_controller.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeChatHeader extends SliverPersistentHeaderDelegate {
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
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: invertProgress,
            child: Container(
              decoration: BoxDecoration(
                gradient: ColorConstants.gradient[1],
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: invertProgress * .9,
            child: Center(
              child: Text(
                "Chat",
                style: h2BTextStyle(color: ColorConstants.slate[25]),
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: AppInput(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorConstants.slate[400],
                  size: 18.w,
                ),
                placeholder: "Cari Nama Pengguna, Chat, dsb..",
                controller: TextEditingController(),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 170.h;

  @override
  double get minExtent => 120.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
