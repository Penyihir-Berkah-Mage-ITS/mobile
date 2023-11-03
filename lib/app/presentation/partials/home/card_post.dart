import 'package:asa/app/controller/home_controller.dart';
import 'package:asa/app/models/post/post_model.dart';
import 'package:asa/app/presentation/partials/home/card_attachment.dart';
import 'package:asa/app/presentation/widget/text_more.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class CardPost extends StatelessWidget {
  final PostModel data;
  HomeController controller = HomeController.i;
  CardPost({
    super.key,
    required this.data,
  });

  String formatTimeAgo(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    Duration difference = DateTime.now().difference(dateTime);
    if (difference.inDays > 0) {
      return "${DateFormat('yMMMMd').format(DateTime.now().subtract(difference))} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
    } else {
      return "Just now";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoute.post(data.id.toString()));
          },
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
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
                          CachedNetworkImage(
                            imageUrl: data.User.profilePicture,
                            width: 52.w,
                            height: 52.w,
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  data.User.username,
                                  style: body4BTextStyle(
                                      color: ColorConstants.slate[800]),
                                ),
                                Text(
                                  formatTimeAgo(data.CreatedAt),
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
                CardAttachment(data: data),
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
                                  data.likes.toString(),
                                  style: body5TextStyle(
                                      color: ColorConstants.slate[500]),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${data.totalComment} comments",
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
                            InkWell(
                              onTap: () {
                                controller.like(data);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up_outlined,
                                    color: data.is_liked
                                        ? ColorConstants.primary[500]
                                        : ColorConstants.slate[400],
                                    size: 14.w,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "Like",
                                    style: body4TextStyle(
                                      weight: data.is_liked
                                          ? FontWeight.w600
                                          : null,
                                      height: 1,
                                      color: data.is_liked
                                          ? ColorConstants.primary[500]
                                          : ColorConstants.slate[500],
                                    ),
                                  ),
                                ],
                              ),
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
