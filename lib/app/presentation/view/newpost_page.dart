import 'package:asa/app/controller/newpost_controller.dart';
import 'package:asa/app/presentation/widget/app_bottombar.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NewPostPage extends GetView<NewPostController> {
  const NewPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: "Postingan Baru",
        leadingWidget: AppButton(
          borderRadius: BorderRadius.circular(6.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          onPressed: () {},
          text: "Post",
          textStyle: body4TextStyle(
            weight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            children: [
              AppInput(
                maxLines: 6,
                placeholder: "Enter a description...",
                controller: TextEditingController(),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/image.svg",
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8.w),
                  Tooltip(
                    key: controller.tooltipkey,
                    decoration: BoxDecoration(
                      color: ColorConstants.slate[800],
                      borderRadius: BorderRadius.circular(6.w),
                    ),
                    textStyle: body4TextStyle(color: ColorConstants.slate[50]),
                    verticalOffset: 20.h,
                    triggerMode: TooltipTriggerMode.manual,
                    message: 'Sekarang anda dapat menambah video!',
                    child: SvgPicture.asset(
                      "assets/icons/video.svg",
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(route: AppRoute.newPost),
    );
  }
}
