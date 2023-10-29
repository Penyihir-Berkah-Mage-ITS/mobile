import 'package:asa/app/controller/onboarding_controller.dart';
import 'package:asa/app/presentation/partials/onboarding/bottom_navigator.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primary[500],
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: ColorConstants.gradient[1],
            ),
            child: PageView(
              onPageChanged: (e) {
                controller.current.value = e;
              },
              physics: BouncingScrollPhysics(),
              children: controller.contents
                  .map(
                    (e) => Column(
                      children: [
                        SizedBox(height: 100.h),
                        Text(
                          e.title,
                          style: h2BTextStyle(
                            color: ColorConstants.slate[25],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          e.caption,
                          style: body5TextStyle(
                            color: ColorConstants.slate[25],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        SvgPicture.asset(
                          e.image,
                          width: e.width,
                          height: e.height,
                        ),
                        SizedBox(height: 232.h),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigator(),
          ),
        ],
      ),
    );
  }
}
