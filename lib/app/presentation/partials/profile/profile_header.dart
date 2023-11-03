import 'package:asa/app/controller/cache_controller.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  CacheController controller = CacheController.i;
  ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.user.value;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.w),
          bottomRight: Radius.circular(20.w),
        ),
        color: Colors.white,
        boxShadow: [ColorConstants.shadow[2]!],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 33.h),
      child: Row(
        children: [
          data?.profilePicture != null
              ? Image.network(
                  data!.profilePicture,
                  width: 76.w,
                  height: 76.h,
                  fit: BoxFit.cover,
                )
              : Container(),
          SizedBox(width: 12.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  data?.username ?? '',
                  style: body3BTextStyle(),
                ),
                Text(
                  data?.phone == ""
                      ? "Phone number not set"
                      : (data?.phone ?? ""),
                  style: body5TextStyle(
                    color: ColorConstants.slate[400],
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff449EEE),
                        borderRadius: BorderRadius.circular(6.w),
                      ),
                      child: Text(
                        "Asa Peeps",
                        style: body5BTextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstants.error,
                        borderRadius: BorderRadius.circular(6.w),
                      ),
                      child: Text(
                        "Unverified",
                        style: body5BTextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
