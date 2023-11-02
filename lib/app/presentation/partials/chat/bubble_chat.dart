import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BubbleChat extends StatelessWidget {
  final bool isMine;
  final String chat;
  const BubbleChat({
    super.key,
    required this.chat,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Align(
        alignment: isMine ? Alignment.topRight : Alignment.topLeft,
        child: ClipPath(
          clipper: isMine ? MyChatClipper() : FriendClipper(),
          child: Container(
            width: 236.w,
            padding: EdgeInsets.fromLTRB(16.w, 10.h, 33.w, 10.h),
            color: isMine
                ? ColorConstants.primary[500]
                : ColorConstants.slate[100],
            child: Text(
              chat,
              style: body5TextStyle(
                color: isMine ? Colors.white : ColorConstants.slate[900],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FriendClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.lineTo(w - 10, 0);
    path.cubicTo(w - 4.477, 0, w, 4.47715, w, 10);
    path.lineTo(w, h - 10);
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
