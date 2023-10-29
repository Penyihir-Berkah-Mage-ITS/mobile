import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Pusat Bantuan',
          style: body4BTextStyle(),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.headset_mic,
                        size: 15.w,
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Pusat Bantuan Pelanggan',
                          style: body5TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 24.w),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: ColorConstants.slate[400],
                height: 5,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.query_stats_outlined,
                        size: 15,
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'FAQ',
                          style: body5TextStyle(),
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
