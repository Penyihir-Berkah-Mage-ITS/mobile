import 'package:asa/app/controller/chat_controller.dart';
import 'package:asa/app/presentation/partials/chat/bubble_chat.dart';
import 'package:asa/app/presentation/partials/chat/chat_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatHeader(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BubbleChat(
                      chat: "Halo sebelumnya sorry banget nih ganggu",
                      isMine: true,
                    ),
                    BubbleChat(
                      chat: "Haloo 👋, it's okey,",
                      isMine: false,
                    ),
                    BubbleChat(
                      chat: 'Halo saya  *****, bolehkah saya bercerita?',
                      isMine: true,
                    ),
                    BubbleChat(
                      chat:
                          "Ada yang bisa kubantu? Mungkin bisa cerita-cerita aja kok. Aku ga ngegigit hehe 😁",
                      isMine: false,
                    ),
                  ],
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
                    controller: TextEditingController(),
                    placeholder: "Pesan",
                  ),
                ),
                SizedBox(width: 12.w),
                InkWell(
                  borderRadius: BorderRadius.circular(6.w),
                  onTap: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.w),
                      color: ColorConstants.primary[500],
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.lineTo(w - 10, 0);
    path.cubicTo(w - 4.477, 0, w, 4.47715, w, 10);
    path.lineTo(w, h - 10.h);
    path.cubicTo(w - 4.477, h, w - 10, h, w - 10, h);
    path.lineTo(33, h);
    path.cubicTo(24.7157, h, 18, h - 6.715699999, 18, h - 15);
    path.lineTo(18, 16);
    path.lineTo(0, 0);
    path.lineTo(18, 0);
    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyChatClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.lineTo(10, 0);
    path.cubicTo(4.47715, 0, 0, 4.47715, 0, 10);
    path.lineTo(0, h - 10);
    path.cubicTo(0, h - 4.47720000, 4.47715, h, 10, h);
    path.lineTo(w - 33, h);
    path.cubicTo(w - 24.716, h, w - 18, h - 6.7157, w - 18, h - 15);
    path.lineTo(w - 18, 16);
    path.lineTo(w, 0);
    path.lineTo(w - 18, 0);
    path.lineTo(10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
