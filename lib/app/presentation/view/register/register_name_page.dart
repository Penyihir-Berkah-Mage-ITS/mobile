import 'package:asa/app/controller/register_controller.dart';
import 'package:asa/app/presentation/partials/register/name/card_name.dart';
import 'package:asa/app/presentation/partials/register/name/content_back.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transparent_pointer/transparent_pointer.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.primary[500],
      body: Form(
        key: controller.nameKey,
        child: Stack(
          children: [
            ContentBack(),
            TransparentPointer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    IgnorePointer(
                      child: SizedBox(
                        height: 360.h,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 36.h,
                        ),
                        constraints: BoxConstraints(minHeight: 440.h),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.w),
                            topRight: Radius.circular(30.w),
                          ),
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Beberapa rekomendasi nama untukmu",
                                style: body4BTextStyle(),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 32.h),
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 10.w,
                                runSpacing: 15.h,
                                children: controller.exampleName
                                    .map(
                                      (e) => Obx(
                                        () => CardName(
                                          text: e,
                                          isChoosed: e ==
                                              controller.usernameValue.value,
                                          onPressed: (e) {
                                            controller.usernameValue.value = e!;
                                            controller.username.text = e;
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Spacer(),
                              SizedBox(height: 20.h),
                              AppButton(
                                onPressed: () {
                                  if (controller.nameKey.currentState!
                                      .validate()) {}
                                },
                                text: "Lanjutkan",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
