import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomBar extends StatelessWidget {
  final String route;
  const AppBottomBar({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "bottom_bar",
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            ColorConstants.shadow[1]!,
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.w),
            topRight: Radius.circular(15.w),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.home);
              },
              child: SvgPicture.asset(
                "assets/icons/home.svg",
                width: 22.w,
                colorFilter: route == AppRoute.home
                    ? ColorFilter.mode(
                        ColorConstants.primary[500]!,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
            SvgPicture.asset(
              "assets/icons/speak.svg",
              width: 22.w,
              colorFilter: route == AppRoute.speakup
                  ? ColorFilter.mode(
                      ColorConstants.primary[500]!,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.newPost);
              },
              child: SvgPicture.asset(
                "assets/icons/plus.svg",
                width: 24.w,
                colorFilter: route == AppRoute.newPost
                    ? ColorFilter.mode(
                        ColorConstants.primary[500]!,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/icons/chat.svg",
                width: 24.w,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.profile);
              },
              child: SvgPicture.asset(
                "assets/icons/profile.svg",
                width: 22.w,
                colorFilter: route == AppRoute.profile
                    ? ColorFilter.mode(
                        ColorConstants.primary[500]!,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
