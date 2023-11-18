import 'package:asa/app/controller/report_controller.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/app/presentation/widget/app_dropdown.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/app/presentation/widget/scrollable_constraints.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

class ReportPage extends GetView<ReportController> {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: "Buat Laporan Kejadian",
      ),
      body: ScrollableConstraints(
        child: Form(
          key: controller.formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.h),
                AppInput(
                  label: "Nama Pelapor",
                  controller: TextEditingController(),
                  placeholder: "Gunakan Nama Asli Anda",
                  validator: (e) =>
                      (e!.isNotEmpty ? null : "Nama tidak boleh kosong"),
                ),
                SizedBox(height: 12.h),
                AppInput(
                  label: "Alamat Pelapor",
                  controller: TextEditingController(),
                  placeholder: "Lokasi Anda saat ini",
                  validator: (e) =>
                      (e!.isNotEmpty ? null : "Alamat tidak boleh kosong"),
                ),
                SizedBox(height: 12.h),
                Obx(
                  () => AppDropdown<String>(
                    label: 'Provinsi',
                    onChanged: <String>(String? e) {
                      var currentProvince = controller.selectedProvince.value;
                      controller.selectedProvince.value = e!.toString();
                      if (e.toString() != currentProvince) {
                        controller.selectedRegency.value = null;
                        controller.getRegency();
                      }
                    },
                    validator: (e) {
                      if (e == null) {
                        return "Provinsi tidak boleh kosong";
                      }
                      if (e.isEmpty) {
                        return "Provinsi tidak boleh kosong";
                      }
                      return null;
                    },
                    value: controller.selectedProvince.value,
                    items: controller.provinces
                        .map(
                          (element) => AppDropdownItem(
                            text: element.name,
                            value: element.id,
                          ),
                        )
                        .toList(),
                    placeholder: 'Pilih Provinsi',
                  ),
                ),
                SizedBox(height: 12.h),
                Obx(
                  () => AppDropdown<String>(
                    label: 'Kota/Kabupaten',
                    onChanged: <String>(String? e) {
                      controller.selectedRegency.value = e.toString();
                    },
                    items: controller.regencies
                        .map(
                          (element) => AppDropdownItem(
                            text: element.name,
                            value: element.id,
                          ),
                        )
                        .toList(),
                    placeholder: 'Pilih Kota/Kabupaten',
                    value: controller.selectedRegency.value,
                    validator: (e) {
                      if (e == null) {
                        return "Kota/Kabupaten tidak boleh kosong";
                      }
                      if (e.isEmpty) {
                        return "Kota/Kabupaten tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                AppInput(
                  label: "Nomor Telepon Pelapor",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                  placeholder: "Masukkan Nomor Telepon Anda",
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
                SizedBox(height: 12.h),
                AppInput(
                  label: "Detail Laporan",
                  controller: TextEditingController(),
                  maxLines: 5,
                  placeholder: "Masukkan Detail Laporan",
                  validator: (e) => (e!.isNotEmpty
                      ? null
                      : "Detail Laporan tidak boleh kosong"),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Bukti Laporan",
                  style: h5BTextStyle(),
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => DottedBorder(
                    color: controller.invalidProof.value
                        ? ColorConstants.error
                        : ColorConstants.slate[300]!,
                    radius: Radius.circular(8.w),
                    dashPattern: [6.w, 4.w],
                    strokeWidth: 1.w,
                    strokeCap: StrokeCap.round,
                    child: GestureDetector(
                      onTap: controller.uploadFotoHandler,
                      child: Container(
                        height: 100,
                        color: Colors.white,
                        child: GestureDetector(
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/add.svg",
                              colorFilter: ColorFilter.mode(
                                controller.invalidProof.value
                                    ? ColorConstants.error
                                    : ColorConstants.slate[300]!,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => controller.invalidProof.value
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: 7,
                            right: 7,
                            top: 7,
                          ),
                          child: Text(
                            "File bukti tidak boleh kosong",
                            style: body5TextStyle(
                              color: ColorConstants.error,
                              size: 11,
                            ),
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.proof.value != null
                      ? Column(
                          children: [
                            SizedBox(height: 6.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                                horizontal: 8.w,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstants.slate[100],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.proof.value!.path
                                          .split("/")
                                          .last,
                                      overflow: TextOverflow.ellipsis,
                                      style: body5TextStyle(),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      controller.proof.value = null;
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
                Text(
                  "Tambahkan bukti laporan berupa gambar atau video",
                  style: h5TextStyle(
                    color: ColorConstants.slate[400],
                  ),
                ),
                Spacer(),
                SizedBox(height: 20.h),
                AppButton(
                  onPressed: () {
                    controller.submit(context);
                  },
                  text: "Buat Laporan",
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
