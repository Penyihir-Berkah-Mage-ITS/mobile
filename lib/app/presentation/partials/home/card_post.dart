import 'package:asa/app/models/post/post_model.dart';
import 'package:asa/app/presentation/widget/text_more.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardPost extends StatelessWidget {
  final PostModel data;
  const CardPost({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoute.post(1.toString()));
          },
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            // margin: EdgeInsets.symmetric(vertical: 2.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/images/avatar_1.svg",
                            width: 52.w,
                            height: 52.w,
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "skyfallin1",
                                  style: body4BTextStyle(
                                      color: ColorConstants.slate[800]),
                                ),
                                Text(
                                  "22m",
                                  style: body5TextStyle(
                                    color: ColorConstants.slate[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      TextMore(
                        text: data.content,
                        textStyle: body5TextStyle(
                          color: Colors.black,
                        ),
                        align: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Image.asset(
                      "assets/images/post_dummy.png",
                      width: 1.sw,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/post_like.svg",
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "300",
                                  style: body5TextStyle(
                                      color: ColorConstants.slate[500]),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "149 comments",
                                  style: body5TextStyle(
                                      color: ColorConstants.slate[500]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: ColorConstants.slate[300],
                          height: 30.h,
                          thickness: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.thumb_up_outlined,
                                  color: ColorConstants.slate[400],
                                  size: 14.w,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "Like",
                                  style: body4TextStyle(
                                      height: 1,
                                      color: ColorConstants.slate[500]),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.comment_outlined,
                                  color: ColorConstants.slate[400],
                                  size: 14.w,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "Comment",
                                  style: body4TextStyle(
                                      height: 1,
                                      color: ColorConstants.slate[500]),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2.5.h),
      ],
    );
  }
}
