import 'package:asa/app/controller/edit_profile_controller.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/app/presentation/widget/app_dropdown.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/app/presentation/widget/image_detail_vew.dart';
import 'package:asa/app/presentation/widget/scrollable_constraints.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: "Edit Profile Saya",
      ),
      body: ScrollableConstraints(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.w),
                  clipBehavior: Clip.antiAlias,
                  child: Obx(() {
                    if (controller.user.value == null) {
                      return Container();
                    }
                    if (controller.picture.value == null) {
                      return CachedNetworkImage(
                        imageUrl: controller.user.value!.profilePicture,
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      );
                    }
                    return ImageDetailView(
                      link: controller.picture.value!.path,
                      isNetwork: false,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    );
                  }),
                ),
                SizedBox(height: 12.h),
                InkWell(
                  onTap: controller.pickAvatar,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    child: Text("Ubah Avatar"),
                  ),
                ),
                SizedBox(height: 30.h),
                AppInput(
                  controller: controller.form['username']!,
                  placeholder: 'Masukkan Username',
                  textInputAction: TextInputAction.next,
                  onChange: (e) {
                    controller.isChanged.value = true;
                  },
                  label: "Username",
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                AppInput(
                  textInputAction: TextInputAction.next,
                  controller: controller.form['phone']!,
                  label: "Nomor Telepon",
                  placeholder: "Masukkan Nomor Telepon",
                  onChange: (e) {
                    controller.isChanged.value = true;
                  },
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
                SizedBox(height: 15.h),
                Obx(
                  () => AppDropdown<String>(
                    label: "Jenis Kelamin",
                    placeholder: "Masukkan Jenis Kelamin",
                    validator: (e) {
                      if (e?.isEmpty ?? true) {
                        return "Jenis Kelamin tidak boleh kosong";
                      }
                      return null;
                    },
                    value: controller.gender.value,
                    onChanged: <String>(String? e) {
                      controller.gender.value = e!.toString();
                      controller.isChanged.value = true;
                    },
                    items: [
                      AppDropdownItem(text: "Perempuan", value: "0"),
                      AppDropdownItem(text: "Laki-Laki", value: "1"),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Spacer(),
                SizedBox(
                  width: 1.sw,
                  child: Obx(
                    () => AppButton(
                      onPressed:
                          controller.isChanged.value ? controller.edit : null,
                      text: "Simpan Perubahan",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
