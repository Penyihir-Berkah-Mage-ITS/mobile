import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TextMore extends StatelessWidget {
// final TextStyle? textStyle;
// final String text;
// final TextAlign? align;
// const TextMore({
//   super.key,
//   required this.text,
//   this.textStyle,
//   this.align,
// });

// }

class TextMore extends StatefulWidget {
  final TextStyle? textStyle;
  final String text;
  final TextAlign? align;
  const TextMore({
    super.key,
    required this.text,
    this.textStyle,
    this.align,
  });

  @override
  State<TextMore> createState() => _TextMoreState();
}

class _TextMoreState extends State<TextMore> {
  bool isMore = false;

  void togleMore() {
    setState(() {
      isMore = !isMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var span = TextSpan(
        text: widget.text,
      );

      var tp = TextPainter(
        maxLines: 4,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        text: span,
      );

      tp.layout(maxWidth: size.maxWidth);
      var exceeded = tp.didExceedMaxLines;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text.rich(
            span,
            overflow: !isMore ? TextOverflow.ellipsis : null,
            maxLines: !isMore ? 4 : null,
            textAlign: widget.align,
            style: widget.textStyle,
          ),
          SizedBox(height: 2.h),
          exceeded
              ? GestureDetector(
                  onTap: togleMore,
                  child: Text(
                    !isMore ? "Selengkapnya" : "Lebih Sedikit",
                    style: body5TextStyle(
                      color: ColorConstants.slate[500],
                    ),
                  ),
                )
              : Container(),
        ],
      );
    });
  }
}
