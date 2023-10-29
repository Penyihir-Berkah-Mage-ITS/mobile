import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardVerification extends StatelessWidget {
  const CardVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.error,
        borderRadius: BorderRadius.circular(8.w),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Verifikasi akun Anda terlebih dahulu!",
              style: body5BTextStyle(
                color: ColorConstants.slate[25],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Icon(
            Icons.chevron_right,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
