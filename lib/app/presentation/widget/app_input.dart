import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  final String? label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String placeholder;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? prefix;
  final bool obscureText;
  final void Function()? ontap;
  final bool readOnly;
  final String? title;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;

  const AppInput({
    super.key,
    this.label,
    this.suffixIcon,
    this.title,
    required this.controller,
    this.placeholder = "",
    this.onChange,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.prefixIcon,
    this.prefix,
    this.obscureText = false,
    this.ontap,
    this.textInputAction,
    this.readOnly = false,
    this.autovalidateMode,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isFocused = false;
  bool isEmpty = true;
  bool isVisible = false;
  bool isInit = true;
  final FocusNode _focus = FocusNode();
  GlobalKey inputKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {
        isInit = false;
      });
    });

    setState(() {
      isEmpty = widget.controller.text.isEmpty;
    });

    _focus.addListener(() {
      setState(() {
        isFocused = _focus.hasFocus ? true : false;
      });
    });
    // print("assd ${widget.obscureText}");
    setState(() {
      isVisible = widget.obscureText;
    });

    if (widget.validator != null) {
      validator = widget.validator!;
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
    _focus.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    setState(() {
      widget.controller.text =
          widget.controller.text.isEmpty ? '' : widget.controller.text;
      isFocused = false;
      isEmpty = widget.controller.text.isEmpty;
    });
  }

  late FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      autovalidateMode: widget.autovalidateMode,
      enabled: true,
      validator: (e) {
        if (widget.validator == null) {
          return null;
        }
        if (e != null) {
          return widget.validator!(e);
        }
        return widget.validator!(widget.controller.text);
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.label == null
                ? Container()
                : Text(
                    widget.label!,
                    style: h5BTextStyle(),
                  ),
            widget.label == null ? Container() : SizedBox(height: 4.h),
            AnimatedContainer(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeIn,
              decoration: _renderBoxDecoration(state),
              child: Stack(
                children: [
                  TextField(
                    maxLines: widget.maxLines,
                    readOnly: widget.readOnly,
                    key: inputKey,
                    focusNode: _focus,
                    onChanged: (e) {
                      if (widget.onChange != null) {
                        widget.onChange!(e);
                      }
                      setState(() {
                        isEmpty = e.isEmpty ? true : false;
                      });
                    },
                    textInputAction: widget.textInputAction,
                    obscureText: isVisible,
                    keyboardType: widget.keyboardType,
                    decoration: _renderInputDecoration(state),
                    style: body4TextStyle(
                      color: state.errorText != null
                          ? Colors.red[400]
                          : ColorConstants.slate[900],
                    ),
                    controller: widget.controller,
                  ),
                  // _renderLabel(state),
                ],
              ),
            ),
            SizedBox(
              height: state.errorText != null ? 4.h : 0,
            ),
            state.errorText != null
                ? Text(
                    state.errorText ?? "",
                    style: body5BTextStyle(
                      color: Colors.red[400],
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }

  Widget renderLabel(FormFieldState<String> state) {
    return widget.label != null
        ? AnimatedPositioned(
            top: isFocused || !isEmpty ? 9.h : 16.h,
            left: 16.w,
            duration: const Duration(milliseconds: 250),
            curve: Curves.fastOutSlowIn,
            child: IgnorePointer(
              ignoring: true,
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 350),
                style: TextStyle(
                  color: state.errorText != null
                      ? ColorConstants.error
                      : ColorConstants.slate[900],
                  fontSize: isFocused || !isEmpty ? 10.sp : 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                child: Text(
                  widget.label!,
                ),
              ),
            ),
          )
        : Container();
  }

  BoxDecoration _renderBoxDecoration(FormFieldState<String> state) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.w),
      border: Border.all(
        color: state.errorText != null
            ? ColorConstants.error
            : (isFocused
                ? ColorConstants.primary[600]!
                : ColorConstants.slate[300]!),
      ),
      boxShadow: state.errorText != null
          ? (isFocused
              ? [
                  BoxShadow(
                    color: Color.fromRGBO(0, 114, 54, 0.40),
                    offset: Offset(0, 0),
                    blurRadius: 4,
                  ),
                ]
              : [
                  BoxShadow(
                    color: ColorConstants.error.withOpacity(0.4),
                    offset: Offset(0, 0),
                    blurRadius: 4,
                  ),
                ])
          : (isFocused
              ? [
                  BoxShadow(
                    color: Color.fromRGBO(0, 114, 54, 0.40),
                    offset: Offset(0, 0),
                    blurRadius: 4,
                  ),
                ]
              : []),
    );
  }

  InputDecoration _renderInputDecoration(FormFieldState<String> state) {
    return InputDecoration(
      hintStyle: body4BTextStyle(
        color: state.errorText != null
            ? ColorConstants.error
            : ColorConstants.slate[400],
      ),
      suffixIcon: widget.obscureText
          ? GestureDetector(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Icon(isVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
            )
          : widget.suffixIcon,
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintText: widget.placeholder,
      // hintText: widget.label == null
      //     ? widget.placeholder
      //     : (isFocused ? widget.placeholder : null),
      contentPadding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 13.h,
        bottom: 13.h,
        // top: (isFocused || !isEmpty) && widget.label != null ? 24.h : 13.h,
        // bottom: (isFocused || !isEmpty) && widget.label != null ? 10.h : 13.h,
      ),
      isCollapsed: true,
    );
  }
}
