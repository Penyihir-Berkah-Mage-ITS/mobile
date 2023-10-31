import 'package:asa/app/controller/login_controller.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/app/presentation/widget/scrollable_constraints.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: ''),
      body: SafeArea(
        child: ScrollableConstraints(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Senang melihat Anda\nkembali.',
                  style: h2BTextStyle(),
                ),
                SizedBox(height: 30.h),
                AppInput(
                  controller: TextEditingController(),
                  placeholder: 'Masukkan Username',
                  label: "Username",
                ),
                SizedBox(height: 16.h),
                AppInput(
                  controller: TextEditingController(),
                  placeholder: 'Masukkan Alamat Email',
                  label: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 4.h),
                GestureDetector(
                  child: Text(
                    'Lupa Password?',
                    style: body4BTextStyle(color: ColorConstants.primary[500]),
                  ),
                ),
                SizedBox(height: 20.h),
                Spacer(),
                AppButton(onPressed: null, text: "Masuk"),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun? ',
                      style: body3TextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Get.previousRoute == AppRoute.registerForm) {
                          Get.back();
                        } else {
                          Get.toNamed(AppRoute.registerName);
                        }
                      },
                      child: Text(
                        'Buat akun',
                        style: body3BTextStyle(
                          color: ColorConstants.primary[500],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
