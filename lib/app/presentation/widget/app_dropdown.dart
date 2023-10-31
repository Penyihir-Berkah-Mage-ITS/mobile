import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownItem<T> {
  final String text;
  final T value;
  final Widget? child;
  final bool enabled;

  AppDropdownItem({
    required this.text,
    required this.value,
    this.child,
    this.enabled = true,
  });
}

class AppDropdown<T> extends StatefulWidget {
  final List<AppDropdownItem> items;
  final T? value;
  final void Function<T>(T?)? onChanged;
  final IconData? prefixIcon;
  final String? placeholder;
  final bool isDisabled;
  final String p;
  final String? Function(T?)? validator;
  final String? label;

  const AppDropdown({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.prefixIcon,
    this.placeholder,
    this.isDisabled = false,
    this.validator,
    this.p = "",
    this.label,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown> {
  T? value;
  final _key = GlobalKey();
  final FocusNode _focus = FocusNode();
  bool isValid = true;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    _focus.addListener(() {
      setState(() {
        isFocused = _focus.hasFocus ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        widget.label == null ? Container() : SizedBox(height: 6.h),
        DropdownButtonFormField2<T>(
          focusNode: _focus,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
          ),
          validator: (e) {
            if (widget.validator != null) {
              var a = widget.validator!(e);
              if (a != null) {
                setState(() {
                  isValid = true;
                });
              } else {
                setState(() {
                  isValid = false;
                });
              }
              return a;
            }
            return null;
          },
          key: _key,
          barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
          isExpanded: true,
          isDense: true,
          iconStyleData: IconStyleData(
            iconSize: 1,
          ),
          value: widget.value,
          customButton: Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 16.w,
            ),
            decoration: BoxDecoration(
              color: ColorConstants.slate[25],
              boxShadow: !isValid
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
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(
                color: !isValid
                    ? ColorConstants.error
                    : (isFocused
                        ? ColorConstants.primary[600]!
                        : ColorConstants.slate[300]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      var isValid = true;
                      if (value == null) {
                        isValid = false;
                      }
                      if (value == -1) {
                        isValid = false;
                      }
                      if (value == "") {
                        isValid = false;
                      }
                      if (widget.items.indexWhere(
                              (element) => element.value == value) ==
                          -1) {
                        isValid = false;
                      }

                      return Text(
                        isValid
                            ? widget.items
                                .firstWhere((element) => element.value == value)
                                .text
                            : widget.placeholder ?? "",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: !this.isValid
                              ? ColorConstants.error
                              : widget.value == null
                                  ? ColorConstants.slate[400]
                                  : ColorConstants.slate[900],
                        ),
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      height: 16.h,
                      width: 1.w,
                      color: isFocused
                          ? ColorConstants.primary[500]
                          : ColorConstants.slate[500],
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 24.sp,
                      color: isFocused
                          ? ColorConstants.primary[500]
                          : ColorConstants.slate[500],
                    ),
                  ],
                ),
              ],
            ),
          ),
          onChanged: !widget.isDisabled
              ? (T? e) {
                  setState(() {
                    if (e != null) {
                      value = e;
                    }
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(e);
                  }
                }
              : null,
          dropdownStyleData: DropdownStyleData(
            offset: Offset(0, -10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: widget.items.isNotEmpty
              ? widget.items
                  .map(
                    (e) => DropdownMenuItem<T>(
                      value: e.value,
                      onTap: null,
                      enabled: e.enabled,
                      child: e.child ??
                          Text(
                            e.text,
                            style: body4TextStyle(
                              color: ColorConstants.slate[800],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  )
                  .toList()
              : [
                  DropdownMenuItem<T>(
                    enabled: false,
                    child: Row(
                      children: [
                        Text(
                          "Tidak ada data",
                          style: body4TextStyle(
                            color: ColorConstants.slate[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
        ),
      ],
    );
  }
}
