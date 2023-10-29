import 'package:asa/app/controller/register_controller.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentBack extends StatelessWidget {
  RegisterController controller = RegisterController.i;
  ContentBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        gradient: ColorConstants.gradient[1],
      ),
      child: Column(
        children: [
          SizedBox(height: 110.h),
          Text(
            'Halo, kita dapat panggil\nkamu siapa?',
            style: h2BTextStyle(
              color: ColorConstants.slate[25],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          Text(
            'Jangan gunakan nama asli, anda dapat\nmenggunakan nama yang merepresentasikan\ndiri anda.',
            style: body5TextStyle(
              color: ColorConstants.slate[25],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppInput(
              controller: controller.form['username']!,
              placeholder: "contoh: lovesky123",
              validator: (e) {
                if (e!.isEmpty) {
                  return 'Username can\'t be empty';
                }
                return null;
              },
              onChange: (e) {
                controller.usernameValue.value = e;
              },
            ),
          ),
        ],
      ),
    );
  }
}
