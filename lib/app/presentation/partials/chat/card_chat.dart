import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardChat extends StatelessWidget {
  const CardChat({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.chatRoom(2.toString()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/images/avatar_1.svg",
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.w),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Bram",
                    style: body4BTextStyle(color: ColorConstants.slate[800]),
                  ),
                  Text(
                    'Ada yang bisa kubantu? Mungkin sedi...',
                    style: body5TextStyle(color: ColorConstants.slate[400]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "19.00",
                  style: body5TextStyle(),
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 22.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                    color: ColorConstants.primary[500],
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      style: body5BTextStyle(color: ColorConstants.slate[25]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
