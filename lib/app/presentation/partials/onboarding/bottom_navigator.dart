import 'package:asa/app/controller/onboarding_controller.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavigator extends StatelessWidget {
  OnboardingController controller = OnboardingController.i;
  BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [0, 1, 2]
              .map(
                (e) => Obx(
                  () => AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                    width: e == controller.current.value ? 50.w : 10.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.w),
                      color: ColorConstants
                          .primary[e == controller.current.value ? 100 : 400],
                    ),
                    height: 10.w,
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 15.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.w),
              topRight: Radius.circular(30.w),
            ),
          ),
          width: 1.sw,
          constraints: BoxConstraints(minHeight: 190.h),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppButton(
                  onPressed: () {},
                  text: 'Masuk dengan akun yang ada',
                ),
                SizedBox(height: 15.h),
                AppButton(
                  type: AppButtonType.outlined,
                  onPressed: () {},
                  text: 'Buat akun baru',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
