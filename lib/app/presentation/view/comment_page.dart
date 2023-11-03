import 'package:asa/app/controller/comment_controller.dart';
import 'package:asa/app/presentation/partials/comment/card_comment.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommentPage extends GetView<CommentController> {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: "Komentar"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Obx(
                () => Wrap(
                  runSpacing: 15.h,
                  children: controller.comments
                      .map((element) => CardComment(data: element))
                      .toList(),
                ),
              ),
            ),
          ),
          Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            constraints: BoxConstraints(maxWidth: 1.sw),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: AppInput(
                    controller: controller.commentInput,
                    onChange: (e) {
                      controller.commentText.value = e;
                    },
                    placeholder: "Tambahkan Komentar Anda",
                  ),
                ),
                SizedBox(width: 12.w),
                Obx(
                  () => InkWell(
                    borderRadius: BorderRadius.circular(6.w),
                    onTap: controller.commentText.value.isEmpty
                        ? null
                        : controller.addComment,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.w),
                        color: controller.commentText.value.isEmpty
                            ? ColorConstants.slate[600]
                            : ColorConstants.primary[500],
                      ),
                      width: 44.w,
                      height: 50.h,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/send.svg",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
