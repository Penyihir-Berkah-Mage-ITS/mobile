import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

ChatHeader() => AppBar(
      toolbarHeight: 80.h,
      foregroundColor: ColorConstants.slate[900],
      leading: IconButton(
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.all(5.w),
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.all(5.w),
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
      ],
      title: Row(
        children: [
          Hero(
            tag: "chat_avatar",
            child: Image.asset(
              "assets/images/avatar_1.png",
              width: 40.w,
              height: 40.h,
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "chat_name",
                child: Text(
                  "skyfallin1",
                  style: body3BTextStyle(),
                ),
              ),
              Text(
                "Last seen 10 minutes ago",
                style: body5TextStyle(
                  color: ColorConstants.slate[400],
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
