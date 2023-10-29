import 'package:asa/app/controller/register_controller.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardGender extends StatelessWidget {
  RegisterController controller = RegisterController.i;
  final int gender;

  CardGender({
    super.key,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.form['gender']!.text = gender.toString();
        controller.gender.value = gender;
      },
      child: Obx(
        () => AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.gender.value == gender
                  ? ColorConstants.primary[500]!
                  : ColorConstants.slate[500]!,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(15.w),
          ),
          width: 150.w,
          height: 150.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                gender == 0
                    ? "assets/images/female.svg"
                    : "assets/images/male.svg",
                colorFilter: controller.gender.value == gender
                    ? ColorFilter.mode(
                        ColorConstants.primary[400]!,
                        BlendMode.srcIn,
                      )
                    : null,
                width: 78.w,
              ),
              SizedBox(height: 6.h),
              Text(
                gender == 0 ? "Perempuan" : "Laki-laki",
                style: h4BTextStyle(
                  color: controller.gender.value == gender
                      ? ColorConstants.primary[500]
                      : ColorConstants.slate[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
