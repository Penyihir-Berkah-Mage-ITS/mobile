import 'package:asa/app/controller/register_controller.dart';
import 'package:asa/app/presentation/partials/register/gender/card_gender.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/scrollable_constraints.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterGenderPage extends GetView<RegisterController> {
  const RegisterGenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: ''),
      body: ScrollableConstraints(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Saya adalah ...",
                style: h2BTextStyle(),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CardGender(
                      gender: 0,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CardGender(
                      gender: 1,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Obx(
                () => AppButton(
                  onPressed: controller.gender.value == -1
                      ? null
                      : () {
                          Get.toNamed(AppRoute.registerAvatar);
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
