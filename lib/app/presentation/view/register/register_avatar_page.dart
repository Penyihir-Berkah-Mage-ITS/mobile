import 'package:asa/app/controller/register_controller.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/scrollable_constraints.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterAvatarPage extends GetView<RegisterController> {
  const RegisterAvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: ""),
      body: ScrollableConstraints(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pilih avatar yang menggambarkan diri Anda",
                textAlign: TextAlign.center,
                style: h2BTextStyle(),
              ),
              SizedBox(height: 32.h),
              Wrap(
                runSpacing: 32.h,
                alignment: WrapAlignment.spaceAround,
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          controller.profilePicture.value = e;
                          controller.form['profile_picture']!.text =
                              e.toString();
                        },
                        child: Obx(
                          () => AnimatedContainer(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.w),
                              color: controller.profilePicture.value == e
                                  ? ColorConstants.primary[500]!.withOpacity(.4)
                                  : null,
                            ),
                            child: SvgPicture.asset(
                              "assets/images/avatar_$e.svg",
                              width: 80.w,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Spacer(),
              SizedBox(height: 20.h),
              Obx(
                () => AppButton(
                  onPressed: controller.profilePicture.value == -1
                      ? null
                      : () {
                          Get.toNamed(AppRoute.registerForm);
                        },
                  text: "Lanjutkan",
                ),
              ),
              SizedBox(height: 36.h),
            ],
          ),
        ),
      ),
    );
  }
}
