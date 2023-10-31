import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardComment extends StatelessWidget {
  const CardComment({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        // ADD LIKE
      },
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/images/avatar_2.svg",
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        "skyfallin1",
                        style: body5BTextStyle(
                          color: ColorConstants.slate[800],
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "22m",
                        style: body5TextStyle(
                          color: ColorConstants.slate[400],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'harusnya seorang petinggi perusahaan tidak bersikap seperti demiki perusahaan tidak bersikap seperti demikiperusahaan tidakp seperti demikian',
                    style: body5TextStyle(
                      color: ColorConstants.slate[800],
                    ),
                  ),
                  Text(
                    "Balas",
                    style: body5BTextStyle(
                      color: ColorConstants.slate[500],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              children: [
                Icon(
                  Icons.favorite_outline,
                  size: 12.w,
                  color: ColorConstants.slate[400],
                ),
                SizedBox(height: 2.h),
                Text(
                  "220",
                  style: body5TextStyle(
                    height: 1,
                    color: ColorConstants.slate[400],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
