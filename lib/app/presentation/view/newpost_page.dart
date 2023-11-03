import 'package:asa/app/controller/newpost_controller.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/app/presentation/widget/image_detail_vew.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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
                controller: controller.form['content']!,
              ),
              SizedBox(height: 16.h),
              Obx(() => controller.attachment.value == null
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: controller.pickImage,
                          child: SvgPicture.asset(
                            "assets/icons/image.svg",
                            width: 20.w,
                            height: 20.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Tooltip(
                          key: controller.tooltipkey,
                          decoration: BoxDecoration(
                            color: ColorConstants.slate[800],
                            borderRadius: BorderRadius.circular(6.w),
                          ),
                          textStyle:
                              body4TextStyle(color: ColorConstants.slate[50]),
                          verticalOffset: 20.h,
                          triggerMode: TooltipTriggerMode.manual,
                          message: 'Sekarang anda dapat menambah video!',
                          child: GestureDetector(
                            onTap: controller.pickVideo,
                            child: SvgPicture.asset(
                              "assets/icons/video.svg",
                              width: 20.w,
                              height: 20.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  : ClipRRect(
                      child: Stack(
                        children: [
                          controller.type.value == 1
                              ? ImageDetailView(
                                  link: controller.attachment.value!.path,
                                  isNetwork: false,
                                )
                              : controller.videoController != null
                                  ? InkWell(
                                      onTap: () {
                                        controller.videoController!.play();
                                      },
                                      child: SizedBox(
                                        width: 1.sw,
                                        child: AspectRatio(
                                          aspectRatio:
                                              controller.aspectRatio.value,
                                          child: VideoPlayer(
                                            controller.videoController!,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                          Positioned(
                            top: 8.h,
                            right: 8.w,
                            child: GestureDetector(
                              onTap: () {
                                controller.attachment.value = null;
                                controller.type.value = 0;
                              },
                              child: Container(
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.w),
                                    color: ColorConstants.slate[700]!
                                        .withOpacity(.7)),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: AppBottomBar(route: AppRoute.newPost),
    );
  }
}
