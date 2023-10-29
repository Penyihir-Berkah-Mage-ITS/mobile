import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardName extends StatelessWidget {
  final String text;
  final bool isChoosed;
  final Function(String? value) onPressed;
  const CardName({
    super.key,
    required this.text,
    required this.isChoosed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(text);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.w),
          border: Border.all(
            width: isChoosed ? 1.5.w : 1.w,
            color: isChoosed
                ? ColorConstants.primary[500]!
                : ColorConstants.slate[400]!,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 4.h),
        child: Text(
          text,
          style: body4BTextStyle(
            color: isChoosed
                ? ColorConstants.primary[500]
                : ColorConstants.slate[400],
          ),
        ),
      ),
    );
  }
}
