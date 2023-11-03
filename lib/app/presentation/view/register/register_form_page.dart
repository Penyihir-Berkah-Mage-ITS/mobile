import 'package:asa/app/controller/register_controller.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterFormPage extends GetView<RegisterController> {
  const RegisterFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: ''),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Halo, selamat datang!\nSenang melihat Anda disini.",
                      style: h2BTextStyle(),
                    ),
                    SizedBox(height: 30.h),
                    AppInput(
                      textInputAction: TextInputAction.next,
                      controller: controller.form['username']!,
                      label: "Nama",
                      placeholder: "Contoh: John Doe",
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.h),
                    AppInput(
                      textInputAction: TextInputAction.next,
                      controller: controller.form['email']!,
                      label: "Alamat Email",
                      placeholder: "Masukkan Alamat Email",
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Email tidak boleh kosong";
                        }
                        if (!e.isEmail) {
                          return "Email tidak valid";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.h),
                    AppInput(
                      textInputAction: TextInputAction.next,
                      controller: controller.form['phone']!,
                      label: "Nomor Telepon",
                      placeholder: "Masukkan Nomor Telepon",
                      keyboardType: TextInputType.number,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Nomor telepon tidak boleh kosong";
                        }
                        if (!e.isPhoneNumber) {
                          return "Nomor telepon tidak valid";
                        }
                        return null;
                      },
                    ),
                    AppInput(
                      textInputAction: TextInputAction.next,
                      controller: controller.form['password']!,
                      label: "Password",
                      prefixIcon: Icon(Icons.password),
                      obscureText: true,
                      placeholder: "a-z, 1-9, dan karakter unik",
                      validator: (value) {
                        if (value!.length < 8) {
                          return 'Password harus minimum 8 karakter';
                        }
                        if (!value.contains(RegExp(r'[a-z]'))) {
                          return 'Password harus memiliki setidaknya satu huruf kecil.';
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password harus memiliki setidaknya satu huruf besar.';
                        }
                        if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Password harus memiliki setidaknya satu angka.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.h),
                    AppInput(
                      textInputAction: TextInputAction.done,
                      controller: controller.confirmPassword,
                      label: "Konfirmasi Password",
                      obscureText: true,
                      prefixIcon: Icon(Icons.password),
                      placeholder: "Ulangi password anda",
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Konfirmasi password tidak boleh kosong";
                        }
                        if (e != controller.form['password']!.text) {
                          return "Password tidak sama";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 28.h),
                    AppButton(
                      onPressed: controller.register,
                      text: "Daftar",
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah punya akun? ",
                          style: body3TextStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.login);
                          },
                          child: Text(
                            "Masuk",
                            style: body3BTextStyle(
                              color: ColorConstants.primary[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
